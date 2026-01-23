import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import et_serieresultat, en_klubb, et_resultat, en_serie
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger

from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._serie import Serie

from srcc.main.batch_3_utdeling.periodiserer import Periodiserer

from srcc.main.kontrollsenter.tilganger import Tilganger

from datetime import date

# periodiserer_serieresultater
def test_periodiser_serieresultater_starter_ny_periode_hvis_serieresultat_ikke_finnes():

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannSerieresultat, [])
            .bygg())
    
    resultatforløp = {
        et_resultat(): (100, en_klubb(klubb="Ås IL"), 'Innlastet.'),
    }

    serieår = 2025
    uttrekksdato = date(2025,1,1)

    Periodiserer.periodiser_serieresultater(seriedata, serieår, uttrekksdato, resultatforløp, MannSerieresultat)

    forventet_serieresultat = et_serieresultat(fra_og_med=uttrekksdato, til_og_med=None, poeng=100, klubb="Ås IL", resultatforløp="Innlastet.")

    assert_at(seriedata).av_type(MannSerieresultat).kun_inneholder(forventet_serieresultat)

def test_periodiser_serieresultater_beholder_periode_hvis_serieresultat_finnes():

    serieresultat = et_serieresultat(fra_og_med=date(2025,1,1), til_og_med=None, poeng=100, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet.")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannSerieresultat, [serieresultat])
            .bygg())

    resultatforløp = {
        et_resultat(dato=date(2025,1,1)): (100, en_klubb(klubb="Ås IL"), 'Innlastet.'),
    }

    uttrekksdato = date(2025,6,1)
    serieår = 2025

    Periodiserer.periodiser_serieresultater(seriedata, serieår, uttrekksdato, resultatforløp, MannSerieresultat)

    assert_at(seriedata).av_type(MannSerieresultat).kun_inneholder(serieresultat)

def test_periodiser_serieresultater_avslutter_gammel_og_starter_ny_periode_hvis_serieresultat_har_ny_klubb():
 
    serieresultat = et_serieresultat(fra_og_med=date(2025,1,1), til_og_med=None, poeng=100, klubb="Ski IL", dato=date(2025,1,1), resultatforløp="Innlastet.")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannSerieresultat, [serieresultat])
            .bygg())
    resultatforløp = {
        et_resultat(dato=date(2025,1,1)): (100, en_klubb(klubb="Ås IL"), 'Innlastet.'),
    }

    uttrekksdato = date(2025,6,1)
    serieår = 2025
    Periodiserer.periodiser_serieresultater(seriedata, serieår, uttrekksdato, resultatforløp, MannSerieresultat)

    forventede_serieresultater = [
        et_serieresultat(fra_og_med=date(2025,1,1), til_og_med=date(2025,5,31), poeng=100, klubb="Ski IL", dato=date(2025,1,1), resultatforløp="Innlastet."),
        et_serieresultat(fra_og_med=date(2025,6,1), til_og_med=None, poeng=100, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet."),
    ]

    assert_at(seriedata).av_type(MannSerieresultat).kun_har(forventede_serieresultater)

def test_periodiser_serieresultater_avslutter_gammel_og_starter_ny_periode_hvis_serieresultat_har_annen_poeng():
    serieresultat = et_serieresultat(fra_og_med=date(2025,1,1), til_og_med=None, poeng=200, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet.")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannSerieresultat, [serieresultat])
            .bygg())

    resultatforløp = {
        et_resultat(dato=date(2025,1,1)): (100, en_klubb(klubb="Ås IL"), 'Innlastet.'),
    }

    uttrekksdato = date(2025,6,1)
    serieår = 2025

    Periodiserer.periodiser_serieresultater(seriedata, serieår, uttrekksdato, resultatforløp, MannSerieresultat)

    forventede_serieresultater = [
        et_serieresultat(fra_og_med=date(2025,1,1), til_og_med=date(2025,5,31), poeng=200, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet."),
        et_serieresultat(fra_og_med=date(2025,6,1), til_og_med=None, poeng=100, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet."),
    ]

    assert_at(seriedata).av_type(MannSerieresultat).kun_har(forventede_serieresultater)

def test_periodiser_serieresultater_avslutter_gammel_og_starter_ny_periode_hvis_serieresultat_har_nytt_resultatforløp():
 
    serieresultat = et_serieresultat(fra_og_med=date(2025,1,1), til_og_med=None, poeng=100, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet.")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Serie, [en_serie(serieår=2025)])
            .med(MannSerieresultat, [serieresultat])
            .bygg())

    resultatforløp = {
        et_resultat(dato=date(2025,1,1)): (100, en_klubb(klubb="Ås IL"), 'Innlastet. Ikke flyttet (utøver unntatt overbygning).'),
    }

    uttrekksdato = date(2025,6,1)
    serieår = 2025

    Periodiserer.periodiser_serieresultater(seriedata, serieår, uttrekksdato, resultatforløp, MannSerieresultat)

    forventede_serieresultater = [
        et_serieresultat(fra_og_med=date(2025,1,1), til_og_med=date(2025,5,31), poeng=100, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet."),
        et_serieresultat(fra_og_med=date(2025,6,1), til_og_med=None, poeng=100, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet. Ikke flyttet (utøver unntatt overbygning)."),
    ]

    assert_at(seriedata).av_type(MannSerieresultat).kun_har(forventede_serieresultater)

def test_periodiser_serieresultater_avkutter_ikke_serieresultater_fra_andre_serieår():
    serieresultat = et_serieresultat(fra_og_med=date(2025,1,1), til_og_med=None, poeng=100, klubb="Ås IL", dato=date(2025,1,1), resultatforløp="Innlastet.")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Serie, [
                en_serie(serieår=2025),
                en_serie(serieår=2026)
            ])
            .med(MannSerieresultat, [serieresultat])
            .bygg())

    uttrekksdato = date(2026,1,1)

    Periodiserer.periodiser_serieresultater(seriedata, 2026, uttrekksdato, {}, MannSerieresultat)

    assert_at(seriedata).av_type(MannSerieresultat).kun_inneholder(serieresultat)