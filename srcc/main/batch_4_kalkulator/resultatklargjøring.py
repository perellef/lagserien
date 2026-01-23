from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._resultat import Resultat

from collections import defaultdict

from sqlalchemy.orm import joinedload
from sqlalchemy.orm import selectinload

class Resultatklargjøring:

    @staticmethod
    def hent_klubbresultater(seriedata, serieår, uttrekksdato, serieklasser):

        Serieresultat = serieklasser.serieresultat

        serieresultater = (seriedata.hent(Serieresultat)
                .options(
                    joinedload(Serieresultat.klubb),
                    selectinload(Serieresultat.resultat).selectinload(Resultat.utøver),
                    selectinload(Serieresultat.resultat).selectinload(Resultat.øvelse)
                )
                .join(Serie, Serie.serieår == serieår)
                .join(Resultat, Resultat.resultat_id == Serieresultat.resultat_id)
                .join(serieklasser.serieøvelse, (serieklasser.serieøvelse.serieår == Serie.serieår) & (serieklasser.serieøvelse.øvelseskode == Resultat.øvelseskode))
                .filter((Serie.fra_og_med <= Resultat.dato) & (Serie.til_og_med >= Resultat.dato))
                .filter(Serieresultat.fra_og_med <= uttrekksdato)
                .filter((Serieresultat.til_og_med == None) | (Serieresultat.til_og_med >= uttrekksdato))
                .filter(Serieresultat.poeng != None)
                .filter(Serieresultat.klubb_id != None)
                .all())

        klubbresultater = defaultdict(dict)
        for serieresultat in serieresultater:
            klubbresultater[serieresultat.klubb][serieresultat.resultat_id] = (serieresultat.fra_og_med, serieresultat.resultat)

        return klubbresultater
    
    @staticmethod
    def fjern_dårligere_klubbresultater(klubbresultater):
        return {klubb: Resultatklargjøring.__fjern_dårligere_resultater(resultater) for klubb,resultater in klubbresultater.items()}