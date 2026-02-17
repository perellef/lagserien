import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import et_mann_lag, et_resultat
from srcc.main.utils.testverktøy.assert_at import assert_at

from srcc.main.batch_4_kalkulator.tabellarbeid import Tabellarbeid

from datetime import date

# sett_opp_tabell
def test_sett_opp_tabell_setter_opp_tabell_TODO():
    assert date.today() <= date.fromisoformat("2026-04-25")

# tabellinnsett_lag
def test_tabellinnsett_lag_innsetter_lag_først_hvis_sterkeste_lag():
    ski_il = et_mann_lag(klubb="Ski IL", lagnummer=1)
    ås_il = et_mann_lag(klubb="Ås IL", lagnummer=1)
    
    laginfo = {
        ski_il: (2000, 1000, 1000),
        ås_il: (4000, 2000, 2000),
    }

    tabell = [ski_il]
    Tabellarbeid.tabellinnsett_lag(tabell, ås_il, laginfo, {})   

    assert_at(tabell).er_lik([ås_il, ski_il])

def test_tabellinnsett_lag_innsetter_lag_sist_hvis_svakeste_lag():
    ås_il = et_mann_lag(klubb="Ås IL", lagnummer=1)
    ski_il = et_mann_lag(klubb="Ski IL", lagnummer=1)
    
    laginfo = {
        ås_il: (4000, 2000, 2000),
        ski_il: (2000, 1000, 1000),
    }

    tabell = [ås_il]
    Tabellarbeid.tabellinnsett_lag(tabell, ski_il, laginfo, {})   

    assert_at(tabell).er_lik([ås_il, ski_il])

def test_tabellinnsett_lag_innsetter_lag_korrekt_i_tabell_hvis_verken_sterkest_eller_svakest():
    ås_il = et_mann_lag(klubb="Ås IL", lagnummer=1)
    ski_il = et_mann_lag(klubb="Ski IL", lagnummer=1)
    nordby_il = et_mann_lag(klubb="Nordby IL", lagnummer=1)
    
    laginfo = {
        ås_il: (4000, 2000, 2000),
        ski_il: (2000, 1000, 1000),
        nordby_il: (3000, 1500, 1500),
    }

    tabell = [ås_il, ski_il]
    Tabellarbeid.tabellinnsett_lag(tabell, nordby_il, laginfo, {})   

    assert_at(tabell).er_lik([ås_il, nordby_il, ski_il])

# slår_lag
def test_slår_lag_returnerer_true_hvis_første_lag_har_mer_poeng():
    ås_il = et_mann_lag(klubb="Ås IL", lagnummer=1)
    ski_il = et_mann_lag(klubb="Ski IL", lagnummer=1)
    
    laginfo = {
        ås_il: (4000, 2000, 2000),
        ski_il: (2000, 1000, 1000),
    }

    assert_at(Tabellarbeid.slår_lag(ås_il, ski_il, laginfo, {})).er_true()    

def test_slår_lag_returnerer_false_hvis_andre_lag_har_mer_poeng():
    ås_il = et_mann_lag(klubb="Ås IL", lagnummer=1)
    ski_il = et_mann_lag(klubb="Ski IL", lagnummer=1)
    
    laginfo = {
        ås_il: (2000, 1000, 1000),
        ski_il: (4000, 2000, 2000),
    }

    assert_at(Tabellarbeid.slår_lag(ås_il, ski_il, laginfo, {})).er_false()

def test_slår_lag_returnerer_true_hvis_lagene_har_likt_med_poeng_men_første_lag_har_bedre_enkeltpoenger():
    ås_il = et_mann_lag(klubb="Ås IL", lagnummer=1)
    ski_il = et_mann_lag(klubb="Ski IL", lagnummer=1)
    
    laginfo = {
        ås_il: (500, 300, 200),
        ski_il: (500, 400, 100),
    }

    oppstillinger = {
        ås_il: {
            "OBLIGATORISK": [
                (300, et_resultat()),
                (100, et_resultat()),
                (100, et_resultat()),
            ],
            "VALGFRI": []
        },
        ski_il: {
            "OBLIGATORISK": [
                (200, et_resultat()),
                (200, et_resultat()),
                (100, et_resultat()),
            ],
            "VALGFRI": []
        }
    }

    assert_at(Tabellarbeid.slår_lag(ås_il, ski_il, laginfo, oppstillinger)).er_true()

def test_slår_lag_returnerer_false_hvis_lagene_har_likt_med_poeng_men_andre_lag_har_bedre_enkeltpoenger():
    ås_il = et_mann_lag(klubb="Ås IL", lagnummer=1)
    ski_il = et_mann_lag(klubb="Ski IL", lagnummer=1)
    
    laginfo = {
        ås_il: (500, 300, 200),
        ski_il: (500, 400, 100),
    }

    oppstillinger = {
        ås_il: {
            "OBLIGATORISK": [
                (200, et_resultat()),
            ],
            "VALGFRI": [
                (200, et_resultat()),
                (100, et_resultat()),
            ]
        },
        ski_il: {
            "OBLIGATORISK": [],
            "VALGFRI": [
                (300, et_resultat()),
                (200, et_resultat()),
            ]
        }
    }

    assert_at(Tabellarbeid.slår_lag(ås_il, ski_il, laginfo, oppstillinger)).er_false()

def test_slår_lag_returnerer_false_hvis_lagene_har_identiske_seriepoeng_og_enkeltpoeng():
    ås_il = et_mann_lag(klubb="Ås IL", lagnummer=1)
    ski_il = et_mann_lag(klubb="Ski IL", lagnummer=1)
    
    laginfo = {
        ås_il: (1200, 700, 500),
        ski_il: (1200, 500, 700),
    }

    oppstillinger = {
        ås_il: {
            "OBLIGATORISK": [
                (600, et_resultat()),
                (100, et_resultat()),
                (500, et_resultat()),
            ],
            "VALGFRI": []
        },
        ski_il: {
            "OBLIGATORISK": [
                (500, et_resultat()),
            ],
            "VALGFRI": [
                (600, et_resultat()),
                (100, et_resultat()),
            ]
        }
    }

    assert_at(Tabellarbeid.slår_lag(ås_il, ski_il, laginfo, oppstillinger)).er_false()