import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import en_serie, et_mann_uttrekksresultat, en_klubb, en_klubbkrets, et_resultat
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger

from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.batch_2_uttrekk.uttrekksperiodiserer import Uttrekksperiodiserer

from srcc.main.kontrollsenter.tilganger import Tilganger

from datetime import date

# periodiser_uttrekksresultater_uttrekksresultater
def test_periodiser_uttrekksresultater_starter_ny_periode_hvis_uttrekksresultat_ikke_finnes():

    seriedata = (Testdatabygger(Tilganger.UTTREKK)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannUttrekksresultat, [])
            .bygg())

    mann_resultatforløp = {
        et_resultat(dato=date(2025,1,1)): en_klubb(klubb="Ås IL"),
    }

    uttrekksdato = date(2025,1,1)

    Uttrekksperiodiserer.periodiser_uttrekksresultater(seriedata, 2025, uttrekksdato, mann_resultatforløp, {})

    forventet_uttrekksresultat = et_mann_uttrekksresultat(dato=date(2025,1,1), fra_og_med=uttrekksdato, til_og_med=None, klubb="Ås IL")

    assert_at(seriedata).av_type(MannUttrekksresultat).kun_inneholder(forventet_uttrekksresultat)

def test_periodiser_uttrekksresultater_beholder_periode_hvis_uttrekksresultat_finnes():

    uttrekksresultat = et_mann_uttrekksresultat(dato=date(2025,1,1), fra_og_med=date(2023,1,1), til_og_med=None, klubb="Ås IL")

    seriedata = (Testdatabygger(Tilganger.UTTREKK)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannUttrekksresultat, [uttrekksresultat])
            .bygg())

    mann_resultatforløp = {
        et_resultat(dato=date(2025,1,1)): en_klubb(klubb="Ås IL"),
    }

    uttrekksdato = date(2025,1,1)

    Uttrekksperiodiserer.periodiser_uttrekksresultater(seriedata, 2025, uttrekksdato, mann_resultatforløp, {})

    assert_at(seriedata).av_type(MannUttrekksresultat).kun_inneholder(uttrekksresultat)

def test_periodiser_uttrekksresultater_avslutter_gammel_og_starter_ny_periode_hvis_uttrekksresultat_har_ny_klubb():

    uttrekksresultat = et_mann_uttrekksresultat(dato=date(2025,1,1), fra_og_med=date(2025,1,1), til_og_med=None, klubb="Ski IL")

    seriedata = (Testdatabygger(Tilganger.UTTREKK)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannUttrekksresultat, [uttrekksresultat])
            .bygg())

    mann_resultatforløp = {
        et_resultat(dato=date(2025,1,1)): en_klubb(klubb="Ås IL"),
    }

    uttrekksdato = date(2025,6,1)

    Uttrekksperiodiserer.periodiser_uttrekksresultater(seriedata, 2025, uttrekksdato, mann_resultatforløp, {})

    forventede_uttrekksresultater = [
        et_mann_uttrekksresultat(dato=date(2025,1,1), fra_og_med=date(2025,1,1), til_og_med=date(2025,5,31), klubb="Ski IL"),
        et_mann_uttrekksresultat(dato=date(2025,1,1), fra_og_med=date(2025,6,1), til_og_med=None, klubb="Ås IL"),
    ]

    assert_at(seriedata).av_type(MannUttrekksresultat).kun_har(forventede_uttrekksresultater)

def test_periodiser_uttrekksresultater_produserer_uttrekksresultater_som_er_tilsvarende_kjønnsinndelt_som_resultatforløp():

    seriedata = (Testdatabygger(Tilganger.UTTREKK)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannUttrekksresultat, [])
            .bygg())

    mann_resultatforløp = {et_resultat(dato=date(2025,1,1)): en_klubb(klubb="Ås IL")}
    kvinne_resultatforløp = {}

    uttrekksdato = date(2025,1,1)

    Uttrekksperiodiserer.periodiser_uttrekksresultater(seriedata, 2025, uttrekksdato, mann_resultatforløp, kvinne_resultatforløp)

    forventede_menn_uttrekksresultater = [et_mann_uttrekksresultat(dato=date(2025,1,1), fra_og_med=uttrekksdato, til_og_med=None, klubb="Ås IL")]
    forventede_kvinner_uttrekksresultater = []

    assert_at(seriedata).av_type(MannUttrekksresultat).kun_har(forventede_menn_uttrekksresultater)
    assert_at(seriedata).av_type(KvinneUttrekksresultat).kun_har(forventede_kvinner_uttrekksresultater)

def test_periodiser_uttrekksresultater_uttrekksresultater_avkutter_ikke_uttrekksresultater_fra_andre_serieår():
    uttrekksresultat = et_mann_uttrekksresultat(dato=date(2025,1,1), fra_og_med=date(2025,1,1), til_og_med=None, klubb="Ås IL")

    seriedata = (Testdatabygger(Tilganger.UTTREKK)
            .med(Serie, [
                en_serie(serieår=2025),
                en_serie(serieår=2026)
            ])
            .med(MannUttrekksresultat, [uttrekksresultat])
            .bygg())

    uttrekksdato = date(2026,1,1)

    Uttrekksperiodiserer.periodiser_uttrekksresultater(seriedata, 2026, uttrekksdato, {}, {})

    assert_at(seriedata).av_type(MannUttrekksresultat).kun_inneholder(uttrekksresultat)

# periodiser_klubbkretser
def test_periodiser_klubbkretser_starter_ny_periode_hvis_klubbkrets_ikke_finnes():
    
    klubb = en_klubb(klubb="Ås IL")
    seriedata = (Testdatabygger(Tilganger.UTTREKK)
            .med(Serie, [en_serie(serieår=2025)])
            .med(Klubbkrets, [])
            .bygg())

    klubbkretser = {
        klubb.klubb_id: "Akershus",
    }

    uttrekksdato = date(2025,1,1)

    Uttrekksperiodiserer.periodiser_klubbkretser(seriedata, uttrekksdato, klubbkretser)

    forventet_klubbkrets = en_klubbkrets(klubb="Ås IL", fra_og_med=date(2025,1,1), til_og_med=None, krets="Akershus")

    assert_at(seriedata).av_type(Klubbkrets).kun_inneholder(forventet_klubbkrets)

def test_periodiser_klubbkretser_beholder_periode_hvis_klubbkrets_finnes():

    klubb = en_klubb(klubb="Ås IL")
    klubbkrets = en_klubbkrets(klubb="Ås IL", fra_og_med=date(2023,1,1), til_og_med=None, krets="Akershus")

    seriedata = (Testdatabygger(Tilganger.UTTREKK)
        .med(Serie, [en_serie(serieår=2025)])
        .med(Klubbkrets, [klubbkrets])
        .bygg())

    klubbkretser = {
        klubb.klubb_id: "Akershus",
    }

    uttrekksdato = date(2025,1,1)

    Uttrekksperiodiserer.periodiser_klubbkretser(seriedata, uttrekksdato, klubbkretser)

    assert_at(seriedata).av_type(Klubbkrets).kun_inneholder(klubbkrets)

def test_periodiser_klubbkretser_avslutter_gammel_og_starter_ny_periode_hvis_klubbkrets_har_ny_krets():

    klubb = en_klubb(klubb="Ås IL")
    klubbkrets = en_klubbkrets(klubb="Ås IL", fra_og_med=date(2023,1,1), til_og_med=None, krets="Akershus")

    seriedata = (Testdatabygger(Tilganger.UTTREKK)
            .med(Serie, [en_serie(serieår=2025)])
            .med(Klubbkrets, [klubbkrets])
            .bygg())

    klubbkretser = {
        klubb.klubb_id: "Oslo og Akershus",
    }

    uttrekksdato = date(2025,6,1)

    Uttrekksperiodiserer.periodiser_klubbkretser(seriedata, uttrekksdato, klubbkretser)

    forventede_klubbkretser = [
        en_klubbkrets(klubb="Ås IL", fra_og_med=date(2023,1,1), til_og_med=date(2025,5,31), krets="Akershus"),
        en_klubbkrets(klubb="Ås IL", fra_og_med=date(2025,6,1), til_og_med=None, krets="Oslo og Akershus"),
    ]

    assert_at(seriedata).av_type(Klubbkrets).kun_har(forventede_klubbkretser)