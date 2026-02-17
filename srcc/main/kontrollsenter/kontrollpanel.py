from srcc.main.kontrollsenter.tilganger import Tilganger
from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.kontrollsenter.database import Database
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._kvinne_serieresultat import KvinneSerieresultat
from srcc.main.utils.orm._batchkjøring import Batchkjøring
from srcc.main.utils.orm._serie import Serie

from srcc.main.batch_0_oppsett.oppsettbatch import Oppsettbatch
from srcc.main.batch_1_grunnlag.grunnlagsbatch import Grunnlagsbatch
from srcc.main.batch_2_uttrekk.uttrekksbatch import Uttrekksbatch
from srcc.main.batch_3_utdeling.utdelingsbatch import Utdelingsbatch
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch

import traceback
import sys
from datetime import datetime, date, timezone

DATABASE = Database.PRODUKSJON

class Kontrollpanel:

    @staticmethod
    def kjør_over_periode(batch, serieår, første_uttrekksdato, siste_uttrekksdato):
        tilganger = Tilganger.til(batch)
        seriedata = Seriedata(tilganger, DATABASE)
        seriedata.åpne()

        endringsdatoer = Kontrollpanel.__finn_endringsdatoer(seriedata, første_uttrekksdato, siste_uttrekksdato)

        try:
            for uttrekksdato in endringsdatoer:
                Kontrollpanel.__kjør_batch(batch, seriedata, serieår, uttrekksdato)
            
            seriedata.commit()
        except Exception as e:
            seriedata.rollback()
            print(traceback.format_exc())
            sys.exit(1)
        finally:
            seriedata.lukk()

    @staticmethod
    def __finn_endringsdatoer(seriedata, første_uttrekksdato, siste_uttrekksdato):
        datoer = set([første_uttrekksdato,])

        for Serieresultat in (MannSerieresultat, KvinneSerieresultat):
            serieresultater = (seriedata.hent(Serieresultat)
                .filter(Serieresultat.fra_og_med >= første_uttrekksdato)
                .filter(Serieresultat.fra_og_med <= siste_uttrekksdato))
    
            for serieresultat in serieresultater:
                datoer.add(serieresultat.resultat.dato)

        return sorted(datoer)

    @staticmethod
    def kjør(batch, serieår, uttrekksdato):
        print(datetime.now(timezone.utc), "Starter opp.")
        seriedata = Seriedata(DATABASE)
        seriedata.initier()
        seriedata.åpne()
        
        print(datetime.now(timezone.utc), "Validerer tillatt batchkjøring.")

        try:
            Kontrollpanel.__kjør_batch(batch, seriedata, serieår, uttrekksdato)
            seriedata.commit()
            print(datetime.now(timezone.utc), "Batch ferdigkjørt. Avslutter.")
        except Exception:
            seriedata.rollback()
            print(traceback.format_exc())
            print(datetime.now(timezone.utc), "Feil oppsto. Avslutter.")
            sys.exit(1)
        finally:
            seriedata.lukk()

    @staticmethod
    def __kjør_batch(batch, seriedata, serieår, uttrekksdato):
        Kontrollpanel.__valider_tillatt_batchkjøring(batch, seriedata, serieår, uttrekksdato)

        print(start := datetime.now(timezone.utc), f"[Batch {batch.batchnummer}] Kjører serieår {serieår} på uttrekksdato {uttrekksdato}")
        batch.kjør(seriedata, serieår, uttrekksdato)
        slutt = datetime.now(timezone.utc)    

        Kontrollpanel.__valider_tillatt_batchkjøring(batch, seriedata, serieår, uttrekksdato)

        seriedata.bulkinnsett([Batchkjøring(batch=batch.batchnummer, serieår=serieår, uttrekksdato=uttrekksdato, start=start, slutt=slutt)])

    @staticmethod
    def __valider_tillatt_batchkjøring(batch, seriedata, serieår, uttrekksdato):
        Kontrollpanel.valider_batch(batch)

        if batch.batchnummer == 0:
            return

        Kontrollpanel.valider_tillatte_argumenter(serieår, uttrekksdato)
        Kontrollpanel.valider_eksisterende_serie(seriedata, serieår)
        Kontrollpanel.valider_batchens_seneste_kjøring(batch, seriedata, serieår, uttrekksdato)
        Kontrollpanel.valider_forutsatte_batchkjøringer(batch, seriedata, serieår, uttrekksdato)

    @staticmethod
    def valider_batch(batch):
        assert batch in (Oppsettbatch, Grunnlagsbatch, Uttrekksbatch, Utdelingsbatch, Kalkulatorbatch)
    
    @staticmethod
    def valider_tillatte_argumenter(serieår, uttrekksdato):
        assert isinstance(serieår, int), f"Serieår skal være et heltall"
        assert isinstance(uttrekksdato, date), f"Uttrekksdato skal være en dato"

    @staticmethod
    def valider_eksisterende_serie(seriedata, serieår):
        assert seriedata.hent(Serie).filter_by(serieår=serieår).count() == 1, f"Kjøring med serieår {serieår} forutsetter en Serie med serieår {serieår}."

    @staticmethod
    def valider_batchens_seneste_kjøring(batch, seriedata, serieår, uttrekksdato):
        kjøringer_etter_uttrekksdato = (seriedata.hent(Batchkjøring)
                    .filter_by(batch=batch.batchnummer, serieår=serieår)
                    .filter(Batchkjøring.uttrekksdato >= uttrekksdato)
                    .all())
        
        assert len(list(kjøringer_etter_uttrekksdato)) == 0, f"Avbryter. Forutsetter ingen batchkjøringer av batch {batch.batchnummer} på eller etter uttrekksdato: {uttrekksdato}."

    @staticmethod
    def valider_forutsatte_batchkjøringer(batch, seriedata, serieår, uttrekksdato):
        if batch.batchnummer == 0:
            return
        if batch.batchnummer == 1:
            return
        if batch.batchnummer == 2:
            Kontrollpanel.valider_kjøring_på_serieår(seriedata, 1, serieår)
        if batch.batchnummer == 3:
            Kontrollpanel.valider_kjøring_på_serieår(seriedata, 1, serieår)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 2, serieår, uttrekksdato)
        if batch.batchnummer == 4:
            Kontrollpanel.valider_kjøring_på_serieår(seriedata, 1, serieår)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 2, serieår, uttrekksdato)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 3, serieår, uttrekksdato)
        if batch.batchnummer == 5:
            Kontrollpanel.valider_kjøring_på_serieår(seriedata, 1, serieår)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 2, serieår, uttrekksdato)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 3, serieår, uttrekksdato)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 4, serieår, uttrekksdato)
        if batch.batchnummer == 6:
            return

    def valider_kjøring_på_serieår(seriedata, batchnummer, serieår):
        kjøring = seriedata.hent(Batchkjøring).filter_by(batch=batchnummer, serieår=serieår).all()
        
        assert len(list(kjøring)) >= 1, f"Avbryter. Forutsetter minst 1 batchkjøringer av batch {batchnummer} på serieår: {serieår}."

    def valider_kjøring_på_dato(seriedata, batchnummer, serieår, dato):
        kjøring = seriedata.hent(Batchkjøring).filter_by(batch=batchnummer, serieår=serieår, uttrekksdato=dato).all()
        
        assert len(list(kjøring)) == 1, f"Avbryter. Forutsetter nøyaktig 1 batchkjøringer av batch {batchnummer} på serieår {serieår} og dato {dato}."

