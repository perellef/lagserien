from srcc.main.utils.orm._batchkjøring import Batchkjøring

from sqlalchemy.orm import joinedload
from collections import defaultdict

class Kalkuleringsbesparelse:

    @staticmethod
    def finn_uforandrede_klubber(seriedata, serieår, alle_klubbresultater, lagresultater):
        siste_kalkulatorkjøring = Kalkuleringsbesparelse.finn_serieårets_siste_kalkulatorkjøring(seriedata, serieår)
        if siste_kalkulatorkjøring == None:
            return set()

        klubb_lagresultater = defaultdict(set)
        for lagresultat in lagresultater:
            klubb_lagresultater[lagresultat.klubb_id].add(lagresultat.resultat_id) 

        resultatene_allerede_kjørt = lambda serieresultater: max(fra_og_med for fra_og_med,_ in serieresultater.values()) <= siste_kalkulatorkjøring

        uforandrede_klubber = set()
        for klubb,resultater in alle_klubbresultater.items():
            if not resultatene_allerede_kjørt(resultater):
                continue

            # ingen (serie)resultater fjernet
            if len(klubb_lagresultater[klubb.klubb_id].difference(set(resultater.keys()))) > 0:
                continue

            uforandrede_klubber.add(klubb.klubb_id)

        return uforandrede_klubber
    
    @staticmethod
    def finn_serieårets_siste_kalkulatorkjøring(seriedata, serieår):
        batchkjøringer = seriedata.hent(Batchkjøring).all()

        er_årets_kalkulatorkjøring = lambda kjøring: kjøring.serieår==serieår and kjøring.batch == 4
        
        tidligere_kjøringer = [kjøring.uttrekksdato for kjøring in batchkjøringer if er_årets_kalkulatorkjøring(kjøring)]
        
        if len(tidligere_kjøringer) == 0:
            return None

        return max(tidligere_kjøringer)     
    
    @staticmethod
    def legg_inn_uforandret_data(seriedata, serieår, uforandrede_klubber, oppstillinger, laginfo, merverdier, serieklasser, uttrekksdato):
        Serieresultat = serieklasser.serieresultat

        serieresultater = (seriedata
                .hent(Serieresultat)
                .filter(Serieresultat.fra_og_med <= uttrekksdato)
                .filter((Serieresultat.til_og_med == None) | (Serieresultat.til_og_med >= uttrekksdato))
                .filter(Serieresultat.poeng != None)
                .filter(Serieresultat.klubb_id != None)
                .all())
    
        lagresultater = (seriedata
            .hent(serieklasser.lagresultat)
            .options(joinedload(serieklasser.lagresultat.lag))
            .filter(serieklasser.lagresultat.fra_og_med <= uttrekksdato)
            .filter((serieklasser.lagresultat.til_og_med == None) | (serieklasser.lagresultat.til_og_med >= uttrekksdato))
            .all())
        
        resultatets_poeng = {e.resultat_id: e.poeng for e in serieresultater}
        
        laginfoer = (seriedata
                .hent(serieklasser.laginfo)
                .options(joinedload(serieklasser.laginfo.lag))
                .filter(serieklasser.laginfo.fra_og_med <= uttrekksdato)
                .filter((serieklasser.laginfo.til_og_med == None) | (serieklasser.laginfo.til_og_med >= uttrekksdato))
                .all())

        utøver_merverdi = (seriedata
                .hent(serieklasser.utøver_merverdi)
                .filter(serieklasser.utøver_merverdi.fra_og_med <= uttrekksdato)
                .filter((serieklasser.utøver_merverdi.til_og_med == None) | (serieklasser.utøver_merverdi.til_og_med >= uttrekksdato))
                .all())

        # lagresultat
        for lagresultat in lagresultater:
            if lagresultat.serieår != serieår:
                continue
            if lagresultat.klubb_id not in uforandrede_klubber:
                continue
            if lagresultat.til_og_med != None:
                continue

            lag = lagresultat.lag
            oppstillingstype = lagresultat.oppstillingstype
            resultat = lagresultat.resultat

            if lag not in oppstillinger:
                oppstillinger[lag] = {"OBLIGATORISK": [], "VALGFRI": []}

            oppstillinger[lag][oppstillingstype].append((resultatets_poeng[resultat.resultat_id], resultat))

        # laginfo
        for info in laginfoer:
            if info.serieår != serieår:
                continue
            if info.klubb_id not in uforandrede_klubber:
                continue
            if info.til_og_med != None:
                continue
            
            laginfo[info.lag] = (
                info.poeng,
                info.poeng_obligatoriske,
                info.poeng_valgfri,
                info.antall_noteringer,
                info.antall_deltakere
            )

        # utøver merverdier
        for merverdi in utøver_merverdi:
            if merverdi.serieår != serieår:
                continue
            if merverdi.klubb_id not in uforandrede_klubber:
                continue
            if merverdi.til_og_med != None:
                continue
            
            merverdier[(merverdi.klubb_id, merverdi.utøver_id)] = merverdi.poeng
