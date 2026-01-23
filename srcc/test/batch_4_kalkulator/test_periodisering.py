import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import en_klubb, en_utøver, et_resultat, et_mann_lag, et_mann_lagresultat, et_serieresultat, en_mann_laginfo, en_mann_lagplassering, en_mann_utøver_merverdi
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger

from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._mann_utøver_merverdi import MannUtøverMerverdi
from srcc.main.batch_4_kalkulator.periodisering import Periodisering
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch

from srcc.main.kontrollsenter.tilganger import Tilganger

from datetime import date

# periodiser_lagresultater
def test_periodiser_lagresultater_starter_ny_periode_hvis_lagresultat_ikke_finnes():

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLagresultat, [])
            .bygg())

    oppstillinger = {et_mann_lag(serieår=2025): {"OBLIGATORISK": [(100, et_resultat())], "VALGFRI": []}}
    uttrekksdato = date(2025,1,1)
    
    Periodisering.periodiser_lagresultater(seriedata, 2025, uttrekksdato, oppstillinger, Kalkulatorbatch.MennSerieklasser)

    forventet_lagresultat = et_mann_lagresultat(serieår=2025, fra_og_med=uttrekksdato, til_og_med=None)

    assert_at(seriedata).av_type(MannLagresultat).kun_inneholder(forventet_lagresultat)
    
def test_periodiser_lagresultater_beholder_periode_hvis_lagresultat_finnes():

    lagresultat = et_mann_lagresultat(serieår=2025, fra_og_med=date(2023,1,1), til_og_med=None, oppstillingstype="VALGFRI")

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannSerieresultat, [et_serieresultat(fra_og_med=date(2023,1,1), til_og_med=None, poeng=100)])
            .med(MannLagresultat, [lagresultat])
            .bygg())
    
    oppstillinger = {et_mann_lag(serieår=2025): {"OBLIGATORISK": [], "VALGFRI": [(100, et_resultat())]}}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_lagresultater(seriedata, 2025, uttrekksdato, oppstillinger, Kalkulatorbatch.MennSerieklasser)

    assert_at(seriedata).av_type(MannLagresultat).kun_inneholder(lagresultat)

def test_periodiser_lagresultater_avslutter_gammel_og_starter_ny_periode_hvis_lagresultat_har_ny_oppstillingstype():
 
    lagresultat = et_mann_lagresultat(serieår=2025, fra_og_med=date(2023,1,1), til_og_med=None, oppstillingstype="VALGFRI")

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannSerieresultat, [et_serieresultat(fra_og_med=date(2023,1,1), til_og_med=None, poeng=100)])
            .med(MannLagresultat, [lagresultat])
            .bygg())

    oppstillinger = {et_mann_lag(serieår=2025): {"OBLIGATORISK": [(100, et_resultat())], "VALGFRI": []}}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_lagresultater(seriedata, 2025, uttrekksdato, oppstillinger, Kalkulatorbatch.MennSerieklasser)

    forventede_lagresultat = [
        et_mann_lagresultat(serieår=2025, fra_og_med=date(2023,1,1), til_og_med=date(2024,12,31), oppstillingstype="VALGFRI"),
        et_mann_lagresultat(serieår=2025, fra_og_med=date(2025,1,1), til_og_med=None,  oppstillingstype="OBLIGATORISK"),
    ]

    assert_at(seriedata).av_type(MannLagresultat).kun_har(forventede_lagresultat)

def test_periodiser_lagresultater_avslutter_gammel_og_starter_ny_periode_hvis_lagresultat_har_ny_poeng():
 
    lagresultat = et_mann_lagresultat(serieår=2025, fra_og_med=date(2023,1,1), til_og_med=None, oppstillingstype="VALGFRI")

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannSerieresultat, [et_serieresultat(fra_og_med=date(2023,1,1), til_og_med=None, poeng=200)])
            .med(MannLagresultat, [lagresultat])
            .bygg())

    oppstillinger = {et_mann_lag(serieår=2025): {"OBLIGATORISK": [], "VALGFRI": [(100, et_resultat())]}}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_lagresultater(seriedata, 2025, uttrekksdato, oppstillinger, Kalkulatorbatch.MennSerieklasser)

    forventede_lagresultat = [
        et_mann_lagresultat(serieår=2025, fra_og_med=date(2023,1,1), til_og_med=date(2024,12,31), oppstillingstype="VALGFRI"),
        et_mann_lagresultat(serieår=2025, fra_og_med=date(2025,1,1), til_og_med=None,  oppstillingstype="VALGFRI"),
    ]

    assert_at(seriedata).av_type(MannLagresultat).kun_har(forventede_lagresultat)

def test_periodiser_lagresultater_avkutter_ikke_lagresultater_fra_andre_serieår():
    lagresultat = et_mann_lagresultat(serieår=2024, fra_og_med=date(2023,1,1), til_og_med=None, oppstillingstype="VALGFRI")

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannSerieresultat, [et_serieresultat(fra_og_med=date(2023,1,1), til_og_med=None)])
            .med(MannLagresultat, [lagresultat])
            .bygg())

    oppstillinger = {}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_lagresultater(seriedata, 2025, uttrekksdato, oppstillinger, Kalkulatorbatch.MennSerieklasser)

    assert_at(seriedata).av_type(MannLagresultat).kun_inneholder(lagresultat)

# periodiser_laginfo
def test_periodiser_laginfo_starter_ny_periode_hvis_laginfo_ikke_finnes():

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLaginfo, [])
            .bygg())

    all_laginfo = {et_mann_lag(serieår=2025): (2000, 1000, 1000, 10, 10)}
    uttrekksdato = date(2025,1,1)
    
    Periodisering.periodiser_laginfo(seriedata, 2025, uttrekksdato, all_laginfo, Kalkulatorbatch.MennSerieklasser)

    forventet_laginfo = en_mann_laginfo(
        serieår=2025,
        fra_og_med=uttrekksdato,
        til_og_med=None,
        poeng=2000,
        poeng_obligatoriske=1000,
        poeng_valgfri=1000, 
        antall_noteringer=10,
        antall_deltakere=10,
    )

    assert_at(seriedata).av_type(MannLaginfo).kun_inneholder(forventet_laginfo)

def test_periodiser_laginfo_beholder_periode_hvis_laginfo_finnes():

    laginfo = en_mann_laginfo(
        serieår=2025,
        fra_og_med=date(2023,1,1),
        til_og_med=None,
        poeng=2000,
        poeng_obligatoriske=1000,
        poeng_valgfri=1000, 
        antall_noteringer=10,
        antall_deltakere=10,
    )

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLaginfo, [laginfo])
            .bygg())

    all_laginfo = {et_mann_lag(serieår=2025): (2000, 1000, 1000, 10, 10)}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_laginfo(seriedata, 2025, uttrekksdato, all_laginfo, Kalkulatorbatch.MennSerieklasser)

    assert_at(seriedata).av_type(MannLaginfo).kun_inneholder(laginfo)

def test_periodiser_laginfo_avslutter_gammel_og_starter_ny_periode_hvis_laginfo_har_ny_info():
 
    laginfo = en_mann_laginfo(
        serieår=2025,
        fra_og_med=date(2023,1,1),
        til_og_med=None,
        poeng=2000,
        poeng_obligatoriske=1000,
        poeng_valgfri=1000, 
        antall_noteringer=10,
        antall_deltakere=10,
    )

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLaginfo, [laginfo])
            .bygg())

    all_laginfo = {et_mann_lag(serieår=2025): (4000, 2000, 2000, 10, 10)}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_laginfo(seriedata, 2025, uttrekksdato, all_laginfo, Kalkulatorbatch.MennSerieklasser)

    forventet_laginfo = [
        en_mann_laginfo(serieår=2025, fra_og_med=date(2023,1,1), til_og_med=date(2024,12,31), poeng=2000, poeng_obligatoriske=1000, poeng_valgfri=1000, antall_noteringer=10, antall_deltakere=10,),
        en_mann_laginfo(serieår=2025, fra_og_med=date(2025,1,1), til_og_med=None, poeng=4000, poeng_obligatoriske=2000, poeng_valgfri=2000, antall_noteringer=10, antall_deltakere=10,),
    ]

    assert_at(seriedata).av_type(MannLaginfo).kun_har(forventet_laginfo)

def test_periodiser_laginfo_avkutter_ikke_laginfo_fra_andre_serieår():
     
    laginfo = en_mann_laginfo(
        serieår=2024,
        fra_og_med=date(2023,1,1),
        til_og_med=None,
        poeng=2000,
        poeng_obligatoriske=1000,
        poeng_valgfri=1000, 
        antall_noteringer=10,
        antall_deltakere=10,
    )

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLaginfo, [laginfo])
            .bygg())

    all_laginfo = {}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_laginfo(seriedata, 2025, uttrekksdato, all_laginfo, Kalkulatorbatch.MennSerieklasser)

    assert_at(seriedata).av_type(MannLaginfo).kun_inneholder(laginfo)

# periodiser_lagplassering
def test_periodiser_lagplassering_starter_ny_periode_hvis_lagplassering_ikke_finnes():

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLagplassering, [])
            .bygg())

    plasseringer = {1: [et_mann_lag(serieår=2025)]}
    uttrekksdato = date(2025,1,1)
    
    Periodisering.periodiser_lagplassering(seriedata, 2025, uttrekksdato, plasseringer, Kalkulatorbatch.MennSerieklasser)

    forventet_lagplassering = en_mann_lagplassering(serieår=2025, fra_og_med=uttrekksdato, til_og_med=None, divisjon=1, plassering=1)

    assert_at(seriedata).av_type(MannLagplassering).kun_inneholder(forventet_lagplassering)

def test_periodiser_lagplassering_beholder_periode_hvis_lagplassering_finnes():

    lagplassering = en_mann_lagplassering(serieår=2025, fra_og_med=date(2023,1,1), til_og_med=None, divisjon=1, plassering=1)

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLagplassering, [lagplassering])
            .bygg())

    plasseringer = {1: [et_mann_lag(serieår=2025)]}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_lagplassering(seriedata, 2025, uttrekksdato, plasseringer, Kalkulatorbatch.MennSerieklasser)

    assert_at(seriedata).av_type(MannLagplassering).kun_inneholder(lagplassering)

def test_periodiser_lagplassering_avslutter_gammel_og_starter_ny_periode_hvis_lagplassering_har_nytt_lag():
 
    lagplasseringer = [
        en_mann_lagplassering(serieår=2025, klubb="Ås", fra_og_med=date(2023,1,1), til_og_med=None, divisjon=1, plassering=1),
        en_mann_lagplassering(serieår=2025, klubb="Ski", fra_og_med=date(2023,1,1), til_og_med=None, divisjon=1, plassering=2),
    ]

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLagplassering, lagplasseringer)
            .bygg())

    plasseringer = {1: [et_mann_lag(serieår=2025, klubb="Ski"), et_mann_lag(serieår=2025, klubb="Ås")]}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_lagplassering(seriedata, 2025, uttrekksdato, plasseringer, Kalkulatorbatch.MennSerieklasser)

    forventet_lagplassering = [
        en_mann_lagplassering(serieår=2025, klubb="Ås", fra_og_med=date(2023,1,1), til_og_med=date(2024,12,31), divisjon=1, plassering=1),
        en_mann_lagplassering(serieår=2025, klubb="Ski", fra_og_med=date(2023,1,1), til_og_med=date(2024,12,31), divisjon=1, plassering=2),
        en_mann_lagplassering(serieår=2025, klubb="Ås", fra_og_med=date(2025,1,1), til_og_med=None,  divisjon=1, plassering=2),
        en_mann_lagplassering(serieår=2025, klubb="Ski", fra_og_med=date(2025,1,1), til_og_med=None,  divisjon=1, plassering=1),
    ]

    assert_at(seriedata).av_type(MannLagplassering).kun_har(forventet_lagplassering)

def test_periodiser_lagplassering_avkutter_ikke_lagplassering_fra_andre_serieår():

    lagplassering = en_mann_lagplassering(serieår=2024, fra_og_med=date(2023,1,1), til_og_med=None, divisjon=1, plassering=1)

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannLagplassering, [lagplassering])
            .bygg())

    plasseringer = {}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_lagplassering(seriedata, 2025, uttrekksdato, plasseringer, Kalkulatorbatch.MennSerieklasser)

    assert_at(seriedata).av_type(MannLagplassering).kun_inneholder(lagplassering)

# periodiser_utøver_merverdier
def test_periodiser_utøver_merverdier_starter_ny_periode_hvis_utøver_merverdi_ikke_finnes():

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(MannUtøverMerverdi, [])
            .bygg())

    klubb_id = en_klubb(klubb="Ås").klubb_id
    utøver_id = en_utøver(navn="Per").utøver_id

    all_utøver_merverdi = {(klubb_id, utøver_id): 100}
    uttrekksdato = date(2025,1,1)
    
    Periodisering.periodiser_utøver_merverdier(seriedata, 2025, uttrekksdato, all_utøver_merverdi, Kalkulatorbatch.MennSerieklasser)

    forventet_utøver_merverdi = en_mann_utøver_merverdi(
        serieår=2025,
        klubb="Ås",
        utøver="Per",
        fra_og_med=uttrekksdato,
        til_og_med=None,
        poeng=100,
    )

    assert_at(seriedata).av_type(MannUtøverMerverdi).kun_inneholder(forventet_utøver_merverdi)

def test_periodiser_utøver_merverdier_beholder_periode_hvis_utøver_merverdi_finnes():
    utøver_merverdi = en_mann_utøver_merverdi(
        serieår=2025,
        klubb="Ås",
        utøver="Per",
        fra_og_med=date(2023,1,1),
        til_og_med=None,
        poeng=100,
    )

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannUtøverMerverdi, [utøver_merverdi])
        .bygg())
    
    klubb_id = en_klubb(klubb="Ås").klubb_id
    utøver_id = en_utøver(navn="Per").utøver_id

    all_utøver_merverdi = {(klubb_id, utøver_id): 100}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_utøver_merverdier(seriedata, 2025, uttrekksdato, all_utøver_merverdi, Kalkulatorbatch.MennSerieklasser)

    assert_at(seriedata).av_type(MannUtøverMerverdi).kun_inneholder(utøver_merverdi)

def test_periodiser_utøver_merverdier_avslutter_gammel_og_starter_ny_periode_hvis_utøver_merverdi_har_ny_poeng():
 
    utøver_merverdi = en_mann_utøver_merverdi(
        serieår=2025,
        klubb="Ås",
        utøver="Per",
        fra_og_med=date(2023,1,1),
        til_og_med=None,
        poeng=100,
    )

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannUtøverMerverdi, [utøver_merverdi])
        .bygg())
    
    klubb_id = en_klubb(klubb="Ås").klubb_id
    utøver_id = en_utøver(navn="Per").utøver_id

    all_utøver_merverdi = {(klubb_id, utøver_id): 200}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_utøver_merverdier(seriedata, 2025, uttrekksdato, all_utøver_merverdi, Kalkulatorbatch.MennSerieklasser)

    forventet_laginfo = [
        en_mann_utøver_merverdi(serieår=2025, klubb="Ås", utøver="Per", fra_og_med=date(2023,1,1), til_og_med=date(2024,12,31), poeng=100),
        en_mann_utøver_merverdi(serieår=2025, klubb="Ås", utøver="Per", fra_og_med=uttrekksdato, til_og_med=None, poeng=200),
    ]

    assert_at(seriedata).av_type(MannUtøverMerverdi).kun_har(forventet_laginfo)

def test_periodiser_utøver_merverdier_avkutter_ikke_utøver_merverdi_fra_andre_serieår():
     
    utøver_merverdi = en_mann_utøver_merverdi(
        serieår=2024,
        klubb="Ås",
        utøver="Per",
        fra_og_med=date(2023,1,1),
        til_og_med=None,
        poeng=100,
    )

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
        .med(MannUtøverMerverdi, [utøver_merverdi])
        .bygg())
    

    all_utøver_merverdi = {}
    uttrekksdato = date(2025,1,1)

    Periodisering.periodiser_utøver_merverdier(seriedata, 2025, uttrekksdato, all_utøver_merverdi, Kalkulatorbatch.MennSerieklasser)

    assert_at(seriedata).av_type(MannUtøverMerverdi).kun_inneholder(utøver_merverdi)
