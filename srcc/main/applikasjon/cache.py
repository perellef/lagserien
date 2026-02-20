import time
from datetime import datetime, timezone

from srcc.main.applikasjon.spørringer import db_hent_serier, db_hent_sist_kjørt, db_hent_seriens_øvelser, db_hent_klubber, db_hent_lagplasseringer, db_hent_rangering_sterkeste_enkeltresultat, db_hent_rangering_mest_aktive_utøver, db_hent_rangering_mest_avgjørende_utøver, db_hent_rangering_klubb_med_størst_bredde, db_hent_rangering_klubb_med_største_forbedring, db_hent_rangering_mest_populære_øvelse, db_hent_maksimalt_antall_noteringer, db_hent_oppstillingskrav, db_hent_9_nyeste_artikler, db_hent_forsinkede_stevner, db_hent_andel_gjennomførte_stevner, db_hent_andel_rapporterte_stevner, db_hent_stevnekalender, db_hent_kretser
from sqlalchemy.exc import OperationalError
from functools import cache

import os
import subprocess

ASSETS_DIR = "srcc/main/applikasjon/static/assets"

class Cache:
    
    def __init__(self, seriedata, serieår):
        self.__seriedata = seriedata
        self.__serieår = serieår

        self.data = {"sist_oppdatert": None}
        self.exceltabell = None # TODO: legge til måte å automatisk laste inn dette på.

    def lytt_etter_og_oppdater_cache(self):
        print("Cacher seriedata")
        self.oppdater_cache(datetime.now(timezone.utc).date())
        self.oppdater_excelfiler()
        while True:
            try:
                if self.kan_oppdateres():
                    print("Oppdaterer cache")
                    self.oppdater_cache(datetime.now(timezone.utc).date())
                    self.oppdater_excelfiler()
            except OperationalError as e:
                print(e)
                time.sleep(300)
            time.sleep(10)

    def kan_oppdateres(self):
        siste_oppdatering = self.data["sist_oppdatert"]
        nyeste_kjøring = None
        with self.__seriedata.connect() as peker:
            nyeste_kjøring = db_hent_sist_kjørt(peker, self.__serieår)

        if nyeste_kjøring is None:
            return False
        if siste_oppdatering is None:
            return True
        return nyeste_kjøring > siste_oppdatering

    def oppdater_excelfiler(self):
        subprocess.run(['python', 'bin/oppdater_offisielle_excelark.py', f"{self.__serieår}"])

    def oppdater_cache(self, uttrekksdato):
        with self.__seriedata.connect() as peker:
            self.data = {
                "serieår": self.__serieår,
                "øvelser": db_hent_seriens_øvelser(peker, self.__serieår),
                "klubber": db_hent_klubber(peker),
                "serier": db_hent_serier(peker),
                "livetabell": {
                    "menn": {
                        1: db_hent_lagplasseringer(peker, self.__serieår, uttrekksdato, "menn", 1),
                        2: db_hent_lagplasseringer(peker, self.__serieår, uttrekksdato, "menn", 2),
                        3: db_hent_lagplasseringer(peker, self.__serieår, uttrekksdato, "menn", 3),
                    },
                    "kvinner": {
                        1: db_hent_lagplasseringer(peker, self.__serieår, uttrekksdato, "kvinner", 1),
                        2: db_hent_lagplasseringer(peker, self.__serieår, uttrekksdato, "kvinner", 2),
                        3: db_hent_lagplasseringer(peker, self.__serieår, uttrekksdato, "kvinner", 3),
                    }
                },
                "noteringer": {
                    1: db_hent_maksimalt_antall_noteringer(peker, self.__serieår, 1),
                    2: db_hent_maksimalt_antall_noteringer(peker, self.__serieår, 2),
                    3: db_hent_maksimalt_antall_noteringer(peker, self.__serieår, 3),
                },
                "krav": {
                    1: db_hent_oppstillingskrav(peker, self.__serieår, 1),
                    2: db_hent_oppstillingskrav(peker, self.__serieår, 2),
                    3: db_hent_oppstillingskrav(peker, self.__serieår, 3),
                },
                "rangeringer": {
                    "utøvere": {
                        "sterkeste-enkeltresultat": db_hent_rangering_sterkeste_enkeltresultat(peker, self.__serieår),
                        "mest-aktive-utøver": db_hent_rangering_mest_aktive_utøver(peker, self.__serieår),
                        "mest-avgjørende-utøver": db_hent_rangering_mest_avgjørende_utøver(peker, self.__serieår),
                    },
                    "klubber": {
                        "klubb-med-størst-bredde": db_hent_rangering_klubb_med_størst_bredde(peker, self.__serieår),
                        "klubb-med-størst-forbedring": db_hent_rangering_klubb_med_største_forbedring(peker, self.__serieår),
                    },
                    "øvelser": {
                        "mest-populære-øvelse": db_hent_rangering_mest_populære_øvelse(peker, self.__serieår),
                    }
                },
                "andel_rapportert": db_hent_andel_rapporterte_stevner(peker, self.__serieår, uttrekksdato),
                "andel_gjennomførte": db_hent_andel_gjennomførte_stevner(peker, self.__serieår, uttrekksdato),
                "stevnekalender": db_hent_stevnekalender(peker, self.__serieår, uttrekksdato),
                "forsinkelser": db_hent_forsinkede_stevner(peker, uttrekksdato),
                "artikler": db_hent_9_nyeste_artikler(peker),
                "sist_oppdatert": db_hent_sist_kjørt(peker, self.__serieår),
                "klubblogoer": self.finn_klubblogoer(),
                "kretser": db_hent_kretser(peker, uttrekksdato)
            }

    @cache
    def finn_klubblogoer(self):
        return [int(img.removesuffix(".png")) for img in os.listdir(ASSETS_DIR + "/klubblogo/")]