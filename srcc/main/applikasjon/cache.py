import time

from srcc.main.applikasjon.spørringer import *
from sqlalchemy.exc import OperationalError
from functools import cache

import os
import subprocess

ASSETS_DIR = "srcc/main/applikasjon/static/assets"

class Cache:
    
    def __init__(self, seriedata, serieår, f_uttrekksdato):
        self.__seriedata = seriedata
        self.__serieår = serieår
        self.__f_uttrekksdato = f_uttrekksdato

        self.data = {}
        self.sist_oppdatert = {"gjennomkjøring": None, "notiser": None}
        self.exceltabell = None

    def lytt_etter_og_oppdater_cache(self):
        print("Cacher seriedata")
        self.oppdater_cache(self.__f_uttrekksdato())
        self.oppdater_excelfiler()
        while True:
            try:
                if self.er_usynkronisert("gjennomkjøring", lambda x: db_hent_siste_gjennomkjøring(x, self.__serieår)):
                    print("Oppdaterer cache")
                    self.oppdater_cache(self.__f_uttrekksdato())
                    self.oppdater_excelfiler()
                    with self.__seriedata.connect() as peker:
                        self.sist_oppdatert["gjennomkjøring"] = db_hent_siste_gjennomkjøring(peker, self.__serieår)
                if self.er_usynkronisert("notiser", lambda x: db_hent_siste_notiskjøring(x, self.__serieår)):
                    print("Oppdaterer notiser")
                    with self.__seriedata.connect() as peker:
                        self.data["notiser"] = self.hent_notiser(peker)
                        self.sist_oppdatert["notiser"] = db_hent_siste_notiskjøring(peker, self.__serieår)
            except OperationalError as e:
                print(e)
                time.sleep(300)
            time.sleep(10)

    def er_usynkronisert(self, k, f):
        siste_oppdatering = self.sist_oppdatert[k]
        nyeste_kjøring = None
        with self.__seriedata.connect() as peker:
            nyeste_kjøring = f(peker)

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
                "notiser": self.hent_notiser(peker),
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
                "klubblogoer": self.finn_klubblogoer(),
                "kretser": db_hent_kretser(peker, uttrekksdato),
            }
            
        print(f"Data lastet inn ({round(time.time()-s, 2)}s)")

    def hent_notiser(self, peker):
        notiselementer = db_hent_notiselementer(peker, self.__serieår, self.__f_uttrekksdato())

        notiser = []
        for notis in db_hent_notiser(peker, self.__serieår, self.__f_uttrekksdato()):
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