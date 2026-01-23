import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import en_batchkjøring, en_serie, en_utøver, en_øvelse, en_mann_serieøvelse, en_kvinne_serieøvelse, et_stevne, et_resultat, et_mann_uttrekksresultat, en_resultattype, et_oppstillingskrav, en_klubb, en_klubbkrets, en_overklubb, en_overbygning, en_klubb_unntatt_overbygning, en_utøver_unntatt_overbygning, en_øvelsesregel, en_rullestolutøver, et_serieresultat, et_mann_lag, et_mann_lagresultat, en_mann_laginfo, en_mann_lagplassering, en_mann_utøver_merverdi

from datetime import datetime, date
import inspect

objektfunksjoner = {
    en_batchkjøring: [],
    en_serie: [],
    en_utøver: ['utøver'],
    en_øvelse: ['øvelse'],
    en_mann_serieøvelse: [],
    en_kvinne_serieøvelse: [],
    et_stevne: ['stevne'],
    et_resultat: ['resultat'],
    et_oppstillingskrav: [],
    en_klubb: ['klubb','moderklubb'],
    en_klubbkrets: [],
    en_overklubb: ['overklubb'],
    en_overbygning: [],
    en_klubb_unntatt_overbygning: [],
    en_utøver_unntatt_overbygning: [],
    en_øvelsesregel: [],
    et_mann_uttrekksresultat: [],
    en_rullestolutøver: [],
    et_serieresultat: [],
    et_mann_lag: ['lag'],
    et_mann_lagresultat: [],
    en_mann_laginfo: [],
    en_mann_lagplassering: [],
    en_mann_utøver_merverdi: []
}

ikke_defaultverdier = {
    'antall_noteringer': 3,
    'antall_deltakere': 3,
    'batch': 2,
    'serieår': 2050,
    'utøver': 'Odd',
    'fødselsår': 2050,
    'fra_og_med': date.fromisoformat('2050-01-01'),
    'til_og_med': date.fromisoformat('2060-01-01'),
    'øvelse': '100m',
    'er_teknisk': True,
    'er_obligatorisk': True,
    'klubb': 'Ski IL',
    'krets': 'Oslo',
    'lagnummer': 3,
    'navn': 'Odd',
    'kjernenavn': 'Ås IL',
    'overklubb': 'Ski IL',
    'moderklubb': 'Ski IL',
    'mellomtidgruppe': 'sprint',
    'mellomtidgruppe_distanse': 10,
    'forutsetter_elektronisk_tidtaking': False,
    'resultatforløp': 'ingenting',
    'oppstillingstype': 'VALGFRI',
    'dato': date.fromisoformat('2050-01-01'),
    'prestasjon': '2.00',
    'prioritet': 10,
    'poeng_obligatoriske': 99,
    'poeng_valgfri': 99,
    'poeng': 99,
    'plassering': 5,
    'divisjon': 4,
    'obl': 5,
    'val': 5,
    'obl_løp': 5,
    'val_løp': 5,
    'res_per_utøver': 5,
    'sted': 'Ski',
    'alder_11_14': True,
    'alder_15_19': True,
    'alder_20_pluss': True,
    'uttrekksdato': date.fromisoformat('2060-01-01'),
    'start': datetime.fromisoformat('2060-01-01'),
    'slutt': datetime.fromisoformat('2060-01-01'),
}

def objekt_func(relasjon):
    for func,nøkler in objektfunksjoner.items():
        for nøkkel in nøkler:
            if nøkkel == relasjon:
                return func
    raise ValueError

def opprett(func, defaultverdier=False):
    if defaultverdier:
        return func()
    kwargs = {k: ikke_defaultverdier[k] for k in inspect.signature(func).parameters.keys()}
    return func(**kwargs)

def test_testobjekter_tilegner_seg_referanse_til_sine_relasjoner():
    for objektfunksjon in objektfunksjoner:
        objekt = opprett(objektfunksjon)
        defaultobjekt = opprett(objektfunksjon, defaultverdier=True)
        for relasjon in objekt.relasjoner():
            assert getattr(objekt, relasjon) == opprett(objekt_func(relasjon)), f"{type(objekt).__name__} refererer ikke til riktig relasjonsobjekt for '{relasjon}' (uten defaultverdier)."
            assert getattr(defaultobjekt, relasjon) == opprett(objekt_func(relasjon), defaultverdier=True), f"{type(objekt).__name__} refererer ikke til riktig relasjonsobjekt for '{relasjon}' (med defaultverdier)."

    assert opprett(en_resultattype, defaultverdier=True).resultat == opprett(et_resultat, defaultverdier=True)
    assert opprett(en_resultattype).resultat == opprett(et_resultat)
    assert opprett(en_resultattype).serieøvelse == opprett(en_mann_serieøvelse)

def test_testobjekter_er_lik_seg_selv():
    for objektfunksjon in objektfunksjoner:
        assert opprett(objektfunksjon) == opprett(objektfunksjon)
        assert opprett(objektfunksjon, defaultverdier=True) == opprett(objektfunksjon, defaultverdier=True)

    assert en_resultattype() == en_resultattype()
    assert opprett(en_resultattype) == opprett(en_resultattype)