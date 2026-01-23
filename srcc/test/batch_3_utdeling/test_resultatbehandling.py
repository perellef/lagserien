import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testobjekter import en_klubb, et_resultat, en_øvelsesregel, en_rullestolutøver, en_overbygning, en_overklubb, en_klubb_unntatt_overbygning, en_klubbkrets, en_utøver_unntatt_overbygning, et_resultatbytte
from srcc.main.utils.testverktøy.assert_at import assert_at
from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger

from srcc.main.utils.orm._øvelsesregel import Øvelsesregel
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.utils.orm._rullestolutøver import Rullestolutøver
from srcc.main.utils.orm._resultatbytte import Resultatbytte
from srcc.main.utils.orm._overklubb import Overklubb
from srcc.main.utils.orm._overbygning import Overbygning
from srcc.main.utils.orm._klubb_unntatt_overbygning import KlubbUnntattOverbygning
from srcc.main.utils.orm._utøver_unntatt_overbygning import UtøverUnntattOverbygning

from srcc.main.batch_3_utdeling.resultatbehandling import Resultatbehandling

from srcc.main.kontrollsenter.tilganger import Tilganger

from datetime import date, datetime

# fjern_resultater_til_klubber_utenfor_seriekretsene
def fjern_resultater_til_klubber_utenfor_seriekretsene_fjerner_ikke_resultat_hvis_klubbens_krets_innehas_av_minst_20():
    
    klubb = en_klubb(klubb="Ås IL")

    antall_kretser = 20
    klubbkretser = [en_klubbkrets(klubb=str(i), kjernenavn=str(i), krets="Akershus") for i in range(antall_kretser-1)]
    klubbkretser.append(en_klubbkrets(klubb="Ås IL", kjernenavn="Ås", krets="Akershus"))

    resultatforløp = {et_resultat(): (klubb, "Innlastet.")}

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
        .med(Klubbkrets, klubbkretser)
        .med(Resultat, [et_resultat()])
        .bygg())

    Resultatbehandling.fjern_resultater_til_klubber_utenfor_seriekretsene(seriedata, resultatforløp)

    assert_at(resultatforløp[et_resultat()]).er_lik((klubb, "Innlastet."))

def fjern_resultater_til_klubber_utenfor_seriekretsene_fjerner_resultat_hvis_klubbens_krets_innehas_av_færre_enn_20():
    
    klubb = en_klubb(klubb="Ås IL")

    antall_kretser = 19
    klubbkretser = [en_klubbkrets(klubb=str(i), kjernenavn=str(i), krets="Akershus") for i in range(antall_kretser-1)]
    klubbkretser.append(en_klubbkrets(klubb="Ås IL", kjernenavn="Ås", krets="Akershus"))
    
    resultatforløp = {et_resultat(): (klubb, "Innlastet.")}

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
        .med(Klubbkrets, klubbkretser)
        .med(Resultat, [et_resultat()])
        .bygg())

    Resultatbehandling.fjern_resultater_til_klubber_utenfor_seriekretsene(seriedata, resultatforløp)

    assert_at(resultatforløp[et_resultat()]).er_lik((None, "Innlastet. Fjernet (resultatets klubb ikke i seriekrets)."))

# fjern_mellomtider_til_serieresultat
def test_fjern_mellomtider_til_serieresultat_fjerner_ikke_mellomtid_hvis_det_er_utøverens_eneste_serieresultat_i_stevnet():

    mellomtid = et_resultat(øvelse="3000m", prestasjon="8,00,00+", utøver="A", sted="Ås")
    resultat1 = et_resultat(øvelse="5000m", prestasjon="15,00,00", utøver="A", sted="Ski")
    resultat2 = et_resultat(øvelse="5000m", prestasjon="15,00,00", utøver="B", sted="Ås")

    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        mellomtid: (klubb, "Innlastet."),
        resultat1: (klubb, "Innlastet."),
        resultat2: (klubb, "Innlastet."),
    }
    
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Øvelsesregel, [
                    en_øvelsesregel(serieår=2100, øvelse="3000m", mellomtidgruppe="løp", mellomtidgruppe_distanse=1),
                    en_øvelsesregel(serieår=2100, øvelse="5000m", mellomtidgruppe="løp", mellomtidgruppe_distanse=2),
            ])
            .med(Resultat, [mellomtid, resultat1, resultat2])
            .bygg())

    Resultatbehandling.fjern_mellomtider_til_serieresultat(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[mellomtid]).er_lik((klubb, "Innlastet."))

def test_fjern_mellomtider_til_serieresultat_fjerner_mellomtid_til_serieresultat_hvis_samme_utøver_og_stevne():

    mellomtid = et_resultat(øvelse="3000m", prestasjon="8,00,00+", utøver="A", sted="Ås")
    serieresultat = et_resultat(øvelse="5000m", prestasjon="15,00,00", utøver="A", sted="Ås")

    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        mellomtid: (klubb, "Innlastet."),
        serieresultat: (klubb, "Innlastet."),
    }
    
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Øvelsesregel, [
                    en_øvelsesregel(serieår=2100, øvelse="3000m", mellomtidgruppe="løp", mellomtidgruppe_distanse=1),
                    en_øvelsesregel(serieår=2100, øvelse="5000m", mellomtidgruppe="løp", mellomtidgruppe_distanse=2),
            ])
            .med(Resultat, [mellomtid, serieresultat])
            .bygg())

    Resultatbehandling.fjern_mellomtider_til_serieresultat(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[mellomtid]).er_lik((None, "Innlastet. Fjernet (mellomtid til serieresultat)."))

def test_fjern_mellomtider_til_serieresultat_fjerner_flere_mellomtider_til_serieresultat_hvis_samme_utøver_og_stevne():

    mellomtid1 = et_resultat(øvelse="3000m", prestasjon="8,00,00+", utøver="A", sted="Ås")
    mellomtid2 = et_resultat(øvelse="5000m", prestasjon="15,00,000+", utøver="A", sted="Ås")
    serieresultat = et_resultat(øvelse="10000m", prestasjon="30,00,00", utøver="A", sted="Ås")

    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        mellomtid1: (klubb, "Innlastet."),
        mellomtid2: (klubb, "Innlastet."),
        serieresultat: (klubb, "Innlastet."),
    }
    
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Øvelsesregel, [
                    en_øvelsesregel(serieår=2100, øvelse="3000m", mellomtidgruppe="løp", mellomtidgruppe_distanse=1),
                    en_øvelsesregel(serieår=2100, øvelse="5000m", mellomtidgruppe="løp", mellomtidgruppe_distanse=2),
                    en_øvelsesregel(serieår=2100, øvelse="10000m", mellomtidgruppe="løp", mellomtidgruppe_distanse=3),
            ])
            .med(Resultat, [mellomtid1, mellomtid2, serieresultat])
            .bygg())

    Resultatbehandling.fjern_mellomtider_til_serieresultat(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[mellomtid1]).er_lik((None, "Innlastet. Fjernet (mellomtid til serieresultat)."))
    assert_at(resultatforløp[mellomtid2]).er_lik((None, "Innlastet. Fjernet (mellomtid til serieresultat)."))

def test_fjern_mellomtider_til_serieresultat_fjerner_manuelle_mellomtid_til_serieresultat_hvis_samme_utøver_og_stevne():
    mellomtid = et_resultat(øvelse="60m", prestasjon="7,0+", utøver="A", sted="Ås")
    serieresultat = et_resultat(øvelse="100m", prestasjon="11,0", utøver="A", sted="Ås")

    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        mellomtid: (klubb, "Innlastet."),
        serieresultat: (klubb, "Innlastet."),
    }
    
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Øvelsesregel, [
                    en_øvelsesregel(serieår=2100, øvelse="60m", mellomtidgruppe="løp", mellomtidgruppe_distanse=1),
                    en_øvelsesregel(serieår=2100, øvelse="100m", mellomtidgruppe="løp", mellomtidgruppe_distanse=2),
            ])
            .med(Resultat, [mellomtid, serieresultat])
            .bygg())

    Resultatbehandling.fjern_mellomtider_til_serieresultat(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[mellomtid]).er_lik((None, "Innlastet. Fjernet (mellomtid til serieresultat)."))

# fjern_manuelle_resultater
def test_fjern_manuelle_resultater_i_elektroniske_øvelser_fjerner_manuelt_resultat_hvis_øvelsen_forutsetter_elektronisk_tidtaking():

    manuelt_resultat = et_resultat(øvelse="60m", prestasjon="6,9")
    
    resultatforløp = {
        manuelt_resultat: (en_klubb(klubb="Ås IL"), "Innlastet."),
    }
    
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Øvelsesregel, [
                    en_øvelsesregel(serieår=2100, øvelse="60m", forutsetter_elektronisk_tidtaking=True),
            ])
            .med(Resultat, [manuelt_resultat])
            .bygg())

    Resultatbehandling.fjern_manuelle_resultater_i_elektroniske_øvelser(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[manuelt_resultat]).er_lik((None, "Innlastet. Fjernet (manuell tid i øvelse som forutsetter elektronisk)."))

def test_fjern_manuelle_resultater_i_elektroniske_øvelser_fjerner_ikke_manuelt_resultat_hvis_øvelsen_ikke_forutsetter_elektronisk_tidtaking():
    manuelt_resultat = et_resultat(øvelse="60m", prestasjon="6,9")
    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        manuelt_resultat: (klubb, "Innlastet."),
    }
    
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Øvelsesregel, [
                    en_øvelsesregel(serieår=2100, øvelse="60m", forutsetter_elektronisk_tidtaking=False),
            ])
            .med(Resultat, [manuelt_resultat])
            .bygg())

    Resultatbehandling.fjern_manuelle_resultater_i_elektroniske_øvelser(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[manuelt_resultat]).er_lik((klubb, "Innlastet."))

def test_fjern_manuelle_resultater_i_elektroniske_øvelser_fjerner_ikke_resultat_som_ikke_er_manuelt():
    resultat_elektronisk_tid = et_resultat(øvelse="60m", prestasjon="7,13")
    resultat_målt_lengde = et_resultat(øvelse="Lengde", prestasjon="5,35")
    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        resultat_elektronisk_tid: (klubb, "Innlastet."),
        resultat_målt_lengde: (klubb, "Innlastet."),
    }
    
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Øvelsesregel, [
                    en_øvelsesregel(serieår=2100, øvelse="60m", forutsetter_elektronisk_tidtaking=True),
                    en_øvelsesregel(serieår=2100, øvelse="Lengde", forutsetter_elektronisk_tidtaking=False),
            ])
            .med(Resultat, [resultat_elektronisk_tid, resultat_målt_lengde])
            .bygg())

    Resultatbehandling.fjern_manuelle_resultater_i_elektroniske_øvelser(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[resultat_elektronisk_tid]).er_lik((klubb, "Innlastet."))
    assert_at(resultatforløp[resultat_målt_lengde]).er_lik((klubb, "Innlastet."))

def test_fjern_manuelle_resultater_i_elektroniske_øvelser_fjerner_manuell_mellomtid_hvis_øvelsen_forutsetter_elektronisk_tidtaking():
    manuelt_resultat = et_resultat(øvelse="60m", prestasjon="7,0+")
    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        manuelt_resultat: (klubb, "Innlastet."),
    }
    
    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Øvelsesregel, [
                    en_øvelsesregel(serieår=2100, øvelse="60m", forutsetter_elektronisk_tidtaking=True),
            ])
            .med(Resultat, [manuelt_resultat])
            .bygg())

    Resultatbehandling.fjern_manuelle_resultater_i_elektroniske_øvelser(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[manuelt_resultat]).er_lik((None, "Innlastet. Fjernet (manuell tid i øvelse som forutsetter elektronisk)."))

# fjern_yngre_utovere
def test_fjern_yngre_utovere_fjerner_resultat_til_utøver_under_11_år():
    resultat = et_resultat(utøver="ungdom", fødselsår=2040, dato=date(2050, 1, 1))

    resultatforløp = {
        resultat: (en_klubb(klubb="Ås IL"), "Innlastet."),
    }

    Resultatbehandling.fjern_yngre_utovere(resultatforløp)

    assert_at(resultatforløp[resultat]).er_lik((None, "Innlastet. Fjernet (utøver under seriens 11-års aldersgrense)."))

def test_fjern_yngre_utovere_fjerner_ikke_resultater_av_utøvere_eldre_enn_11_år():
    ungdomsresultat = et_resultat(utøver="ungdom", fødselsår=2038, dato=date(2050, 1, 1))
    juniorresultat = et_resultat(utøver="junior",  fødselsår=2034, dato=date(2050, 1, 1))
    seniorresultat = et_resultat(utøver="senior",  fødselsår=2024, dato=date(2050, 1, 1))
    veteranresultat = et_resultat(utøver="veteran",  fødselsår=2000, dato=date(2050, 1, 1))

    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        ungdomsresultat: (klubb, "Innlastet."),
        juniorresultat: (klubb, "Innlastet."),
        seniorresultat: (klubb, "Innlastet."),
        veteranresultat: (klubb, "Innlastet."),
    }

    Resultatbehandling.fjern_yngre_utovere(resultatforløp)

    assert_at(resultatforløp[ungdomsresultat]).er_lik((klubb, "Innlastet."))
    assert_at(resultatforløp[juniorresultat]).er_lik((klubb, "Innlastet."))
    assert_at(resultatforløp[seniorresultat]).er_lik((klubb, "Innlastet."))
    assert_at(resultatforløp[veteranresultat]).er_lik((klubb, "Innlastet."))

def test_fjern_yngre_utovere_fjerner_ikke_resultater_av_utøver_som_har_ukjent_fødselsdato():
    resultat = et_resultat(utøver="ungdom", fødselsår=None, dato=date(2050, 1, 1))

    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        resultat: (klubb, "Innlastet."),
    }

    Resultatbehandling.fjern_yngre_utovere(resultatforløp)

    assert_at(resultatforløp[resultat]).er_lik((klubb, "Innlastet."))

# fjern_rullestolutovere
def test_fjern_rullestolresultater_fjerner_resultat_hvis_den_er_av_en_rullestolutøver():
    rullestolresultat = et_resultat(utøver="rullestolutøver")

    resultatforløp = {
        rullestolresultat: (en_klubb(klubb="Ås IL"), "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Rullestolutøver, [en_rullestolutøver(serieår=2100, utøver="rullestolutøver")])
            .med(Resultat, [rullestolresultat])
            .bygg())

    Resultatbehandling.fjern_rullestolresultater(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[rullestolresultat]).er_lik((None, "Innlastet. Fjernet (resultat av rullestolutøver)."))

def test_fjern_rullestolresultater_fjerner_ikke_resultat_hvis_den_ikke_er_av_en_rullestolutøver():
    resultat = et_resultat()
    klubb = en_klubb(klubb="Ås IL")

    resultatforløp = {
        resultat: (klubb, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Rullestolutøver, [])
            .med(Resultat, [resultat])
            .bygg())

    Resultatbehandling.fjern_rullestolresultater(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[resultat]).er_lik((klubb, "Innlastet."))

# flytt_overbygningsresultater
def test_flytt_overbygningsresultater_flytter_resultater_i_aldersgruppen_til_overklubb_fra_moderklubbene():
    tjalve = en_klubb(klubb="Tjalve")
    koll = en_klubb(klubb="Koll")
    heming = en_klubb(klubb="Heming")

    tjalve_overklubb = en_overklubb(serieår=2100, overklubb="Tjalve", alder_11_14=False, alder_15_19=True, alder_20_pluss=False)

    resultat1 = et_resultat(utøver="A", fødselsår=2000, dato=date(2015,1,1))
    resultat2 = et_resultat(utøver="B", fødselsår=2000, dato=date(2015,1,1))
    resultat3 = et_resultat(utøver="C", fødselsår=2000, dato=date(2015,1,1))

    resultatforløp = {
        resultat1: (koll, "Innlastet."),
        resultat2: (koll, "Innlastet."),
        resultat3: (heming, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [tjalve, koll, heming])
            .med(Overklubb, [tjalve_overklubb])
            .med(Overbygning, [
                en_overbygning(serieår=2100, overklubb="Tjalve", alder_15_19=True, moderklubb="Koll"),
                en_overbygning(serieår=2100, overklubb="Tjalve", alder_15_19=True, moderklubb="Heming"),
            ])
            .med(Resultat, [resultat1, resultat2, resultat3])
            .bygg())

    serieår = 2100

    Resultatbehandling.flytt_overbygningsresultater(seriedata, serieår, resultatforløp)

    assert_at(resultatforløp[resultat1]).er_lik((tjalve, "Innlastet. Flyttet (overbygning)."))
    assert_at(resultatforløp[resultat2]).er_lik((tjalve, "Innlastet. Flyttet (overbygning)."))
    assert_at(resultatforløp[resultat3]).er_lik((tjalve, "Innlastet. Flyttet (overbygning)."))

def test_flytt_overbygningsresultater_flytter_ikke_resultater_i_annen_aldersgruppe_enn_overklubb():
    tjalve = en_klubb(klubb="Tjalve")
    koll = en_klubb(klubb="Koll")
    heming = en_klubb(klubb="Heming")

    tjalve_overklubb = en_overklubb(serieår=2100, overklubb="Tjalve", alder_11_14=True, alder_15_19=False, alder_20_pluss=True)

    resultat1 = et_resultat(utøver="A", fødselsår=2000, dato=date(2015,1,1))
    resultat2 = et_resultat(utøver="B", fødselsår=2000, dato=date(2015,1,1))
    resultat3 = et_resultat(utøver="c", fødselsår=2000, dato=date(2015,1,1))

    resultatforløp = {
        resultat1: (koll, "Innlastet."),
        resultat2: (koll, "Innlastet."),
        resultat3: (heming, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [tjalve, koll, heming])
            .med(Overklubb, [tjalve_overklubb])
            .med(Overbygning, [
                en_overbygning(serieår=2100, overklubb="Tjalve", alder_11_14=True, alder_20_pluss=True, moderklubb="Koll"),
                en_overbygning(serieår=2100, overklubb="Tjalve", alder_11_14=True, alder_20_pluss=True, moderklubb="Heming"),
            ])
            .med(Resultat, [resultat1, resultat2, resultat3])
            .bygg())

    Resultatbehandling.flytt_overbygningsresultater(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[resultat1]).er_lik((koll, "Innlastet."))
    assert_at(resultatforløp[resultat2]).er_lik((koll, "Innlastet."))
    assert_at(resultatforløp[resultat3]).er_lik((heming, "Innlastet."))

def test_flytt_overbygningsresultater_flytter_ikke_resultater_fra_klubber_som_ikke_er_moderklubber():
    tjalve = en_klubb(klubb="Tjalve")
    koll = en_klubb(klubb="Koll")
    heming = en_klubb(klubb="Heming")
    ås = en_klubb(klubb="Ås")

    tjalve_overklubb = en_overklubb(serieår=2100, overklubb="Tjalve", alder_11_14=False, alder_15_19=True, alder_20_pluss=False)

    resultat1 = et_resultat(utøver="A", fødselsår=2000, dato=date(2015,1,1))

    resultatforløp = {
        resultat1: (ås, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [tjalve, ås, koll, heming])
            .med(Overklubb, [tjalve_overklubb])
            .med(Overbygning, [
                en_overbygning(serieår=2100, overklubb="Tjalve", alder_15_19=True, moderklubb="Koll"),
                en_overbygning(serieår=2100, overklubb="Tjalve", alder_15_19=True, moderklubb="Heming"),
            ])
            .med(Resultat, [resultat1])
            .bygg())

    Resultatbehandling.flytt_overbygningsresultater(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[resultat1]).er_lik((ås, "Innlastet."))

def test_flytt_overbygningsresultater_flytter_ikke_resultat_av_utøver_som_er_unntatt_overbygning():
    tjalve = en_klubb(klubb="Tjalve")
    koll = en_klubb(klubb="Koll")
    heming = en_klubb(klubb="Heming")

    tjalve_overklubb = en_overklubb(serieår=2100, overklubb="Tjalve", alder_11_14=False, alder_15_19=True, alder_20_pluss=False)

    resultat1 = et_resultat(utøver="unntatt utøver", fødselsår=2000, dato=date(2015,1,1))
    unntatt_utøver = en_utøver_unntatt_overbygning(serieår=2100, utøver="unntatt utøver", moderklubb="Heming")

    resultatforløp = {
        resultat1: (heming, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [tjalve, koll, heming])
            .med(Overklubb, [tjalve_overklubb])
            .med(Overbygning, [
                en_overbygning(serieår=2100, overklubb="Tjalve", alder_15_19=True, moderklubb="Koll"),
                en_overbygning(serieår=2100, overklubb="Tjalve", alder_15_19=True, moderklubb="Heming"),
            ])
            .med(UtøverUnntattOverbygning, [unntatt_utøver])
            .med(Resultat, [resultat1])
            .bygg())

    Resultatbehandling.flytt_overbygningsresultater(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[resultat1]).er_lik((heming, "Innlastet. Ikke flyttet (utøver unntatt overbygning)."))

# tilbakeflytt_utøverunntatte_overbygningsresultater
def test_tilbakeflytt_utøverunntatte_overbygningsresultater_tilbakeflytter_utøver_unntatt_overbygning_sine_resultater_fra_overklubb():
    nordby = en_klubb(klubb="Nordby")
    ås = en_klubb(klubb="Ås")

    ås_overklubb = en_overklubb(serieår=2100, overklubb="Ås")

    resultat1 = et_resultat(utøver="unntatt utøver", fødselsår=2000, dato=date(2015,1,1))
    unntatt_utøver = en_utøver_unntatt_overbygning(serieår=2100, utøver="unntatt utøver", moderklubb="Nordby")

    resultatforløp = {
        resultat1: (ås, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [nordby, ås])
            .med(Overklubb, [ås_overklubb])
            .med(Overbygning, [
                en_overbygning(serieår=2100, overklubb="Ås", moderklubb="Nordby"),
            ])
            .med(UtøverUnntattOverbygning, [unntatt_utøver])
            .med(Resultat, [resultat1])
            .bygg())

    Resultatbehandling.tilbakeflytt_utøverunntatte_overbygningsresultater(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[resultat1]).er_lik((nordby, "Innlastet. Tilbakeflyttet (utøver unntatt overbygning)."))

def test_tilbakeflytt_utøverunntatte_overbygningsresultater_tilbakeflytter_ikke_utøver_unntatt_overbygning_sine_resultater_fra_annen_klubb_enn_overklubb():
    nordby = en_klubb(klubb="Nordby")
    ås = en_klubb(klubb="Ås")
    ski = en_klubb(klubb="Ski")

    ås_overklubb = en_overklubb(serieår=2100, overklubb="Ås")

    resultat1 = et_resultat(utøver="unntatt utøver", fødselsår=2000, dato=date(2015,1,1))
    unntatt_utøver = en_utøver_unntatt_overbygning(serieår=2100, utøver="unntatt utøver", moderklubb="Nordby")

    resultatforløp = {
        resultat1: (ski, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [nordby, ås])
            .med(Overklubb, [ås_overklubb])
            .med(Overbygning, [
                en_overbygning(serieår=2100, overklubb="Ås", moderklubb="Nordby"),
            ])
            .med(UtøverUnntattOverbygning, [unntatt_utøver])
            .med(Resultat, [resultat1])
            .bygg())

    Resultatbehandling.tilbakeflytt_utøverunntatte_overbygningsresultater(seriedata, 2100, resultatforløp)

    assert_at(resultatforløp[resultat1]).er_lik((ski, "Innlastet."))

# overskriv_klubb_ved_resultatbytte
def test_overskriv_klubb_ved_resultatbytte_setter_resultatets_klubb_til_det_angitte_i_resultatbytte_hvis_det_finnes():
    utledet_klubb = en_klubb(klubb="Ås IL")
    ønsket_klubb = en_klubb(klubb="Nordby IL")
    
    resultat = et_resultat(utøver="Odd", øvelse="60m")
    resultatbytte = et_resultatbytte(utøver="Odd", øvelse="60m", klubb="Nordby IL", registrert=datetime.fromisoformat("2100-01-01T00:00:00"))

    resultatforløp = {
        resultat: (utledet_klubb, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [utledet_klubb, ønsket_klubb])
            .med(Resultat, [resultat])
            .med(Resultatbytte, [resultatbytte])
            .bygg())
    uttrekksdato = date.fromisoformat("2100-01-01")
    
    Resultatbehandling.overskriv_klubb_ved_resultatbytte(seriedata, uttrekksdato, resultatforløp)

    assert_at(resultatforløp[resultat]).er_lik((ønsket_klubb, "Innlastet. Manuelt satt til Nordby IL."))

def test_overskriv_klubb_ved_resultatbytte_setter_resultatets_klubb_til_None_hvis_ingen_klubb_er_angitt():
    utledet_klubb = en_klubb(klubb="Ås IL")
    
    resultat = et_resultat(utøver="Odd", øvelse="60m")
    resultatbytte = et_resultatbytte(utøver="Odd", øvelse="60m", klubb=None, registrert=datetime.fromisoformat("2100-01-01T00:00:00"))

    resultatforløp = {
        resultat: (utledet_klubb, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [utledet_klubb])
            .med(Resultat, [resultat])
            .med(Resultatbytte, [resultatbytte])
            .bygg())
    uttrekksdato = date.fromisoformat("2100-01-01")

    Resultatbehandling.overskriv_klubb_ved_resultatbytte(seriedata, uttrekksdato, resultatforløp)

    assert_at(resultatforløp[resultat]).er_lik((None, "Innlastet. Manuelt fjernet."))

def test_overskriv_klubb_ved_resultatbytte_overskriver_ikke_hvis_uttrekksdato_er_før_resultatbytte_ble_registrert():
    utledet_klubb = en_klubb(klubb="Ås IL")
    ønsket_klubb = en_klubb(klubb="Nordby IL")
    
    resultat = et_resultat(utøver="Odd", øvelse="60m")
    resultatbytte = et_resultatbytte(utøver="Odd", øvelse="60m", klubb="Nordby IL", registrert=datetime.fromisoformat("2100-04-01T00:00:00"))

    resultatforløp = {
        resultat: (utledet_klubb, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [utledet_klubb, ønsket_klubb])
            .med(Resultat, [resultat])
            .med(Resultatbytte, [resultatbytte])
            .bygg())
    
    uttrekksdato = date.fromisoformat("2100-01-01")

    Resultatbehandling.overskriv_klubb_ved_resultatbytte(seriedata, uttrekksdato, resultatforløp)

    assert_at(resultatforløp[resultat]).er_lik((utledet_klubb, "Innlastet."))

# tilbakeflytt_klubbunntatte_overbygningsresultater
def test_tilbakeflytt_klubbunntatte_overbygningsresultater_flytter_ikke_vanlig_resultat_fra_overklubb_til_moderklubb():    
    ullkisa = en_klubb(klubb="Ull/Kisa")
    lørenskog = en_klubb(klubb="Lørenskog")

    ullkisa_overklubb = en_overklubb(serieår=2100, overklubb="Ull/Kisa", alder_11_14=False, alder_15_19=True, alder_20_pluss=False)

    resultat = et_resultat()
    
    resultatforløp = {
        resultat: (ullkisa, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [ullkisa, lørenskog])
            .med(Overklubb, [ullkisa_overklubb])
            .med(KlubbUnntattOverbygning, [
                en_klubb_unntatt_overbygning(serieår=2100, overklubb="Ull/Kisa", alder_15_19=True, moderklubb="Lørenskog"),
            ])
            .med(Resultat, [resultat])
            .bygg())
    
    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    Resultatbehandling.tilbakeflytt_klubbunntatte_overbygningsresultater(seriedata, serieår, uttrekksdato, resultatforløp)

    assert_at(resultatforløp[resultat]).er_lik((ullkisa, "Innlastet."))

def test_tilbakeflytt_klubbunntatte_overbygningsresultater_flytter_resultat_fra_overklubb_til_moderklubb_hvis_utøver_har_resultat_for_begge_klubber():    
    nordby = en_klubb(klubb="Nordby IL")
    ås = en_klubb(klubb="Ås IL")

    ås_overklubb = en_overklubb(serieår=2100, overklubb="Ås IL", alder_11_14=False, alder_15_19=True, alder_20_pluss=False)

    resultat1 = et_resultat(utøver="Per", fødselsår=2085, øvelse="60m")
    resultat2 = et_resultat(utøver="Per", fødselsår=2085, øvelse="100m")
    
    resultatforløp = {
        resultat1: (nordby, "Innlastet."),
        resultat2: (ås, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [nordby, ås])
            .med(Overklubb, [ås_overklubb])
            .med(KlubbUnntattOverbygning, [
                en_klubb_unntatt_overbygning(serieår=2100, moderklubb="Nordby IL", overklubb="Ås IL", alder_11_14=False, alder_15_19=True, alder_20_pluss=False),
            ])
            .med(Resultat, [resultat1, resultat2])
            .bygg())
    
    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    Resultatbehandling.tilbakeflytt_klubbunntatte_overbygningsresultater(seriedata, serieår, uttrekksdato, resultatforløp)

    assert_at(resultatforløp[resultat1]).er_lik((nordby, "Innlastet."))
    assert_at(resultatforløp[resultat2]).er_lik((nordby, "Innlastet. Tilbakeflyttet (klubb unntatt overbygning)."))

def test_tilbakeflytt_klubbunntatte_overbygningsresultater_flytter_ikke_resultat_som_var_resultatbyttet():    
    nordby = en_klubb(klubb="Nordby IL")
    ås = en_klubb(klubb="Ås IL")

    ås_overklubb = en_overklubb(serieår=2100, overklubb="Ås IL", alder_11_14=False, alder_15_19=True, alder_20_pluss=False)

    resultat1 = et_resultat(utøver="Per", fødselsår=2085, øvelse="60m")
    resultat2 = et_resultat(utøver="Per", fødselsår=2085, øvelse="100m")
    resultat3 = et_resultat(utøver="Per", fødselsår=2085, øvelse="200m")

    resultatbytte_skjedde = et_resultatbytte(utøver="Per", fødselsår=2085, øvelse="100m", klubb="Ås IL", registrert=datetime.fromisoformat("2100-01-01T00:00:00"))
    resultatbytte_skjedde_ikke = et_resultatbytte(utøver="Per", fødselsår=2085, øvelse="200m", klubb="Ås IL", registrert=datetime.fromisoformat("2100-12-31T00:00:00"))

    resultatforløp = {
        resultat1: (nordby, "Innlastet."),
        resultat2: (ås, "Innlastet. Manuelt satt til Ås IL."),
        resultat3: (ås, "Innlastet."),
    }

    seriedata = (Testdatabygger(Tilganger.MANIPULATOR)
            .med(Klubb, [nordby, ås])
            .med(Overklubb, [ås_overklubb])
            .med(KlubbUnntattOverbygning, [
                en_klubb_unntatt_overbygning(serieår=2100, moderklubb="Nordby IL", overklubb="Ås IL", alder_11_14=False, alder_15_19=True, alder_20_pluss=False),
            ])
            .med(Resultat, [resultat1, resultat2, resultat3])
            .med(Resultatbytte, [
                resultatbytte_skjedde,
                resultatbytte_skjedde_ikke
            ])
            .bygg())

    serieår = 2100
    uttrekksdato = date.fromisoformat("2100-01-01")
    Resultatbehandling.tilbakeflytt_klubbunntatte_overbygningsresultater(seriedata, serieår, uttrekksdato, resultatforløp)

    assert_at(resultatforløp[resultat1]).er_lik((nordby, "Innlastet."))
    assert_at(resultatforløp[resultat2]).er_lik((ås, "Innlastet. Manuelt satt til Ås IL."))
    assert_at(resultatforløp[resultat3]).er_lik((nordby, "Innlastet. Tilbakeflyttet (klubb unntatt overbygning)."))