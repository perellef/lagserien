from srcc.main.utils.beholdere.liste import Liste 

from srcc.main.batch_4_kalkulator.diverse import Resultattype, nullutøver, poeng, øvelse, utøver, er_løp, er_teknisk, er_obligatorisk
from srcc.main.batch_4_kalkulator.oppstillingsgenerator import Oppstillingsgenerator

from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from sqlalchemy.orm.exc import NoResultFound, MultipleResultsFound

import time
from functools import cache

class Kalkulator:
    
    @staticmethod
    def LagKalk(serieår, seriedata, klubb, resultater, laginfo, oppstillinger, merverdier, serieøvelser, serieresultater, topplag, serieklasser, nye_lag):
        resultattyper = Liste([Resultattype(serieresultater[res.resultat_id], serieøvelser[res.øvelseskode]) for res in resultater])           
        starttid = time.time()

        oppstillingskrav = {el.divisjon: el for el in seriedata.hent(Oppstillingskrav).filter_by(serieår=serieår).all()}
        lagdiv = Kalkulator.__finn_lagenes_div(klubb.klubb_id, topplag)
        alle_lag = Kalkulator.__beregn_alle_lag(resultattyper, lagdiv, oppstillingskrav)

        tid_brukt = time.time()-starttid
        if tid_brukt > 1:
            print(f"{klubb.klubbnavn}: {tid_brukt:.2f}s")

        for lag_nr, (lagoppstilling, merverdiene) in enumerate(alle_lag, start=1):
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
    def __beregn_alle_lag(cls, resultater, div, oppstillingskrav):

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
            alle_lag.append((lagoppstilling, merverdier))

            gjenværende_resultater = gjenværende_resultater.filter(lambda x: x.utøver not in lagoppstilling.utøvere())
            i += 1

        return alle_lag

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
        # TODO: skal kunne fjerne aktuelle resultater, men i praksis ikke fungert. Må undersøke hvorfor
        aktuelle_resultater = cls.finn_aktuelle_resultater(resultater.sort(reverse=True), krav)
        for i,resultat in enumerate(aktuelle_resultater, start=1):
            resultat.sett_resultatindeks(i)

        oppstillingsgenerator = Oppstillingsgenerator(krav, aktuelle_resultater)
        return oppstillingsgenerator.generer()

    @classmethod
    def finn_aktuelle_resultater(cls, resultater, krav):
        """
        Finner obligatoriske og valgfri resultater som er aktuelle, dvs. de som er vurdert til
        teoretisk mulige i den endelige serieoppstillingen. Øvrige resultater er uinteressante.
        """
        beste_obligatoriske = cls.finn_beste_obligatoriske(resultater)

        obligatoriske = cls.finn_aktuelle_obligatoriske_resultater(beste_obligatoriske, resultater, krav)
        valgfri = cls.finn_aktuelle_valgfri_resultater(obligatoriske, resultater, krav)

        return (Liste.merge(obligatoriske, valgfri)
                .filter(lambda x: x.poeng > 0)
                .sort(reverse=True))
    
    @classmethod
    def finn_beste_obligatoriske(cls, resultater):
        """
        Finner beste resultat til hver obligatorisk øvelse.
        """
        return (resultater
            .filter(er_obligatorisk)
            .sort(reverse=True)
            .distinct(øvelse))
        
    @classmethod
    def finn_aktuelle_obligatoriske_resultater(cls, obligatoriske, resultater, krav):
        """
        Finner aktuelle obligatoriske resultater, dvs. de som har teoretisk mulighet til å være
        i endelig obligatorisk oppstilling. Dette er de sterkeste obligatoriske resultatene óg -
        hvis dette er overbelastet - også neste resultat i øvelsen. 
        """
        aktuelle_resultater = cls.finn_aktuelle_resultater_fra_obligatoriske(obligatoriske, resultater, krav)
        
        belastede_utøvere = cls.finn_belastede_utøvere(aktuelle_resultater, krav)

        overbelastede_øvelser = (obligatoriske
            .group_by(øvelse)
            .values()
            .filter(lambda x: x.all(lambda y: y.utøver in belastede_utøvere))
            .map(lambda x: x.first().serieøvelse))
        
        if len(overbelastede_øvelser)==0:
            return obligatoriske
        
        ventende_resultater = resultater.exclude(obligatoriske).group_by(øvelse)

        neste_erstattere = overbelastede_øvelser.map(lambda x: ventende_resultater.get(x.øvelse).first() if x.øvelse in ventende_resultater else Resultattype.null(x))
        like_erstattere = resultater.filter(lambda x: neste_erstattere.any(lambda y: x.poeng == y.poeng and x.øvelse == y.øvelse))
        
        erstattere = Liste.merge(neste_erstattere, like_erstattere)
        nye_obligatoriske = Liste.concat(obligatoriske, erstattere)

        return cls.finn_aktuelle_obligatoriske_resultater(nye_obligatoriske, resultater, krav)

    @classmethod
    def finn_aktuelle_valgfri_resultater(cls, obligatoriske, resultater, krav):
        """
        Finner aktuelle valgfri resultater, dvs. de som har teoretisk mulighet til å være
        i endelig valgfri oppstilling. Dette er de som er ansett som aktuell samlet sett, unntatt
        de som er vurdert til å ikke kunne finnes i valgfri oppstilling.
        """
        aktuelle_resultater = cls.finn_aktuelle_resultater_fra_obligatoriske(obligatoriske, resultater, krav)
        
        ikkeval = cls.finn_ikkeval(obligatoriske, krav)

        return aktuelle_resultater.exclude(ikkeval)
     
    @classmethod
    def finn_aktuelle_resultater_fra_obligatoriske(cls, obligatoriske, resultater, krav):
        """
        ???
        """
        
        def rek(usikre):
            ikke_usikre_resultater = resultater.exclude(usikre)
            beste_valgfri = cls.uthent_maksløpsbeste_resultater(ikke_usikre_resultater, krav.antall_valgfri, krav.maks_valgfri_løp)

            kombinerte_resultater = Liste.merge(usikre, beste_valgfri)
            aktuelle_resultater = resultater.filter(lambda x: kombinerte_resultater.any(lambda y: x.poeng == y.poeng and x.er_teknisk == y.er_teknisk))

            belastede_utøvere = cls.finn_belastede_utøvere(aktuelle_resultater, krav)
            belastede_resultater = resultater.filter(lambda x: x.utøver in belastede_utøvere)

            nye_usikre = Liste.merge(usikre, belastede_resultater)

            if nye_usikre == usikre:
                return aktuelle_resultater.sort(reverse=True)
            
            return rek(nye_usikre)
            
        return rek(obligatoriske)
    
    @classmethod
    def finn_ikkeval(cls, obligatoriske, krav):
        """
        Finner ikkeval, dvs. resultater som ikke kan være i valgfri oppstilling. Dette er 
        sterke resultater som alltid vil favoriseres å være i obligatorisk oppstilling.
        """
        ideell = cls.finn_ideell(obligatoriske, krav)
        
        antall_garanterte_tekniske_obl = max(
            krav.antall_obligatoriske-krav.maks_obligatoriske_løp,
            ideell.count(er_teknisk)-(krav.antall_valgfri-krav.maks_valgfri_løp)
        )

        tek_ikkeval = ideell.filter(er_teknisk).first(antall_garanterte_tekniske_obl)
        lop_ikkeval = ideell.filter(er_løp).first(krav.maks_obligatoriske_løp)

        return Liste.concat(tek_ikkeval, lop_ikkeval)
    
    @classmethod
    def finn_ideell(cls, resultater, krav):
        """
        Finner ideelle resultater, dvs. de resultatene som gir sterkeste obligatoriske oppstilling
        der utfordring rundt belastede resultater er ignorert.
        """
        return (resultater
            .filter(er_obligatorisk)
            .sort(reverse=True)
            .distinct(øvelse)
            .first(krav.antall_obligatoriske))
    
    @classmethod
    def uthent_maksløpsbeste_resultater(cls, resultater, antall, antall_løp):
        """
        Henter de :param:`antall` beste resultatene, men uten å overstige :param:`antall_løp`
        løpsresultater.
        """
        antall_beste_løp = resultater.first(antall).count(er_løp)

        if antall_beste_løp <= antall_løp:
            return resultater.first(antall)
        
        return Liste.concat(
            resultater.filter(er_teknisk).first(antall-antall_løp),
            resultater.filter(er_løp).first(antall_løp)
        )
    
    @classmethod
    def finn_belastede_utøvere(cls, resultater, krav):
        """
        Finner utøvere som er belastet, dvs. at de har flere resultater enn det maksimalt
        tillatte for en og samme utøver i oppstillingen.
        """
        return (resultater
            .filter(lambda res: res.utøver != nullutøver)
            .group_by(utøver)
            .items()
            .filter(lambda item: len(item[1])>krav.maks_resultater_per_utøver)
            .map(lambda item: item[0]))