from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._resultatbytte import Resultatbytte
from srcc.main.utils.orm._arkiv_mann_sluttplasseringer import ArkivMannSluttplassering
from srcc.main.utils.orm._arkiv_kvinne_sluttplasseringer import ArkivKvinneSluttplassering

from datetime import date
from collections import defaultdict

øvelseskoder = {
    "60": "60m",
    "100": "100m",
    "200": "200m",
    "400": "400m",
    "800": "800m",
    "1500": "1500m",
    "3000": "3000m",
    "5000": "5000m",
    "10000": "10000m",
    "3000H": "3000m hinder",
    "60h": "60m hekk",
    "100h": "100m hekk",
    "110h": "110m hekk",
    "200h": "200m hekk",
    "400h": "400m hekk",
    "3000K": "3000m kapp.",
    "5000K": "5000m kapp.",
    "10000K": "10000m kapp.",
    "20000K": "20000m kapp.",
    "høyde": "Høyde",
    "stav": "Stav",
    "lengde": "Lengde",
    "tresteg": "Tresteg",
    "hut": "Høyde u.t",
    "lut": "Lengde u.t",
    "kule": "Kule",
    "diskos": "Diskos",
    "slegge": "Slegge",
    "spyd": "Spyd"
}

class Oppsettbatch():

    batchnummer = 0

    @staticmethod
    def kjør(seriedata, serieår, uttrekksdato):
        Oppsettbatch.innsett_øvelser(seriedata)
        Oppsettbatch.innsett_serier(seriedata)
        Oppsettbatch.innsett_arkiv_sluttplasseringer(seriedata)

        klubber = list(set(
            Oppsettbatch.toppklubber()
            + Oppsettbatch.overbygningsklubber()
            + Oppsettbatch.resultatbytter()[0]
        ))

        utøvere = list(set(
            Oppsettbatch.rullestolutøvere()
            + Oppsettbatch.utøvere_unntatt_overbygning()
        ))

        resultatbytter = Oppsettbatch.resultatbytter()[1]

        seriedata.bulkinnsett_ignorer(utøvere)
        seriedata.bulkinnsett_ignorer(klubber)

        seriedata.slett_og_bulkinnsett(resultatbytter)

    @staticmethod       
    def innsett_øvelser(seriedata):
        øvelser = []
        for øvelseskode, øvelsesnavn in øvelseskoder.items():
            øvelser.append(Øvelse(øvelseskode=øvelseskode, øvelsesnavn=øvelsesnavn))

        seriedata.bulkinnsett_erstatt(øvelser)

    @staticmethod
    def innsett_serier(seriedata):
        serier = [
            Serie(serieår=2020, fra_og_med=date.fromisoformat(f'2019-11-01'), til_og_med=date.fromisoformat(f'2020-10-31'), avsluttet=None),
            Serie(serieår=2021, fra_og_med=date.fromisoformat(f'2020-11-01'), til_og_med=date.fromisoformat(f'2021-12-31'), avsluttet=None),
            Serie(serieår=2022, fra_og_med=date.fromisoformat(f'2022-01-01'), til_og_med=date.fromisoformat(f'2022-12-31'), avsluttet=None),
            Serie(serieår=2023, fra_og_med=date.fromisoformat(f'2023-01-01'), til_og_med=date.fromisoformat(f'2023-12-31'), avsluttet=None),
            Serie(serieår=2024, fra_og_med=date.fromisoformat(f'2024-01-01'), til_og_med=date.fromisoformat(f'2024-12-31'), avsluttet=None),
            Serie(serieår=2025, fra_og_med=date.fromisoformat(f'2025-01-01'), til_og_med=date.fromisoformat(f'2025-12-31'), avsluttet=None),
            Serie(serieår=2026, fra_og_med=date.fromisoformat(f'2026-01-01'), til_og_med=date.fromisoformat(f'2026-12-31'), avsluttet=None),
        ]
        
        seriedata.bulkinnsett_ignorer(serier)

    @staticmethod
    def overbygningsklubber():
        overbygning_klubbdata = [
            (128,      "IL Korlevoll-Odda",               "Korlevoll-Odda"),
            (385,      "Nordre Eidsvoll IL",              "Nordre Eidsvoll"),
            (2,        "Eidsvold Turnforening Friidrett", "Eidsvold"      ),
            (3,        "Raumnes & Årnes IL",              "Raumnes Årnes"),
            (134,      "Gloppen Friidrettslag",           "Gloppen"),
            (137,      "IL Heming",                       "Heming"),
            (11,       "Sørum IL",                        "Sørum"),
            (143,      "FIL Aks-77",                      "Aks-77"),
            (16,       "IL i BUL",                        "BUL"),
            (10000400, "Eidsvåg IL, Åsane",               "Eidsvåg Åsane"),
            (146,      "Turn & IL Hovding",               "Hovding"),
            (19,       "IL Koll",                         "Koll"),
            (15,       "Ullensaker/Kisa IL",              "Ullensaker/Kisa"),
            (21,       "Lørenskog Friidrettslag",         "Lørenskog"),
            (280,      "Fjellhug/Vereide IL",             "Fjellhug/Vereide"),
            (281,      "Hyen IL",                         "Hyen"),
            (26,       "Nesodden IF",                     "Nesodden"),
            (25,       "IL Tyrving",                      "Tyrving"),
            (285,      "Beitstad IL",                     "Beitstad" ),
            (29,       "Hurdal IL",                       "Hurdal"),
            (34,       "IK Tjalve",                       "Tjalve"),
            (2089,     "Hvam IL",                         "Hvam"),
            (172,      "Selbu IL",                        "Selbu"),
            (51,       "Steinkjer Friidrettsklubb",       "Steinkjer"),
            (181,      "Stord Idrettslag",                "Stord"),
            (54,       "Kongsvinger IL Friidrett",        "Kongsvinger"),
            (183,      "Bremnes Idrettslag",              "Bremnes"),
            (182,      "Fitjar Idrettslag",               "Fitjar"),
            (59,       "Nesøya IL",                       "Nesøya"),
            (61,       "Norna-Salhus IL",                 "Norna-Salhus"),
            (191,      "Børsa IL",                        "Børsa"),
            (64,       "Breimsbygda IL",                  "Breimsbygda"),
            (65,       "IL Gular",                        "Gular"),
            (324,      "Straumsnes IL",                   "Straumsnes"),
            (78,       "Sandane Turn og Idrettslag",      "Sandane"),
            (338,      "Triumf",                          "Triumf"),
            (90,       "Brodd IL",                        "Brodd"),
            (481,      "Sør-Beitstad IL",                 "Sør-Beitstad"),
            (361,      "Grue IL",                         "Grue"),
            (107,      "Selsbakk IF",                     "Selsbakk"),
            (117,      "Strandebarm IL",                  "Strandebarm"),
            (123,      "Tingvoll Idrettslag",             "Tingvoll"),
            (253,      "Loddefjord IL",                   "Loddefjord"),
            (10000511, "Tingvoll Friidrettsklubb",        "Tingvoll"),
        ]

        klubber = []
        for klubb_id, klubbnavn, kjernenavn in overbygning_klubbdata:
            klubber.append(Klubb(klubb_id=klubb_id, klubbnavn=klubbnavn, kjernenavn=kjernenavn))
        
        return klubber

    def toppklubber():
        topplag_klubbdata = [
            (34,   "IK Tjalve"                 , "Tjalve"),
            (83,   "Sandnes IL"                , "Sandnes"),
            (75,   "IL Gneist"                 , "Gneist"),
            (25,   "IL Tyrving"                , "Tyrving"),
            (44,   "Tønsberg Friidrettsklubb"  , "Tønsberg"),
            (61,   "Norna-Salhus IL"           , "Norna-Salhus"),
            (16,   "IL i BUL"                  , "BUL"),
            (181,  "Stord Idrettslag"          , "Stord"),
            (10,   "Nittedal IL"               , "Nittedal"),
            (93,   "Dimna IL"                  , "Dimna"),
            (109,  "Fana IL"                   , "Fana"),
            (13,   "Sportsklubben Vidar"       , "Vidar"),
            (65,   "IL Gular"                  , "Gular"),
            (89,   "Idrettslaget Skjalg"       , "Skjalg"),
            (51,   "Steinkjer Friidrettsklubb" , "Steinkjer"),
            (145,  "Ask Friidrett"             , "Ask"),
            (104,  "Osterøy IL"                , "Osterøy"),
            (171,  "Ranheim IL"                , "Ranheim"),
            (100,  "IL Fri"                    , "Fri"),
            (50,   "Bækkelagets SK"            , "Bækkelagets"),
            (27,   "IF Sturla"                 , "Sturla"),
            (53,   "Haugesund IL"              , "Haugesund"),
            (134,  "Gloppen Friidrettslag"     , "Gloppen"),
            (7,    "Ås IL"                     , "Ås"),
            (121,  "Sarpsborg IL"              , "Sarpsborg"),
            (196,  "Stjørdal Friidrettsklubb"  , "Stjørdal"),
            (31,   "Fredrikstad IF"            , "Fredrikstad"),
            (69,   "Sørild FIK"                , "Sørild"),
            (63,   "Bergens Turnforening"      , "Bergens"),
            (71,   "Laksevåg TIL"              , "Laksevåg"),
            (28,   "Moss IL"                   , "Moss"),
            (68,   "IL Runar"                  , "Runar"),
            (70,   "Larvik Turn & IF"          , "Larvik"),
            (107,  "Selsbakk IF"               , "Selsbakk"),
            (8,    "IL Sandvin"                , "Sandvin"),
            (259,  "IK Hind"                   , "Hind"),
            (105,  "Lillehammer IF"            , "Lillehammer"),
            (73,   "Kristiansands IF Friidrett", "Kristiansands"),
            (176,  "IL i BUL Tromsø"           , "BUL Tromsø"),
            (24,   "Asker Sk. Friidrett"       , "Asker"), 
            (62,   "Moelven IL"                , "Moelven"), 
            (2180, "Fyllingen IL"              , "Fyllingen"), 
            (72,   "Urædd Friidrett"           , "Urædd"), 
            (2067, "Hattfjelldal IL"           , "Hattfjelldal"), 
            (91,   "Sem IF"                    , "Sem"), 
            (60,   "FIK Orion"                 , "Orion"),
            (132,  "IL Bjarg"                  , "Bjarg"),
            (214,  "Mjøsdalen IL"              , "Mjøsdalen"),
            (126,  "Os Turnforening"           , "Os"),
            (87,   "Varegg IL"                 , "Varegg"),
            (174,  "Hareid IL"                 , "Hareid"),
            (318,  "Hamar IL"                  , "Hamar"),
        ]

        klubber = []
        for klubb_id, klubbnavn, kjernenavn in topplag_klubbdata:
            klubber.append(Klubb(klubb_id=klubb_id, klubbnavn=klubbnavn, kjernenavn=kjernenavn))
        
        return klubber

    @staticmethod
    def resultatbytter():
        klubbdata = [
            (21, "Lørenskog Friidrettslag", "Lørenskog"),
        ]

        resultatbyttedata = [
            (10403845, 21, date.fromisoformat("2025-07-09"), "Utøver mangler resultat for moderklubb ved klubb unntatt overbygning"),
            (10392758, 21, date.fromisoformat("2025-07-09"), "Utøver mangler resultat for moderklubb ved klubb unntatt overbygning"),
            (10368270, 21, date.fromisoformat("2025-07-09"), "Utøver mangler resultat for moderklubb ved klubb unntatt overbygning"),
            (10377338, 21, date.fromisoformat("2025-07-09"), "Utøver mangler resultat for moderklubb ved klubb unntatt overbygning"),
            (10382195, None, date.fromisoformat("2025-12-12"), 'utøver oppfyller på tidspunkt ikke krav til seriedeltakelse'),
            (10385695, None, date.fromisoformat("2025-12-12"), 'utøver oppfyller på tidspunkt ikke krav til seriedeltakelse')
        ]

        
        klubber = []
        for klubb_id,klubbnavn, kjernenavn in klubbdata:
            klubber.append(Klubb(klubb_id=klubb_id, klubbnavn=klubbnavn, kjernenavn=kjernenavn))
        
        resultatbytter = []
        for statistikk_resultat_id, klubb_id, registrert, notat in resultatbyttedata:
            resultatbytter.append(Resultatbytte(statistikk_resultat_id=statistikk_resultat_id, klubb_id=klubb_id, registrert=registrert, notat=notat))

        return klubber, resultatbytter

    @staticmethod
    def rullestolutøvere():
        utøverdata = [
            (57333, "Anisa Abdihakin Abdulle", 2005),
            (57388, "Sofie Østerbø Jansen", 1996)
        ]

        utøvere = []
        for utøver_id,navn,fødselsår in utøverdata:
            utøvere.append(Utøver(utøver_id=utøver_id, navn=navn, fødselsår=fødselsår))
        return utøvere
    
    @staticmethod
    def utøvere_unntatt_overbygning():
        utøverdata = [
            (30465, "Johannes Hopland", 2005),
            (30729, "Phillip Morken", 2004),
            (17166, "Johannes Sandvik Bø", 2006)
        ]

        utøvere = []
        for utøver_id,navn,fødselsår in utøverdata:
            utøvere.append(Utøver(utøver_id=utøver_id, navn=navn, fødselsår=fødselsår))
        return utøvere
    
    def innsett_arkiv_sluttplasseringer(seriedata):
        with open("srcc/main/batch_0_oppsett/arkiv_sluttplasseringer.csv", "r", encoding="latin-1") as f:
            data = [el.rstrip("\n").split(";") for el in f.readlines()][1:]

        ArkivSluttplassering = {
            "menn": ArkivMannSluttplassering,
            "kvinner": ArkivKvinneSluttplassering,
        }

        arkivplasseringer = defaultdict(list)

        unikhet = {"menn": defaultdict(list), "kvinner": defaultdict(list)}
        klubbunikhet = {"menn": defaultdict(list), "kvinner": defaultdict(list)}

        for kjønn, serieår, divisjon, plassering, klubb_id, _, lagnummer, poeng in data:
            arkivSluttplassering = ArkivSluttplassering[kjønn](
                serieår=int(serieår),
                divisjon=int(divisjon),
                plassering=int(plassering),
                klubb_id=None if klubb_id == "" else int(klubb_id),
                lagnummer=int(lagnummer),
                poeng=int(poeng)
            )

            unikhet[kjønn][(int(serieår), int(divisjon), int(plassering))].append((klubb_id,lagnummer,poeng))
            if klubb_id != "":
                klubbunikhet[kjønn][(serieår, klubb_id, lagnummer)].append((divisjon,lagnummer,poeng))
            arkivplasseringer[kjønn].append(arkivSluttplassering)

        seriedata.slett_og_bulkinnsett(arkivplasseringer["menn"])
        seriedata.slett_og_bulkinnsett(arkivplasseringer["kvinner"])
