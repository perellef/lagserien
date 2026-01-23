import sys
sys.path.append('./')

from srcc.main.batch_3_utdeling.poengberegner import Poengberegner
from srcc.main.utils.testverktøy.assert_at import assert_at

# beregn
def test_beregn_legger_til_14_eller_24_hundredeler_hvis_manuelt_sprint_eller_hekkeresultat():
    assert_at(Poengberegner.beregn("menn", "60", "8,0")).er_tilnærmet_lik(424.85714, 1e-4)
    assert_at(Poengberegner.beregn("menn", "400h", "64,0")).er_tilnærmet_lik(528.35366, 1e-4)

# til_standard_resultatformat
def test_til_standard_resultatformat_støttet_resultat_med_både_punktum_og_komma():  
    assert_at(Poengberegner.til_standard_resultatformat("9.00.00", "3000")).er_lik(540.00)
    assert_at(Poengberegner.til_standard_resultatformat("9,00,00", "3000")).er_lik(540.00)

def test_til_standard_resultatformat_fjerner_mx_og_pluss_suffiks():
    assert_at(Poengberegner.til_standard_resultatformat("9,00,00+", "3000")).er_lik(540.00)
    assert_at(Poengberegner.til_standard_resultatformat("9,00,00mx", "3000")).er_lik(540.00)

def test_til_standard_resultatformat_støtter_ss_h_og_s_h_format():
    assert_at(Poengberegner.til_standard_resultatformat("8,0", "60")).er_lik(8.24)
    assert_at(Poengberegner.til_standard_resultatformat("10,0", "60")).er_lik(10.24)

def test_til_standard_resultatformat_støtter_s_hh_format():
    assert_at(Poengberegner.til_standard_resultatformat("8,00", "60")).er_lik(8.00)

def test_til_standard_resultatformat_støtter_ss_hh_format():
    assert_at(Poengberegner.til_standard_resultatformat("10,00", "60")).er_lik(10.00)
    assert_at(Poengberegner.til_standard_resultatformat("64,00", "400h")).er_lik(64.00)

def test_til_standard_resultatformat_støtter_m_ss_hh_format():
    assert_at(Poengberegner.til_standard_resultatformat("9,00,00", "3000")).er_lik(540.00)

def test_til_standard_resultatformat_støtter_mm_ss_hh_format():
    assert_at(Poengberegner.til_standard_resultatformat("29,00,00", "10000")).er_lik(1740.00)
    assert_at(Poengberegner.til_standard_resultatformat("29,11,10", "10000")).er_lik(1751.10)

def test_til_standard_resultatformat_støtter_mm_ss_h_format():
    assert_at(Poengberegner.til_standard_resultatformat("29,11,1", "10000")).er_lik(1751.10)

def test_til_standard_resultatformat_støttet_h_mm_ss_hh_format():
    assert_at(Poengberegner.til_standard_resultatformat("1,10,00,00", "10000K")).er_lik(4200.00)

def test_til_standard_resultatformat_feiler_hvis_formatet_ikke_er_støttet():
    assert_at(lambda: Poengberegner.til_standard_resultatformat("11,,00", "100")).feiler_med(ValueError)
    assert_at(lambda: Poengberegner.til_standard_resultatformat("`33,00", "200")).feiler_med(ValueError)
    assert_at(lambda: Poengberegner.til_standard_resultatformat("`7,20A", "60")).feiler_med(ValueError)

# finn_nedre_grense_ved_binærsøk
def test_finn_nedre_grense_ved_binærsøk_returnerer_minus_1_hvis_resultate_er_svakere_enn_laveste_grense():
    grenseverdier = [10, 20, 30, 40, 50]

    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 9.9)).er_lik(-1)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 5)).er_lik(-1)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, -50)).er_lik(-1)
   
def test_finn_nedre_grense_ved_binærsøk_feiler_med_value_error_hvis_resultate_er_sterkere_enn_øverste_grense():
    grenseverdier = [10, 20, 30, 40, 50]

    assert_at(lambda: Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 1200)).feiler_med(ValueError)
    assert_at(lambda: Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 55)).feiler_med(ValueError)
    assert_at(lambda: Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 50)).feiler_med(ValueError)

def test_finn_nedre_grense_ved_binærsøk_finner_grense_slik_at_resultat_er_bedre_enn_grense_men_ikke_bedre_enn_neste():
    grenseverdier = [10, 20, 30, 40, 50]
    
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 15)).er_lik(0)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 20)).er_lik(1)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 29)).er_lik(1)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 30)).er_lik(2)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 35)).er_lik(2)
    
    grenseverdier = [50, 40, 30, 20, 10]
    
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 15)).er_lik(3)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 20)).er_lik(3)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 29)).er_lik(2)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 30)).er_lik(2)
    assert_at(Poengberegner.finn_nedre_grense_ved_binærsøk(grenseverdier, 35)).er_lik(1)