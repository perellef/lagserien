import time
from datetime import datetime, timezone

from srcc.main.applikasjon.spørringer import *
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
        s = time.time()
        with self.__seriedata.connect() as peker:
            self.data = {
                "serieår": self.__serieår,
                "øvelser": db_hent_seriens_øvelser(peker, self.__serieår),
                "klubber": db_hent_klubber(peker),
                "utøvere": db_hent_utøvere(peker),
                "serier": db_hent_serier(peker),
                "notiser": self.hent_notiser(peker, uttrekksdato),
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
                        "allroundere": db_hent_rangering_allroundere(peker, self.__serieår, uttrekksdato),
                        "nøkkelutøvere": db_hent_rangering_nøkkelutøvere(peker, self.__serieår, uttrekksdato),
                        "nykommere": db_hent_rangering_nykommere(peker, self.__serieår, uttrekksdato),
                    },
                    "lag": {
                        "ideallag": db_hent_rangering_ideallag(peker, self.__serieår, uttrekksdato),
                        "kommersterke": db_hent_rangering_kommersterke(peker, self.__serieår, uttrekksdato),
                        "juniorlag": db_hent_rangering_juniorlag(peker, self.__serieår, uttrekksdato),
                    },
                    "klubber": {
                        "vekstklubber": db_hent_rangering_vekstklubber(peker, self.__serieår, uttrekksdato),
                        "storklubber": db_hent_rangering_storklubber(peker, self.__serieår, uttrekksdato),
                    },
                    "kretser": {
                        "største-krets": db_hent_rangering_største_krets(peker, self.__serieår, uttrekksdato),
                    }
                },
                "andel_rapportert": db_hent_andel_rapporterte_stevner(peker, self.__serieår, uttrekksdato),
                "andel_gjennomførte": db_hent_andel_gjennomførte_stevner(peker, self.__serieår, uttrekksdato),
                "stevnekalender": db_hent_stevnekalender(peker, self.__serieår, uttrekksdato),
                "forsinkelser": db_hent_forsinkede_stevner(peker, uttrekksdato),
                "artikler": db_hent_9_nyeste_artikler(peker),
                "sist_oppdatert": db_hent_sist_kjørt(peker, self.__serieår),
                "klubblogoer": self.finn_klubblogoer(),
                "kretser": db_hent_kretser(peker, uttrekksdato),
            }
            
        print(f"Data lastet inn ({round(time.time()-s, 2)}s)")

    def hent_notiser(self, peker, uttrekksdato):
        notiselementer = db_hent_notiselementer(peker, uttrekksdato)

        notiser = []
        for notis in db_hent_notiser(peker, uttrekksdato):
            notiser.append({
                "generert": notis[2],
                "kategori": notis[4],
                "notistype": notis[5],
                "undertype": notis[6],
                "elementer": {}
            })

            for e in notiselementer:
                if e[0] != notis[0]:
                    continue
                
                if e[1] not in notiser[-1]["elementer"]:
                    notiser[-1]["elementer"][e[1]] = []
                notiser[-1]["elementer"][e[1]].append(e[3:])

        return notiser    
            
    @cache
    def finn_klubblogoer(self):
        return [int(img.removesuffix(".png")) for img in os.listdir(ASSETS_DIR + "/klubblogo/")]