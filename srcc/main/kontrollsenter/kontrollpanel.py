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
from datetime import datetime, date, timezone

DATABASE = Database.PRODUKSJON

class Kontrollpanel:

    @staticmethod
    def kjør_over_periode(batch, serieår, første_uttrekksdato, siste_uttrekksdato):
        tilganger = Tilganger.til(batch)
        seriedata = Seriedata(tilganger, DATABASE)
        seriedata.åpne()
        endringsdatoer = Kontrollpanel.__finn_endringsdatoer(seriedata, første_uttrekksdato, siste_uttrekksdato)
        seriedata.lukk()

        for uttrekksdato in endringsdatoer:
            try:
                Kontrollpanel.kjør(batch, seriedata, serieår, uttrekksdato)
            except Exception:
                break

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
        
        seriedata = Seriedata(DATABASE)
        seriedata.initier()
        seriedata.åpne()

        if Kontrollpanel.tilsvarende_kjøring_pågår_eller_er_ferdig(seriedata, batch, serieår, uttrekksdato):
            seriedata.lukk()
            print(datetime.now(timezone.utc), f"[Batch {batch.batchnummer}] Tilsvarende kjøring finnes. Avslutter.")
            return

        print(start := datetime.now(timezone.utc), f"[Batch {batch.batchnummer}] Kjører serieår {serieår} på uttrekksdato {uttrekksdato}")
        pågående_kjøring = Batchkjøring(batch=batch.batchnummer, serieår=serieår, uttrekksdato=uttrekksdato, status="pågår", start=start, slutt=None)
        seriedata.bulkinnsett([pågående_kjøring])
        seriedata.commit()

        try:
            Kontrollpanel.__valider_tillatt_batchkjøring(batch, seriedata, serieår, uttrekksdato)
        except Exception:
            print(datetime.now(timezone.utc), f"[Batch {batch.batchnummer}] Kjøring avbrytes.")
            seriedata.bulkslett([pågående_kjøring])
            seriedata.bulkinnsett([Batchkjøring(batch=batch.batchnummer, serieår=serieår, uttrekksdato=uttrekksdato, status="avbrutt", start=start, slutt=datetime.now(timezone.utc))])
            seriedata.commit()
            seriedata.lukk()
            raise

        try:
            batch.kjør(seriedata, serieår, uttrekksdato)
        except Exception:
            seriedata.rollback()
            seriedata.bulkslett([pågående_kjøring])
            seriedata.bulkinnsett([Batchkjøring(batch=batch.batchnummer, serieår=serieår, uttrekksdato=uttrekksdato, status="feilet", start=datetime.now(timezone.utc), slutt=datetime.now(timezone.utc))])
            seriedata.commit()
            seriedata.lukk()
            print(traceback.format_exc())
            print(datetime.now(timezone.utc), f"[Batch {batch.batchnummer}] Kjøring feilet.")
            raise

        try:
            Kontrollpanel.__valider_tillatt_batchkjøring(batch, seriedata, serieår, uttrekksdato)
            print(datetime.now(timezone.utc), f"[Batch {batch.batchnummer}] Kjøring fullført.")
            seriedata.bulkslett([pågående_kjøring])
            seriedata.bulkinnsett([Batchkjøring(batch=batch.batchnummer, serieår=serieår, uttrekksdato=uttrekksdato, status="ferdig", start=datetime.now(timezone.utc), slutt=datetime.now(timezone.utc))])
            seriedata.commit()
            seriedata.lukk()
        except Exception:
            print(datetime.now(timezone.utc), f"[Batch {batch.batchnummer}] Kjøring avbrytes.")
            seriedata.rollback()
            seriedata.bulkslett([pågående_kjøring])
            seriedata.bulkinnsett([Batchkjøring(batch=batch.batchnummer, serieår=serieår, uttrekksdato=uttrekksdato, status="avbrutt", start=datetime.now(timezone.utc), slutt=datetime.now(timezone.utc))])
            seriedata.commit()
            seriedata.lukk()
            raise

    @staticmethod
    def __valider_tillatt_batchkjøring(batch, seriedata, serieår, uttrekksdato):
        Kontrollpanel.valider_batch(batch)

        if batch.batchnummer == 0:
            return

        Kontrollpanel.valider_tillatte_argumenter(serieår, uttrekksdato)
        Kontrollpanel.valider_eksisterende_serie(seriedata, serieår)
        Kontrollpanel.valider_batchens_seneste_kjøring(batch, seriedata, serieår, uttrekksdato)
        Kontrollpanel.valider_forutsatte_batchkjøringer(batch, seriedata, serieår, uttrekksdato)

    def tilsvarende_kjøring_pågår_eller_er_ferdig(seriedata, batch, serieår, uttrekksdato):
        kjøringer = (seriedata.hent(Batchkjøring)
                    .filter_by(batch=batch.batchnummer, serieår=serieår, uttrekksdato=uttrekksdato)
                    .filter((Batchkjøring.status == "pågår") | (Batchkjøring.status == "ferdig"))
                    .all())

        return len(list(kjøringer)) > 0

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
                .filter((Batchkjøring.status == "pågår") | (Batchkjøring.status == "ferdig"))
                .filter(Batchkjøring.uttrekksdato > uttrekksdato)
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
            Kontrollpanel.valider_kjøring_på_serieår(seriedata, 1, serieår)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 2, serieår, uttrekksdato)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 3, serieår, uttrekksdato)
            Kontrollpanel.valider_kjøring_på_dato(seriedata, 4, serieår, uttrekksdato)

    def valider_kjøring_på_serieår(seriedata, batchnummer, serieår):
        kjøring = seriedata.hent(Batchkjøring).filter_by(batch=batchnummer, serieår=serieår).all()
        
        assert len(list(kjøring)) >= 1, f"Avbryter. Forutsetter minst 1 batchkjøringer av batch {batchnummer} på serieår: {serieår}."

    def valider_kjøring_på_dato(seriedata, batchnummer, serieår, dato):
        kjøring = seriedata.hent(Batchkjøring).filter_by(batch=batchnummer, serieår=serieår, uttrekksdato=dato, status="ferdig").all()
        
        assert len(list(kjøring)) == 1, f"Avbryter. Forutsetter nøyaktig 1 batchkjøringer av batch {batchnummer} på serieår {serieår} og dato {dato}."

