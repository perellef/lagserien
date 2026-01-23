from datetime import timedelta

from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.utils.orm._serie import Serie

from sqlalchemy.orm import joinedload

class Uttrekksperiodiserer:

    @staticmethod
    def periodiser_uttrekksresultater(seriedata, serieår, uttrekksdato, menn_resultatforløp, kvinner_resultatforløp):
        
        for Uttrekksresultat, resultatforløp in zip([MannUttrekksresultat, KvinneUttrekksresultat],  [menn_resultatforløp, kvinner_resultatforløp]):

            nye_uttrekksresultater = []
            utløpte_uttrekksresultater = []

            løpende_uttrekksresultater = (seriedata.hent(Uttrekksresultat)
                .options(joinedload(Uttrekksresultat.resultat))
                .options(joinedload(Uttrekksresultat.klubb))
                .join(Resultat, Resultat.resultat_id == Uttrekksresultat.resultat_id)
                .join(Serie, (Serie.fra_og_med <= Resultat.dato) & (Serie.til_og_med >= Resultat.dato))
                .filter_by(serieår=serieår)
                .filter(Uttrekksresultat.til_og_med == None)
                .all())

            finnes_allerede = set()
            for uttrekksresultat in løpende_uttrekksresultater:
                assert uttrekksresultat.fra_og_med < uttrekksdato, f"Avbryter. {Uttrekksresultat.__name__} må ha fra_og_med før uttrekksdato {uttrekksdato}, men hadde: '{uttrekksresultat.fra_og_med}'."

                if (
                    uttrekksresultat.resultat in resultatforløp
                    and resultatforløp[uttrekksresultat.resultat] == uttrekksresultat.klubb
                ):
                    finnes_allerede.add(uttrekksresultat.resultat)
                    continue

                lukket_uttrekksresultat = Uttrekksresultat(
                    resultat_id=uttrekksresultat.resultat_id,
                    fra_og_med=uttrekksresultat.fra_og_med,
                    til_og_med=uttrekksdato - timedelta(days=1),
                    klubb_id=uttrekksresultat.klubb_id
                )

                utløpte_uttrekksresultater.append(uttrekksresultat)
                nye_uttrekksresultater.append(lukket_uttrekksresultat)

            for resultat,klubb in resultatforløp.items():
                if resultat in finnes_allerede:
                    continue
                nye_uttrekksresultater.append(Uttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=uttrekksdato, til_og_med=None, klubb_id=klubb.klubb_id))

            seriedata.bulkslett(utløpte_uttrekksresultater)
            seriedata.bulkinnsett(nye_uttrekksresultater)

    @staticmethod
    def periodiser_klubbkretser(seriedata, uttrekksdato, klubbkretser):
        nye_klubbkretser = []
        utløpte_klubbkretser = []

        løpende_klubbkretser = seriedata.hent(Klubbkrets).filter_by(til_og_med=None).all()

        finnes_allerede = set()
        for klubbkrets in løpende_klubbkretser:
            assert klubbkrets.fra_og_med < uttrekksdato, f"Avbryter. {Klubbkrets.__name__} må ha fra_og_med før uttrekksdato {uttrekksdato}, men hadde: '{uttrekksresultat.fra_og_med}'."

            if (
                klubbkrets.klubb_id in klubbkretser
                and klubbkretser[klubbkrets.klubb_id] == klubbkrets.krets
            ):
                finnes_allerede.add(klubbkrets.klubb_id)
                continue

            lukket_klubbresultat = Klubbkrets(
                klubb_id=klubbkrets.klubb_id,
                fra_og_med=klubbkrets.fra_og_med,
                til_og_med=uttrekksdato - timedelta(days=1),
                krets=klubbkrets.krets
            )

            utløpte_klubbkretser.append(klubbkrets)
            nye_klubbkretser.append(lukket_klubbresultat)

        for klubb_id,krets in klubbkretser.items():
            if klubb_id in finnes_allerede:
                continue
            nye_klubbkretser.append(Klubbkrets(klubb_id=klubb_id, fra_og_med=uttrekksdato, til_og_med=None, krets=krets))

        seriedata.bulkslett(utløpte_klubbkretser)
        seriedata.bulkinnsett(nye_klubbkretser)