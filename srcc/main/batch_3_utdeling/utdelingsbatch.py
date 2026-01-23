from srcc.main.batch_3_utdeling.resultatbehandling import Resultatbehandling
from srcc.main.batch_3_utdeling.periodiserer import Periodiserer
from srcc.main.batch_3_utdeling.poengberegner import Poengberegner

from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._kvinne_serieresultat import KvinneSerieresultat

import math

from sqlalchemy.orm import selectinload

class Utdelingsbatch:

    batchnummer = 3

    @staticmethod
    def kjør(seriedata, serieår, uttrekksdato):

        for kjønn, Uttrekksresultat, Serieresultat in zip(("menn", "kvinner"), (MannUttrekksresultat, KvinneUttrekksresultat), (MannSerieresultat, KvinneSerieresultat)):

            #TODO: trekk dette ut i en funksjon og lag tester
            resultater = (seriedata.hent(Uttrekksresultat)       
                .options(
                    selectinload(Uttrekksresultat.klubb),
                    selectinload(Uttrekksresultat.resultat).selectinload(Resultat.utøver),
                    selectinload(Uttrekksresultat.resultat).selectinload(Resultat.øvelse)
                )
                .select_from(Resultat)
                .join(Uttrekksresultat, Resultat.resultat_id == Uttrekksresultat.resultat_id)
                .join(Serie, (Serie.fra_og_med <= Resultat.dato) & (Serie.til_og_med >= Resultat.dato))
                .filter(Uttrekksresultat.fra_og_med <= uttrekksdato)
                .filter((Uttrekksresultat.til_og_med == None) | (Uttrekksresultat.til_og_med >= uttrekksdato))
                .filter_by(serieår=serieår)
                .filter(Resultat.dato <= uttrekksdato)
                .all())

            Utdelingsbatch.assert_unike_statistikk_resultater([uttr.resultat for uttr in resultater], uttrekksdato)

            resultatforløp = {resultat.resultat: (resultat.klubb, "Innlastet.") for resultat in resultater}

            Resultatbehandling.fjern_resultater_til_klubber_utenfor_seriekretsene(seriedata, resultatforløp)
            Resultatbehandling.fjern_mellomtider_til_serieresultat(seriedata, serieår, resultatforløp)
            Resultatbehandling.fjern_manuelle_resultater_i_elektroniske_øvelser(seriedata, serieår, resultatforløp)
            Resultatbehandling.fjern_yngre_utovere(resultatforløp)
            Resultatbehandling.fjern_rullestolresultater(seriedata, serieår, resultatforløp)
            Resultatbehandling.flytt_overbygningsresultater(seriedata, serieår, resultatforløp)
            Resultatbehandling.tilbakeflytt_utøverunntatte_overbygningsresultater(seriedata, serieår, resultatforløp)
            Resultatbehandling.overskriv_klubb_ved_resultatbytte(seriedata, uttrekksdato, resultatforløp)
            Resultatbehandling.tilbakeflytt_klubbunntatte_overbygningsresultater(seriedata, serieår, uttrekksdato, resultatforløp)

            resultatforløp = Poengberegner.beregn_for_resultater(kjønn, resultatforløp)
            resultatforløp = Utdelingsbatch.fjern_overflødige(resultatforløp)

            Periodiserer.periodiser_serieresultater(seriedata, serieår, uttrekksdato, resultatforløp, Serieresultat)

    @staticmethod
    def assert_unike_statistikk_resultater(resultater, uttrekksdato):
        statistikk_resultat_ider = set()
        for resultat in resultater:
            if resultat.statistikk_resultat_id in statistikk_resultat_ider:
                raise ValueError(f"Skal for uttrekk ha unike statistikk_resultat_id, men fant flere for {resultat.statistikk_resultat_id} på {uttrekksdato}.")
            statistikk_resultat_ider.add(resultat.statistikk_resultat_id)

    @staticmethod
    def fjern_overflødige(resultatforløp):
        resultattupler = [(poeng, res.øvelseskode, res.utøver_id, klubb, forløp, res) for res,(poeng,klubb,forløp) in resultatforløp.items()]

        resultatforløp = {}
        brukte = set()
        for poeng, øvelseskode, utøver_id, klubb, forløp, resultat in sorted(resultattupler, key=lambda x: 0 if x[0]==None else x[0], reverse=True): 

            if poeng is None:
                resultatforløp[resultat] = (poeng, klubb, forløp)
                continue
            
            if (øvelseskode, utøver_id, klubb) not in brukte:
                brukte.add((øvelseskode, utøver_id, klubb))

                if poeng < 1:
                    continue
                resultatforløp[resultat] = (math.floor(poeng), klubb, forløp)

        return resultatforløp
