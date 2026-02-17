import sys
sys.path.append('./')

from srcc.main.utils.dokumentasjon_bakgrunn.tabelloversetter import Tabelloversetter 
from srcc.main.utils.dokumentasjon_bakgrunn.defaultobjekter import defaultobjekter

from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.utils.orm._klubb_unntatt_overbygning import KlubbUnntattOverbygning
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._utøver_unntatt_overbygning import UtøverUnntattOverbygning
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._øvelsesregel import Øvelsesregel
from srcc.main.utils.orm._kvinne_lag import KvinneLag
from srcc.main.utils.orm._kvinne_lagplassering import KvinneLagplassering
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat
from srcc.main.utils.orm._kvinne_laginfo import KvinneLaginfo
from srcc.main.utils.orm._kvinne_serieøvelse import KvinneSerieøvelse
from srcc.main.utils.orm._kvinne_lagresultat import KvinneLagresultat
from srcc.main.utils.orm._kvinne_topplag import KvinneTopplag
from srcc.main.utils.orm._mann_lag import MannLag
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._mann_topplag import MannTopplag
from srcc.main.utils.orm._overklubb import Overklubb
from srcc.main.utils.orm._overbygning import Overbygning
from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from srcc.main.utils.orm._rullestolutøver import Rullestolutøver
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._resultatbytte import Resultatbytte
from srcc.main.utils.orm._mann_utøver_merverdi import MannUtøverMerverdi

from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch
from srcc.main.batch_3_utdeling.utdelingsbatch import Utdelingsbatch

from datetime import date
import time
import re

tabellvarianter = {
    "klubber": (Klubb,),
    "klubbkretser": (Klubbkrets,),
    "klubber unntatt overbygning": (KlubbUnntattOverbygning,),
    "stevner": (Stevne,),
    "lag": (MannLag,),
    "laginfo": (MannLaginfo,),
    "lagresultater": (MannLagresultat,),
    "lagplasseringer": (MannLagplassering,),
    "oppstillingskrav": (Oppstillingskrav,),
    "overklubber": (Overklubb,),
    "overbygninger": (Overbygning,),
    "resultatbytter": (Resultatbytte,),
    "resultater": (Resultat,),
    "rullestolutøvere": (Rullestolutøver,),
    "serier": (Serie,),
    "serieresultater": (MannSerieresultat,),
    "serieøvelser": (MannSerieøvelse,),
    "topplag": (MannTopplag,),
    "uttrekksresultater": (MannUttrekksresultat,),
    "utøver merverdier": (MannUtøverMerverdi,),
    "utøvere": (Utøver,),
    "utøvere unntatt overbygning": (UtøverUnntattOverbygning,),
    "øvelsesregler": (Øvelsesregel,),
    "øvelser": (Øvelse,),
}

batcher = {
    "utdelings": Utdelingsbatch,
    "kalkulator": Kalkulatorbatch,
}

class Utsagn:

    tid_brukt = None

    def ta_tid(func):
        def wrapper(*args, **kwargs):
            start = time.time() 
            result = func(*args, **kwargs)
            Utsagn.tid_brukt = time.time()-start
            return result
        return wrapper

    @staticmethod
    def tolk(utsagn, råtabell):

        alle_utsagn = {
            r"^Gitt følgende ([^.]*):": Utsagn.utled_tabell,
            r"^Gitt ingen (.*)": Utsagn.utled_tom_tabell,
            r"^Gitt følgende serieresultater fra (.*):": Utsagn.utled_serieresultater_på_dato,
            r"^Gitt klubben (.*) med følgende serieresultater fra (.*):": Utsagn.utled_serieresultater_for_klubb_på_dato,
            r"^Gitt klubben (.*) med følgende uttrekksresultater fra (.*) til (.*):": Utsagn.utled_uttrekksresultater_for_klubb_for_periode,
            r"^Gitt klubben (.*) med følgende uttrekksresultater fra (.*):": Utsagn.utled_uttrekksresultater_for_klubb_fra_dato,
            r"^Gitt klubben (.*) med ingen uttrekksresultater fra (.*)": lambda x,y: ([], []),
            r"^Når (.*)batch kjøres med serieår (.*) og uttrekksdato (.*)": Utsagn.kjør_batch,
            r"^Når seriedata benyttes": lambda x: x,
            r"^Så skal (.*) sitt (.*). lag få følgende lagresultater serien (.*) på dato (.*):": Utsagn.verifiser_klubbens_lagresultater,
            r"^Så skal (.*) sitt (.*). lag få følgende laginfo serien (.*) på dato (.*):": Utsagn.verifiser_klubbens_laginfo,
            r"^Så skal (.*) bli:": Utsagn.verifiser_lik_forventet,
            r"^Så skal ingen (.*) finnes": Utsagn.verifiser_ingen,
            r"^Så skal batchen bruke under (.*) sekunder": Utsagn.verifiser_tid_brukt_sekunder,
        }

        for mønster,f in alle_utsagn.items():
            if match := re.match(mønster, utsagn):
                if råtabell == None:
                    return lambda *args: f(*args, *match.groups())
                else:
                    return lambda *args: f(*args, råtabell, *match.groups())
                
        raise ValueError(f"Ingen predefinerte mønstre matchet utsagnet: {utsagn}")

    @staticmethod
    def utled_tabell(råtabell, tabellnavn):
        tabeller = []
        defaulttabeller = []
        for cls in tabellvarianter[tabellnavn]:
            objekter, defaultobjekter = Tabelloversetter.fra_råtabell(cls, råtabell)
            tabeller.append((cls, objekter))
            defaulttabeller.extend(defaultobjekter)
        return defaulttabeller, tabeller
    
    @staticmethod
    def utled_tom_tabell(tabellnavn):
        return [],[(cls,[]) for cls in tabellvarianter[tabellnavn]]
    
    @staticmethod
    def utled_serieresultater_på_dato(råtabell, fra_dato):
        fra_og_med = date.fromisoformat(fra_dato.replace(".","-"))

        klubber = {}
        for klubbnavn, resultat_id in zip(råtabell.attributt("Klubb"), råtabell.attributt("Resultat id")):
            klubber[int(resultat_id)] = defaultobjekter["Klubb"](klubbnavn)             

        defaulttabeller, tabeller = Utsagn.utled_tabell(råtabell.fjern("Klubb","Poeng"), "resultater")
        _,resultater = tabeller[0]

        serieresultater = [MannSerieresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=None, poeng=int(poeng), klubb_id=klubber[resultat.resultat_id].klubb_id, forløp="fra dokumentasjon") for resultat,poeng in zip(resultater, råtabell.attributt("Poeng"))]
        menn_uttrekksresultater = [MannUttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=None, klubb_id=klubber[resultat.resultat_id].klubb_id) for resultat in resultater]
        kvinne_uttrekksresultater = [KvinneUttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=None, klubb_id=klubber[resultat.resultat_id].klubb_id) for resultat in resultater]

        defaulttabeller.append((Klubb, list(klubber.values())))
        tabeller.append((MannSerieresultat, serieresultater))
        tabeller.append((MannUttrekksresultat, menn_uttrekksresultater))
        tabeller.append((KvinneUttrekksresultat, kvinne_uttrekksresultater))

        return defaulttabeller, tabeller

    @staticmethod
    def utled_serieresultater_for_klubb_på_dato(råtabell, klubbnavn, uttrekksdato):
        fra_og_med = date.fromisoformat(uttrekksdato.replace(".","-"))
        klubb = defaultobjekter["Klubb"](klubbnavn)

        defaulttabeller, tabeller = Utsagn.utled_tabell(råtabell.fjern("Poeng"), "resultater")
        _,resultater = tabeller[0]

        serieresultater = [MannSerieresultat(resultat_id=resultat.resultat_id, fra_og_med=date.fromisoformat(uttrekksdato.replace(".","-")), til_og_med=None, poeng=int(poeng), klubb_id=klubb.klubb_id, forløp="fra dokumentasjon") for resultat,poeng in zip(resultater, råtabell.attributt("Poeng"))]
        menn_uttrekksresultater = [MannUttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=None, klubb_id=klubb.klubb_id) for resultat in resultater]
        kvinne_uttrekksresultater = [KvinneUttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=None, klubb_id=klubb.klubb_id) for resultat in resultater]

        defaulttabeller.append((Klubb, [klubb]))
        tabeller.append((MannSerieresultat, serieresultater))
        tabeller.append((MannUttrekksresultat, menn_uttrekksresultater))
        tabeller.append((KvinneUttrekksresultat, kvinne_uttrekksresultater))

        return defaulttabeller, tabeller

    @staticmethod
    def utled_uttrekksresultater_for_klubb_fra_dato(råtabell, klubbnavn, fra_dato):
        fra_og_med = date.fromisoformat(fra_dato.replace(".","-"))
        klubb = defaultobjekter["Klubb"](klubbnavn)

        defaulttabeller, tabeller = Utsagn.utled_tabell(råtabell, "resultater")
        _,resultater = tabeller[0]

        menn_uttrekksresultater = [MannUttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=None, klubb_id=klubb.klubb_id) for resultat in resultater]
        kvinne_uttrekksresultater = [KvinneUttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=None, klubb_id=klubb.klubb_id) for resultat in resultater]

        defaulttabeller.append((Klubb, [klubb]))
        tabeller.append((MannUttrekksresultat, menn_uttrekksresultater))
        tabeller.append((KvinneUttrekksresultat, kvinne_uttrekksresultater))

        return defaulttabeller, tabeller
    
    @staticmethod
    def utled_uttrekksresultater_for_klubb_for_periode(råtabell, klubbnavn, fra_dato, til_dato):
        fra_og_med = date.fromisoformat(fra_dato.replace(".","-"))
        til_og_med = date.fromisoformat(til_dato.replace(".","-"))
        klubb = defaultobjekter["Klubb"](klubbnavn)

        defaulttabeller, tabeller = Utsagn.utled_tabell(råtabell, "resultater")
        _,resultater = tabeller[0]

        menn_uttrekksresultater = [MannUttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=til_og_med, klubb_id=klubb.klubb_id) for resultat in resultater]
        kvinne_uttrekksresultater = [KvinneUttrekksresultat(resultat_id=resultat.resultat_id, fra_og_med=fra_og_med, til_og_med=til_og_med, klubb_id=klubb.klubb_id) for resultat in resultater]

        defaulttabeller.append((Klubb, [klubb]))
        tabeller.append((MannUttrekksresultat, menn_uttrekksresultater))
        tabeller.append((KvinneUttrekksresultat, kvinne_uttrekksresultater))

        return defaulttabeller, tabeller

    @staticmethod
    @ta_tid
    def kjør_batch(seriedata, batch, serieår, uttrekksdato):
        batcher[batch].kjør(seriedata, int(serieår), date.fromisoformat(uttrekksdato.replace(".","-")))

    @staticmethod
    def verifiser_klubbens_laginfo(seriedata, råtabell1, klubbnavn, lagnummer, serieår, dato):
        aktuell_dato = date.fromisoformat(dato.replace(".","-"))
        klubb = seriedata.hent(Klubb).filter_by(klubbnavn=klubbnavn).one()

        for Laginfo in tabellvarianter["laginfo"]:
            laginfo = (seriedata
                .hent(Laginfo)
                .filter_by(klubb_id=klubb.klubb_id, lagnummer=lagnummer, serieår=int(serieår))
                .filter((Laginfo.fra_og_med <= aktuell_dato))
                .filter((Laginfo.til_og_med == None) | (Laginfo.til_og_med >= aktuell_dato))
                .one())

            råtabell2 = Tabelloversetter.til_råtabell(råtabell1.header(), Laginfo, [laginfo])
            Utsagn.__verifiser_to_like_tabeller(råtabell1, råtabell2)

    @staticmethod
    def verifiser_klubbens_lagresultater(seriedata, råtabell1, klubbnavn, lagnummer, serieår, dato):
        aktuell_dato = date.fromisoformat(dato.replace(".","-"))
        klubb = seriedata.hent(Klubb).filter_by(klubbnavn=klubbnavn).one()

        for Lagresultat in tabellvarianter["lagresultater"]:
            lagresultater = (seriedata
                .hent(Lagresultat)
                .filter_by(klubb_id=klubb.klubb_id, lagnummer=lagnummer, serieår=int(serieår))
                .filter((Lagresultat.fra_og_med <= aktuell_dato))
                .filter((Lagresultat.til_og_med == None) | (Lagresultat.til_og_med >= aktuell_dato))
                .all())
            
            råtabell2 = Tabelloversetter.til_råtabell(råtabell1.header(), Lagresultat, lagresultater)
            Utsagn.__verifiser_to_like_tabeller(råtabell1, råtabell2)

    @staticmethod
    def verifiser_lik_forventet(seriedata, råtabell1, tabellnavn):

        for Lagresultat in tabellvarianter[tabellnavn]:
            lagresultater = seriedata.hent(Lagresultat).all()
            råtabell2 = Tabelloversetter.til_råtabell(råtabell1.header(), Lagresultat, lagresultater)
            Utsagn.__verifiser_to_like_tabeller(råtabell1, råtabell2)
        
    @staticmethod
    def verifiser_ingen(seriedata, tabellnavn):
        for cls in tabellvarianter[tabellnavn]:
            antall = seriedata.hent(cls).count()
            assert antall == 0, f"Ingen {tabellnavn} skulle finnes, men fant '{antall}'"

    @staticmethod
    def __verifiser_to_like_tabeller(fra_dokumentasjon, fra_kode):
        assert fra_dokumentasjon == fra_kode, '\n' + fra_dokumentasjon.tabelldiff(fra_kode)

    @staticmethod
    def verifiser_tid_brukt_sekunder(_, sekunder):
        assert Utsagn.tid_brukt < int(sekunder), f"Batchen skulle brukt under {sekunder} sekunder, men brukte: {Utsagn.tid_brukt:.1f}s"


