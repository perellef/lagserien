from srcc.main.utils.orm._øvelsesregel import Øvelsesregel
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._kvinne_serieøvelse import KvinneSerieøvelse
from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._utøver import Utøver

from srcc.main.utils.orm._overklubb import Overklubb
from srcc.main.utils.orm._overbygning import Overbygning
from srcc.main.utils.orm._klubb_unntatt_overbygning import KlubbUnntattOverbygning
from srcc.main.utils.orm._utøver_unntatt_overbygning import UtøverUnntattOverbygning
from srcc.main.utils.orm._rullestolutøver import Rullestolutøver

from srcc.main.batch_1_grunnlag.konfig import konfigdata
from sqlalchemy.exc import MultipleResultsFound, NoResultFound

class Konfiginnhenting:

    @staticmethod
    def innsett_konfig(serieår, seriedata):
        årkonfig = konfigdata[str(serieår)]
        
        Konfiginnhenting.innsett_øvelsesinfo(int(serieår), årkonfig, seriedata)
        Konfiginnhenting.innsett_resultatavvik(int(serieår), årkonfig, seriedata)
        Konfiginnhenting.innsett_setting(int(serieår), årkonfig, seriedata)

    @staticmethod
    def innsett_setting(serieår, årkonfig, seriedata):
        setting = årkonfig["settinger"]

        oppstillingskrav = list(seriedata.hent(Oppstillingskrav).filter((Oppstillingskrav.serieår != serieår)).all())
        for divisjon in [1,2,3]:
            
            oppstillingskrav.append(
                Oppstillingskrav(
                    serieår=serieår,
                    divisjon=divisjon,
                    antall_obligatoriske=setting["øvelseskrav"][f"{divisjon}. div"]["antall_obligatoriske"],
                    antall_valgfri=setting["øvelseskrav"][f"{divisjon}. div"]["antall_valgfri"],
                    maks_obligatoriske_løp=setting["øvelseskrav"][f"{divisjon}. div"]["maks_obligatoriske_løp"],
                    maks_valgfri_løp=setting["øvelseskrav"][f"{divisjon}. div"]["maks_valgfri_løp"],
                    maks_resultater_per_utøver=setting["maks resultater per person"],
                )
            )

        seriedata.slett_og_bulkinnsett(oppstillingskrav)

    @staticmethod
    def innsett_resultatavvik(serieår, årkonfig, seriedata):
        resultatavvik = årkonfig["resultatavvik"]

        overklubber, overbygninger = Konfiginnhenting.les_overbygningsklubber(serieår, resultatavvik, seriedata)
        
        seriedata.bulkslett(seriedata.hent(Overbygning).filter_by(serieår=serieår).all())        
        seriedata.bulkslett(seriedata.hent(Overklubb).filter_by(serieår=serieår).all())        
        seriedata.bulkinnsett(overklubber)
        seriedata.bulkinnsett(overbygninger)

        klubber_unntatt_overbygning = Konfiginnhenting.les_klubber_unntatt_overbygning(serieår, resultatavvik, seriedata)
        utøvere_unntatt_overbygning = Konfiginnhenting.les_utøvere_unntatt_overbygning(serieår, resultatavvik, seriedata)
        rullestolutøvere = Konfiginnhenting.les_rullestolutøvere(serieår, resultatavvik, seriedata)

        seriedata.bulkslett(seriedata.hent(KlubbUnntattOverbygning).filter_by(serieår=serieår).all())
        seriedata.bulkslett(seriedata.hent(UtøverUnntattOverbygning).filter_by(serieår=serieår).all())
        seriedata.bulkslett(seriedata.hent(Rullestolutøver).filter_by(serieår=serieår).all())
        seriedata.bulkinnsett(klubber_unntatt_overbygning)
        seriedata.bulkinnsett(utøvere_unntatt_overbygning)
        seriedata.bulkinnsett(rullestolutøvere)

    @staticmethod
    def innsett_øvelsesinfo(serieår, årkonfig, seriedata):

        øvelsesregler = list(seriedata.hent(Øvelsesregel).filter((Øvelsesregel.serieår != serieår)).all())
        menn_serieøvelser = list(seriedata.hent(MannSerieøvelse).filter((MannSerieøvelse.serieår != serieår)).all())
        kvinner_serieøvelser = list(seriedata.hent(KvinneSerieøvelse).filter((KvinneSerieøvelse.serieår != serieår)).all())

        for prioritet,(øvelseskode,info) in enumerate(årkonfig['øvelsesinfo'].items(), start=1):
            mellomtidgruppe = None
            mellomtidgruppe_distanse = None
            if 'mellomtid' in info:
                mellomtidgruppe = list(info['mellomtid'].keys())[0]
                mellomtidgruppe_distanse = int(list(info['mellomtid'].values())[0])

            forutsetter_elektronisk_tidtaking = False
            if 'manuell' in info:
                forutsetter_elektronisk_tidtaking = not info['manuell']

            øvelsesregler.append(Øvelsesregel(serieår=serieår, øvelseskode=øvelseskode, mellomtidgruppe=mellomtidgruppe, mellomtidgruppe_distanse=mellomtidgruppe_distanse, forutsetter_elektronisk_tidtaking=forutsetter_elektronisk_tidtaking))

            for kjønn, Serieøvelse, serieøvelser in zip(['menn','kvinner'],[MannSerieøvelse, KvinneSerieøvelse], [menn_serieøvelser, kvinner_serieøvelser]):
                serieøvelse = info[kjønn]
                if not serieøvelse:
                    continue

                er_obligatorisk = ('obl' in serieøvelse)
                er_teknisk = ('tek' in serieøvelse)

                serieøvelser.append(Serieøvelse(serieår=serieår, øvelseskode=øvelseskode, er_obligatorisk=er_obligatorisk, er_teknisk=er_teknisk, prioritet=prioritet))

        seriedata.slett_og_bulkinnsett(øvelsesregler)
        seriedata.slett_og_bulkinnsett(menn_serieøvelser)
        seriedata.slett_og_bulkinnsett(kvinner_serieøvelser)

    @staticmethod
    def __hent_nøyaktig_én(seriedata, cls, **kwargs):
        try:
            return seriedata.hent(cls).filter_by(**kwargs).one()
        except MultipleResultsFound:
            raise AssertionError(f"{cls.__name__} skulle hatt nøyaktig én rad med " + ', '.join(f"{k} '{v}'" for k,v in kwargs.items()) + ", men hadde flere.")
        except NoResultFound:
            raise AssertionError(f"{cls.__name__} skulle hatt nøyaktig én rad med " + ', '.join(f"{k} '{v}'" for k,v in kwargs.items()) + ", men hadde ingen.")

    @staticmethod
    def __valider_samsvarende_klubb_id_og_kjernenavn(seriedata, klubb_id, kjernenavn):
        klubb_fra_klubb_id = Konfiginnhenting.__hent_nøyaktig_én(seriedata, Klubb, klubb_id=klubb_id)
        assert klubb_fra_klubb_id.kjernenavn == kjernenavn, f"Oppgitt klubb_id {klubb_id} ({klubb_fra_klubb_id.kjernenavn}) matchet ikke kjernenavn {kjernenavn}."

    @staticmethod
    def __valider_eksisterende_utøver_id(seriedata, utøver_id):
        Konfiginnhenting.__hent_nøyaktig_én(seriedata, Utøver, utøver_id=utøver_id)    
        
    @staticmethod
    def __valider_eksisterende_overklubb(seriedata, serieår, overklubb_id):
        Konfiginnhenting.__hent_nøyaktig_én(seriedata, Overklubb, serieår=serieår, overklubb_id=overklubb_id)
        
    @staticmethod
    def __valider_eksisterende_overbygning(seriedata, serieår, moderklubb_id):
        Konfiginnhenting.__hent_nøyaktig_én(seriedata, Overbygning, serieår=serieår, moderklubb_id=moderklubb_id)

    @staticmethod
    def les_overbygningsklubber(serieår, resultatavvik, seriedata):
        overklubber = []
        overbygninger = []

        for overgang in resultatavvik["overbygningsklubber"]:
            overklubb_id = overgang["id"]
            overklubb_navn = overgang["kjernenavn"]

            Konfiginnhenting.__valider_samsvarende_klubb_id_og_kjernenavn(seriedata, overklubb_id, overklubb_navn)

            overklubb = Overklubb(
                serieår=serieår,
                overklubb_id=overklubb_id,
                alder_11_14=overgang["aldersgrupper"][0],
                alder_15_19=overgang["aldersgrupper"][1],
                alder_20_pluss=overgang["aldersgrupper"][2]
            )

            overklubber.append(overklubb)

            for (moderklubb_id, moderklubb_kjernenavn) in overgang["moderklubber"]:
                Konfiginnhenting.__valider_samsvarende_klubb_id_og_kjernenavn(seriedata, moderklubb_id, moderklubb_kjernenavn)

                overbygninger.append(Overbygning(serieår=serieår, moderklubb_id=moderklubb_id, overklubb_id=overklubb_id))

        return overklubber, overbygninger
                
    @staticmethod
    def les_klubber_unntatt_overbygning(serieår, resultatavvik, seriedata):
        klubber_unntatt_overbygning = []
        
        for klubbunntak in resultatavvik["klubber unntatt overbygning"]:
            moderklubb_id = klubbunntak["id"]
            moderklubb_kjernenavn = klubbunntak["kjernenavn"]
            overklubb_id, overklubb_kjernenavn = klubbunntak["overklubb"]

            Konfiginnhenting.__valider_eksisterende_overklubb(seriedata, serieår, overklubb_id)
            Konfiginnhenting.__valider_samsvarende_klubb_id_og_kjernenavn(seriedata, moderklubb_id, moderklubb_kjernenavn)
            Konfiginnhenting.__valider_samsvarende_klubb_id_og_kjernenavn(seriedata, overklubb_id, overklubb_kjernenavn)

            klubber_unntatt_overbygning.append(KlubbUnntattOverbygning(serieår=serieår, moderklubb_id=moderklubb_id, overklubb_id=overklubb_id))
        
        return klubber_unntatt_overbygning

    @staticmethod
    def les_utøvere_unntatt_overbygning(serieår, resultatavvik, seriedata):
        utøvere_unntatt_overbygning = []
        for utøverunntak in resultatavvik["utøvere unntatt overbygning"]:
            utøver_id = utøverunntak["id"]
            _ = utøverunntak["navn"]
            moderklubb_id, moderklubb_kjernenavn = utøverunntak["moderklubb"]
            
            Konfiginnhenting.__valider_eksisterende_utøver_id(seriedata, utøver_id)
            Konfiginnhenting.__valider_samsvarende_klubb_id_og_kjernenavn(seriedata, moderklubb_id, moderklubb_kjernenavn)
            Konfiginnhenting.__valider_eksisterende_overbygning(seriedata, serieår, moderklubb_id)
            
            utøvere_unntatt_overbygning.append(UtøverUnntattOverbygning(serieår=serieår, utøver_id=utøver_id, moderklubb_id=moderklubb_id))
                
        return utøvere_unntatt_overbygning

    @staticmethod
    def les_rullestolutøvere(serieår, resultatavvik, seriedata):
        rullestolutøvere = []
        
        for utøverdata in resultatavvik["rullestolutøvere"]:
            utøver_id = utøverdata["id"]
            _ = utøverdata["navn"]

            Konfiginnhenting.__valider_eksisterende_utøver_id(seriedata, utøver_id)
            rullestolutøvere.append(Rullestolutøver(serieår=serieår, utøver_id=utøver_id))
        
        return rullestolutøvere