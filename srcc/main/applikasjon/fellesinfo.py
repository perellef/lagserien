from srcc.main.kontrollsenter.database import Database
from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.applikasjon.cache import Cache

from datetime import date, datetime, timezone

import sys

serieår = int(sys.argv[1])
frosset_uttrekksdato = None
if len(sys.argv) > 2:
    frosset_uttrekksdato = date.fromisoformat(sys.argv[2])

f_uttrekksdato = lambda: frosset_uttrekksdato if frosset_uttrekksdato != None else datetime.now(timezone.utc).date()

seriedata = Seriedata(Database.PRODUKSJON)

cache = Cache(seriedata, serieår, f_uttrekksdato)