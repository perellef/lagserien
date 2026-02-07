import sys
sys.path.append('./')

from bin.skript.excel_serieark import ExcelSerieark

from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.kontrollsenter.database import Database

from srcc.main.utils.orm._batchkjøring import Batchkjøring

import zipfile
import time
import os

argv = sys.argv

try:
    serieår = int(argv[1])
except Exception:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <serieår>")
    sys.exit(1)

database = Database.TESTDATA

seriedata = Seriedata(database)
seriedata.åpne()

DIR = "srcc/main/applikasjon/static/assets/excelfiler"

start = time.time()
excelfiler = ExcelSerieark.produser_offisielle_serieark(seriedata, serieår)

print(f"tid brukt: {round(time.time()-start,2)}s")
for filnavn in os.listdir(DIR):
    if all((
        filnavn.startswith('serieoppsett_'),
        filnavn.endswith('.zip')
    )):
        filsti = os.path.join(DIR, filnavn)
        try:
            os.remove(filsti)
            print(f"Slettet: {filsti}")
        except Exception as feilmelding:
            print(f"Feil oppsto ved sletting {filsti}: {feilmelding}")
            raise Exception

siste_kjøredato = max([e.uttrekksdato for e in seriedata.hent(Batchkjøring).filter_by(serieår=serieår).filter_by(batch=4).all()])

zipfil = f'{DIR}/serieoppsett_{siste_kjøredato}.zip'
with zipfile.ZipFile(zipfil, 'w', compression=zipfile.ZIP_DEFLATED) as zipf:
    for filnavn, bytesIO in excelfiler.items():
        zipf.writestr(f"{filnavn}.xlsx", bytesIO.getvalue())

print("+ " + zipfil)