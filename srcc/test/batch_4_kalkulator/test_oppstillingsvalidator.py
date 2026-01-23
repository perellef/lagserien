import sys
sys.path.append('./')

from srcc.main.batch_4_kalkulator.oppstillingsvalidator import Oppstillingsvalidator, OppstillingException
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testobjekter import en_resultattype
from srcc.main.batch_4_kalkulator.optimal_lagoppstilling import OptimalLagoppstilling
from srcc.main.batch_4_kalkulator.diverse import nullutøver, nulløvelse

VILKÅRLIG_SJEKKSUM = 1
def en_serieoppstilling(obl, val):
    return OptimalLagoppstilling(obl, val, VILKÅRLIG_SJEKKSUM)

# valider_ingen_nullresultater
def test_valider_ingen_nullresultater_asserter_oppstillingexception_hvis_obligatorisk_lagoppstilling_har_nullresultater():
    
    serieoppstilling = en_serieoppstilling(
        obl=[en_resultattype(poeng=0, øvelse=nulløvelse, utøver=nullutøver)],
        val=[]
    )
    
    validering_av_nullresultat = lambda: Oppstillingsvalidator.valider_ingen_nullresultater(serieoppstilling)
    
    assert_at(validering_av_nullresultat).feiler_med(OppstillingException)

def test_valider_ingen_nullresultater_asserter_oppstillingexception_hvis_valgfri_lagoppstilling_har_nullresultater():
    
    serieoppstilling = en_serieoppstilling(
        obl=[],
        val=[en_resultattype(poeng=0, øvelse=nulløvelse, utøver=nullutøver)]
    )
    
    validering_av_nullresultat = lambda: Oppstillingsvalidator.valider_ingen_nullresultater(serieoppstilling)
    
    assert_at(validering_av_nullresultat).feiler_med(OppstillingException)

def test_valider_ingen_nullresultater_asserter_ikke_oppstillingexception_hvis_lagoppstilling_ikke_har_nullresultater():
    
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=100, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=300, øvelse="stav", utøver="Tom"),
        ],
        val=[
            en_resultattype(poeng=200, øvelse="kule", utøver="Ole"),
            en_resultattype(poeng=100, øvelse="spyd", utøver="Per")
        ]
    )
    
    validering_av_nullresultat = lambda: Oppstillingsvalidator.valider_ingen_nullresultater(serieoppstilling)
    
    assert_at(validering_av_nullresultat).ikke_feiler()

# valider_ikke_overstigende_resultater_i_obl
def test_valider_ikke_overstigende_resultater_i_obl_asserter_oppstillingexception_hvis_lagoppstilling_har_flere_obligatoriske_resultater_enn_kravet_tilsier():
        
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=100, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=300, øvelse="stav", utøver="Tom"),
            en_resultattype(poeng=200, øvelse="kule", utøver="Ole"),
            en_resultattype(poeng=100, øvelse="spyd", utøver="Per")
        ],
        val=[]
    )
    
    validering_av_overstigende_resultater_i_obl = lambda: Oppstillingsvalidator.valider_ikke_overstigende_resultater_i_obl(serieoppstilling, 3)
    
    assert_at(validering_av_overstigende_resultater_i_obl).feiler_med(OppstillingException)

def test_valider_ikke_overstigende_resultater_i_obl_asserter_ikke_oppstillingexception_hvis_lagoppstilling_ikke_har_flere_obligatoriske_resultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=100, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=300, øvelse="stav", utøver="Tom"),
            en_resultattype(poeng=200, øvelse="kule", utøver="Ole")
        ],
        val=[]
    )
    
    validering_av_overstigende_resultater_i_obl = lambda: Oppstillingsvalidator.valider_ikke_overstigende_resultater_i_obl(serieoppstilling, 3)
    
    assert_at(validering_av_overstigende_resultater_i_obl).ikke_feiler()

# valider_ikke_overstigende_resultater_i_val
def test_valider_ikke_overstigende_resultater_i_val_asserter_oppstillingexception_hvis_lagoppstilling_har_flere_valgfri_resultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[],
        val=[
            en_resultattype(poeng=400, øvelse="stav", utøver="Tom"),
            en_resultattype(poeng=300, øvelse="kule", utøver="Ole"),
            en_resultattype(poeng=200, øvelse="spyd", utøver="Per"),
            en_resultattype(poeng=100, øvelse="100m", utøver="Per")
        ]
    )
    
    validering_av_overstigende_resultater_i_val = lambda: Oppstillingsvalidator.valider_ikke_overstigende_resultater_i_val(serieoppstilling, 3)
    
    assert_at(validering_av_overstigende_resultater_i_val).feiler_med(OppstillingException)

def test_valider_ikke_overstigende_resultater_i_val_asserter_ikke_oppstillingexception_hvis_lagoppstilling_ikke_har_flere_valgfri_resultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[],
        val=[
            en_resultattype(poeng=300, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=200, øvelse="stav", utøver="Tom"),
            en_resultattype(poeng=100, øvelse="kule", utøver="Ole")
        ]
    )
    
    validering_av_overstigende_resultater_i_val = lambda: Oppstillingsvalidator.valider_ikke_overstigende_resultater_i_val(serieoppstilling, 3)
    
    assert_at(validering_av_overstigende_resultater_i_val).ikke_feiler()

# valider_ikke_overstigende_løpsresultater_i_obl
def test_valider_ikke_overstigende_løpsresultater_i_obl_asserter_oppstillingexception_hvis_lagoppstilling_har_flere_obligatoriske_løpsresultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=100, øvelse="100m", utøver="Per", er_teknisk=False),
            en_resultattype(poeng=400, øvelse="200m", utøver="Ole", er_teknisk=False),
            en_resultattype(poeng=300, øvelse="400m", utøver="Ole", er_teknisk=False),
            en_resultattype(poeng=500, øvelse="800m", utøver="Per", er_teknisk=False),
            en_resultattype(poeng=300, øvelse="stav", utøver="Tom", er_teknisk=True)
        ],
        val=[]
    )
    
    validering_av_overstigende_løpsresultater_i_obl = lambda: Oppstillingsvalidator.valider_ikke_overstigende_løpsresultater_i_obl(serieoppstilling, 3)
    
    assert_at(validering_av_overstigende_løpsresultater_i_obl).feiler_med(OppstillingException)

def test_valider_ikke_overstigende_løpsresultater_i_obl_asserter_ikke_oppstillingexception_hvis_lagoppstilling_ikke_har_flere_obligatoriske_løpsresultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=100, øvelse="100m", utøver="Per", er_teknisk=False),
            en_resultattype(poeng=400, øvelse="200m", utøver="Ole", er_teknisk=False),
            en_resultattype(poeng=300, øvelse="400m", utøver="Ole", er_teknisk=False),
            en_resultattype(poeng=300, øvelse="stav", utøver="Tom", er_teknisk=True)
        ],
        val=[]   
    )
    
    validering_av_overstigende_løpsresultater_i_obl = lambda: Oppstillingsvalidator.valider_ikke_overstigende_løpsresultater_i_obl(serieoppstilling, 3)
    
    assert_at(validering_av_overstigende_løpsresultater_i_obl).ikke_feiler()

# valider_ikke_overstigende_løpsresultater_i_val
def test_valider_ikke_overstigende_løpsresultater_i_val_asserter_oppstillingexception_hvis_lagoppstilling_har_flere_valgfri_løpsresultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[],
        val=[
            en_resultattype(poeng=500, øvelse="100m", utøver="Per", er_teknisk=False),
            en_resultattype(poeng=400, øvelse="200m", utøver="Ole", er_teknisk=False),
            en_resultattype(poeng=300, øvelse="400m", utøver="Ole", er_teknisk=False),
            en_resultattype(poeng=200, øvelse="800m", utøver="Per", er_teknisk=False),
            en_resultattype(poeng=100, øvelse="stav", utøver="Tom", er_teknisk=True)
        ]   
    )
    
    validering_av_overstigende_løpsresultater_i_val = lambda: Oppstillingsvalidator.valider_ikke_overstigende_løpsresultater_i_val(serieoppstilling, 3)
    
    assert_at(validering_av_overstigende_løpsresultater_i_val).feiler_med(OppstillingException)

def test_valider_ikke_overstigende_løpsresultater_i_val_asserter_ikke_oppstillingexception_hvis_lagoppstilling_ikke_har_flere_valgfri_løpsresultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[],
        val=[
            en_resultattype(poeng=400, øvelse="100m", utøver="Per", er_teknisk=False),
            en_resultattype(poeng=300, øvelse="200m", utøver="Ole", er_teknisk=False),
            en_resultattype(poeng=200, øvelse="400m", utøver="Ole", er_teknisk=False),
            en_resultattype(poeng=100, øvelse="stav", utøver="Tom", er_teknisk=True)
        ]   
    )
    
    validering_av_overstigende_løpsresultater_i_val = lambda: Oppstillingsvalidator.valider_ikke_overstigende_løpsresultater_i_val(serieoppstilling, 3)
    
    assert_at(validering_av_overstigende_løpsresultater_i_val).ikke_feiler()

# valider_ingen_overbelastede_utøvere
def test_valider_ingen_overbelastede_utøvere_asserter_oppstillingexception_hvis_utøver_har_flere_resultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=500, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=400, øvelse="200m", utøver="Ole"),
            en_resultattype(poeng=300, øvelse="400m", utøver="Ole"),
            en_resultattype(poeng=300, øvelse="stav", utøver="Tom")
        ],
        val=[
            en_resultattype(poeng=400, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=300, øvelse="100m", utøver="Ole"),
            en_resultattype(poeng=200, øvelse="60mh", utøver="Ole"),
            en_resultattype(poeng=100, øvelse="kule", utøver="Tom")
        ]   
    )
    
    validering_av_overbelastede_utøvere = lambda: Oppstillingsvalidator.valider_ingen_overbelastede_utøvere(serieoppstilling, 3)
    
    assert_at(validering_av_overbelastede_utøvere).feiler_med(OppstillingException)

def test_valider_ingen_overbelastede_utøvere_asserter_ikke_oppstillingexception_hvis_utøver_ikke_har_flere_resultater_enn_kravet_tilsier():
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=500, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=400, øvelse="200m", utøver="Ole"),
            en_resultattype(poeng=300, øvelse="400m", utøver="Ole"),
            en_resultattype(poeng=300, øvelse="stav", utøver="Tom")
        ],
        val=[
            en_resultattype(poeng=300, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=200, øvelse="100m", utøver="Ole"),
            en_resultattype(poeng=100, øvelse="kule", utøver="Tom")
        ]   
    )
    
    validering_av_overbelastede_utøvere = lambda: Oppstillingsvalidator.valider_ingen_overbelastede_utøvere(serieoppstilling, 3)
    
    assert_at(validering_av_overbelastede_utøvere).ikke_feiler()

# valider_ingen_gjenbrukte_obl_øvelser
def test_valider_ingen_gjenbrukte_obl_øvelser_asserter_oppstillingexception_hvis_øvelse_gjenbrukes():
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=500, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=400, øvelse="200m", utøver="Ole"),
            en_resultattype(poeng=300, øvelse="400m", utøver="Ole"),
            en_resultattype(poeng=300, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=100, øvelse="stav", utøver="Tom")
        ],
        val=[]   
    )
    
    validering_av_gjenbrukte_obl_øvelser = lambda: Oppstillingsvalidator.valider_ingen_gjenbrukte_obl_øvelser(serieoppstilling)
    
    assert_at(validering_av_gjenbrukte_obl_øvelser).feiler_med(OppstillingException)

def test_valider_ingen_gjenbrukte_obl_øvelser_asserter_ikke_oppstillingexception_hvis_øvelse_ikke_gjenbrukes():
    serieoppstilling = en_serieoppstilling(
        obl=[
            en_resultattype(poeng=500, øvelse="100m", utøver="Per"),
            en_resultattype(poeng=400, øvelse="200m", utøver="Ole"),
            en_resultattype(poeng=300, øvelse="400m", utøver="Ole"),
            en_resultattype(poeng=100, øvelse="stav", utøver="Tom")
        ],
        val=[]   
    )
    
    validering_av_gjenbrukte_obl_øvelser = lambda: Oppstillingsvalidator.valider_ingen_gjenbrukte_obl_øvelser(serieoppstilling)
    
    assert_at(validering_av_gjenbrukte_obl_øvelser).ikke_feiler()