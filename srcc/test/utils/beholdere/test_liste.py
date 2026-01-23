import sys
sys.path.append('./')

from srcc.main.utils.beholdere.liste import Liste
from srcc.main.utils.beholdere.dict import Dict

from srcc.main.utils.testverktøy.assert_at import assert_at

# of
def test_of_returnerer_en_liste_med_verdiene_gitt():
    assert_at(Liste.of(1, 2)).er_lik(Liste([1,2]))

# concat
def test_concat_konkatinerer_lister():
    assert_at(Liste.concat([1,2,3,4,5], [4,5,6,7])).er_lik(Liste([1,2,3,4,5,4,5,6,7]))

# merge
def test_merge_sammenslår_lister_slik_at_ingen_duplikater_finnes():
    assert_at(Liste.merge([1,2,3,4,5], [4,5,6,7])).er_lik(Liste([1,2,3,4,5,6,7]))

# map
def test_map_utfører_funksjon_på_alle_elementene():
    assert_at(Liste([1,2,3,4]).map(lambda x: 2*x)).er_lik(Liste([2,4,6,8]))

# filter
def test_filter_fjerner_elementer_med_sant_predikatet():
    assert_at(Liste([1,2,3,4]).filter(lambda x: x % 2 == 0)).er_lik(Liste([2,4]))

# reduce
def test_reduce_summerer_elementene_hvis_gitt_startakkumulator_0_og_pluss_operator():
    assert_at(Liste([1,2,3,4]).reduce(0, lambda x,y: x+y)).er_lik(10)

# adjust_if
def test_adjust_mapper_elementer_med_sant_predikat():
    assert_at(Liste([1,2,3,4]).adjust_if(lambda x: x % 2 == 0, lambda x: 2*x)).er_lik(Liste([1,4,3,8]))

# group_by
def test_group_by_grupperer_elementer_mappet_likt_sammen():
    assert_at(Liste([1,2,3,4]).group_by(lambda x: x % 2)).er_lik(Dict({1: Liste([1,3]), 0: Liste([2,4])}))

def test_group_by_plasserer_grupperene_i_samme_rekkefølge_som_første_element():
    assert_at(Liste([2,4,7,3,8,9]).group_by(lambda x: x).keys()).er_lik(Liste([2,4,7,3,8,9]))

def test_group_by_verdiene_følger_rekkefølgen_fra_initiell_liste():
    assert_at(Liste([1,7,5,9,11]).group_by(lambda x: x % 2).values().first()).er_lik(Liste([1,7,5,9,11]))

# sort
def test_sort_sorterer_elementene():
    assert_at(Liste([2,3,1,4]).sort()).er_lik(Liste([1,2,3,4]))

def test_sort_med_nøkkel_sorterer_elementene_på_nøkkel():
    assert_at(Liste([0,3,5,6]).sort(key=lambda x: x % 4)).er_lik(Liste([0,5,6,3]))

def test_sort_reversert_returner_elementene_omvendt_sortert():
    assert_at(Liste([2,3,1,4]).sort(reverse=True)).er_lik(Liste([4,3,2,1]))

def test_sort_beholder_opprinnelig_rekkefølge_på_elementer_som_er_like():
    assert_at(Liste([2,4,1,3,6,8,5]).sort(key=lambda x: x % 2)).er_lik(Liste([2,4,6,8,1,3,5]))

# distinct
def test_distinct_fjerner_duplikater_i_listen():
    assert_at(Liste([1,1,2]).distinct()).er_lik(Liste([1,2]))

def test_distinct_beholder_rekkefølgen_av_de_første_unike_elementene():
    assert_at(Liste([1,2,1,2]).distinct()).er_lik(Liste([1,2]))

def test_distinct_med_func_fjerner_elementer_som_gir_duplikater_av_func_av_element():
    assert_at(Liste([1,2,3,4]).distinct(lambda x: x % 2)).er_lik(Liste([1,2]))

# flatten
def test_flatten_flater_ut_en_nøstet_liste():
    assert_at(Liste([[1],[2,3,4],[]]).flatten()).er_lik(Liste([1,2,3,4]))

# skip
def test_skip_uten_n_parameter_fjerner_første_element_fra_listen():
    assert_at(Liste([1,2,3]).skip()).er_lik(Liste([2,3]))

def test_skip_med_n_parameter_fjerner_de_n_første_elementene_fra_listen():
    assert_at(Liste([1,2,3,4,5,6]).skip(5)).er_lik(Liste([6]))

def test_skip_kaster_valueerror_hvis_n_er_mindre_enn_0():
    assert_at(lambda: Liste([1,2,3]).skip(-1)).feiler_med(ValueError)

def test_skip_kaster_valueerror_hvis_n_er_større_enn_listens_lengde():
    assert_at(lambda: Liste([1,2,3]).skip(4)).feiler_med(ValueError)

# min
def test_min_returnerer_minste_element_i_listen():
    assert_at(Liste([3,4,1,2]).min()).er_lik(1)

def test_min_returnerer_det_første_av_flere_minste_elementer():
    assert_at(Liste([3,4,1,2]).min(key=lambda x: x % 2)).er_lik(4)
    
def test_min_with_ties_returnerer_flere_minste_verdier():
    assert_at(Liste([3,1,1,2]).min(with_ties=True)).er_lik(Liste([1,1]))

def test_min_with_ties_returnerer_liste_med_ett_minste_verdi_hvis_unikt_minste():
    assert_at(Liste([3,4,1,2]).min(with_ties=True)).er_lik(Liste([1]))

def test_min_kaster_value_error_hvis_ingen_elementer_finnes():
    assert_at(lambda: Liste([]).min()).feiler_med(ValueError)

# max
def test_max_returnerer_største_element_i_listen():
    assert_at(Liste([3,4,1,2]).max()).er_lik(4)

def test_max_returnerer_det_første_av_flere_største_elementer():
    assert_at(Liste([3,4,1,2]).max(key=lambda x: x % 2)).er_lik(3)
    
def test_max_with_ties_returnerer_flere_største_verdier():
    assert_at(Liste([3,4,4,2]).max(with_ties=True)).er_lik(Liste([4,4]))

def test_max_with_ties_returnerer_liste_med_ett_største_verdi_hvis_unikt_største():
    assert_at(Liste([3,4,1,2]).max(with_ties=True)).er_lik(Liste([4]))

def test_max_kaster_value_error_hvis_ingen_elementer_finnes():
    assert_at(lambda: Liste([]).max()).feiler_med(ValueError)

# first
def test_first_returnerer_none_hvis_listen_er_tom():
    assert_at(Liste([]).first()).er_none()
    
def test_first_returnerer_første_element_hvis_listen_er_ikketom():
    assert_at(Liste([1,2,3]).first()).er_lik(1)
    
def test_first_returnerer_none_hvis_ingen_elementer_finnes():
    assert_at(Liste([]).first()).er_none()

def test_first_returnerer_liste_med_alle_elementer_hvis_n_er_større_enn_antall_elementer():
    assert_at(Liste([1,2,3]).first(n=4)).er_lik(Liste([1,2,3]))

# last
def test_last_returnerer_siste_element_hvis_n_ikke_er_gitt():
    assert_at(Liste([1,2,3]).last()).er_lik(3)

def test_last_returnerer_en_liste_med_n_siste_element_hvis_n_er_gitt():
    assert_at(Liste([1,2,3]).last(n=2)).er_lik(Liste([2,3]))
    
def test_last_returnerer_none_hvis_ingen_elementer_finnes():
    assert_at(Liste([]).last()).er_none()

def test_last_returnerer_liste_med_alle_elementer_hvis_n_er_større_enn_antall_elementer():
    assert_at(Liste([1,2,3]).last(n=4)).er_lik(Liste([1,2,3]))

# sum
def test_sum_summerer_opp_elementene_i_listen():
    assert_at(Liste([1,2,3,4]).sum()).er_lik(10)

# count
def test_count_returnerer_antall_elementer_i_listen():
    assert_at(Liste([1,2,3,4]).count()).er_lik(4)

def test_count_med_predikat_returnerer_antall_elementer_i_listen_som_gir_sant_predikat():
    assert_at(Liste([1,2,3,4]).count(lambda x: x % 2 == 0)).er_lik(2)

# any
def test_any_returnerer_true_hvis_minst_en_av_betingelsene_er_true():
    assert_at(Liste([False,True,False]).any(lambda x: x)).er_true()

def test_any_returnerer_false_hvis_ingen_av_betingelsene_er_true():
    assert_at(Liste([False,False,False]).any(lambda x: x)).er_false()

# all
def test_all_returnerer_true_hvis_alle_betingelsene_er_true():
    assert_at(Liste([True,True,True]).all(lambda x: x)).er_true()

def test_all_returnerer_false_hvis_ikke_alle_betingelsene_er_true():
    assert_at(Liste([True,True,False]).all(lambda x: x)).er_false()

# none
def test_none_returnerer_true_hvis_ingen_av_betingelsene_er_true():
    assert_at(Liste([False,False,False]).none(lambda x: x)).er_true()

def test_any_returnerer_false_hvis_minst_en_betingelsene_er_true():
    assert_at(Liste([False,True,False]).none(lambda x: x)).er_false()

# is_sorted
def test_is_sorted_returnerer_true_hvis_listen_er_tom():
    assert_at(Liste([]).is_sorted()).er_true()
    
def test_is_sorted_returnerer_true_hvis_listen_inneholder_ett_element():
    assert_at(Liste([1]).is_sorted()).er_true()
    
def test_is_sorted_returnerer_true_hvis_listen_er_sortert():
    assert_at(Liste([1,5,7,9,10]).is_sorted()).er_true()
    
def test_is_sorted_returnerer_false_hvis_listen_ikke_er_sortert():
    assert_at(Liste([1,3,2,9,10]).is_sorted()).er_false()
    
def test_is_sorted_reverse_returnerer_true_hvis_listen_er_i_motsatt_rekkefølge():
    assert_at(Liste([10,8,6,1,-1]).is_sorted(reverse=True)).er_true()

# exclude
def test_exclude_returnerer_ny_liste_med_elementer_som_eksisterer_i_første_unntatt_de_i_andre_liste():
    assert_at(Liste([1,2,3,3,4,4,5]).exclude(Liste([4,5,6,7])) == Liste([1,2,3,3])).er_true()

# copy
def test_copy_returnerer_en_lik_liste_med_samme_elementer():
    assert_at((l := Liste([1,2,3,3,4,4,5])).copy()).er_lik(l)

def test_copy_returnerer_en_liste_med_ulik_referanse():
    assert_at((l := Liste([1,2,3,3,4,4,5])).copy()).ikke_er(l)