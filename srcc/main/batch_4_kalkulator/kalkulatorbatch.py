from srcc.main.batch_4_kalkulator.resultatklargjøring import Resultatklargjøring
from srcc.main.batch_4_kalkulator.kalkulator import Kalkulator
from srcc.main.batch_4_kalkulator.tabellarbeid import Tabellarbeid
from srcc.main.batch_4_kalkulator.periodisering import Periodisering
from srcc.main.batch_4_kalkulator.kalkuleringsbesparelse import Kalkuleringsbesparelse

from srcc.main.utils.orm._mann_topplag import MannTopplag
from srcc.main.utils.orm._mann_lag import MannLag
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._mann_utøver_merverdi import MannUtøverMerverdi
from srcc.main.utils.orm._kvinne_topplag import KvinneTopplag
from srcc.main.utils.orm._kvinne_lag import KvinneLag
from srcc.main.utils.orm._kvinne_laginfo import KvinneLaginfo
from srcc.main.utils.orm._kvinne_lagresultat import KvinneLagresultat
from srcc.main.utils.orm._kvinne_lagplassering import KvinneLagplassering
from srcc.main.utils.orm._kvinne_serieresultat import KvinneSerieresultat
from srcc.main.utils.orm._kvinne_serieøvelse import KvinneSerieøvelse
from srcc.main.utils.orm._kvinne_utøver_merverdi import KvinneUtøverMerverdi

from sqlalchemy.orm import joinedload

class Kalkulatorbatch:

    batchnummer = 4

    class MennSerieklasser:
        serieresultat = MannSerieresultat
        topplag = MannTopplag
        lag = MannLag
        laginfo = MannLaginfo
        lagresultat = MannLagresultat
        lagplassering = MannLagplassering
        serieøvelse = MannSerieøvelse
        utøver_merverdi = MannUtøverMerverdi
    
    class KvinnerSerieklasser:
        serieresultat = KvinneSerieresultat
        topplag = KvinneTopplag
        lag = KvinneLag
        laginfo = KvinneLaginfo
        lagresultat = KvinneLagresultat
        lagplassering = KvinneLagplassering
        serieøvelse = KvinneSerieøvelse
        utøver_merverdi = KvinneUtøverMerverdi

    @staticmethod
    def kjør(seriedata, serieår, uttrekksdato):
        Kalkulatorbatch.kjør_for_kjønn(seriedata, serieår, uttrekksdato, Kalkulatorbatch.MennSerieklasser)
        Kalkulatorbatch.kjør_for_kjønn(seriedata, serieår, uttrekksdato, Kalkulatorbatch.KvinnerSerieklasser)

    @staticmethod
    def kjør_for_kjønn(seriedata, serieår, uttrekksdato, serieklasser):

        klubbresultater = Resultatklargjøring.hent_klubbresultater(seriedata, serieår, uttrekksdato, serieklasser)

        oppstillinger = {}
        laginfo = {}
        merverdier = {}

        lagresultater = (seriedata
            .hent(serieklasser.lagresultat)
            .options(joinedload(serieklasser.lagresultat.lag))
            .filter(serieklasser.lagresultat.fra_og_med <= uttrekksdato)
            .filter((serieklasser.lagresultat.til_og_med == None) | (serieklasser.lagresultat.til_og_med >= uttrekksdato))
            .all())

        uforandrede_klubber = Kalkuleringsbesparelse.finn_uforandrede_klubber(seriedata, serieår, klubbresultater, lagresultater)                
        klubbresultater = {klubb: resultater.values() for klubb,resultater in klubbresultater.items() if klubb not in uforandrede_klubber}

        Kalkuleringsbesparelse.legg_inn_uforandret_data(seriedata, serieår, uforandrede_klubber, oppstillinger, laginfo, merverdier, serieklasser, uttrekksdato)     
        
        topplag = {(topplag.klubb_id, topplag.lagnummer): topplag.divisjon for topplag in seriedata.hent(serieklasser.topplag).all() if topplag.serieår == serieår}
        
        serieøvelser = {serieøvelse.øvelseskode: serieøvelse for serieøvelse in seriedata.hent(serieklasser.serieøvelse).filter_by(serieår=serieår).all()}
        serieresultater = {serieresultat.resultat_id: serieresultat for serieresultat in seriedata.hent(serieklasser.serieresultat).all()}
        
        nye_lag = []
        for klubb,resultatdata in klubbresultater.items():
            resultater = map(lambda x: x[1], resultatdata)
            Kalkulator.LagKalk(serieår, seriedata, klubb, resultater, laginfo, oppstillinger, merverdier, serieøvelser, serieresultater, topplag, serieklasser, nye_lag)

        seriedata.bulkinnsett(nye_lag)
        tabeller = Tabellarbeid.sett_opp_tabell(laginfo, oppstillinger, topplag)
        
        Periodisering.periodiser_lagresultater(seriedata, serieår, uttrekksdato, oppstillinger, serieklasser)
        Periodisering.periodiser_lagplassering(seriedata, serieår, uttrekksdato, tabeller, serieklasser)
        Periodisering.periodiser_laginfo(seriedata, serieår, uttrekksdato, laginfo, serieklasser)
        Periodisering.periodiser_utøver_merverdier(seriedata, serieår, uttrekksdato, merverdier, serieklasser)