from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._øvelse import Øvelse

from datetime import date

from srcc.main.utils.testverktøy._testobjekter import AliasID

defaultobjekter = {
    "Klubb": lambda x: None if x=='' else Klubb(klubb_id=AliasID.til_id(x), klubbnavn=x, kjernenavn=x),
    "Stevne": lambda x: None if x=='' else Stevne(stevne_id=AliasID.til_id(x), stevnedato=date.fromisoformat("9999-01-01"), stevnetittel="irrelevant", arena="irrelevant", sted=x, er_nasjonalt=False, rapportert=date.fromisoformat("9999-01-01")),
    "Utøver": lambda x: None if x=='' else Utøver(utøver_id=AliasID.til_id(x), navn=x, fødselsår=None),
    "Øvelse": lambda x: None if x=='' else Øvelse(øvelseskode=x, øvelsesnavn=x)
}