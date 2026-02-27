from srcc.main.utils.beholdere.liste import Liste 

from srcc.main.batch_4_kalkulator.diverse import Resultattype, nullutøver, poeng, øvelse, utøver, er_løp, er_teknisk, er_obligatorisk
from srcc.main.batch_4_kalkulator.oppstillingsgenerator import Oppstillingsgenerator
from srcc.main.batch_4_kalkulator.dugnadsmatrise import dugnadsmatrise

from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from sqlalchemy.orm.exc import NoResultFound, MultipleResultsFound

import time
from functools import cache

class Kalkulator:
    
    @staticmethod
    def LagKalk(serieår, seriedata, klubb, resultater, laginfo, oppstillinger, merverdier, forbedringspotensialer, serieøvelser, serieresultater, topplag, serieklasser, nye_lag):
        resultattyper = Liste([Resultattype(res, serieresultater[res.resultat_id].poeng, serieøvelser[res.øvelseskode]) for res in resultater])           
        starttid = time.time()

        oppstillingskrav = {el.divisjon: el for el in seriedata.hent(Oppstillingskrav).filter_by(serieår=serieår).all()}
        lagdiv = Kalkulator.__finn_lagenes_div(klubb.klubb_id, topplag)
        alle_lag = Kalkulator.__beregn_alle_lag(resultattyper, lagdiv, oppstillingskrav, serieøvelser)

        tid_brukt = time.time()-starttid
        if tid_brukt > 1:
            print(f"{klubb.klubbnavn}: {tid_brukt:.2f}s")

        for lag_nr, (lagoppstilling, merverdiene, forbedringspotensial) in enumerate(alle_lag, start=1):
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

            forbedringspotensialer[lag] = forbedringspotensial

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
            forbedringspotensial = 0#cls.beregn_forbedringsmuligheter(gjenværende_resultater, krav, serieøvelser, lagoppstilling.poeng())
            
            alle_lag.append((lagoppstilling, merverdier, forbedringspotensial))

            gjenværende_resultater = gjenværende_resultater.filter(lambda x: x.utøver not in lagoppstilling.utøvere())
            i += 1

        return alle_lag
    
    @classmethod
    def beregn_forbedringsmuligheter(cls, resultater, krav, serieøvelser, lagpoeng):
        nye_resultater = list(resultater)
        for res in resultater:
            for ny_øvelse, (a, b) in dugnadsmatrise[res.øvelseskode].items():
                if ny_øvelse not in serieøvelser:
                    continue
                
                poeng = int(a * res.poeng + b)
                
                nye_resultater.append(
                    Resultattype.imiter(poeng, serieøvelser[ny_øvelse], res.utøver)
                )
        
        besøkt = set()
        beste_resultater = []
        for res in sorted(nye_resultater, reverse=True):
            if res.poeng <= 0:
                continue
            if (res.utøver_id, res.øvelseskode) in besøkt:
                continue
            besøkt.add((res.utøver_id, res.øvelseskode))
            beste_resultater.append(res)

        like_lag = cls.beregn_like_lagoppstillinger(Liste(beste_resultater), krav)

        Kalkulator.beregn_like_lagoppstillinger.cache_clear()
        return like_lag.first().poeng()-lagpoeng
    
    
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
