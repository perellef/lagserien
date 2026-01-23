from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._resultat import Resultat

from sqlalchemy.orm import joinedload

from datetime import timedelta

class Periodiserer:
    
    @staticmethod        
    def periodiser_serieresultater(seriedata, serieår, uttrekksdato, resultatforløp, Serieresultat):
    
        nye_serieresultater = []
        utløpte_serieresultater = []

        løpende_serieres = (seriedata.hent(Serieresultat)
            .options(
                joinedload(Serieresultat.resultat),
                joinedload(Serieresultat.klubb)
            )
            .join(Resultat, Resultat.resultat_id == Serieresultat.resultat_id)
            .join(Serie, (Serie.fra_og_med <= Resultat.dato) & (Serie.til_og_med >= Resultat.dato))
            .filter_by(serieår=serieår)
            .filter(Resultat.dato <= uttrekksdato)
            .filter(Serieresultat.til_og_med == None)
            .all())

        finnes_allerede = set()
        for serieres in løpende_serieres:
            assert serieres.fra_og_med < uttrekksdato, f"Avbryter. Klubbresultat må ha fra_og_med før uttrekksdato {uttrekksdato}, men hadde: '{serieres.fra_og_med}'."

            if (
                serieres.resultat in resultatforløp
                and resultatforløp[serieres.resultat] == (serieres.poeng, serieres.klubb, serieres.forløp)
            ):
                finnes_allerede.add(serieres.resultat)
                continue

            lukket_serieres = Serieresultat(
                resultat_id=serieres.resultat_id,
                fra_og_med=serieres.fra_og_med,
                til_og_med=uttrekksdato - timedelta(days=1),
                poeng=serieres.poeng,
                klubb_id=serieres.klubb_id,
                forløp=serieres.forløp
            )

            utløpte_serieresultater.append(serieres)
            nye_serieresultater.append(lukket_serieres)
            
        for resultat,(poeng, klubb,forløp) in resultatforløp.items():
            if resultat in finnes_allerede:
                continue
            nye_serieresultater.append(Serieresultat(resultat_id=resultat.resultat_id, fra_og_med=uttrekksdato, til_og_med=None, poeng=poeng, klubb_id=None if klubb == None else klubb.klubb_id, forløp=forløp))

        seriedata.bulkslett(utløpte_serieresultater)
        seriedata.bulkinnsett(nye_serieresultater)