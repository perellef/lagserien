from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._artikkel import Artikkel
from srcc.main.utils.orm._resultatbytte import Resultatbytte
from srcc.main.utils.orm._arkiv_mann_sluttplasseringer import ArkivMannSluttplassering
from srcc.main.utils.orm._arkiv_kvinne_sluttplasseringer import ArkivKvinneSluttplassering

from datetime import date, datetime
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
        Oppsettbatch.innsett_artikler(seriedata)
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
        serier = []
        serier.append(Serie(serieår=2021, fra_og_med=date.fromisoformat(f'2020-11-01'), til_og_med=date.fromisoformat(f'2021-12-31'), avsluttet=None))
        serier.append(Serie(serieår=2022, fra_og_med=date.fromisoformat(f'2022-01-01'), til_og_med=date.fromisoformat(f'2022-12-31'), avsluttet=None))
        serier.append(Serie(serieår=2023, fra_og_med=date.fromisoformat(f'2023-01-01'), til_og_med=date.fromisoformat(f'2023-12-31'), avsluttet=None))
        serier.append(Serie(serieår=2024, fra_og_med=date.fromisoformat(f'2024-01-01'), til_og_med=date.fromisoformat(f'2024-12-31'), avsluttet=None))
        serier.append(Serie(serieår=2025, fra_og_med=date.fromisoformat(f'2025-01-01'), til_og_med=date.fromisoformat(f'2025-12-31'), avsluttet=None))
        serier.append(Serie(serieår=2026, fra_og_med=date.fromisoformat(f'2026-01-01'), til_og_med=date.fromisoformat(f'2026-12-31'), avsluttet=None))
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

    @staticmethod
    def innsett_artikler(seriedata):
        artikkeldata = [
            (
                datetime.fromisoformat('2025-12-01T10:05:23'),
                "Bjørge Pedersen",
                "En måned igjen av Lagserien",
                "lakeri_ertzgaard.png",
                "Lakeri Ertzgaard fra Tjalve.",
                "Foto: Bildbyrån",
                "En måned gjenstår av lagserien 2025, hvilket betyr at det fortsatt er rikelig med muligheter for å forbedre seg. Vi kommenterer ikke poengstillingen i hver divisjon denne gang utover å nevne at fire lag rykker opp og ned samtidig som vi ser at flere lag har forbedret seg siden forrige utsendelse og at det fortsatt er svært jevnt i opp- og nedrykkskampene.",
                """
                I oversikten viser vi de 50 beste i tredjedivisjon, men klikker du deg inn på detaljene i excel vises alle lag over 5.000 poeng.

                Vi minner også om at Per Ellef Aalerud har laget en egen nettside for lagserien som kan finnes her: <a href="https://www.lagserien.no/" target="_blank" rel="noopener">Lagserien</a>

                Her oppdateres poengstillingen daglig etter hvert som resultatene blir registrert i statistikken. Det er noen tekniske utfordringer ved at ikke alle lag vises når dette sendes ut, men forhåpentligvis er det løst raskt.
                Nettsiden med de nevnte hjelpemidlene er under utvikling og vi setter stor pris på alle innspill til forbedringer. Disse kan sendes til Per Ellef på mail: per.ellef2000@outlook.com

                Har du behov for en dialog med oss om hvordan laget ditt konkret kan forbedre seg, eller har du andre spørsmål eller kommentarer til serien, er det bare å kontakte Bjørge Pedersen på: bjorgep@online.no

                Så til poengstillingen.

                Førstedivisjon menn:

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/herrer1.png">

                Førstedivisjon kvinner:

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/kvinner1.png">

                Andredivisjon menn:

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/herrer2.png">

                Andredivisjon kvinner:

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/kvinner2.png">

                Tredjedivisjon menn:

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/herrer3.png">

                Tredjedivisjon kvinner:

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/kvinner3.png">

                Første- og andredivisjon.
                Tredjedivisjon menn.
                Tredjedivisjon kvinner.
                """
            ),
            (
                datetime.fromisoformat('2025-09-23T10:05:23'),
                "Bjørge Pedersen",
                "Mange forbedringer i Lagserien",
                "lakeri_ertzgaard.png",
                "Lakeri Ertzgaard fra Tjalve.",
                "Foto: Bildbyrån",
                "Siden forrige rapportering har mange lag forbedret seg i Lagserien. Det har vært høy stevneaktivitet og ettersom lagserien varer ut året, er det fortsatt gode muligheter til ytterligere forbedringer.",
                """
                Lagserien varer ut kalenderåret slik at det fortsatt er mange muligheter for forbedringer.
                Og når det gjelder forbedringer er våre tips som før:

                <span style="font-weight: 500; font-style: italic;">Tips 1: Sørg for at alle øvelser dekkes opp.</span>
                Dette er det desidert viktigste. Selv moderate resultater gir flere hundre poeng.

                <span style="font-weight: 500; font-style: italic;">Tips 2: Sørg for at utøverne deltar i flere øvelser, helst fem som er det maksimalt tillatte.</span>
                De fleste utøvere har som regel fokus på én favorittøvelse, men klubben vil tjene stort på at utøverne deltar i flere øvelser. Og det burde ikke by på problemer. Som regel vil en sprinter kunne hoppe bra i lengde, en kulestøter vil kaste bra diskos og en langdistanseløper vil prestere bra på mellomdistanse.

                Vi minner også om at fire lag rykker opp og ned.
                Skulle du ha spørsmål til hvordan laget ditt konkret kan forbedre seg, eller har du andre spørsmål eller kommentarer til serien, er det bare å kontakte Bjørge Pedersen.

                <b>Så til poengstillingen.</b>

                <b>Førstedivisjon menn:</b>

                Tjalve leder helt suverent, men bak er det svært jevnt mellom tre lag i kampen om andreplassen. Sandnes har passert BUL, og begge lagene er nære Vidar.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-09-23-083714.png">

                <b>Førstedivisjon kvinner:</b>

                Det er mer vann mellom båtene i teten av kvinnenes første divisjon. Nedover på tabellen har Ullensaker/Kisa passert både Haugesund og Gneist, og sistnevnte er nå på nedrykksplass.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-09-23-084021.png">

                <b>Andredivisjon menn:</b>

                I denne divisjonen har det skjedd store endringer. Moelven har arrangert en mangekamp, og den førte laget fra nedrykksplass direkte til tetplassen. Samtidig er det svært jevnt bakover i kampen om de fire opprykksplassene.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-09-23-084227.png">

                <b>Andredivisjon kvinner:</b>

                Det har ikke vært de store endringer i kvinnenes andre divisjon, men det er svært jevnt i kampen om den siste opprykksplassen. Det er ikke mange poeng som skiller Bækkelaget, Sturla og Fana.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-09-23-084529.png">

                <b>Tredjedivisjon menn:</b>

                Osterøy har forbedret seg bra, og klatret fra sjette plass til tet. Dermed er Sandnes 2 akkurat bak den siste opprykksplassen, men som vi ser er det også her svært jevnt.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-09-23-084816.png">

                <b>Tredjedivisjon kvinner:</b>

                Hareid avanserte flott i helgen og gikk fra tiende plass til opprykksplass. Dermed er Hamar nå under opprykkstreken, men det er svært jevnt både oppover og nedover.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-09-23-085224.png">

                <b>Hjemmeside for Lagserien</b>

                Serieutvalget jobber med å utvikle en egen nettside for lagserien. Her kan man blant annet se daglige oppdateringer av seriestatus med utgangspunkt i det som ligger i statistikken. Ettersom det tar noe tid før resultater fra avholdte stevner kommer inn i statistikken vil denne oppstillingen være mindre ajourført enn den som Serieutvalget publiserer i disse utsendelsene, hvor vi har med slike resultater. Her finner du nettsiden.

                Første- og andredivisjon.
                Tredjedivisjon menn.
                Tredjedivisjon kvinner.                
                """
            ),
            (
                datetime.fromisoformat('2025-08-26T15:05:23'),
                "Bjørge Pedersen",
                "Flere forbedringer i Lagserien",
                "lakeri_ertzgaard.png",
                "Lakeri Ertzgaard fra Tjalve.",
                "Foto: Bildbyrån",
                "Det er cirka tre uker siden vår første rapportering, og i etterkant har mange av lagene forbedret seg. Det har vært god stevneaktivitet med blant annet NM junior, Norgeslekene og flere helgestevner.",
                """
                Lagserien varer ut kalenderåret slik at det fortsatt er mange muligheter for forbedringer.
                Og når det gjelder forbedringer er våre tips som før:

                <span style="font-weight: 500; font-style: italic;">Tips 1: Sørg for at alle øvelser dekkes opp.</span>
                Dette er det desidert viktigste. Selv moderate resultater gir flere hundre poeng.

                <span style="font-weight: 500; font-style: italic;">Tips 2: Sørg for at utøverne deltar i flere øvelser, helst fem som er det maksimalt tillatte.</span>
                De fleste utøvere har som regel fokus på én favorittøvelse, men klubben vil tjene stort på at utøverne deltar i flere øvelser. Og det burde ikke by på problemer. Som regel vil en sprinter kunne hoppe bra i lengde, en kulestøter vil kaste bra diskos og en langdistanseløper vil prestere bra på mellomdistanse.

                Vi minner også om at fire lag rykker opp og ned.
                Skulle du ha spørsmål til hvordan laget ditt konkret kan forbedre seg, eller har du andre spørsmål eller kommentarer til serien, er det bare å kontakte Bjørge Pedersen.

                <b>Så til poengstillingen.</b>

                <b>Førstedivisjon menn:</b>

                Samtlige lag har forbedret seg siden sist, og i toppen ser vi at Vidar har passert BUL i en svært jevn kamp om andreplassen. Begge lagene har for øvrig passert Sandnes og Norna-Salhus på alle tiders listen, og ligger dermed som nummer to og tre også der. Sandnes har også forbedret seg mye, og er på skuddhold av de to Osloklubbene.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-08-26-080501.png">

                <b>Førstedivisjon kvinner:</b>

                Mye tyder på at de tre øverste plassene er avklart. Bakover er det derimot langt mer jevnt, særlig mellom plassene fem og tolv. Her kan det komme relativt store endringer.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-08-26-080803.png">

                <b>Andredivisjon menn:</b>

                Sørild har passert Ask og Stord og overtatt ledelsen, men vi ser at det er svært jevnt i toppen. Vi legger også merke til at alle de fire nederste lagene har mange resultater de kan fylle i forhold til det maksimale 25, og hvis disse dekkes opp kan flere av dem fort hevde seg i opprykkskampen.
                Det er foreløpig dobbelt Hordaland i tet, og BUL viser sin flotte bredde ved at deres 3. lag ligger på opprykksplass.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-08-26-081141.png">

                <b>Andredivisjon kvinner:</b>

                Det er de samme fire lagene på opprykksplass, men i alle fall for den fjerde og siste plassen er det ganske jevnt.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-08-26-081421.png">

                <b>Tredjedivisjon menn:</b>

                Det er veldig jevnt i toppen. Vidar 2 har overtatt tetplassen, og Sandnes 2 har passert Tjalve 3 og foreløpig tatt den fjerde plassen.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-08-26-081655.png">

                <b>Tredjedivisjon kvinner:</b>

                Det er litt mer vann mellom båtene i kvinnenes tredje divisjon. Vidar 2 er soleklart i ledelsen og har stø kurs mott opprykk. Også Lambertseter ligger godt an. I kampen om de to siste plassene er det mer jevnt. Enn så lenge har Herkules og Hamar forsvart plassene, men spesielt BUL-Tromsø har tatt mye innpå.

                <img src="https://www.friidrett.no/contentassets/c097801a30364ee29679440a50ed2897/img_2025-08-26-082041.png">

                Første- og andredivisjon.
                Tredjedivisjon menn.
                Tredjedivisjon kvinner.                
                """
            ), 
            (
                datetime.fromisoformat('2025-01-20T13:14:29'),
                "Bjørge Pedersen",
                "Dobbeltseier til Tjalve for sjette året på rad",
                "tobias_grønstad.png",
                "Tobias Grønstad.",
                "Foto: Bildbyrån.",
                "Det er ingen overraskelse at Tjalve vinner lagserien. I de 22 årene vi har hatt serien i nåværende format, har de vunnet 19 ganger for menn og 18 ganger for kvinner. Vi tar for ordens skyld forbehold for feil og mangler i oversikten under.",
                """
                <b>Sluttstillingene i Lagserien 2024:</b>

                <b>1. divisjon menn:</b>

                <img src="https://www.friidrett.no/contentassets/b139e768cc59493899a92aa5ee328edf/h1.png">

                Tjalve har vært helt suverene i årets serie. De oppnådde den høyeste poengsummen noensinne med nåværende regelverk hva antall øvelser angår, og siden nåværende poengtabell ble iverksatt i 2003.
                Rekordforbedringen var på nesten 600 poeng.

                Bak Tjalve er det mye jevnere.

                Sandnes tok sin sjette sølvplass på rad men ble pustet i nakken av flere konkurrenter.
                Vidar kom på pallen for første gang og forbedret seg kraftig fra i fjor.
                Og rett bak der igjen finner vi Ullensaker/Kisa og BUL som i likhet med Vidar presterte sitt beste noensinne. Nivået er såpass høyt at Norna-Salhus falt tre plasser fra fjoråret selv om poengsummen var nesten like høy.

                Det er generelt høyt nivå også i år, og som i fjor var ikke 22.000 poeng nok til å unngå nedrykk. Vi ser at kun Tjalve 2 klarte å fornye plassen av de nyopprykkede lagene.

                <b>1. divisjon kvinner:</b>

                <img src="https://www.friidrett.no/contentassets/b139e768cc59493899a92aa5ee328edf/k1.png">

                Tjalve er helt suverene også i kvinneklassen og smadret sin egen poengrekord med ca. 1250 poeng.

                Norna-Salhus forsvarte fjorårets sølvplass og bergensklubben endte opp med en poengsum som kun Tjalve har klart av andre lag tidligere.

                Tredjeplassen gikk til Sandnes som etter et år utenfor pallen nå er tilbake.

                Det er relativt vanlig at nyopprykkede lag sliter med å klare seg. Så også i år hvor tre av de fire som rykket opp rykker rett ned igjen. Kun Tjalve 2 berget plassen.

                <b>2. divisjon menn:</b>

                <img src="https://www.friidrett.no/contentassets/b139e768cc59493899a92aa5ee328edf/h2.png">

                BUL har en fantastisk bredde på herresiden. I fjor rykket de opp til andredivisjon med både sitt andrelag og tredjelag. Andrelaget fortsetter triumfferden videre opp til toppdivisjonen, mens tredjelaget klarte å beholde plassen.

                Det var veldig jevnt i kampen om de tre andre opprykksplassene. Ranheim returnerer raskt til toppen igjen, mens Kristiansand og Fyllingen sikret de to siste plassene. Kristiansand har ikke vært i toppdivisjonen siden 2011, mens det for Fyllingen vil bli en spennende debut.

                Det var svært jevnt i bunnstriden. Dimna berget plassen med resultater fra sitt stevne lille nyttårsaften. Dermed ble det Haugesund som rykket ned i stedet, og det blir første gang klubben blir å finne på nivå tre. Osterøy og Steinkjer rykker ned for andre året på rad.

                <b>2. divisjon kvinner:</b>

                <img src="https://www.friidrett.no/contentassets/b139e768cc59493899a92aa5ee328edf/k2.png">

                Vidar presterte svært godt og var helt suverene i kvinnenes andredivisjon. De forbedret poengrekorden for divisjonen med over 2000 poeng og vil kunne kjempe om en pallplass i førstedivisjon i 2025.

                Vi ser også at samtlige lag som rykket ned i fjor rykket rett opp igjen, og at de tre plassene bak fylles av lag som rykket opp fra tredjedivisjon.

                Det innebærer at noen «gamle travere» som Sarpsborg, BUL-Tromsø og Bergens Turn må ta turen ned i tredjedivisjon.

                <b>3. divisjon menn:</b>

                <img src="https://www.friidrett.no/contentassets/b139e768cc59493899a92aa5ee328edf/h3.png">

                Gular finner vi som regel på et av de to øverste nivåene, og oppholdet i tredjedivisjon ble kortest mulig - i likhet med Moss som også rykker rett opp igjen.

                Det laget som på mange måter imponerer mest er likevel Hattfjelldal. Det er svært sterkt at en klubb fra en såpass liten kommune kan få fram tilstrekkelig nivå og bredde til å rykke opp. Også Tyrving viser god bredde ved at deres andrelag rykker opp.

                Antall lag over minimumsgrensen på 5000 poeng er ned i år fra 151 til 147 lag.

                <b>3. divisjon kvinner:</b>

                <img src="https://www.friidrett.no/contentassets/b139e768cc59493899a92aa5ee328edf/k3.png">

                Sem vinner divisjonen relativt klart og rykker for første gang opp til nivå to hvor de til neste vil duellere mot naboklubben Tønsberg.

                Orion viste også stor framgang og sikret en litt overraskende andreplass. Vi må tilbake til 2014 sist Orion var i andredivisjon. De to andre klubbene som klarte opprykk har en nærmere historikk på nivå to. Steinkjer rykket rett opp igjen etter nedrykket, mens Laksevåg var på nivå så sent som i 2022.

                Antall lag over minimumsgrensen på 5000 poeng er opp fra 138 i fjor til 146 i år.

                Første- og andredivisjon.

                Tredjedivisjon menn.

                Tredjedivisjon kvinner.

                <b>All historikk samlet på et sted</b>

                Serieutvalget har samlet all historikk fra 2003-2024 i et eget regneark. Her kan man se de beste lagene i de ulike divisjonene år for år, all-time best lister både samlet og for hver krets og en oversikt over alle lag år for år sortert pr. krets.
                """
            ),
            (
                datetime.fromisoformat('2023-12-07T11:58:16'),
                "Bjørge Pedersen",
                "Dobbeltseier til Tjalve for femte år på rad",
                "sander_aae_skotheim.png",
                "Sander Aae Skotheim.",
                "Foto: Bildbyrån.",
                "Det er ingen overraskelse at Tjalve vinner lagserien. I de 21 årene vi har hatt serien i nåværende format har de vunnet 18 ganger for menn og 17 ganger for kvinner. Vi tar for ordens skyld forbehold for feil og mangler.",
                """
                <b>Førstedivisjon menn:</b>
                <b>Tjalve helt suverene med tiende seier på rad og med ny suveren poengrekord.</b>

                <img src="https://www.friidrett.no/contentassets/c81180a1275845f7be2d76551bb4a4c0/h1.png">

                Tjalve har vært helt suverene i årets serie og oppnådde den høyeste poengsummen noensinne med nåværende regelverk hva antall øvelser angår og siden nåværende poengtabell ble iverksatt i 2003. Poengrekordforbedringen var på over 500 poeng.
                Sandnes forsvarte sin sølvplass fra i fjor med sin beste poengsum noensinne, og det er bare Tjalve som har klart en høyere poengsum. Det var en særdeles jevn og spennende duell om bronseplassen. Lenge var det BUL som var i føringen, men med en imponerende sluttspurt i romjulen ble det til slutt Norna-Salhus som kunne forsvare plassen fra fjoråret. Flotte prestasjoner av begge, og BUL leverte sin beste poengsum noensinne.
                Det har generelt vært et høyt nivå i år. Aldri før har noen rykket ned med en poengsum over 22.000, og aldri før har alle lag vært over 20.000. Vi legger merke til at Fana som nyopprykket lag klarte en fin sjetteplass, og at to av de nyopprykkede lagene klarte seg, mens Tønsberg rykker ned etter syv strake sesonger på øverste nivå.

                <b>Førstedivisjon kvinner:</b>
                <b>Tjalve suveren vinner for femte år på rad og også her med ny poengrekord.</b>

                <img src="https://www.friidrett.no/contentassets/c81180a1275845f7be2d76551bb4a4c0/k1.png">

                Tjalve er også ganske suverene i kvinneklassen og slo også sin egen poengrekord med ca. 50 poeng. Den største framgang var det Norna-Salhus som stod for. Det var ingen tvil om andreplassen, og bergensklubben endte opp med en poengsum som kun Tjalve har klart av andre lag tidligere. Det var jevnt i kampen om tredjeplassen, og til slutt var det Tyrving som var best av disse lagene. Vi noterer her flott framgang for Fredrikstad med sin klart beste poengsum noensinne.
                Det er relativt vanlig at nyopprykkede lag sliter med å klare seg, så også i år hvor tre av de fire som rykket opp rykker rett ned igjen. Ullensaker/Kisa derimot sikret plassen i sin første sesong på øverste nivå.

                <b>Andredivisjon menn:</b>
                <b>To lag rykker opp for andre år på rad.</b>

                <img src="https://www.friidrett.no/contentassets/c81180a1275845f7be2d76551bb4a4c0/h2.png">

                Med en flott sluttspurt var det Sørild som vant og sikret seg sitt andre opprykk på rad. Det var særdeles jevnt, og Sørild lå på en syvendeplass inntil de mobiliserte i et stevne i romjulen. Også Moelven fortsetter opprykksferden og det skal bli spennende å se hva de to klubbene kan utrette på det øverste nivået i 2024. Sandvin imponerte også, og rykker opp for første gang.
                Det var også svært jevnt i bunnstriden, og Hind klatret til slutt over den berømte nedrykksstreken. Vi noterer også at både Gular og Nittedal rykker ned for andre året på rad.

                <b>Andredivisjon kvinner:</b>
                <b>To av «reservelagene» rykker opp.</b>

                <img src="https://www.friidrett.no/contentassets/c81180a1275845f7be2d76551bb4a4c0/k2.png">

                Tjalves andrelag vant relativt klart etter å ha rykket opp fra tredjedivisjon. Det blir første gang Tjalve får sitt andrelag på det øverste nivå, og med flere nyinnmeldte utøvere, er det all grunn til å tro at de vil hevde seg veldig godt. Den eneste klubben som så langt har hatt to lag på toppnivået er Tyrving, og også deres andrelag rykket opp. Fana var dog nærmest Tjalve, og sikret med det raskest mulig retur til toppen, mens Kristiansand ble siste opprykkslag. Sist gang de var i førstedivisjon var i 2015.
                Nederst legger vi merke til at begge lagene fra Nord Trøndelag må ta turen ned i tredjedivisjon.

                <b>Tredjedivisjon menn:</b>
                <b>To lag fra BUL rykker opp.</b>

                <img src="https://www.friidrett.no/contentassets/c81180a1275845f7be2d76551bb4a4c0/h3.png">

                BUL dokumenterer sin store bredde ved at både deres andrelag og tredjelag rykker opp, og det er historisk at et tredjelag rykker opp til nivå to. Det var en del lag som mobiliserte i romjulen, og Dimna ble gjennom det belønnet med opprykk igjen etter nedrykket i fjor. Asker rykket også opp. De har vært på nivå to før, men det er helt tilbake i 2007.
                Antall lag over minimumsgrensen på 5.000 er opp i år, fra 148 til 151 lag.

                <b>Tredjedivisjon kvinner:</b>
                <b>Imponerende seier til Fyllingen.</b>

                <img src="https://www.friidrett.no/contentassets/c81180a1275845f7be2d76551bb4a4c0/k3.png">

                I fjor rykket Fyllingens menn opp til nivå to og i år var det kvinnenes tur. Det var jevnt i toppen. Bækkelaget var rett bak og rykker dermed opp igjen etter to år på nivå tre. Den sterke sesongen til Norna-Salhus understrekes av at deres andrelag rykker opp. Det blir første gang for klubben. Urædd avgjorde kampen om den siste opprykksplassen, da de passerte Lambertseter i romjulen.
                Antall lag over minimumsgrensen på 5.000 er opp fra 136 i fjor til 138 i år.

                <b>All historikk samlet på et sted</b>

                Serieutvalget har samlet all historikk fra 2003-2023 i et regneark. Her kan man se de beste lagene i de ulike divisjonene år for år, all-time best lister både samlet og hver krets og en oversikt over alle lag år for år sortert pr. krets.

                Første- og andredivisjon 2023.

                Tredjedivisjon kvinner 2023.

                Tredjedivisjon menn 2023.
                """
            ), 
            (
                datetime.fromisoformat('2023-07-21T11:58:16'),
                "Bjørge Pedersen",
                "Fortsatt to måneder igjen av Lagserien",
                "astri_ayo_lakeri_ertzgaard.png",
                "Astri Ayo Lakeri Ertzgaard.",
                "Foto: Bildbyrån.",
                "Utendørssesongen går mot sin slutt, men ettersom lagserien varer ut året er det fortsatt mulighet til å trekke innendørs og forbedre poengsummene.",
                """
                Siden forrige rapportering har det vært mange forbedringer og til dels store endringer i rekkefølge.

                Denne gang viser vi alle lag i 3. divisjon med poengsum over 8.000 poeng i excel-dokumentet nederst i saken. I den endelige oversikten ved serieslutt tar vi med alle over 5.000.

                Skulle du ha spørsmål til hvordan laget ditt konkret kan forbedre seg, eller har du andre spørsmål eller kommentarer til serien, er det bare å kontakte Bjørge Pedersen.

                <b>Så til poengstillingen:</b>

                <b>Førstedivisjon menn:</b>

                Tjalve har forbedret sin poengsum noe mer, og selv om Sandnes har tatt litt innpå er det ingen tvil om hvor seieren ender. Det er ganske jevnt mellom BUL og Norna-Salhus i kampen om tredjeplassen og begge lag har passert 25.000 poeng.
                Nederst har Tønsberg forbedret seg kraftig og er nå nære Skjalg som foreløpig innehar den siste sikre plassen.

                <img src="https://www.friidrett.no/contentassets/e4698c1cfce240959328d127555abb53/h1_2510.png">

                <b>Førstedivisjon kvinner:</b>

                Det er ingen endringer i rekkefølgen i toppen der det er svært jevnt mellom fire lag i kampen om tredjeplassen.
                Det er heller ingen endringer i rekkefølge i bunnen, men Haugesund er svært nære Skjalg og Dimna som enn så lenge ligger på sikker plass. Vidar har også gode muligheter til å klatre oppover.

                <img src="https://www.friidrett.no/contentassets/e4698c1cfce240959328d127555abb53/k1_2510.png">

                <b>Andredivisjon menn:</b>

                Dette er den divisjonen hvor det har skjedd mest. Moelven har gått fra nedrykksplass til opprykksplass. De har mange gode løpere, og med en tikamp og et stevne i lengde uten tilløp ble forbedringen kolossal.
                Også Sandvin har forbedret seg mye og virker sikre på opprykk.
                Videre har Kristiansand rykket opp til opprykksplass og Haugesund falt fra en tilsynelatende trygg andreplass til å ligge rett under opprykk. Det er jevnt, og både Stord, Sørild og Ask kan utfordre lagene foran.
                Det er også svært jevnt nede på tabellen. Bare ni poeng skiller Moss som ligger over streken og Hind som ligger rett under, og både Gular og Sturla er også svært nære.

                <img src="https://www.friidrett.no/contentassets/e4698c1cfce240959328d127555abb53/h2_2510.png">

                <b>Andredivisjon kvinner:</b>


                Det er de samme fire lagene på opprykksplass som sist. Fana og Tyrving 2 har forbedret seg mest. Også Tønsberg som er den nærmeste utfordreren har forbedret seg bra.
                Nederst har Nittedal passert Ask og ligger nå foreløpig på den siste trygge plassen.

                <img src="https://www.friidrett.no/contentassets/e4698c1cfce240959328d127555abb53/k2_2510.png">

                <b>Tredjedivisjon menn:</b>

                Den største endringen her er at BUL 3 har avansert åtte plasser til en flott tredjeplass, og nå ligger BUL an til at to av deres lag rykker opp til andredivisjon. Det vil i så fall bli første gang en klubbs 3. lag er på nivå to.
                Det er imidlertid muligheter for lagene bak til å utfordre. Noen har øvelser til gode slik at de lett kan forbedre seg mye mens andre har noen lave poengsummer som lett kan forbedres.

                <img src="https://www.friidrett.no/contentassets/e4698c1cfce240959328d127555abb53/h3_2510.png">

                <b>Tredjedivisjon kvinner:</b>

                Fyllingen har overtatt tetplassen fra Bækkelaget men begge virker trygge på opprykk. Det er veldig jevnt når det gjelder de to siste plassene som gir opprykk. Her er det muligheter for de av klubbene som mobiliserer.

                <img src="https://www.friidrett.no/contentassets/e4698c1cfce240959328d127555abb53/k3_2510.png">

                Første- og andredivisjon.

                Tredjedivisjon menn - alle lag over 8.000 poeng.

                Tredjedivisjon kvinner - alle lag over 8.000 poeng.
                """
            ),
        ]

        artikler = []
        for publisert, skrevet_av, tittel, image, bildeinnhold, fotograf, inngress, innhold in artikkeldata:
            artikler.append(Artikkel(publisert=publisert, skrevet_av=skrevet_av, tittel=tittel, image=image, bildeinnhold=bildeinnhold, fotograf=fotograf, inngress=inngress, innhold=innhold))
        seriedata.slett_og_bulkinnsett(artikler)
    
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
