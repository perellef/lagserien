import sys
sys.path.append('./')

from srcc.main.utils.orm._batchkjøring import Batchkjøring
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._overklubb import Overklubb
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._overbygning import Overbygning
from srcc.main.utils.orm._klubb_unntatt_overbygning import KlubbUnntattOverbygning
from srcc.main.utils.orm._utøver_unntatt_overbygning import UtøverUnntattOverbygning
from srcc.main.utils.orm._øvelsesregel import Øvelsesregel
from srcc.main.batch_4_kalkulator.kalkulator import Resultattype
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._kvinne_serieøvelse import KvinneSerieøvelse
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._resultatbytte import Resultatbytte
from srcc.main.utils.orm._rullestolutøver import Rullestolutøver
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._mann_lag import MannLag
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._mann_utøver_merverdi import MannUtøverMerverdi
from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat

from srcc.main.batch_4_kalkulator.diverse import nullutøver, nulløvelse

from datetime import date, datetime
import hashlib


def konsistent_forkortet_hash(s):
    hash_object = hashlib.sha256(str(s).encode('utf-8'))
    return int(str(int(hash_object.hexdigest(),16))[:9])

class AliasID:

    aliaser = {}

    @staticmethod
    def til_id(navn):
        _id_ = konsistent_forkortet_hash(navn)

        AliasID.aliaser[_id_] = navn
        return _id_

    @staticmethod
    def til_alias(_id_):
        try:
            return AliasID.aliaser[_id_]
        except KeyError:
            return _id_


def en_batchkjøring(batch=4, serieår=2100, uttrekksdato=date(2100,1,1), start=datetime(2100,1,1), slutt=datetime(2100,1,1)):
    return Batchkjøring(
        batch=batch,
        serieår=serieår,
        uttrekksdato=uttrekksdato,
        start=start,
        slutt=slutt,
    )

def en_serie(serieår=2100, fra_og_med=None, til_og_med=None):
    return Serie(
        serieår=serieår,
        fra_og_med=date(serieår,1,1) if fra_og_med == None else fra_og_med,
        til_og_med=date(serieår,12,31) if til_og_med == None else til_og_med,
    )

def en_utøver(navn="A", fødselsår=2000):
    return Utøver(
        utøver_id=AliasID.til_id(f"{navn} {fødselsår}"),
        navn=navn,
        fødselsår=fødselsår,
    )

def en_øvelse(øvelse="60m"):
    return Øvelse(
        øvelseskode=øvelse,
        øvelsesnavn=øvelse,
    )

def en_mann_serieøvelse(serieår=2100, øvelse="60m", er_obligatorisk=False, er_teknisk=False, prioritet=1):
   
    _øvelse_ = en_øvelse(øvelse=øvelse)

    serieøvelse = MannSerieøvelse(
        serieår=serieår,
        øvelseskode=_øvelse_.øvelseskode,
        er_obligatorisk=er_obligatorisk,
        er_teknisk=er_teknisk,
        prioritet=prioritet,
    )
    serieøvelse.øvelse = _øvelse_

    return serieøvelse

def en_kvinne_serieøvelse(serieår=2100, øvelse="60m", er_obligatorisk=False, er_teknisk=False, prioritet=1):
   
    _øvelse_ = en_øvelse(øvelse=øvelse)

    serieøvelse = KvinneSerieøvelse(
        serieår=serieår,
        øvelseskode=_øvelse_.øvelseskode,
        er_obligatorisk=er_obligatorisk,
        er_teknisk=er_teknisk,
        prioritet=prioritet,
    )
    serieøvelse.øvelse = _øvelse_

    return serieøvelse

def en_mann_utøver_merverdi(serieår=2100, klubb="Ås IL", kjernenavn="Ås", utøver="A", fødselsår=2000,  fra_og_med=date(2100,1,1), til_og_med=None, poeng=100):
   
    _klubb_ = en_klubb(klubb=klubb, kjernenavn=kjernenavn)
    _utøver_ = en_utøver(navn=utøver, fødselsår=fødselsår)

    mann_utøver_merverdi = MannUtøverMerverdi(
        serieår=serieår,
        klubb_id=_klubb_.klubb_id,
        utøver_id=_utøver_.utøver_id,
        fra_og_med=fra_og_med,
        til_og_med=til_og_med,
        poeng=poeng
    )
    mann_utøver_merverdi.klubb = _klubb_
    mann_utøver_merverdi.utøver = _utøver_

    return mann_utøver_merverdi

def et_stevne(sted="Ås"):
    return Stevne(
        stevne_id=AliasID.til_id(sted),
        stevnedato=date.fromisoformat("9999-01-01"),
        stevnetittel="",
        arena="",
        sted=sted,
        er_nasjonalt=True,
        rapportert=date.fromisoformat("9999-01-01")
    )

def et_resultatbytte(øvelse="60m", utøver="A", fødselsår=2000, sted="Ås", dato=date(2100,1,1), prestasjon="", klubb="Ås IL", kjernenavn="Ås", registrert=datetime(2100,1,1), notat=""):
    _resultat_ = et_resultat(øvelse=øvelse, utøver=utøver, fødselsår=fødselsår, sted=sted, dato=dato, prestasjon=prestasjon)
    _klubb_ = None if klubb==None else en_klubb(klubb=klubb, kjernenavn=kjernenavn)
    
    resultatbytte = Resultatbytte(
        statistikk_resultat_id=_resultat_.statistikk_resultat_id,
        klubb_id=None if _klubb_ == None else _klubb_.klubb_id,
        registrert=registrert,
        notat=notat,
    )

    resultatbytte.resultat = _resultat_
    resultatbytte.klubb = _klubb_
    return resultatbytte

def et_resultat(øvelse="60m", utøver="A", fødselsår=2000, sted="Ås", dato=date(2100,1,1), prestasjon=""):
    
    _utøver_ = utøver if utøver == nullutøver else en_utøver(navn=utøver, fødselsår=fødselsår)
    _stevne_ = et_stevne(sted=sted)
    _øvelse_ = øvelse if øvelse == nulløvelse else en_øvelse(øvelse=øvelse)
    
    resultat_id = AliasID.til_id(str(_utøver_.utøver_id)+_øvelse_.øvelseskode+str(_stevne_.stevne_id)+prestasjon)
    
    resultat = Resultat(
        resultat_id=resultat_id,
        stevne_id=_stevne_.stevne_id,
        utøver_id=_utøver_.utøver_id,
        øvelseskode=_øvelse_.øvelseskode,
        prestasjon=prestasjon,
        dato=dato,
        statistikk_resultat_id=resultat_id
    )
    resultat.stevne = _stevne_
    resultat.utøver = _utøver_
    resultat.øvelse = _øvelse_

    return resultat

def et_mann_uttrekksresultat(øvelse="60m", utøver="A", fødselsår=2000, sted="Ås", dato=date(2100,1,1), prestasjon="", fra_og_med=date(2100,1,1), til_og_med=None, klubb="Ås IL", kjernenavn="Ås"):
    
    _resultat_ = et_resultat(sted=sted, utøver=utøver, øvelse=øvelse, fødselsår=fødselsår, dato=dato, prestasjon=prestasjon)
    _klubb_ = en_klubb(klubb=klubb, kjernenavn=kjernenavn)

    uttrekksresultat = MannUttrekksresultat(
        resultat_id=_resultat_.resultat_id,
        fra_og_med=fra_og_med,
        til_og_med=til_og_med,
        klubb_id=_klubb_.klubb_id,
    )

    uttrekksresultat.resultat = _resultat_
    uttrekksresultat.klubb = _klubb_

    return uttrekksresultat

def et_kvinne_uttrekksresultat(øvelse="60m", utøver="A", fødselsår=2000, sted="Ås", dato=date(2100,1,1), prestasjon="", fra_og_med=date(2100,1,1), til_og_med=None, klubb="Ås IL", kjernenavn="Ås"):
    
    _resultat_ = et_resultat(sted=sted, utøver=utøver, øvelse=øvelse, fødselsår=fødselsår, dato=dato, prestasjon=prestasjon)
    _klubb_ = en_klubb(klubb=klubb, kjernenavn=kjernenavn)
    uttrekksresultat = KvinneUttrekksresultat(
        resultat_id=_resultat_.resultat_id,
        fra_og_med=fra_og_med,
        til_og_med=til_og_med,
        klubb_id=_klubb_.klubb_id,
    )

    uttrekksresultat.resultat = _resultat_
    uttrekksresultat.klubb = _klubb_

    return uttrekksresultat

def et_oppstillingskrav(serieår=2100, divisjon=1, obl=10, val=10, obl_løp=10, val_løp=10, res_per_utøver=10):
    return Oppstillingskrav(
        serieår=serieår,
        divisjon=divisjon,
        antall_obligatoriske=obl,
        antall_valgfri=val,
        maks_obligatoriske_løp=obl_løp,
        maks_valgfri_løp=val_løp,
        maks_resultater_per_utøver=res_per_utøver,
    )

def en_klubb(klubb="Ås IL", kjernenavn="Ås"):
    return Klubb(
        klubb_id=AliasID.til_id(klubb),
        klubbnavn=klubb,
        kjernenavn=kjernenavn
    )

def en_klubbkrets(fra_og_med=date(2100,1,1), til_og_med=None, klubb="Ås IL", kjernenavn="Ås", krets="Oslo"):
    _klubb_ = en_klubb(klubb=klubb, kjernenavn=kjernenavn) 
    klubbkrets = Klubbkrets(
        fra_og_med=fra_og_med,
        til_og_med=til_og_med,
        klubb_id=_klubb_.klubb_id,
        krets=krets
    )
    
    klubbkrets.klubb = _klubb_
    return klubbkrets

def en_overklubb(serieår=2100, overklubb="Ås IL", kjernenavn="Ås", alder_11_14=False, alder_15_19=False, alder_20_pluss=False):
    
    _klubb_ = en_klubb(klubb=overklubb, kjernenavn=kjernenavn) 
    
    overklubb = Overklubb(
        serieår=serieår,
        overklubb_id=_klubb_.klubb_id,
        alder_11_14=alder_11_14,
        alder_15_19=alder_15_19,
        alder_20_pluss=alder_20_pluss,
    )

    overklubb.klubb = _klubb_
    return overklubb

def en_overbygning(serieår=2100, overklubb="Ås IL", kjernenavn="Ås", alder_11_14=False, alder_15_19=False, alder_20_pluss=False, moderklubb="Ås IL"):
    
    _overklubb_ = en_overklubb(serieår=serieår, overklubb=overklubb, alder_11_14=alder_11_14, alder_15_19=alder_15_19, alder_20_pluss=alder_20_pluss)
    _moderklubb_ = en_klubb(klubb=moderklubb, kjernenavn=kjernenavn)
    
    overbygning = Overbygning(
        serieår=serieår,
        overklubb_id=_overklubb_.overklubb_id,
        moderklubb_id=_moderklubb_.klubb_id,
    )
    
    overbygning.overklubb = _overklubb_
    overbygning.moderklubb = _moderklubb_
    
    return overbygning

def en_klubb_unntatt_overbygning(serieår=2100, overklubb="Ås IL", kjernenavn="Ås", alder_11_14=False, alder_15_19=False, alder_20_pluss=False, moderklubb="Ås IL"):
    
    _overklubb_ = en_overklubb(serieår=serieår, overklubb=overklubb, alder_11_14=alder_11_14, alder_15_19=alder_15_19, alder_20_pluss=alder_20_pluss)
    _moderklubb_ = en_klubb(klubb=moderklubb, kjernenavn=kjernenavn)
    
    klubb_unntatt_overbygning = KlubbUnntattOverbygning(
        serieår=serieår,
        overklubb_id=_overklubb_.overklubb_id,
        moderklubb_id=_moderklubb_.klubb_id,
    )
    klubb_unntatt_overbygning.overklubb = _overklubb_
    klubb_unntatt_overbygning.moderklubb = _moderklubb_
    
    return klubb_unntatt_overbygning

def en_utøver_unntatt_overbygning(serieår=2100, utøver="A", fødselsår=2000, moderklubb="Ås IL", kjernenavn="Ås"):
    
    _utøver_ = en_utøver(navn=utøver, fødselsår=fødselsår)
    _moderklubb_ = en_klubb(klubb=moderklubb, kjernenavn=kjernenavn)
    
    utøver_unntatt_overbygning = UtøverUnntattOverbygning(
        serieår=serieår,
        utøver_id=_utøver_.utøver_id,
        moderklubb_id=_moderklubb_.klubb_id,
    )

    utøver_unntatt_overbygning.utøver = _utøver_
    utøver_unntatt_overbygning.moderklubb = _moderklubb_
    
    return utøver_unntatt_overbygning

def en_øvelsesregel(serieår=2100, øvelse="60m", mellomtidgruppe=None, mellomtidgruppe_distanse=None, forutsetter_elektronisk_tidtaking=False):
    
    _øvelse_ = en_øvelse(øvelse=øvelse)

    øvelsesregel = Øvelsesregel(
        serieår=serieår,
        øvelseskode=_øvelse_.øvelseskode,
        mellomtidgruppe=mellomtidgruppe,
        mellomtidgruppe_distanse=mellomtidgruppe_distanse,
        forutsetter_elektronisk_tidtaking=forutsetter_elektronisk_tidtaking,
    )
    øvelsesregel.øvelse = _øvelse_
    
    return øvelsesregel

def en_rullestolutøver(serieår=2100, utøver="A", fødselsår=2000):

    _utøver_ = en_utøver(navn=utøver, fødselsår=fødselsår)

    rullestolutøver = Rullestolutøver(
        serieår=serieår,
        utøver_id=_utøver_.utøver_id
    )
    rullestolutøver.utøver = _utøver_
    return rullestolutøver

def et_serieresultat(øvelse="60m", poeng=100, utøver="A", fødselsår=2000, sted="Ås", dato=date(2100,1,1), prestasjon="", fra_og_med=date(2100,1,1), til_og_med=None, klubb="Ås IL", kjernenavn="Ås", resultatforløp=""):

    _resultat_ = et_resultat(øvelse=øvelse, utøver=utøver, fødselsår=fødselsår, sted=sted, dato=dato, prestasjon=prestasjon)
    _klubb_ = None if klubb == None else en_klubb(klubb=klubb, kjernenavn=kjernenavn)

    serieresultat = MannSerieresultat(
        resultat_id=_resultat_.resultat_id,
        fra_og_med=fra_og_med,
        til_og_med=til_og_med,
        poeng=poeng,
        klubb_id=None if klubb == None else _klubb_.klubb_id,
        forløp=resultatforløp
    )

    serieresultat.resultat = _resultat_
    serieresultat.klubb = _klubb_

    return serieresultat

def en_resultattype(øvelse="60m", poeng=100, utøver="A", fødselsår=2000, sted="Ås", dato=date(2100,1,1), prestasjon="", serieår=2100, er_obligatorisk=False, er_teknisk=False, prioritet=1):
    serieresultat = et_serieresultat(
        øvelse=øvelse,
        poeng=poeng,
        utøver=utøver,
        fødselsår=fødselsår,
        sted=sted,
        dato=dato,
        prestasjon=prestasjon
    )

    return Resultattype(
        serieresultat,
        en_mann_serieøvelse(serieår=serieår, øvelse=øvelse, er_obligatorisk=er_obligatorisk, er_teknisk=er_teknisk, prioritet=prioritet),
    )

def et_mann_lag(serieår=2100, klubb="Ås IL", kjernenavn="Ås", lagnummer=1):
    _klubb_ = en_klubb(klubb=klubb, kjernenavn=kjernenavn)

    lag = MannLag(
        serieår=serieår,
        klubb_id=_klubb_.klubb_id,
        lagnummer=lagnummer,
    )
    lag.klubb = _klubb_
    return lag

def et_mann_lagresultat(
    serieår=2100,
    klubb="Ås IL",
    kjernenavn="Ås",
    lagnummer=1,
    oppstillingstype="OBLIGATORISK",
    fra_og_med=date(2100,1,1),
    til_og_med=None,
    sted="Ås",
    utøver="A",
    fødselsår=2000,
    øvelse="60m",
    dato=date(2100,1,1),
    prestasjon="",
):
    _klubb_ = en_klubb(klubb=klubb, kjernenavn=kjernenavn)
    _lag_ = et_mann_lag(serieår=serieår, klubb=klubb, lagnummer=lagnummer)
    _resultat_ = et_resultat(øvelse=øvelse, prestasjon=prestasjon, utøver=utøver, fødselsår=fødselsår, sted=sted, dato=dato)

    lagresultat = MannLagresultat(
        serieår=serieår,
        klubb_id=_klubb_.klubb_id,
        lagnummer=lagnummer,
        oppstillingstype=oppstillingstype,
        fra_og_med=fra_og_med,
        til_og_med=til_og_med,
        resultat_id=_resultat_.resultat_id,
    )
    lagresultat.lag = _lag_
    lagresultat.resultat = _resultat_
    return lagresultat

def en_mann_laginfo(
    serieår=2100,
    klubb="Ås IL",
    kjernenavn="Ås",
    lagnummer=1,
    fra_og_med=date(2100,1,1),
    til_og_med=None,
    poeng=1000,
    poeng_obligatoriske=1000,
    poeng_valgfri=1000,
    antall_noteringer=10,
    antall_deltakere=10,
):
    _klubb_ = en_klubb(klubb=klubb, kjernenavn=kjernenavn)
    _lag_ = et_mann_lag(serieår=serieår, klubb=klubb, lagnummer=lagnummer)

    laginfo = MannLaginfo(
        serieår=serieår,
        klubb_id=_klubb_.klubb_id,
        lagnummer=lagnummer,
        fra_og_med=fra_og_med,
        til_og_med=til_og_med,
        poeng=poeng,
        poeng_obligatoriske=poeng_obligatoriske,
        poeng_valgfri=poeng_valgfri,
        antall_noteringer=antall_noteringer,
        antall_deltakere=antall_deltakere,
    )
    laginfo.lag = _lag_
    return laginfo

def en_mann_lagplassering(serieår=2100, divisjon=1, plassering=1, fra_og_med=date(2100,1,1), til_og_med=None, klubb="Ås IL", kjernenavn="Ås", lagnummer=1):
    _klubb_ = en_klubb(klubb=klubb, kjernenavn=kjernenavn)
    _lag_ = et_mann_lag(serieår=serieår, klubb=klubb, lagnummer=lagnummer)

    lagplassering = MannLagplassering(
        serieår=serieår,
        divisjon=divisjon,
        plassering=plassering,
        fra_og_med=fra_og_med,
        til_og_med=til_og_med,
        klubb_id=_klubb_.klubb_id,
        lagnummer=lagnummer,
    )
    lagplassering.lag = _lag_
    return lagplassering
