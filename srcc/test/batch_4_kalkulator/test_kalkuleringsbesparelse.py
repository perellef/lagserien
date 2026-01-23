import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import en_klubb, en_utøver, et_mann_lag, en_batchkjøring, et_resultat, et_serieresultat, en_mann_laginfo, et_mann_lagresultat, en_mann_utøver_merverdi
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger

from srcc.main.utils.orm._batchkjøring import Batchkjøring
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._mann_utøver_merverdi import MannUtøverMerverdi
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.batch_4_kalkulator.kalkuleringsbesparelse import Kalkuleringsbesparelse
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch

from srcc.main.kontrollsenter.tilganger import Tilganger

from datetime import date

# finn_uforandrede_klubber
def test_finn_uforandrede_klubber_returnerer_ingen_klubber_hvis_ingen_tidligere_kalkulatorkjøring():

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(Batchkjøring, [])
        .bygg())
    
    klubbresultater = {
        en_klubb(klubb="Ås"): {
            183538738: (date(2100,1,1), et_resultat())
        }
    }

    lagresultater = [
        et_mann_lagresultat()
    ]
    
    serieår = 2100
    klubber = Kalkuleringsbesparelse.finn_uforandrede_klubber(seriedata, serieår, klubbresultater, lagresultater)

    assert len(klubber) == 0

def test_finn_uforandrede_klubber_returnerer_ingen_klubber_hvis_et_resultat_har_kommet_etter_siste_kalkulatorkjøring():
    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(Batchkjøring, [
            en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,1)),
            en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,2)),
            en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,3))
            
        ])
        .bygg())
    
    klubbresultater = {
        en_klubb(klubb="Ås"): {
            947836366: (date(2100,1,3), et_resultat(utøver="Per")),
            914795193: (date(2100,1,1), et_resultat(utøver="Odd")),
            878301914: (date(2100,1,5), et_resultat(utøver="Jan")),
            191206936: (date(2100,1,2), et_resultat(utøver="Tom")),
        }
    }
    
    lagresultater = [
        et_mann_lagresultat(utøver="Per", klubb="Ås"),
        et_mann_lagresultat(utøver="Odd", klubb="Ås"),
        et_mann_lagresultat(utøver="Tom", klubb="Ås"),
    ]

    serieår = 2100
    klubber = Kalkuleringsbesparelse.finn_uforandrede_klubber(seriedata, serieår, klubbresultater, lagresultater)

    assert len(klubber) == 0

def test_finn_uforandrede_klubber_returnerer_ingen_klubber_hvis_et_resultat_er_fjernet_etter_siste_kalkulatorkjøring():
    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
    .med(Batchkjøring, [
        en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,1)),
        en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,2)),
        en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,3))
    ])
    .bygg())
    
    klubbresultater = {
        en_klubb(klubb="Ås"): {
            947836366: (date(2100,1,1), et_resultat(utøver="Per")),
        }
    }

    lagresultater = [
        et_mann_lagresultat(utøver="Per", klubb="Ås"),
        et_mann_lagresultat(utøver="Tom", klubb="Ås"),
    ]

    serieår = 2100
    klubber = Kalkuleringsbesparelse.finn_uforandrede_klubber(seriedata, serieår, klubbresultater, lagresultater)

    assert len(klubber) == 0

def test_finn_uforandrede_klubber_returnerer_klubber_der_siste_resultat_var_hentet_før_forrige_kalkulatorkjøring():

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(Batchkjøring, [
            en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,1)),
            en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,2)),
            en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,3))
            
        ])
        .bygg())
    
    klubbresultater = {
        en_klubb(klubb="Ås"): {
            947836366: (date(2100,1,3), et_resultat(utøver="Per")),
            191206936: (date(2100,1,1), et_resultat(utøver="Tom")),
        }
    }

    lagresultater = set([
        et_mann_lagresultat(utøver="Per", klubb="Ås"),
        et_mann_lagresultat(utøver="Tom", klubb="Ås"),
    ])
    
    serieår = 2100
    klubber = Kalkuleringsbesparelse.finn_uforandrede_klubber(seriedata, serieår, klubbresultater, lagresultater)

    ås_il = en_klubb(klubb="Ås")
    assert_at(klubber).kun_inneholder(ås_il.klubb_id)

# legg_inn_data_for_uforandrede_klubber
def test_legg_inn_uforandret_data_legger_inn_oppstilling_til_uforandrede_klubber():
    uforandrede_klubber = set([en_klubb(klubb="Ås").klubb_id])

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannLagresultat, [
            et_mann_lagresultat(serieår=2100, klubb="Ås", lagnummer=1, utøver="A", øvelse="60m", oppstillingstype="OBLIGATORISK"),
            et_mann_lagresultat(serieår=2100, klubb="Ås", lagnummer=1, utøver="B", øvelse="100m", oppstillingstype="VALGFRI"),
        ])
        .med(MannSerieresultat, [
            et_serieresultat(utøver="A", øvelse="60m", poeng=100),
            et_serieresultat(utøver="B", øvelse="100m", poeng=100),
        ])
        .bygg())

    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    oppstillinger = {}

    Kalkuleringsbesparelse.legg_inn_uforandret_data(seriedata, serieår, uforandrede_klubber, oppstillinger, {}, {}, Kalkulatorbatch.MennSerieklasser, uttrekksdato)

    assert oppstillinger == {
        et_mann_lag(klubb="Ås", lagnummer=1): {
            "OBLIGATORISK": [(100, et_resultat(utøver="A", øvelse="60m"))],
            "VALGFRI": [(100, et_resultat(utøver="B", øvelse="100m"))],
        }
    }

def test_legg_inn_uforandret_data_legger_ikke_inn_oppstilling_til_ikkeuforandrede_klubber():
    uforandrede_klubber = set()

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannLagresultat, [
            et_mann_lagresultat(serieår=2100, klubb="Ås", lagnummer=1, utøver="A", øvelse="60m", oppstillingstype="OBLIGATORISK"),
            et_mann_lagresultat(serieår=2100, klubb="Ås", lagnummer=1, utøver="B", øvelse="100m", oppstillingstype="VALGFRI"),
        ])
        .med(MannSerieresultat, [
            et_serieresultat(utøver="A", øvelse="60m", poeng=100),
            et_serieresultat(utøver="B", øvelse="100m", poeng=100),
        ])
        .bygg())

    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    oppstillinger = {}

    Kalkuleringsbesparelse.legg_inn_uforandret_data(seriedata, serieår, uforandrede_klubber, oppstillinger, {}, {}, Kalkulatorbatch.MennSerieklasser, uttrekksdato)

    assert oppstillinger == {}

def test_legg_inn_uforandret_data_legger_inn_laginfo_til_uforandrede_klubber():
    uforandrede_klubber = set([en_klubb(klubb="Ås").klubb_id])

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannLaginfo, [
            en_mann_laginfo(serieår=2100, klubb="Ås", lagnummer=1, poeng=4000, poeng_obligatoriske=2000, poeng_valgfri=2000, antall_noteringer=5, antall_deltakere=5)
        ])
        .bygg())

    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    laginfo = {}

    Kalkuleringsbesparelse.legg_inn_uforandret_data(seriedata, serieår, uforandrede_klubber, {}, laginfo, {}, Kalkulatorbatch.MennSerieklasser, uttrekksdato)

    assert laginfo == {et_mann_lag(klubb="Ås", lagnummer=1): (4000, 2000, 2000, 5, 5)}

def test_legg_inn_uforandret_data_legger_ikke_inn_laginfo_til_ikkeuforandrede_klubber():
    uforandrede_klubber = set()

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannLaginfo, [
            en_mann_laginfo(serieår=2100, klubb="Ås", lagnummer=1, poeng=4000, poeng_obligatoriske=2000, poeng_valgfri=2000, antall_noteringer=5, antall_deltakere=5)
        ])
        .bygg())

    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    laginfo = {}

    Kalkuleringsbesparelse.legg_inn_uforandret_data(seriedata, serieår, uforandrede_klubber, {}, laginfo, {}, Kalkulatorbatch.MennSerieklasser, uttrekksdato)

    assert laginfo == {}

def test_legg_inn_uforandret_data_legger_inn_utøver_merverdi_til_uforandrede_klubber():
    uforandrede_klubber = set([en_klubb(klubb="Ås").klubb_id])

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannUtøverMerverdi, [
            en_mann_utøver_merverdi(serieår=2100, klubb="Ås", utøver="Per", poeng=100)
        ])
        .bygg())

    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    merverdier = {}

    Kalkuleringsbesparelse.legg_inn_uforandret_data(seriedata, serieår, uforandrede_klubber, {}, {}, merverdier, Kalkulatorbatch.MennSerieklasser, uttrekksdato)

    klubb_id = en_klubb(klubb="Ås").klubb_id
    utøver_id = en_utøver(navn="Per").utøver_id

    assert merverdier == {(klubb_id, utøver_id): 100}

def test_legg_inn_uforandret_data_legger_ikke_inn_utøver_merverdi_til_ikkeuforandrede_klubber():
    uforandrede_klubber = set()

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannUtøverMerverdi, [
            en_mann_utøver_merverdi(serieår=2100, klubb="Ås", utøver="Per", poeng=100)
        ])
        .bygg())

    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    merverdier = {}

    Kalkuleringsbesparelse.legg_inn_uforandret_data(seriedata, serieår, uforandrede_klubber, {}, {}, merverdier, Kalkulatorbatch.MennSerieklasser, uttrekksdato)

    assert merverdier == {}