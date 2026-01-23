import sys
sys.path.append('./')

from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.featuretoggle import FeatureToggle

# aktiver
# deaktiver
# er_aktivert
# er_deaktivert
def test_en_feature_defaultes_til_deaktivert():
    assert_at(FeatureToggle.feature_xxx.er_deaktivert()).er_true()
    assert_at(FeatureToggle.feature_xxx.er_aktivert()).er_false()

def test_en_feature_som_aktiveres_er_aktivert():
    FeatureToggle.feature_xxx.aktiver()

    assert_at(FeatureToggle.feature_xxx.er_aktivert()).er_true()
    assert_at(FeatureToggle.feature_xxx.er_deaktivert()).er_false()

    FeatureToggle.deaktiver(FeatureToggle.feature_xxx)

def test_en_feature_som_aktiveres_og_så_deaktiveres_er_dektivert():
    FeatureToggle.feature_xxx.aktiver()
    FeatureToggle.deaktiver(FeatureToggle.feature_xxx)
    
    assert_at(FeatureToggle.feature_xxx.er_deaktivert()).er_true()
    assert_at(FeatureToggle.feature_xxx.er_aktivert()).er_false()

# hvis_aktivert
def test_hvis_aktivert_funksjonen_utføres_hvis_featuren_er_aktivert():
    FeatureToggle.aktiver(FeatureToggle.feature_xxx)

    featuretogglet_verdi = (FeatureToggle.feature_xxx.hvis_aktivert(lambda: 2).ellers(lambda: 3))

    assert_at(featuretogglet_verdi).er_lik(2)

    FeatureToggle.deaktiver(FeatureToggle.feature_xxx)

def test_ellers_funksjonen_utføres_hvis_featuren_er_deaktivert():
    featuretogglet_verdi = (FeatureToggle.feature_xxx.hvis_aktivert(lambda: 2).ellers(lambda: 3))

    assert_at(featuretogglet_verdi).er_lik(3)

## finn_feature
def test_finn_feature_returnerer_featuren_med_navnet_hvis_den_innehas():
    assert_at(FeatureToggle.finn_feature("xxx")).er_lik(FeatureToggle.feature_xxx)

def test_finn_feature_kaster_valueerror_hvis_ingen_feature_innehar_navnet():
    assert_at(lambda: FeatureToggle.finn_feature("yyy")).feiler_med(ValueError)
