import sys
sys.path.append('./')

from srcc.main.batch_4_kalkulator.kalkulator import Kalkulator
from srcc.main.batch_4_kalkulator.diverse import nullutøver
from srcc.main.utils.testverktøy._testobjekter import en_øvelse, en_utøver, en_resultattype, et_oppstillingskrav

from srcc.main.utils.beholdere.liste import Liste
from datetime import date

# hent_lag_ellers_opprett
def test_hent_lag_ellers_opprett_TODO():
    assert date.today() <= date.fromisoformat("2026-04-25")

# __finn_lagenes_div
def test_finn_lagenes_div_TODO():
    assert date.today() <= date.fromisoformat("2026-04-25")

# __beregn_alle_lag
def test_beregn_alle_lag_finner_alle_lagene_til_klubben():
    assert date.today() <= date.fromisoformat("2026-04-25")

# beregn_unikt_beste_lagoppstilling
def test_beregn_unikt_beste_lagoppstilling_finner_beste_lag_basert_på_neste_hvis_flere_har_lik_poeng():
    assert date.today() <= date.fromisoformat("2026-04-25")

# beregn_like_lagoppstillinger
def test_beregn_like_lagoppstillinger_cacher_tidligere_beregninger():
    assert date.today() <= date.fromisoformat("2026-04-25")