import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import en_klubb, en_utøver, et_oppstillingskrav, en_mann_serieøvelse, en_kvinne_serieøvelse, en_øvelsesregel, en_overklubb, en_klubb_unntatt_overbygning, en_utøver_unntatt_overbygning, en_overbygning, en_rullestolutøver
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger

from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._kvinne_serieøvelse import KvinneSerieøvelse
from srcc.main.utils.orm._øvelsesregel import Øvelsesregel
from srcc.main.utils.orm._overklubb import Overklubb
from srcc.main.utils.orm._overbygning import Overbygning
from srcc.main.utils.orm._klubb_unntatt_overbygning import KlubbUnntattOverbygning
from srcc.main.utils.orm._utøver_unntatt_overbygning import UtøverUnntattOverbygning
from srcc.main.utils.orm._rullestolutøver import Rullestolutøver
from srcc.main.batch_1_grunnlag.konfiginnhenting import Konfiginnhenting

from srcc.main.kontrollsenter.tilganger import Tilganger

# innsett_setting
def test_innsett_setting_setter_innleste_oppstillingskrav():
    årkonfig = {
        'settinger': {
            'øvelseskrav': {
                '1. div': {'antall_obligatoriske': 10, 'maks_obligatoriske_løp': 10, 'antall_valgfri': 5, 'maks_valgfri_løp': 5},
                '2. div': {'antall_obligatoriske': 5, 'maks_obligatoriske_løp': 5, 'antall_valgfri': 2, 'maks_valgfri_løp': 2},
                '3. div': {'antall_obligatoriske': 0, 'maks_obligatoriske_løp': 0, 'antall_valgfri': 0, 'maks_valgfri_løp': 0}
            },
            'maks resultater per person': 5
        }
    }

    seriedata = Testdatabygger(Tilganger.ALT).bygg()
    serieår = 2100
    
    Konfiginnhenting.innsett_setting(serieår, årkonfig, seriedata)
    
    forventede_oppstillingskrav = [
        et_oppstillingskrav(serieår=serieår, divisjon=1, obl=10, val=5, obl_løp=10, val_løp=5, res_per_utøver=5),
        et_oppstillingskrav(serieår=serieår, divisjon=2, obl=5, val=2, obl_løp=5, val_løp=2, res_per_utøver=5),
        et_oppstillingskrav(serieår=serieår, divisjon=3, obl=0, val=0, obl_løp=0, val_løp=0, res_per_utøver=5),
    ]

    assert_at(seriedata).av_type(Oppstillingskrav).kun_har(forventede_oppstillingskrav)

def test_innsett_setting_beholder_oppstillingskrav_fra_andre_serieår():
    årkonfig = {
        'settinger': {
            'øvelseskrav': {
                '1. div': {'antall_obligatoriske': 10, 'maks_obligatoriske_løp': 10, 'antall_valgfri': 5, 'maks_valgfri_løp': 5},
                '2. div': {'antall_obligatoriske': 5, 'maks_obligatoriske_løp': 5, 'antall_valgfri': 2, 'maks_valgfri_løp': 2},
                '3. div': {'antall_obligatoriske': 0, 'maks_obligatoriske_løp': 0, 'antall_valgfri': 0, 'maks_valgfri_løp': 0}
            },
            'maks resultater per person': 5
        }
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
        .med(Klubb, [et_oppstillingskrav(serieår=2099), et_oppstillingskrav(serieår=2101)])
        .bygg())
    
    serieår = 2100
    
    Konfiginnhenting.innsett_setting(serieår, årkonfig, seriedata)
    
    forventede_oppstillingskrav = [
        et_oppstillingskrav(serieår=2099),
        et_oppstillingskrav(serieår=2101),
        et_oppstillingskrav(serieår=serieår, divisjon=1, obl=10, val=5, obl_løp=10, val_løp=5, res_per_utøver=5),
        et_oppstillingskrav(serieår=serieår, divisjon=2, obl=5, val=2, obl_løp=5, val_løp=2, res_per_utøver=5),
        et_oppstillingskrav(serieår=serieår, divisjon=3, obl=0, val=0, obl_løp=0, val_løp=0, res_per_utøver=5),
    ]

    assert_at(seriedata).av_type(Oppstillingskrav).kun_har(forventede_oppstillingskrav)

def test_innsett_setting_fjerner_oppstillingskrav_som_ikke_finnes_i_serieårets_settinger():
    årkonfig = {
        'settinger': {
            'øvelseskrav': {
                '1. div': {'antall_obligatoriske': 10, 'maks_obligatoriske_løp': 10, 'antall_valgfri': 5, 'maks_valgfri_løp': 5},
                '2. div': {'antall_obligatoriske': 5, 'maks_obligatoriske_løp': 5, 'antall_valgfri': 2, 'maks_valgfri_løp': 2},
                '3. div': {'antall_obligatoriske': 0, 'maks_obligatoriske_løp': 0, 'antall_valgfri': 0, 'maks_valgfri_løp': 0}
            },
            'maks resultater per person': 5
        }
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
        .med(Oppstillingskrav, [et_oppstillingskrav(serieår=2100, obl=1, val=1, obl_løp=1, val_løp=1, res_per_utøver=1)])
        .bygg())
    serieår = 2100
    
    Konfiginnhenting.innsett_setting(serieår, årkonfig, seriedata)
    
    forventede_oppstillingskrav = [
        et_oppstillingskrav(serieår=serieår, divisjon=1, obl=10, val=5, obl_løp=10, val_løp=5, res_per_utøver=5),
        et_oppstillingskrav(serieår=serieår, divisjon=2, obl=5, val=2, obl_løp=5, val_løp=2, res_per_utøver=5),
        et_oppstillingskrav(serieår=serieår, divisjon=3, obl=0, val=0, obl_løp=0, val_løp=0, res_per_utøver=5),
    ]

    assert_at(seriedata).av_type(Oppstillingskrav).kun_har(forventede_oppstillingskrav)

# innsett_øvelsesinfo
def test_innsett_øvelsesinfo_setter_innleste_øvelsesregler():
    årkonfig = {
        'øvelsesinfo': {
            "60h":  {"menn": ["obl","løp"], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 1}, "manuell": False},
            "100h": {"menn": [           ], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 2}},
            "stav": {"menn": ["obl","tek"], "kvinner": ["obl","tek"]},
            "spyd": {"menn": ["obl","tek"], "kvinner": ["obl","tek"]},
        }
    }

    seriedata = Testdatabygger(Tilganger.ALT).bygg()
    serieår = 2100
    
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_øvelsesregler = [
        en_øvelsesregel(serieår=serieår, øvelse="60h", mellomtidgruppe="hekk", mellomtidgruppe_distanse=1, forutsetter_elektronisk_tidtaking=True),
        en_øvelsesregel(serieår=serieår, øvelse="100h", mellomtidgruppe="hekk", mellomtidgruppe_distanse=2, forutsetter_elektronisk_tidtaking=False),
        en_øvelsesregel(serieår=serieår, øvelse="stav", mellomtidgruppe=None, mellomtidgruppe_distanse=None, forutsetter_elektronisk_tidtaking=False),
        en_øvelsesregel(serieår=serieår, øvelse="spyd", mellomtidgruppe=None, mellomtidgruppe_distanse=None, forutsetter_elektronisk_tidtaking=False),
    ]

    assert_at(seriedata).av_type(Øvelsesregel).kun_har(forventede_øvelsesregler)

def test_innsett_øvelsesinfo_beholder_øvelsesregel_fra_andre_serieår():
    årkonfig = {
        'øvelsesinfo': {}
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
        .med(Øvelsesregel, [en_øvelsesregel(serieår=2099), en_øvelsesregel(serieår=2101)])
        .bygg())
    serieår = 2100
    
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_øvelsesregler = [
        en_øvelsesregel(serieår=2099),
        en_øvelsesregel(serieår=2101)
    ]

    assert_at(seriedata).av_type(Øvelsesregel).kun_har(forventede_øvelsesregler)

def test_innsett_øvelsesinfo_fjerner_øvelsesregler_som_ikke_finnes_i_serieårets_øvelsesinfo():
    årkonfig = {
        'øvelsesinfo': {
            "60h":  {"menn": ["obl","løp"], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 1}, "manuell": False},
            "100h": {"menn": [           ], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 2}},
            "stav": {"menn": ["obl","tek"], "kvinner": ["obl","tek"]},
        }
    }
    
    serieår = 2100

    seriedata = (Testdatabygger(Tilganger.ALT)
        .med(Øvelsesregel, [
            en_øvelsesregel(serieår=serieår, øvelse="60h", mellomtidgruppe="hekk", mellomtidgruppe_distanse=1, forutsetter_elektronisk_tidtaking=True),
            en_øvelsesregel(serieår=serieår, øvelse="100h", mellomtidgruppe="hekk", mellomtidgruppe_distanse=2, forutsetter_elektronisk_tidtaking=False),
            en_øvelsesregel(serieår=serieår, øvelse="stav", mellomtidgruppe=None, mellomtidgruppe_distanse=None, forutsetter_elektronisk_tidtaking=False),
            en_øvelsesregel(serieår=serieår, øvelse="spyd", mellomtidgruppe=None, mellomtidgruppe_distanse=None, forutsetter_elektronisk_tidtaking=False),
        ])
        .bygg())
    
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_øvelsesregler = [
        en_øvelsesregel(serieår=serieår, øvelse="60h", mellomtidgruppe="hekk", mellomtidgruppe_distanse=1, forutsetter_elektronisk_tidtaking=True),
        en_øvelsesregel(serieår=serieår, øvelse="100h", mellomtidgruppe="hekk", mellomtidgruppe_distanse=2, forutsetter_elektronisk_tidtaking=False),
        en_øvelsesregel(serieår=serieår, øvelse="stav", mellomtidgruppe=None, mellomtidgruppe_distanse=None, forutsetter_elektronisk_tidtaking=False),
    ]

    assert_at(seriedata).av_type(Øvelsesregel).kun_har(forventede_øvelsesregler)

def test_innsett_øvelsesinfo_setter_innleste_menn_serieøvelser():
    årkonfig = {
        'øvelsesinfo': {
            "60h":  {"menn": ["obl","løp"], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 1}, "manuell": False},
            "100h": {"menn": [           ], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 2}},
            "stav": {"menn": ["obl","tek"], "kvinner": ["obl","tek"]},
            "spyd": {"menn": [      "tek"], "kvinner": [      "tek"]},
        }
    }

    seriedata = Testdatabygger(Tilganger.ALT).bygg()
    serieår = 2100
    
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_menn_serieøvelser = [
        en_mann_serieøvelse(serieår=serieår, øvelse="60h", er_obligatorisk=True, er_teknisk=False, prioritet=1),
        en_mann_serieøvelse(serieår=serieår, øvelse="stav", er_obligatorisk=True, er_teknisk=True, prioritet=3),
        en_mann_serieøvelse(serieår=serieår, øvelse="spyd", er_obligatorisk=False, er_teknisk=True, prioritet=4),
    ]
    
    assert_at(seriedata).av_type(MannSerieøvelse).kun_har(forventede_menn_serieøvelser)

def test_innsett_øvelsesinfo_beholder_mann_serieøvelse_fra_andre_serieår():
    årkonfig = {
        'øvelsesinfo': {}
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
        .med(MannSerieøvelse, [en_mann_serieøvelse(serieår=2099), en_mann_serieøvelse(serieår=2101)])
        .bygg())
    serieår = 2100
    
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_menn_serieøvelser = [
        en_mann_serieøvelse(serieår=2099),
        en_mann_serieøvelse(serieår=2101),
    ]
    
    assert_at(seriedata).av_type(MannSerieøvelse).kun_har(forventede_menn_serieøvelser)

def test_innsett_øvelsesinfo_fjerner_mann_serieøvelse_som_ikke_finnes_i_serieårets_øvelsesinfo():
    årkonfig = {
        'øvelsesinfo': {
            "stav": {"menn": ["obl","tek"], "kvinner": ["obl","tek"]},
            "spyd": {"menn": [      "tek"], "kvinner": [      "tek"]},
        }
    }

    serieår = 2100

    seriedata = (Testdatabygger(Tilganger.ALT)
        .med(MannSerieøvelse, [
            en_mann_serieøvelse(serieår=serieår, øvelse="60h", er_obligatorisk=True, er_teknisk=False, prioritet=1),
            en_mann_serieøvelse(serieår=serieår, øvelse="stav", er_obligatorisk=True, er_teknisk=True, prioritet=3),
            en_mann_serieøvelse(serieår=serieår, øvelse="spyd", er_obligatorisk=False, er_teknisk=True, prioritet=4),
        ])
        .bygg())
    
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_menn_serieøvelser = [
        en_mann_serieøvelse(serieår=serieår, øvelse="stav", er_obligatorisk=True, er_teknisk=True, prioritet=1),
        en_mann_serieøvelse(serieår=serieår, øvelse="spyd", er_obligatorisk=False, er_teknisk=True, prioritet=2),
    ]
    
    assert_at(seriedata).av_type(MannSerieøvelse).kun_har(forventede_menn_serieøvelser)

def test_innsett_øvelsesinfo_setter_innleste_kvinner_serieøvelser():
    årkonfig = {
        'øvelsesinfo': {
            "60h":  {"menn": ["obl","løp"], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 1}, "manuell": False},
            "100h": {"menn": [           ], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 2}},
            "stav": {"menn": ["obl","tek"], "kvinner": ["obl","tek"]},
            "spyd": {"menn": [      "tek"], "kvinner": [      "tek"]},
        }
    }

    seriedata = Testdatabygger(Tilganger.ALT).bygg()
    serieår = 2100
    
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_kvinner_serieøvelser = [
        en_kvinne_serieøvelse(serieår=serieår, øvelse="60h", er_obligatorisk=True, er_teknisk=False, prioritet=1),
        en_kvinne_serieøvelse(serieår=serieår, øvelse="100h", er_obligatorisk=True, er_teknisk=False, prioritet=2),
        en_kvinne_serieøvelse(serieår=serieår, øvelse="stav", er_obligatorisk=True, er_teknisk=True, prioritet=3),
        en_kvinne_serieøvelse(serieår=serieår, øvelse="spyd", er_obligatorisk=False, er_teknisk=True, prioritet=4),
    ]
    
    assert_at(seriedata).av_type(KvinneSerieøvelse).kun_har(forventede_kvinner_serieøvelser)

def test_innsett_øvelsesinfo_beholder_kvinne_serieøvelse_fra_andre_serieår():
    årkonfig = {
        'øvelsesinfo': {}
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
        .med(MannSerieøvelse, [
            en_kvinne_serieøvelse(serieår=2099),
            en_kvinne_serieøvelse(serieår=2101),
        ])
        .bygg())
    
    serieår = 2100
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_kvinner_serieøvelser = [
            en_kvinne_serieøvelse(serieår=2099),
            en_kvinne_serieøvelse(serieår=2101),
    ]
    
    assert_at(seriedata).av_type(KvinneSerieøvelse).kun_har(forventede_kvinner_serieøvelser)

def test_innsett_øvelsesinfo_fjerner_kvinne_serieøvelse_som_ikke_finnes_i_serieårets_øvelsesinfo():
    årkonfig = {
        'øvelsesinfo': {
            "60h":  {"menn": ["obl","løp"], "kvinner": ["obl","løp"], "mellomtid": {"hekk": 1}, "manuell": False},
        }
    }
    
    serieår = 2100
    seriedata = (Testdatabygger(Tilganger.ALT)
        .med(KvinneSerieøvelse, [
            en_kvinne_serieøvelse(serieår=serieår, øvelse="60h", er_obligatorisk=True, er_teknisk=False, prioritet=1),
            en_kvinne_serieøvelse(serieår=serieår, øvelse="100h", er_obligatorisk=True, er_teknisk=False, prioritet=2),
        ])
        .bygg())
    
    Konfiginnhenting.innsett_øvelsesinfo(serieår, årkonfig, seriedata)
    
    forventede_kvinner_serieøvelser = [
        en_kvinne_serieøvelse(serieår=serieår, øvelse="60h", er_obligatorisk=True, er_teknisk=False, prioritet=1),
    ]
    
    assert_at(seriedata).av_type(KvinneSerieøvelse).kun_har(forventede_kvinner_serieøvelser)

# les_overbygningsklubber
def test_les_overbygningsklubber_returnerer_innleste_overklubber_fra_serieåret():

    ås_il = en_klubb(klubb="Ås IL", kjernenavn="Ås")
    ski_il = en_klubb(klubb="Ski IL", kjernenavn="Ski")
    nordby_il = en_klubb(klubb="Nordby IL", kjernenavn="Nordby")

    resultatavvik = {
        'overbygningsklubber': [
            {
                "id": ås_il.klubb_id,
                "kjernenavn": "Ås",
                "aldersgrupper": [True, True, False],
                "moderklubber": [[ski_il.klubb_id, "Ski"], [nordby_il.klubb_id, "Nordby"]]
            }
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, ski_il, nordby_il])
            .bygg())
        
    serieår = 2100

    overklubber, _ = Konfiginnhenting.les_overbygningsklubber(serieår, resultatavvik, seriedata)
    
    forventede_overklubber = [
        en_overklubb(serieår=serieår, overklubb="Ås IL", alder_11_14=True, alder_15_19=True, alder_20_pluss=False),
    ]
    
    assert_at(overklubber).kun_inneholder(*forventede_overklubber)

def test_les_overbygningsklubber_med_ikkematchende_overklubb_id_og_navn_feiler():
    ås_il = en_klubb(klubb="Ås IL", kjernenavn="Ås")
    ski_il = en_klubb(klubb="Ski IL", kjernenavn="Ski")
    nordby_il = en_klubb(klubb="Nordby IL", kjernenavn="Nordby")

    resultatavvik = {
        'overbygningsklubber': [
            {
                "id": 404,
                "kjernenavn": "Ås",
                "aldersgrupper": [True, True, False],
                "moderklubber": [[ski_il, "Ski"], [nordby_il.klubb_id, "Nordby"]]
            }
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, ski_il, nordby_il])
            .bygg())
        
    serieår = 2100
    func = lambda: Konfiginnhenting.les_overbygningsklubber(serieår, resultatavvik, seriedata)
    
    assert_at(func).feiler_med(AssertionError)

def test_les_overbygningsklubber_returnerer_innleste_overbygninger_fra_serieåret():
    
    ås_il = en_klubb(klubb="Ås IL", kjernenavn="Ås")
    ski_il = en_klubb(klubb="Ski IL", kjernenavn="Ski")
    nordby_il = en_klubb(klubb="Nordby IL", kjernenavn="Nordby")

    resultatavvik = {
        'overbygningsklubber': [
            {
                "id": ås_il.klubb_id,
                "kjernenavn": "Ås",
                "aldersgrupper": [True, True, False],
                "moderklubber": [[ski_il.klubb_id, "Ski"], [nordby_il.klubb_id, "Nordby"]]
            }
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, ski_il, nordby_il])
            .bygg())
        
    serieår = 2100

    _, overbygninger = Konfiginnhenting.les_overbygningsklubber(serieår, resultatavvik, seriedata)
    
    forventede_overbygninger = [
        en_overbygning(serieår=serieår, overklubb="Ås IL", moderklubb="Ski IL"),
        en_overbygning(serieår=serieår, overklubb="Ås IL", moderklubb="Nordby IL"),
    ]

    assert_at(overbygninger).kun_har(forventede_overbygninger)

def test_les_overbygningsklubber_med_ikkematchende_moderklubb_id_og_navn_feiler():
    ås_il = en_klubb(klubb="Ås IL")
    ski_il = en_klubb(klubb="Ski IL")
    nordby_il = en_klubb(klubb="Nordby IL")

    resultatavvik = {
        'overbygningsklubber': [
            {
                "id": ås_il.klubb_id,
                "kjernenavn": "Ås IL",
                "aldersgrupper": [True, True, False],
                "moderklubber": [[404, "Ski IL"], [nordby_il.klubb_id, "Nordby IL"]]
            }
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, ski_il, nordby_il])
            .bygg())
        
    serieår = 2100
    func = lambda: Konfiginnhenting.les_overbygningsklubber(serieår, resultatavvik, seriedata)
    
    assert_at(func).feiler_med(AssertionError)

# les_klubber_unntatt_overbygning
def test_les_klubber_unntatt_overbygning_returnerer_innleste_klubber_unntatt_overbygning_fra_serieåret():
    
    serieår = 2100

    ås_il = en_klubb(klubb="Ås IL", kjernenavn="Ås")
    ås_il_overklubb = en_overklubb(serieår=serieår, overklubb="Ås IL")
    vestby_il = en_klubb(klubb="Vestby IL", kjernenavn="Vestby")

    resultatavvik = {
        "klubber unntatt overbygning": [
            {"id": vestby_il.klubb_id, "kjernenavn": "Vestby", "overklubb": [ås_il.klubb_id, "Ås"]}
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, vestby_il])
            .med(Overklubb, [ås_il_overklubb])
            .bygg())

    klubber_unntatt_overbygning = Konfiginnhenting.les_klubber_unntatt_overbygning(serieår, resultatavvik, seriedata)
    
    forventede_unntatte_klubber = [
        en_klubb_unntatt_overbygning(serieår=serieår, overklubb="Ås IL", moderklubb="Vestby IL"),
    ]

    assert_at(klubber_unntatt_overbygning).kun_inneholder(*forventede_unntatte_klubber)

def test_les_klubber_unntatt_overbygning_med_overklubb_som_ikke_finnes_feiler():
        
    ås_il = en_klubb(klubb="Ås IL")
    vestby_il = en_klubb(klubb="Vestby IL")

    resultatavvik = {
        "klubber unntatt overbygning": [
            {"id": vestby_il.klubb_id, "kjernenavn": "Vestby IL", "overklubb": [ås_il.klubb_id, "Ås IL"]}
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, vestby_il])
            .med(Overklubb, [])
            .bygg())
        
    serieår = 2100

    func = lambda: Konfiginnhenting.les_klubber_unntatt_overbygning(serieår, resultatavvik, seriedata)
    
    assert_at(func).feiler_med(AssertionError)

def test_les_klubber_unntatt_overbygning_med_ikkematchende_overklubb_id_og_navn_feiler():
    
    serieår = 2100
    
    ås_il = en_klubb(klubb="Ås IL")
    ås_il_overklubb = en_overklubb(serieår=serieår, overklubb="Ås IL")
    vestby_il = en_klubb(klubb="Vestby IL")

    resultatavvik = {
        "klubber unntatt overbygning": [
            {"id": vestby_il.klubb_id, "kjernenavn": "Vestby IL", "overklubb": [404, "Ås IL"]}
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, vestby_il])
            .med(Overklubb, [ås_il_overklubb])
            .bygg())

    func = lambda: Konfiginnhenting.les_klubber_unntatt_overbygning(serieår, resultatavvik, seriedata)
    
    assert_at(func).feiler_med(AssertionError)

def test_les_klubber_unntatt_overbygning_med_ikkematchende_moderklubb_id_og_navn_feiler():
    
    serieår = 2100
    
    ås_il = en_klubb(klubb="Ås IL")
    ås_il_overklubb = en_overklubb(serieår=serieår, overklubb="Ås IL")
    vestby_il = en_klubb(klubb="Vestby IL")

    resultatavvik = {
        "klubber unntatt overbygning": [
            {"id": 404, "kjernenavn": "Vestby IL", "overklubb": [ås_il.klubb_id, "Ås IL"]}
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Klubb, [ås_il, vestby_il])
            .med(Overklubb, [ås_il_overklubb])
            .bygg())
        
    serieår = 2100

    func = lambda: Konfiginnhenting.les_klubber_unntatt_overbygning(serieår, resultatavvik, seriedata)
    
    assert_at(func).feiler_med(AssertionError)

# les_utøvere_unntatt_overbygning
def test_les_utøvere_unntatt_overbygning_returnerer_innleste_utøvere_unntatt_overbygning():
    
    serieår = 2100

    utøver = en_utøver("Per")
    ås_il = en_klubb(klubb="Ås IL", kjernenavn="Ås")
    ik_tjalve = en_klubb(klubb="IK Tjalve", kjernenavn="Tjalve")
    ik_tjalve_overklubb = en_overklubb(serieår=serieår, overklubb="IK Tjalve")
    overbygning = en_overbygning(serieår=serieår, overklubb="IK Tjalve", moderklubb="Ås IL")

    resultatavvik = {
        "utøvere unntatt overbygning": [
            {"id": utøver.utøver_id, "navn": "Per", "moderklubb": [ås_il.klubb_id, "Ås"]}
        ]
    }
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Utøver, [utøver])
            .med(Klubb, [ås_il, ik_tjalve])
            .med(Overklubb, [ik_tjalve_overklubb])
            .med(Overbygning, [overbygning])
            .bygg())

    utøvere_unntatt_overbygning = Konfiginnhenting.les_utøvere_unntatt_overbygning(serieår, resultatavvik, seriedata)
    
    forventede_unntatte_utøvere = [
        en_utøver_unntatt_overbygning(serieår=serieår, utøver="Per", moderklubb="Ås IL"),
    ]

    assert_at(utøvere_unntatt_overbygning).kun_inneholder(*forventede_unntatte_utøvere)

def test_les_utøvere_unntatt_overbygning_med_ikkematchende_utøver_id_og_navn_feiler():
        
    serieår = 2100

    utøver = en_utøver("Per")
    ås_il = en_klubb(klubb="Ås IL")
    ik_tjalve = en_klubb(klubb="IK Tjalve")
    ik_tjalve_overklubb = en_overklubb(serieår=serieår, overklubb="IK Tjalve")
    overbygning = en_overbygning(serieår=serieår, overklubb="IK Tjalve", moderklubb="Ås IL")

    resultatavvik = {
        "utøvere unntatt overbygning": [
            {"id": 404, "navn": "Per", "moderklubb": [ås_il.klubb_id, "Ås IL"]}
        ]
    }
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Utøver, [utøver])
            .med(Klubb, [ås_il, ik_tjalve])
            .med(Overklubb, [ik_tjalve_overklubb])
            .med(Overbygning, [overbygning])
            .bygg())

    func = lambda: Konfiginnhenting.les_utøvere_unntatt_overbygning(serieår, resultatavvik, seriedata)
    
    assert_at(func).feiler_med(AssertionError)

def test_les_utøvere_unntatt_overbygning_med_overbygning_som_ikke_finnes_feiler():
    
    serieår = 2100

    utøver = en_utøver("Per")
    ås_il = en_klubb(klubb="Ås IL")
    ik_tjalve = en_klubb(klubb="IK Tjalve")
    ik_tjalve_overklubb = en_overklubb(serieår=serieår, overklubb="IK Tjalve")

    resultatavvik = {
        "utøvere unntatt overbygning": [
            {"id": utøver.utøver_id, "navn": "Per", "moderklubb": [ås_il.klubb_id, "Ås IL"]}
        ]
    }
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Utøver, [utøver])
            .med(Klubb, [ås_il, ik_tjalve])
            .med(Overklubb, [ik_tjalve_overklubb])
            .med(Overbygning, [])
            .bygg())

    func = lambda: Konfiginnhenting.les_utøvere_unntatt_overbygning(serieår, resultatavvik, seriedata)

    assert_at(func).feiler_med(AssertionError)

def test_les_utøvere_unntatt_overbygning_med_ikkematchende_moderklubb_id_og_navn_feiler():
    
    serieår = 2100

    utøver = en_utøver("Per")
    ås_il = en_klubb(klubb="Ås IL")
    ik_tjalve = en_klubb(klubb="IK Tjalve")
    ik_tjalve_overklubb = en_overklubb(serieår=serieår, overklubb="IK Tjalve")
    overbygning = en_overbygning(serieår=serieår, overklubb="IK Tjalve", moderklubb="Ås IL")

    resultatavvik = {
        "utøvere unntatt overbygning": [
            {"id": utøver.utøver_id, "navn": "Per", "moderklubb": [404, "Ås IL"]}
        ]
    }
    
    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Utøver, [utøver])
            .med(Klubb, [ås_il, ik_tjalve])
            .med(Overklubb, [ik_tjalve_overklubb])
            .med(Overbygning, [overbygning])
            .bygg())

    func = lambda: Konfiginnhenting.les_utøvere_unntatt_overbygning(serieår, resultatavvik, seriedata)

    assert_at(func).feiler_med(AssertionError)

# les_rullestolutøvere
def test_les_rullestolutøvere_returnerer_innleste_rullestolutøvere():

    per = en_utøver(navn="Per")

    resultatavvik = {
        "rullestolutøvere": [
            {"id": per.utøver_id, "navn": "Per"},
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Utøver, [per])
            .bygg())
    
    serieår = 2100

    rullestolutøvere = Konfiginnhenting.les_rullestolutøvere(serieår, resultatavvik, seriedata)

    forventede_rullestolutøvere = [
        en_rullestolutøver(serieår=serieår, utøver="Per")
    ]

    assert_at(rullestolutøvere).kun_inneholder(*forventede_rullestolutøvere)

def test_les_rullestolutøvere_med_ikkematchende_utøver_id_og_navn_feiler():
    
    per = en_utøver(navn="Per")

    resultatavvik = {
        "rullestolutøvere": [
            {"id": 404, "navn": "Per"},
        ]
    }

    seriedata = (Testdatabygger(Tilganger.ALT)
            .med(Utøver, [per])
            .bygg())
    
    serieår = 2100

    func = lambda: Konfiginnhenting.les_rullestolutøvere(serieår, resultatavvik, seriedata)
    
    assert_at(func).feiler_med(AssertionError)