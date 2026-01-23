import sys
sys.path.append('./')

from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger
from srcc.main.kontrollsenter.tilganger import Tilganger
from srcc.main.utils.testverktøy._testobjekter import en_utøver, en_øvelse, et_stevne, en_klubb, en_klubbkrets
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._klubb import Klubb

from datetime import date
from sqlalchemy.exc import IntegrityError 

# innsett_muteres
def test_innsett_muteres_innsetter_objekt_i_databasen():

    seriedata = Testdatabygger(Tilganger.ALT).bygg()

    resultat = Resultat(
        stevne_id=12,
        utøver_id="Ole",
        øvelseskode="stav",
        prestasjon="3.23",
        dato=date(2100,1,1),
        statistikk_resultat_id=1,
    )

    seriedata.innsett_muteres(resultat)

    forventet_resultat = Resultat(
        resultat_id=1,
        stevne_id=12,
        utøver_id="Ole",
        øvelseskode="stav",
        prestasjon="3.23",
        dato=date(2100,1,1),
        statistikk_resultat_id=1,
    )

    assert_at(seriedata).av_type(Resultat).kun_inneholder(forventet_resultat)

def test_innsett_muteres_muterer_objekt_med_manglende_verdi():
    stav = en_øvelse(øvelse="stav")
    stevne = et_stevne(sted="Ås")
    utøver = en_utøver(navn="Ole")

    seriedata = Testdatabygger(Tilganger.ALT).bygg()

    resultat = Resultat(
        stevne_id=stevne.stevne_id,
        utøver_id=utøver.utøver_id,
        øvelseskode=stav.øvelseskode,
        prestasjon="3.23",
        dato=date(2100,1,1),
        statistikk_resultat_id=1,
    )

    seriedata.innsett_muteres(resultat)

    assert_at(resultat.resultat_id).er_lik(1)

# bulkinnsett_muteres
def test_bulkinnsett_muteres_innsetter_objekter_i_databasen():
    seriedata = Testdatabygger(Tilganger.ALT).bygg()

    resultater = [
        Resultat(stevne_id=1, utøver_id="Ole", øvelseskode="stav", prestasjon="3.23", dato=date(2100,1,1), statistikk_resultat_id=1),
        Resultat(stevne_id=2, utøver_id="Ole", øvelseskode="kule", prestasjon="9.42", dato=date(2100,1,1), statistikk_resultat_id=2),
        Resultat(stevne_id=3, utøver_id="Ole", øvelseskode="spyd", prestasjon="34.00", dato=date(2100,1,1), statistikk_resultat_id=3)
    ]
    
    seriedata.bulkinnsett_muteres(resultater)

    forventede_resultater = [
        Resultat(resultat_id=1, stevne_id=1, utøver_id="Ole", øvelseskode="stav", prestasjon="3.23", dato=date(2100,1,1), statistikk_resultat_id=1),
        Resultat(resultat_id=2, stevne_id=2, utøver_id="Ole", øvelseskode="kule", prestasjon="9.42", dato=date(2100,1,1), statistikk_resultat_id=2),
        Resultat(resultat_id=3, stevne_id=3, utøver_id="Ole", øvelseskode="spyd", prestasjon="34.00", dato=date(2100,1,1), statistikk_resultat_id=3)
    ]

    assert_at(seriedata).av_type(Resultat).kun_har(forventede_resultater)

def test_bulkinnsett_muteres_muterer_objekter_med_manglende_verdi():
    seriedata = Testdatabygger(Tilganger.ALT).bygg()

    resultat1 = Resultat(stevne_id=1, utøver_id="Ole", øvelseskode="stav", prestasjon="3.23", dato=date(2100,1,1), statistikk_resultat_id=1)
    resultat2 = Resultat(stevne_id=2, utøver_id="Ole", øvelseskode="kule", prestasjon="9.42", dato=date(2100,1,1), statistikk_resultat_id=2)
    resultat3 = Resultat(stevne_id=3, utøver_id="Ole", øvelseskode="spyd", prestasjon="34.00", dato=date(2100,1,1), statistikk_resultat_id=3)
    
    seriedata.bulkinnsett_muteres([resultat1, resultat2, resultat3])

    assert_at(resultat1.resultat_id).er_lik(1)
    assert_at(resultat2.resultat_id).er_lik(2)
    assert_at(resultat3.resultat_id).er_lik(3)

# bulkinnsett_erstatt
def test_bulkinnsett_erstatt_innsetter_objekter_i_databasen_hvis_de_ikke_bryter_med_noen_betingelser():
    seriedata = Testdatabygger(Tilganger.ALT).bygg()

    klubb = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    seriedata.bulkinnsett_erstatt([klubb])

    assert_at(seriedata).av_type(Klubb).kun_inneholder(klubb)

def test_bulkinnsett_erstatt_erstatter_objekter_i_databasen_hvis_de_bryter_med_primærnøkkel():
    eksisterende_klubb = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [eksisterende_klubb])
            .bygg())

    klubb = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    seriedata.bulkinnsett_erstatt([klubb])

    assert_at(seriedata).av_type(Klubb).kun_inneholder(klubb)

def test_bulkinnsett_erstatt_feiler_hvis_objektene_ikke_bryter_med_primærnøkkel_men_noe_annet():
    eksisterende_klubb = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [eksisterende_klubb])
            .bygg())

    klubb = Klubb(klubb_id=2, klubbnavn="Ås IL", kjernenavn="Ås")

    assert_at(lambda: seriedata.bulkinnsett_erstatt([klubb])).feiler_med(IntegrityError)

def test_bulkinnsett_erstatt_fjerner_ikke_seriedata_med_annen_primærnøkkel():
    ski_il = Klubb(klubb_id=1, klubbnavn="Ski IL", kjernenavn="Ski")
    vestby_il = Klubb(klubb_id=2, klubbnavn="Vestby IL", kjernenavn="Vestby")
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ski_il, vestby_il])
            .bygg())

    ås_il = Klubb(klubb_id=3, klubbnavn="Ås IL", kjernenavn="Ås")
    seriedata.bulkinnsett_erstatt([ås_il])

    assert_at(seriedata).av_type(Klubb).kun_inneholder(ski_il, vestby_il, ås_il)

# bulkinnsett_ignorer
def test_bulkinnsett_ignorer_innsetter_objekter_i_databasen_hvis_de_ikke_allerede_finnes():
    seriedata = Testdatabygger(Tilganger.ALT).bygg()

    klubb = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    seriedata.bulkinnsett_ignorer([klubb])

    assert_at(seriedata).av_type(Klubb).kun_inneholder(klubb)

def test_bulkinnsett_ignorer_foretar_seg_ingenting_for_objekter_kolliderer_med_primærnøkkel():
    eksisterende_klubb = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [eksisterende_klubb])
            .bygg())

    klubb = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    seriedata.bulkinnsett_ignorer([klubb])

    assert_at(seriedata).av_type(Klubb).kun_inneholder(eksisterende_klubb)

def test_bulkinnsett_ignorer_feiler_hvis_objektene_ikke_bryter_med_primærnøkkel_men_noe_annet():
    eksisterende_klubb = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [eksisterende_klubb])
            .bygg())

    klubb = Klubb(klubb_id=2, klubbnavn="Ås IL", kjernenavn="Ås")

    assert_at(lambda: seriedata.bulkinnsett_ignorer([klubb])).feiler_med(IntegrityError)

# bulkslett
def test_bulkslett_sletter_objekter_som_angitt():
    eksisterende_klubber = [
        Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås"),
        Klubb(klubb_id=2, klubbnavn="Ski IL", kjernenavn="Ski"),
    ]
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, eksisterende_klubber)
            .bygg())

    seriedata.bulkslett(eksisterende_klubber)

    assert_at(seriedata).av_type(Klubb).er_tom()

def test_bulkslett_sletter_kun_objekter_som_er_angitt():
    ås_il = Klubb(klubb_id=1, klubbnavn="Ås IL", kjernenavn="Ås")
    ski_il = Klubb(klubb_id=2, klubbnavn="Ski IL", kjernenavn="Ski")
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, ski_il])
            .bygg())

    seriedata.bulkslett([ski_il])

    assert_at(seriedata).av_type(Klubb).kun_inneholder(ås_il)