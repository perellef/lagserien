from srcc.main.kontrollsenter.database import Database
from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.applikasjon.cache import Cache

import os

serieår = int(os.environ.get("LAGSERIEN_SERIEAR"))
seriedata = Seriedata(Database.PRODUKSJON)

cache = Cache(seriedata, serieår)