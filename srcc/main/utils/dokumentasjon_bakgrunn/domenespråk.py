import sys
sys.path.append('./')

from datetime import datetime, date

from srcc.main.utils.testverktøy._testobjekter import AliasID

class Domenepråk:

    til_kodeattributter = {
        "Alder 11-14": "alder_11_14",
        "Alder 15-19": "alder_15_19",
        "Alder 20+": "alder_20_pluss",
        "Klubb": "klubb_id",
        "Stevne": "stevne_id",
        "Moderklubb": "moderklubb_id",
        "Overklubb": "overklubb_id",
        "Resultat": "resultat_id",
        "Utøver": "utøver_id",
        "Øvelse": "øvelseskode",
    }

    fra_kodeattributter = {
        "klubb_id": "Klubb",
        "resultat_id": "Resultat",
        "utøver_id": "Utøver",
    }

    til_kodeverdier = {
        "Alder 11-14": lambda x: x.lower() == "ja",
        "Alder 15-19": lambda x: x.lower() == "ja",
        "Alder 20+": lambda x: x.lower() == "ja",
        "Antall deltakere": int,
        "Antall obligatoriske": int,
        "Antall noteringer": int,
        "Antall valgfri": int,
        "Dato": lambda x: date.fromisoformat(x.replace(".","-")),
        "Divisjon": int,
        "Er obligatorisk": lambda x: x.lower() == "ja",
        "Er teknisk": lambda x: x.lower() == "ja",
        "Forløp": str,
        "Forutsetter elektronisk tidtaking": lambda x: x.lower() == "ja",
        "Fra og med": lambda x: date.fromisoformat(x.replace(".","-")),
        "Fødselsår": lambda x: None if x == '' else int(x),
        "Klubb": lambda x: None if x=='' else AliasID.til_id(x),
        "Klubb id": int,
        "Klubbnavn": str,
        "Krets": str,
        "Lagnummer": int,
        "Maks obligatoriske løp": int,
        "Maks resultater per utøver": int,
        "Maks valgfri løp": int,
        "Mellomtidgruppe": lambda x: None if x=='' else str(x),
        "Mellomtidgruppe distanse": lambda x: None if x=='' else str(x),
        "Moderklubb": AliasID.til_id,
        "Navn": str,
        "Oppstillingstype": str,
        "Overklubb": AliasID.til_id,
        "Registrert": lambda x: datetime.fromisoformat(x.replace(".","-")),
        "Plassering": int,
        "Poeng": lambda x: None if x=='' else int(x),
        "Poeng obligatoriske": int,
        "Poeng valgfri": int,
        "Prestasjon": lambda x: x.replace(".",","),
        "Prioritet": int,
        "Resultat": int,
        "Resultat id": int,
        "Statistikk resultat id": int,
        "Serieår": int,
        "Sted": str,
        "Stevne": AliasID.til_id,
        "Stevnedato": lambda x: date.fromisoformat(x.replace(".","-")),
        "Til og med": lambda x: None if x == "" else date.fromisoformat(x.replace(".","-")),
        "Utøver id": int,
        "Utøver": AliasID.til_id,
        "Øvelseskode": str,
        "Øvelsesnavn": str,
        "Øvelse": str,
    }

    fra_kodeverdier = {
        "Antall deltakere": str,
        "Antall noteringer": str,
        "Divisjon": str,
        "Fra og med": lambda x: str(x).replace("-","."),
        "Forløp": str,
        "Fødselsår": lambda x: '' if x == None else str(x),
        "Indeks": str,
        "Konkurranse": lambda x: str(AliasID.til_alias(x)),
        "Klubb": lambda x: '' if x == None else str(AliasID.til_alias(x)),
        "Lagnummer": str,
        "Oppstillingstype": str,
        "Navn": str,
        "Plassering": str,
        "Poeng": lambda x: '' if x == None else str(x),
        "Poeng obligatoriske": str,
        "Poeng valgfri": str,
        "Prestasjon": str,
        "Resultat": lambda x: str(AliasID.til_alias(x)),
        "Serieår": str,
        "Sted": str,
        "Til og med": lambda x: '' if x == None else str(x).replace("-","."),
        "Utøver": lambda x : str(AliasID.til_alias(x)),
        "Øvelseskode": str,
    }

    @staticmethod
    def til_kodeattributt(attributt):
        assert attributt == attributt.capitalize().replace("_"," "), "Domeneattributt var på uventet format"
        try:
            return Domenepråk.til_kodeattributter[attributt]
        except KeyError:
            return attributt.lower().replace(" ","_")

    @staticmethod
    def fra_kodeattributt(attributt):
        assert attributt == attributt.lower().replace(" ","_"), "Kodeattributt var på uventet format"
        try:
            return Domenepråk.fra_kodeattributter[attributt]
        except KeyError:
            return attributt.capitalize().replace("_"," ")

    @staticmethod
    def til_kodeverdi(attributt, verdi):
        return Domenepråk.til_kodeverdier[attributt](verdi)
        
    @staticmethod
    def fra_kodeverdi(attributt, verdi):
        return Domenepråk.fra_kodeverdier[attributt](verdi)
        