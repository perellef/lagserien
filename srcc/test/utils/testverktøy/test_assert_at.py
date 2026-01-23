import sys
sys.path.append('./')

from srcc.main.kontrollsenter.tilganger import Tilganger
from srcc.main.utils.testverktøy._testobjekter import en_klubb
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger
from srcc.main.utils.orm._klubb import Klubb

def assertionerror_kastes(funksjon):
    try:
        funksjon()
    except Exception:
        return True
    else:
        return False

def assertionerror_kastes_ikke(funksjon):
    try:
        funksjon()
        return True
    except Exception:
        return False

# AssertAt.feiler_med_feilmelding
def test_assert_at_feiler_med_feilmelding_asserter_true_hvis_funksjon_kaster_feilmelding():
    def funksjon():
        raise ValueError("Feil")

    f = lambda: assert_at(funksjon).feiler_med(ValueError)
    assert assertionerror_kastes_ikke(f)

def test_assert_at_feiler_med_feilmelding_asserter_false_hvis_funksjon_kaster_annen_feilmelding():
    def funksjon():
        raise KeyError("Feil")

    f = lambda: assert_at(funksjon).feiler_med(ValueError)
    assert assertionerror_kastes(f)

def test_assert_at_feiler_med_feilmelding_asserter_false_hvis_funksjon_ikke_feiler():
    def funksjon():
        raise KeyError("Feil")

    f = lambda: assert_at(funksjon).feiler_med(ValueError)
    assert assertionerror_kastes(f)

# AssertAt.ikke_feiler
def test_assert_at_ikke_feiler_asserter_true_hvis_funksjon_ikke_feiler():
    def funksjon():
        ...

    f = lambda: assert_at(funksjon).ikke_feiler()
    assert assertionerror_kastes_ikke(f)

def test_assert_at_ikke_feiler_asserter_false_hvis_funksjon_feiler():
    def funksjon():
        raise KeyError("Feil")

    f = lambda: assert_at(funksjon).ikke_feiler(ValueError)
    assert assertionerror_kastes(f)

def test_assert_at_feiler_med_asserter_false_hvis_funksjon_ikke_feiled_med_gitt_feiltype():
    def funksjon():
        raise KeyError("Feil")

    f = lambda: assert_at(funksjon).feiler_med(ValueError)
    assert assertionerror_kastes(f)

# AssertAt.kun_har
def test_assert_at_kun_har_asserter_false_hvis_beholder_ikke_har_nøyaktig_samme_elementer_og_rekkefølge():
    f1 = lambda: assert_at([1,2,3]).kun_har([1,2])
    f2 = lambda: assert_at([1,2,3]).kun_har([1,2,3,4])
    
    assert assertionerror_kastes(f1)
    assert assertionerror_kastes(f2)
    
def test_assert_at_kun_har_asserter_true_hvis_beholder_har_nøyaktig_samme_elementer_og_rekkefølge():
    f = lambda: assert_at([1,2,3]).kun_har([1,2,3])

    assert assertionerror_kastes_ikke(f)

# AssertAt.kun_inneholder
def test_assert_at_kun_inneholder_asserter_false_hvis_beholder_ikke_inneholder_nøyaktig_de_elementene_gitt():
    f1 = lambda: assert_at([1,2,3]).kun_inneholder(1,2)
    f2 = lambda: assert_at([1,2,3]).kun_inneholder(1,2,3,4)
        
    assert assertionerror_kastes(f1)
    assert assertionerror_kastes(f2)
    
def test_assert_at_kun_inneholder_asserter_true_hvis_beholder_inneholder_nøyaktig_de_elementene_gitt():
    f = lambda: assert_at([1,2,3]).kun_inneholder(1,2,3)

    assert assertionerror_kastes_ikke(f)

# AssertAt.er_lik
def test_assert_at_er_lik_asserter_false_hvis_objekt_ikke_er_lik_forventet():
    f = lambda: assert_at(1).er_lik(2)
        
    assert assertionerror_kastes(f)
    
def test_assert_at_er_lik_asserter_true_hvis_objekt_er_lik_forventet():
    f = lambda: assert_at(1).er_lik(1)
        
    assert assertionerror_kastes_ikke(f)

# AssertAt.er_tilnærmet_lik

def test_assert_at_er_lik_asserter_false_hvis_objekt_ikke_er_tilnærmet_lik_forventet():
    f = lambda: assert_at(1.333333).er_tilnærmet_lik(1.33344, 0.0001)
        
    assert assertionerror_kastes(f)
    
def test_assert_at_er_lik_asserter_true_hvis_objekt_er_tilnærmet_lik_forventet():
    f = lambda: assert_at(1.333333).er_tilnærmet_lik(1.33344, 0.001)
        
    assert assertionerror_kastes_ikke(f)

# AssertAt.er_ulik
def test_assert_at_er_ulik_asserter_false_hvis_objekt_ikke_er_ulik_forventet():
    f = lambda: assert_at(1).er_ulik(1)
        
    assert assertionerror_kastes(f)
    
def test_assert_at_er_ulik_asserter_true_hvis_objekt_er_ulik_forventet():
    f = lambda: assert_at(1).er_ulik(2)
        
    assert assertionerror_kastes_ikke(f)

# AssertAt.er_true
def test_assert_at_er_true_asserter_false_hvis_objekt_ikke_er_true():
    f = lambda: assert_at(False).er_true()
        
    assert assertionerror_kastes(f)
    
def test_assert_at_er_true_asserter_true_hvis_objekt_er_true():
    f = lambda: assert_at(True).er_true()
        
    assert assertionerror_kastes_ikke(f)

# test_AssertAt.er_false
def test_assert_at_er_false_asserter_false_hvis_objekt_ikke_er_false():
    f = lambda: assert_at(True).er_false()
        
    assert assertionerror_kastes(f)
    
def test_assert_at_er_false_asserter_true_hvis_objekt_er_false():
    f = lambda: assert_at(False).er_false()
        
    assert assertionerror_kastes_ikke(f)

# AssertAt.er_none
def test_assert_at_er_none_asserter_false_hvis_objekt_ikke_er_none():
    f1 = lambda: assert_at(True).er_none()
    f2 = lambda: assert_at(1).er_none()
        
    assert assertionerror_kastes(f1)
    assert assertionerror_kastes(f2)
    
def test_assert_at_er_none_asserter_true_hvis_objekt_er_none():
    f = lambda: assert_at(None).er_none()
        
    assert assertionerror_kastes_ikke(f)

# AssertAt.ikke_er
def test_assert_at_ikke_er_asserter_false_hvis_objekt_er_det_samme():
    a = [1,2]
    assert assertionerror_kastes(lambda: assert_at(a).ikke_er(a))

def test_assert_at_ikke_er_asserter_true_hvis_objekt_ikke_er_det_samme():
    a = [1,2]
    b = [1,2]        
    assert assertionerror_kastes_ikke(lambda: assert_at(a).ikke_er(b))

# AssertAtSeriedata.AvType.kun_har
def test_assert_at_seriedata_av_type_kun_har_asserter_false_hvis_seriedataen_ikke_har_nøyaktig_samme_elementer_og_rekkefølge():
    
    ås_il = en_klubb(klubb="Ås IL")
    ski_il = en_klubb(klubb="Ski IL")
    nordby_il = en_klubb(klubb="Nordby IL")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
        .med(Klubb, [ås_il, ski_il])
        .bygg())
    
    f1 = lambda: assert_at(seriedata).av_type(Klubb).kun_har([ski_il])
    f2 = lambda: assert_at(seriedata).av_type(Klubb).kun_har([ski_il, ski_il, nordby_il])

    assert assertionerror_kastes(f1)
    assert assertionerror_kastes(f2)
    
def test_assert_at_seriedata_av_type_kun_har_asserter_true_hvis_seriedataen_har_nøyaktig_samme_elementer_og_rekkefølge():
    
    ås_il = en_klubb(klubb="Ås IL")
    ski_il = en_klubb(klubb="Ski IL")
    nordby_il = en_klubb(klubb="Nordby IL")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
        .med(Klubb, [ås_il, ski_il, nordby_il])
        .bygg())
    
    f = lambda: assert_at(seriedata).av_type(Klubb).kun_har([ås_il, ski_il, nordby_il])

    assert assertionerror_kastes_ikke(f)

# AssertAtSeriedata.AvType.kun_inneholder
def test_assert_at_seriedata_av_type_kun_inneholder_asserter_false_hvis_seriedataen_ikke_har_nøyaktig_samme_elementer():
    
    ås_il = en_klubb(klubb="Ås IL")
    ski_il = en_klubb(klubb="Ski IL")
    nordby_il = en_klubb(klubb="Nordby IL")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
        .med(Klubb, [ås_il, ski_il])
        .bygg())
    
    f1 = lambda: assert_at(seriedata).av_type(Klubb).kun_inneholder(ås_il)
    f2 = lambda: assert_at(seriedata).av_type(Klubb).kun_inneholder(ski_il, nordby_il, ås_il)

    assert assertionerror_kastes(f1)
    assert assertionerror_kastes(f2)
    
def test_assert_at_seriedata_av_type_kun_inneholder_asserter_true_hvis_seriedataen_har_nøyaktig_samme_elementer():
        
    ås_il = en_klubb(klubb="Ås IL")
    ski_il = en_klubb(klubb="Ski IL")
    nordby_il = en_klubb(klubb="Nordby IL")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
        .med(Klubb, [ås_il, ski_il, nordby_il])
        .bygg())
    
    f1 = lambda: assert_at(seriedata).av_type(Klubb).kun_inneholder(ås_il, ski_il, nordby_il)
    f2 = lambda: assert_at(seriedata).av_type(Klubb).kun_inneholder(ski_il, nordby_il, ås_il)

    assert assertionerror_kastes_ikke(f1)
    assert assertionerror_kastes_ikke(f2)

# AssertAtSeriedata.AvType.er_tom
def test_assert_at_seriedata_av_type_er_tom_asserter_false_hvis_seriedataen_ikke_er_tom():
    ås_il = en_klubb(klubb="Ås IL")
    ski_il = en_klubb(klubb="Ski IL")

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
        .med(Klubb, [ås_il, ski_il])
        .bygg())
    
    f = lambda: assert_at(seriedata).av_type(Klubb).er_tom()

    assert assertionerror_kastes(f)
    
def test_assert_at_seriedata_av_type_er_tom_asserter_true_hvis_seriedataen_ikke_er_tom():
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
        .med(Klubb, [])
        .bygg())
    
    f = lambda: assert_at(seriedata).av_type(Klubb).er_tom()

    assert assertionerror_kastes_ikke(f)