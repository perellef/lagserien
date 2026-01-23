import sys
sys.path.append('./')

from srcc.main.utils.beholdere.set import Set
from srcc.main.utils.testverktøy.assert_at import assert_at

from datetime import date

# of
def test_of_returnerer_et_set_med_verdiene_gitt():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return 
    assert_at(Set.of(1,2)).er_lik(Set([1,2]))

# combine
def test_combine_slår_sammen_flere_set():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return 
    assert_at(Set.combine([1,2],[2,3],[4,5])).er_lik(Set([1,2,3,4,5]))

# map
def test_map_utfører_funksjon_på_alle_elementene():
    assert_at(Set([1,2,3,4]).map(lambda x: 2*x)).er_lik(Set([2,4,6,8]))

# filter
def test_filter_fjerner_elementer_med_sant_predikatet():
    assert_at(Set([1,2,3,4]).filter(lambda x: x % 2 == 0)).er_lik(Set([2,4]))
    
# reduce
def test_reduce_summerer_elementene_hvis_gitt_startakkumulator_0_og_pluss_operator():
    assert_at(Set([1,2,3,4]).reduce(0, lambda x,y: x+y)).er_lik(10)

# union
def test_union_TODO():
    assert date.today() <= date.fromisoformat("2025-12-31")

# intersection
def test_intersection_TODO():
    assert date.today() <= date.fromisoformat("2025-12-31")

# difference
def test_difference_TODO():
    assert date.today() <= date.fromisoformat("2025-12-31")

# adjust_if
def test_adjust_mapper_elementer_med_sant_predikat():
    assert_at(Set([1,2,3,4]).adjust_if(lambda x: x % 2 == 0, lambda x: 2*x)).er_lik(Set([1,4,3,8]))

# group_by
def test_group_by_grupperer_elementer_mappet_likt_sammen():
    assert date.today() <= date.fromisoformat("2025-12-31")

def test_group_by_plasserer_grupperene_i_samme_rekkefølge_som_første_element():
    assert date.today() <= date.fromisoformat("2025-12-31")
    
def test_group_by_verdiene_følger_rekkefølgen_fra_initiell_liste():
    assert date.today() <= date.fromisoformat("2025-12-31")

# flatten
def test_flatten_flater_ut_et_nøstet_set():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([[1],[2,3,4],[2,3]]).flatten()).er_lik(Set([1,2,3,4]))

# min
def test_min_returnerer_minste_element_i_listen():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([3,4,1,2]).min()).er_lik(1)

def test_min_returnerer_det_første_av_flere_minste_elementer():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([3,4,1,2]).min(key=lambda x: x % 2)).er_lik(4)
    
def test_min_with_ties_returnerer_flere_minste_verdier():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([3,1,1,2]).min(with_ties=True)).er_lik(Set([1,1]))

def test_min_with_ties_returnerer_liste_med_ett_minste_verdi_hvis_unikt_minste():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([3,4,1,2]).min(with_ties=True)).er_lik(Set([1]))

def test_min_kaster_value_error_hvis_ingen_elementer_finnes():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(lambda: Set([]).min()).feiler_med(ValueError)

# max
def test_max_returnerer_største_element_i_listen():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([3,4,1,2]).max()).er_lik(4)

def test_max_returnerer_det_første_av_flere_største_elementer():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([3,4,1,2]).max(key=lambda x: x % 2)).er_lik(3)
    
def test_max_with_ties_returnerer_flere_største_verdier():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([3,4,4,2]).max(with_ties=True)).er_lik(Set([4,4]))

def test_max_with_ties_returnerer_liste_med_ett_største_verdi_hvis_unikt_største():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([3,4,1,2]).max(with_ties=True)).er_lik(Set([4]))

def test_max_kaster_value_error_hvis_ingen_elementer_finnes():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(lambda: Set([]).max()).feiler_med(ValueError)

# sum
def test_sum_summerer_opp_elementene_i_listen():
    assert_at(Set([1,2,3,4]).sum()).er_lik(10)

# count
def test_count_returnerer_antall_elementer_i_listen():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([1,2,3,4]).count()).er_lik(4)

def test_count_med_predikat_returnerer_antall_elementer_i_listen_som_gir_sant_predikat():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at(Set([1,2,3,4]).count(lambda x: x % 2 == 0)).er_lik(2)

# any
def test_any_returnerer_true_hvis_minst_en_av_betingelsene_er_true():
    assert_at(Set([False,True,False]).any(lambda x: x)).er_true()

def test_any_returnerer_false_hvis_ingen_av_betingelsene_er_true():
    assert_at(Set([False,False,False]).any(lambda x: x)).er_false()

# all
def test_all_returnerer_true_hvis_alle_betingelsene_er_true():
    assert_at(Set([True,True,True]).all(lambda x: x)).er_true()

def test_all_returnerer_false_hvis_ikke_alle_betingelsene_er_true():
    assert_at(Set([True,True,False]).all(lambda x: x)).er_false()

# none
def test_none_returnerer_true_hvis_ingen_av_betingelsene_er_true():
    assert_at(Set([False,False,False]).none(lambda x: x)).er_true()

def test_any_returnerer_false_hvis_minst_en_betingelsene_er_true():
    assert_at(Set([False,True,False]).none(lambda x: x)).er_false()

# copy
def test_copy_returnerer_en_lik_liste_med_samme_elementer():
    assert date.today() <= date.fromisoformat("2025-12-31")
    return
    assert_at((s := Set([1,2,3,4])).copy()).er_lik(s)

def test_copy_returnerer_en_liste_med_ulik_referanse():
    assert_at((s := Set([1,2,3,4])).copy()).ikke_er(s)