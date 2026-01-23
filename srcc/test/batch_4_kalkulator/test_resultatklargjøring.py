import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger
from srcc.main.utils.testverktøy._testobjekter import en_serie, et_serieresultat, en_klubb, et_mann_uttrekksresultat, et_resultat, et_kvinne_uttrekksresultat, en_mann_serieøvelse, en_kvinne_serieøvelse

from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._kvinne_serieøvelse import KvinneSerieøvelse

from srcc.main.batch_4_kalkulator.resultatklargjøring import Resultatklargjøring
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch

from srcc.main.kontrollsenter.tilganger import Tilganger

from datetime import date

# hent_klubbresultater
def test_hent_klubbresultater_henter_kun_serieresultater_som_overlapper_uttrekksdato():
    
    resultatdata = [
        ("60m", date(2020,1,1), date(2050,1,1), None),
        ("100m", date(2020,1,1), date(2020,1,1), date(2030,1,1)),
        ("200m", date(2020,1,1), date(2040,1,1), None),
        ("400m", date(2020,1,1), date(2030,1,1), date(2040,1,1)),
    ]

    resultater = [et_resultat(øvelse=øvelse, dato=dato) for øvelse, dato, _, _ in resultatdata]
    serieresultater = [et_serieresultat(øvelse=øvelse, dato=dato, fra_og_med=fra_og_med, til_og_med=til_og_med) for øvelse, dato, fra_og_med, til_og_med in resultatdata]

    serieår = 2020
    uttrekksdato = date(2040,1,1)

    serieøvelser = [en_mann_serieøvelse(serieår=serieår, øvelse=øvelse, prioritet=i) for i,(øvelse, _, _, _) in enumerate(resultatdata)]

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(Serie, [en_serie(serieår=serieår)])
            .med(Resultat, resultater)
            .med(MannSerieresultat, serieresultater)
            .med(MannSerieøvelse, serieøvelser)
            .bygg())

    klubbresultater = Resultatklargjøring.hent_klubbresultater(seriedata, serieår, uttrekksdato, Kalkulatorbatch.MennSerieklasser)

    assert len(klubbresultater) == 1
    assert klubbresultater[en_klubb()] == {
        341482840: (date(2040,1,1), et_resultat(øvelse="200m", dato=date(2020,1,1))),
        153383690: (date(2030,1,1), et_resultat(øvelse="400m", dato=date(2020,1,1)))
    }

def test_hent_klubbresultater_fordeler_resultatene_på_klubb():
    
    resultatdata = [
        ("60m", date(2020,1,1), "Ås IL"),
        ("100m", date(2020,1,1), "Ås IL"),
        ("200m", date(2020,1,1), "Ski IL"),
        ("400m", date(2020,1,1), None),
    ]

    resultater = [et_resultat(øvelse=øvelse, dato=dato) for øvelse, dato, _ in resultatdata]
    serieresultater = [et_serieresultat(øvelse=øvelse, dato=dato, klubb=klubb, fra_og_med=dato, til_og_med=None) for øvelse, dato, klubb in resultatdata]

    serieår = 2020
    uttrekksdato = date(2040,1,1)

    serieøvelser = [en_mann_serieøvelse(serieår=serieår, øvelse=øvelse, prioritet=i) for i,(øvelse, _, _) in enumerate(resultatdata)]

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(Serie, [en_serie(serieår=serieår)])
            .med(Resultat, resultater)
            .med(MannSerieresultat, serieresultater)
            .med(MannSerieøvelse, serieøvelser)
            .bygg())

    klubbresultater = Resultatklargjøring.hent_klubbresultater(seriedata, serieår, uttrekksdato, Kalkulatorbatch.MennSerieklasser)

    assert len(klubbresultater) == 2
    assert klubbresultater[en_klubb(klubb="Ås IL")] == {
        183538738: (date(2020,1,1), et_resultat(øvelse="60m", dato=date(2020,1,1))),
        952952951: (date(2020,1,1), et_resultat(øvelse="100m", dato=date(2020,1,1)))
    }
    assert klubbresultater[en_klubb(klubb="Ski IL")] == {
        341482840: (date(2020,1,1), et_resultat(øvelse="200m", dato=date(2020,1,1)))
    }

def test_hent_klubbresultater_henter_kun_serieresultater_med_serieøvelse_tilhørende_øvelsen():
    
    resultatdata = [
        ("100m hekk", date(2020,1,1)),
        ("110m hekk", date(2020,1,1)),
    ]

    resultater = [et_resultat(øvelse=øvelse, dato=dato) for øvelse, dato in resultatdata]
    serieresultater = [et_serieresultat(øvelse=øvelse, dato=dato, fra_og_med=dato, til_og_med=None) for øvelse, dato in resultatdata]

    serieår = 2020
    uttrekksdato = date(2040,1,1)

    menn_serieøvelser = [en_mann_serieøvelse(serieår=serieår, øvelse="110m hekk", prioritet=1)]

    seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(Serie, [en_serie(serieår=serieår)])
            .med(Resultat, resultater)
            .med(MannSerieresultat, serieresultater)
            .med(MannSerieøvelse, menn_serieøvelser)
            .bygg())

    mannlige_klubbresultater = Resultatklargjøring.hent_klubbresultater(seriedata, serieår, uttrekksdato, Kalkulatorbatch.MennSerieklasser)

    resultat_110mhk = et_resultat(øvelse="110m hekk", dato=date(2020,1,1))

    assert mannlige_klubbresultater[en_klubb()] == {
        resultat_110mhk.resultat_id: (date(2020,1,1), resultat_110mhk),
    }