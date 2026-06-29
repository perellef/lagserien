from srcc.main.utils.beholdere.liste import Liste 

from srcc.main.batch_4_kalkulator.diverse import Resultattype
from srcc.main.batch_4_kalkulator.oppstillingsgenerator import Oppstillingsgenerator
from srcc.main.batch_4_kalkulator.dugnadsmatrise import dugnadsmatrise

from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from sqlalchemy.orm.exc import NoResultFound, MultipleResultsFound

import time
from functools import cache
from collections import defaultdict
from datetime import datetime


class Kalkulator:
    
    @staticmethod
    def LagKalk(serieår, seriedata, klubb, resultater, laginfo, oppstillinger, merverdier, lagpotensialer, lagpotensial_felter, serieøvelser, serieresultater, topplag, serieklasser, nye_lag):
        resultattyper = Liste([Resultattype(res, serieresultater[res.resultat_id].poeng, serieøvelser[res.øvelseskode]) for res in resultater])           
        starttid = time.time()

        oppstillingskrav = {el.divisjon: el for el in seriedata.hent(Oppstillingskrav).filter_by(serieår=serieår).all()}
        lagdiv = Kalkulator.__finn_lagenes_div(klubb.klubb_id, topplag)
        alle_lag = Kalkulator.__beregn_alle_lag(resultattyper, lagdiv, oppstillingskrav, serieøvelser)

        tid_brukt = time.time()-starttid
        print(f"{tid_brukt:.2f}s")

        for lag_nr, (lagoppstilling, merverdiene, lagpotensial) in enumerate(alle_lag, start=1):
            lag = Kalkulator.hent_lag_ellers_opprett(seriedata, serieklasser, serieår, klubb, lag_nr, nye_lag)

            deltakere = set()

            poeng_obligatoriske = 0
            oppstillinger[lag] = {"OBLIGATORISK": [], "VALGFRI": []}
            
            for el in lagoppstilling.obl():
                oppstillinger[lag]["OBLIGATORISK"].append((el.poeng, el.resultat))
                poeng_obligatoriske += el.poeng

                deltakere.add(el.resultat.utøver)

            poeng_valgfri = 0
            for el in lagoppstilling.val():
                oppstillinger[lag]["VALGFRI"].append((el.poeng, el.resultat))
                poeng_valgfri += el.poeng

                deltakere.add(el.resultat.utøver)

            laginfo[lag] = (
                poeng_obligatoriske+poeng_valgfri,
                poeng_obligatoriske,
                poeng_valgfri,
                len(lagoppstilling.obl()) + len(lagoppstilling.val()),
                len(deltakere)
            )

            for utøver_id, poeng in merverdiene.items():
                merverdier[(klubb.klubb_id, utøver_id)] = poeng

            lagpotensialer[lag] = (lagpotensial[0]-poeng_obligatoriske-poeng_valgfri)
            
            if lagpotensial[1] != None:
                lagpotensial_felter[lag] = {"OBLIGATORISK": [], "VALGFRI": []}
                for el in lagpotensial[1].obl():
                    lagpotensial_felter[lag]["OBLIGATORISK"].append((el.øvelseskode, el.utøver_id, el.poeng, None if el.resultat_id == 0 else el.resultat_id))
                for el in lagpotensial[1].val():
                    lagpotensial_felter[lag]["VALGFRI"].append((el.øvelseskode, el.utøver_id, el.poeng, None if el.resultat_id == 0 else el.resultat_id))

    @classmethod
    def hent_lag_ellers_opprett(cls, seriedata, serieklasser, serieår, klubb, lagnummer, nye_lag):
        try:
            return seriedata.hent(serieklasser.lag).filter_by(serieår=serieår, klubb_id=klubb.klubb_id, lagnummer=lagnummer).one()
        except NoResultFound:
            nytt_lag = serieklasser.lag(
                serieår=serieår,
                klubb_id=klubb.klubb_id,
                lagnummer=lagnummer,
            )
            nytt_lag.klubb = klubb
            nye_lag.append(nytt_lag)
            return nytt_lag
        except MultipleResultsFound:
            raise ValueError(f"Skulle ha vært 0 eller 1 eksisterende for ({serieår}, {klubb.klubb_id}, {lagnummer}) men var flere.")

    @classmethod
    def __finn_lagenes_div(cls, klubb_id, topplag):
        div = []

        lag_nr = 1
        while True:
            try:
                div.append(topplag[(klubb_id, lag_nr)]) 
            except KeyError:
                break
            lag_nr += 1

        return div

    @classmethod
    def __beregn_alle_lag(cls, resultater, div, oppstillingskrav, serieøvelser):

        alle_lag = []
        gjenværende_resultater = resultater

        i = 0
        while len(gjenværende_resultater) > 0:
            
            if len(div)>i:
                krav = oppstillingskrav[div[i]]
            else:
                krav = oppstillingskrav[3]

            lagoppstilling = cls.beregn_unikt_beste_lagoppstilling(gjenværende_resultater, krav) 

            merverdier = {}
            for utøver in lagoppstilling.utøvere():
                ikke_utøvers_resultater = gjenværende_resultater.filter(lambda x: x.utøver != utøver)
                like_lag = cls.beregn_like_lagoppstillinger(ikke_utøvers_resultater, krav)

                merverdier[utøver.utøver_id] = lagoppstilling.poeng() - like_lag.first().poeng()
                Kalkulator.beregn_like_lagoppstillinger.cache_clear()
            
            forbedringspotensial = cls.beregn_forbedringsmuligheter(gjenværende_resultater, krav, serieøvelser, lagoppstilling, lagoppstilling.poeng())
            alle_lag.append((lagoppstilling, merverdier, forbedringspotensial))

            gjenværende_resultater = gjenværende_resultater.filter(lambda x: x.utøver not in lagoppstilling.utøvere())
            i += 1

        return alle_lag
    
    @classmethod
    def beregn_forbedringsmuligheter(cls, resultater, krav, serieøvelser, lagoppstilling, lagpoeng):
        nye_resultater = list(resultater)
        for res in resultater:
            if res.øvelseskode not in dugnadsmatrise: # for kjøring fra applikasjon
                return (0, None)
            for ny_øvelse, (a, b) in dugnadsmatrise[res.øvelseskode].items():
                if ny_øvelse not in serieøvelser:
                    continue
                
                poeng = int(a * res.poeng + b)
                nye_resultater.append(
                    Resultattype.imiter(poeng, serieøvelser[ny_øvelse], res.utøver)
                )
            
        ubrukt_obligatorisk_øvelse = lambda x: x.er_obligatorisk and x.øvelseskode not in set(e.øvelseskode for e in lagoppstilling.obl())

        utøvere = {}
        besøkt = set()
        for res in sorted(nye_resultater, reverse=True):
            if res.poeng <= 0:
                continue
            if (res.utøver_id, res.øvelseskode) in besøkt:
                continue
            besøkt.add((res.utøver_id, res.øvelseskode))

            if any(((res.poeng, res.utøver_id, res.øvelseskode) == (e.poeng, e.utøver_id, e.øvelseskode) for e in lagoppstilling.obl())):
                continue
            if any(((res.poeng, res.utøver_id, res.øvelseskode) == (e.poeng, e.utøver_id, e.øvelseskode) for e in lagoppstilling.val())):
                continue

            if not any((
                lagoppstilling.kan_isolert_forbedre_valgfri(res, krav),
                lagoppstilling.kan_isolert_forbedre_obligatoriske(res, krav),
            )):
                continue
            
            if res.utøver_id not in utøvere:
                utøvere[res.utøver_id] = {
                    "beste": None,
                    "beste-tekniske": None,
                    "beste-obligatoriske": None,
                    "beste-obligatoriske-tekniske": None,
                    "beste-ubrukte-obligatoriske": None,
                    "beste-ubrukte-tekniske-obligatoriske": None,
                }

            if utøvere[res.utøver_id]["beste"] == None:
                utøvere[res.utøver_id]["beste"] = res
            if res.er_teknisk and utøvere[res.utøver_id]["beste-tekniske"] == None:
                utøvere[res.utøver_id]["beste-tekniske"] = res
            if res.er_obligatorisk and utøvere[res.utøver_id]["beste-obligatoriske"] == None:
                utøvere[res.utøver_id]["beste-obligatoriske"] = res
            if res.er_obligatorisk and res.er_teknisk and utøvere[res.utøver_id]["beste-obligatoriske-tekniske"] == None:
                utøvere[res.utøver_id]["beste-obligatoriske-tekniske"] = res
            if ubrukt_obligatorisk_øvelse(res) and utøvere[res.utøver_id]["beste-ubrukte-obligatoriske"] == None:
                utøvere[res.utøver_id]["beste-ubrukte-obligatoriske"] = res
            if res.er_teknisk and ubrukt_obligatorisk_øvelse(res) and utøvere[res.utøver_id]["beste-ubrukte-tekniske-obligatoriske"] == None:
                utøvere[res.utøver_id]["beste-ubrukte-tekniske-obligatoriske"] = res

        alle_beste = list(sorted([e["beste"] for e in utøvere.values() if e["beste"] != None], reverse=True))
        alle_beste_tekniske = list(sorted([e["beste-tekniske"] for e in utøvere.values() if e["beste-tekniske"] != None], reverse=True))
        alle_beste_obligatoriske = list(sorted([e["beste-obligatoriske"] for e in utøvere.values() if e["beste-obligatoriske"] != None], reverse=True))
        alle_beste_obligatoriske_tekniske = list(sorted([e["beste-obligatoriske-tekniske"] for e in utøvere.values() if e["beste-obligatoriske-tekniske"] != None], reverse=True))
        alle_beste_ubrukte_obligatoriske = list(sorted([e["beste-ubrukte-obligatoriske"] for e in utøvere.values() if e["beste-ubrukte-obligatoriske"] != None], reverse=True))
        alle_beste_ubrukte_tekniske_obligatoriske = list(sorted([e["beste-ubrukte-tekniske-obligatoriske"] for e in utøvere.values() if e["beste-ubrukte-tekniske-obligatoriske"] != None], reverse=True))

        alle = [alle_beste, alle_beste_tekniske, alle_beste_obligatoriske, alle_beste_obligatoriske_tekniske, alle_beste_ubrukte_obligatoriske, alle_beste_ubrukte_tekniske_obligatoriske]

        def fjern_duplikater(lst):
            result = []
            [result.append(x) for x in lst if not any(((x.utøver_id, x.øvelseskode) == (x2.utøver_id, x2.øvelseskode) for x2 in result))]
            return result

        for n_første in (1,3,5,None):
            beste_resultater = fjern_duplikater(lagoppstilling.obl()+lagoppstilling.val()+[e for lst in alle for e in (lst[:n_første] if n_første != None else lst)])

            like_lag = cls.beregn_like_lagoppstillinger(Liste(beste_resultater), krav)
            Kalkulator.beregn_like_lagoppstillinger.cache_clear()
            if like_lag.first().poeng() > lagpoeng:
                break
        else:
            return (lagpoeng, lagoppstilling)

        nye_resultater = set(list(resultater) + like_lag.first().obl() + like_lag.first().val())
        return Kalkulator.beregn_forbedringsmuligheter(nye_resultater, krav, serieøvelser, like_lag.first(), like_lag.first().poeng())
    
    @classmethod
    def beregn_unikt_beste_lagoppstilling(cls, resultater, krav):
        """
        Kalkulerer den optimale serieoppstillingen. Hvis flere oppstillinger har lik seriepoeng,
        beregnes også neste oppstilling fra resterende resultater å avgjøre den optimale.
        """
        def beregn_optimal():
            optimale_lag = cls.beregn_like_lagoppstillinger(resultater.sort(reverse=True), krav)
            
            if len(optimale_lag) == 1:
                return optimale_lag.first()
        
            beregn_lagoppstilling = lambda lag: cls.beregn_unikt_beste_lagoppstilling(
                resultater.filter(lambda x: x.utøver not in lag.utøvere()).sort(reverse=True),
                krav,
            )
            
            return optimale_lag.max(key=beregn_lagoppstilling)
        
        optimal_lagoppstilling = beregn_optimal()
        Kalkulator.beregn_like_lagoppstillinger.cache_clear()
        return optimal_lagoppstilling
    
    @classmethod
    @cache
    def beregn_like_lagoppstillinger(cls, resultater, krav):
        """
        Kalkulerer beste serieoppstillinger. Det kan være flere serieoppstillinger dersom
        flere oppstillinger gir samme høyeste seriepoeng. 
        """
        for i,resultat in enumerate(resultater, start=0):
            resultat.sett_resultatindeks(i)

        oppstillingsgenerator = Oppstillingsgenerator(krav, resultater)
        return oppstillingsgenerator.generer()
