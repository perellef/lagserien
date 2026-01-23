import sys
sys.path.append('./')

from srcc.main.kontrollsenter.kontrollpanel import Kontrollpanel
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger
from srcc.main.kontrollsenter.tilganger import Tilganger
from srcc.main.utils.testverktøy._testobjekter import en_serie, en_batchkjøring
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._batchkjøring import Batchkjøring

from srcc.main.batch_1_grunnlag.grunnlagsbatch import Grunnlagsbatch
from srcc.main.batch_2_uttrekk.uttrekksbatch import Uttrekksbatch
from srcc.main.batch_3_utdeling.utdelingsbatch import Utdelingsbatch
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch

from datetime import date

# valider_batch
def test_valider_batch_feiler_ikke_hvis_batch():
    assert_at(lambda: Kontrollpanel.valider_batch(Grunnlagsbatch)).ikke_feiler()
    assert_at(lambda: Kontrollpanel.valider_batch(Uttrekksbatch)).ikke_feiler()
    assert_at(lambda: Kontrollpanel.valider_batch(Utdelingsbatch)).ikke_feiler()
    assert_at(lambda: Kontrollpanel.valider_batch(Kalkulatorbatch)).ikke_feiler()

def test_valider_batch_feiler_hvis_ikke_batch():
    assert_at(lambda: Kontrollpanel.valider_batch(0)).feiler_med(AssertionError)
    assert_at(lambda: Kontrollpanel.valider_batch(5)).feiler_med(AssertionError)
    assert_at(lambda: Kontrollpanel.valider_batch("dsds")).feiler_med(AssertionError)

# valider_tillatte_argumenter
def test_valider_tillatte_argumenter_feiler_ikke_hvis_serieår_er_et_og_uttrekksdato_en_dato_heltall():
    assert_at(lambda: Kontrollpanel.valider_tillatte_argumenter(1234, date.today())).ikke_feiler()

def test_valider_tillatte_argumenter_feiler_hvis_serieår_ikke_er_et_heltall():
    assert_at(lambda: Kontrollpanel.valider_tillatte_argumenter("1234", date.today())).feiler_med(AssertionError)

def test_valider_tillatte_argumenter_feiler_hvis_uttrekksdato_ikke_er_en_dato():
    assert_at(lambda: Kontrollpanel.valider_tillatte_argumenter("1234", "2020-01-01")).feiler_med(AssertionError)

# valider_eksisterende_serie
def test_valider_eksisterende_serie_feiler_ikke_hvis_serie_med_serieår_eksisterer():
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Serie, [en_serie(serieår=2025)])
            .bygg())
    
    assert_at(lambda: Kontrollpanel.valider_eksisterende_serie(seriedata, 2025)).ikke_feiler()

def test_valider_eksisterende_serie_feiler_hvis_serie_med_serieår_ikke_eksisterer():
    seriedata = Testdatabygger(Tilganger.ALT).bygg()
    
    assert_at(lambda: Kontrollpanel.valider_eksisterende_serie(seriedata, 2025)).feiler_med(AssertionError)

# valider_batchens_seneste_kjøring
def test_valider_batchens_seneste_kjøring_feiler_ikke_hvis_ingen_batchkjøring_av_samme_batch_og_serieår_er_kjørt_på_senere_tidspunkt():
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Batchkjøring, [en_batchkjøring(serieår=2025, batch=2, uttrekksdato=date.fromisoformat("2020-01-01"))])
            .bygg())
    
    assert_at(lambda: Kontrollpanel.valider_batchens_seneste_kjøring(Uttrekksbatch, seriedata, 2025, date.fromisoformat("2025-01-01"))).ikke_feiler()

def test_valider_batchens_seneste_kjøring_feiler_ikke_hvis_ingen_batchkjøring_av_samme_batch_og_serieår_er_kjørt_på_senere_tidspunkt():
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Batchkjøring, [en_batchkjøring(serieår=2025, batch=2, uttrekksdato=date.fromisoformat("2030-01-01"))])
            .bygg())
    
    assert_at(lambda: Kontrollpanel.valider_batchens_seneste_kjøring(Uttrekksbatch, seriedata, 2025, date.fromisoformat("2025-01-01"))).feiler_med(AssertionError)

# valider_kjøring_på_serieår
def test_valider_kjøring_på_serieår_feiler_ikke_hvis_det_finnes_kjøring_for_batch_på_serieår():
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Batchkjøring, [en_batchkjøring(serieår=2025, batch=2, uttrekksdato=date.fromisoformat("2030-01-01"))])
            .bygg())
    
    assert_at(lambda: Kontrollpanel.valider_kjøring_på_serieår(seriedata, 2, 2025)).ikke_feiler()

def test_valider_kjøring_på_serieår_feiler_hvis_det_ikke_finnes_kjøring_for_batch_på_serieår():
    seriedata = Testdatabygger(Tilganger.ALT).bygg()
    
    assert_at(lambda: Kontrollpanel.valider_kjøring_på_serieår(seriedata, 2, 2025)).feiler_med(AssertionError)

# valider_kjøring_på_dato
def test_valider_kjøring_på_dato_feiler_ikke_hvis_det_finnes_kjøring_for_batch_på_dato():
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Batchkjøring, [en_batchkjøring(serieår=2025, batch=2, uttrekksdato=date.fromisoformat("2030-01-01"))])
            .bygg())
    
    assert_at(lambda: Kontrollpanel.valider_kjøring_på_dato(seriedata, 2, 2025, date.fromisoformat("2030-01-01"))).ikke_feiler()

def test_valider_kjøring_på_dato_feiler_hvis_det_ikke_finnes_kjøring_for_batch_på_dato():
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Batchkjøring, [en_batchkjøring(serieår=2025, batch=2, uttrekksdato=date.fromisoformat("2025-01-01"))])
            .bygg())
    
    assert_at(lambda: Kontrollpanel.valider_kjøring_på_dato(seriedata, 2, 2025, date.fromisoformat("2030-01-01"))).feiler_med(AssertionError)
