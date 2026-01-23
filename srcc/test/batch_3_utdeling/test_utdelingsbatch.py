import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import en_klubb, et_resultat, et_serieresultat
from srcc.main.utils.testverktøy.assert_at import assert_at
from datetime import date

from srcc.main.utils.orm._resultat import Resultat
from srcc.main.batch_3_utdeling.utdelingsbatch import Utdelingsbatch

# assert_unike_resultater
def test_assert_unike_resultater_feiler_hvis_to_resultater_har_samme_statistikk_resultat_id():
    uttrekksdato = date.fromisoformat("2100-06-01")

    resultater = [
        Resultat(stevne_id=1, utøver_id=1, øvelseskode="60", prestasjon="8,00", dato=date.fromisoformat("2100-03-01"), statistikk_resultat_id=1),
        Resultat(stevne_id=2, utøver_id=1, øvelseskode="100", prestasjon="13,00", dato=date.fromisoformat("2100-04-01"), statistikk_resultat_id=1),
    ]
    
    f = lambda: Utdelingsbatch.assert_unike_statistikk_resultater(resultater, uttrekksdato)

    assert_at(f).feiler_med(ValueError)

def test_assert_unike_resultater_feiler_ikke_hvis_resultatene_til_uttrekksresultatene_har_unike_statistikk_resultat_id():
    uttrekksdato = date.fromisoformat("2100-06-01")

    resultater = [
        Resultat(stevne_id=1, utøver_id=1, øvelseskode="60", prestasjon="8,00", dato=date.fromisoformat("2100-03-01"), statistikk_resultat_id=1),
        Resultat(stevne_id=2, utøver_id=1, øvelseskode="100", prestasjon="13,00", dato=date.fromisoformat("2100-04-01"), statistikk_resultat_id=2),
        Resultat(stevne_id=2, utøver_id=1, øvelseskode="100", prestasjon="13,00+", dato=date.fromisoformat("2100-04-01"), statistikk_resultat_id=3),
    ]
    
    f = lambda: Utdelingsbatch.assert_unike_statistikk_resultater(resultater, uttrekksdato)

    assert_at(f).ikke_feiler()

# fjern_overflødige
def test_fjern_overflødige_runder_poengene_ned_til_nærmeste_heltall():
    ås_il = en_klubb(klubb="Ås")
    
    resultatforløp = {
        et_resultat(utøver="A", øvelse="100h", prestasjon="15.00"): (766.66667, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="3000", prestasjon="9.00.00"): (941.05058, ås_il, "irr"),
    }

    assert Utdelingsbatch.fjern_overflødige(resultatforløp) == {
        et_resultat(utøver="A", øvelse="100h", prestasjon="15.00"): (766, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="3000", prestasjon="9.00.00"): (941, ås_il, "irr"),
    }

def test_fjern_overflødige_beholder_kun_resultatet_med_høyest_poeng_per_utøver_og_øvelse():
    ås_il = en_klubb(klubb="Ås")
    
    resultatforløp = {
        et_resultat(utøver="A", øvelse="100h", prestasjon="15.00"): (766.66667, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="3000", prestasjon="9.00.00"): (941.05058, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="3000", prestasjon="9.10.00"): (902.14008, ås_il, "irr"),
        et_resultat(utøver="B", øvelse="kule", prestasjon="14.00"): (811.03896, ås_il, "irr"),
        et_resultat(utøver="C", øvelse="kule", prestasjon="15.00"): (857.28598, ås_il, "irr"),
    }

    assert Utdelingsbatch.fjern_overflødige(resultatforløp) == {
        et_resultat(utøver="A", øvelse="100h", prestasjon="15.00"): (766, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="3000", prestasjon="9.00.00"): (941, ås_il, "irr"),
        et_resultat(utøver="B", øvelse="kule", prestasjon="14.00"): (811, ås_il, "irr"),
        et_resultat(utøver="C", øvelse="kule", prestasjon="15.00"): (857, ås_il, "irr"),
    }

def test_fjern_overflødige_beholder_like_resultater_hvis_de_er_fra_ulike_klubber():
    ås_il = en_klubb(klubb="Ås")
    nordby_il = en_klubb(klubb="Nordby")
    
    resultatforløp = {
        et_resultat(utøver="A", øvelse="100h", prestasjon="15.00"): (766.66667, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="100h", prestasjon="15.00"): (766.66667, nordby_il, "irr"),
    }

    assert Utdelingsbatch.fjern_overflødige(resultatforløp) == {
        et_resultat(utøver="A", øvelse="100h", prestasjon="15.00"): (766, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="100h", prestasjon="15.00"): (766, nordby_il, "irr"),
    }

def test_fjern_overflødige_fjerner_resultater_med_0_poeng():
    ås_il = en_klubb(klubb="Ås")
    
    resultatforløp = {
        et_resultat(øvelse="100h", prestasjon="30.00"): (0, ås_il, "irr"),
    }

    assert Utdelingsbatch.fjern_overflødige(resultatforløp) == {}

def test_fjern_overflødige_beholder_resultat_med_ukjent_poeng_uavhengig_av_unikhet():
    ås_il = en_klubb(klubb="Ås")
    
    resultatforløp = {
        et_resultat(utøver="A", øvelse="3000", prestasjon="9.00.00"): (941.05058, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="3000", prestasjon="`8.50.00"): (None, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="3000", prestasjon="9.10.00"): (902.14008, ås_il, "irr"),
    }

    assert Utdelingsbatch.fjern_overflødige(resultatforløp) == {
        et_resultat(utøver="A", øvelse="3000", prestasjon="9.00.00"): (941, ås_il, "irr"),
        et_resultat(utøver="A", øvelse="3000", prestasjon="`8.50.00"): (None, ås_il, "irr"),
    }

