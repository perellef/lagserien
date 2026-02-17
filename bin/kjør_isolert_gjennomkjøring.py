import sys
sys.path.append('./')

from bin.skript.excel_serieark import ExcelSerieark

from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.kontrollsenter.database import Database
from srcc.main.utils.orm._serie import Serie

from srcc.main.batch_0_oppsett.oppsettbatch import Oppsettbatch
from srcc.main.batch_1_grunnlag.grunnlagsbatch import Grunnlagsbatch
from srcc.main.batch_2_uttrekk.uttrekksbatch import Uttrekksbatch
from srcc.main.batch_3_utdeling.utdelingsbatch import Utdelingsbatch
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch

from datetime import datetime, date
import os

argv = sys.argv

try:
    serieår = int(argv[1])
except Exception:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <serieår>")
    sys.exit(1)

uttrekksdato = date.today()

DATABASE = Database.TOM
seriedata = Seriedata(DATABASE)
seriedata.initier()
seriedata.åpne()

UT = "ut"

def kjør(batch):
    print(datetime.now(), f"[Batch {batch.batchnummer}] starter.")
    batch.kjør(seriedata, serieår, uttrekksdato)
    print(datetime.now(), f"[Batch {batch.batchnummer}] er fullført.", end="\n\n")
    seriedata.commit()

kjør(Oppsettbatch)
assert seriedata.hent(Serie).filter_by(serieår=serieår).count() == 1, f"Kjøring med serieår {serieår} forutsetter en Serie med serieår {serieår}."

kjør(Grunnlagsbatch)
kjør(Uttrekksbatch)
kjør(Utdelingsbatch)
kjør(Kalkulatorbatch)

print(datetime.now(), f"Produserer excelfiler.", end="\n\n")
excelfiler = ExcelSerieark.produser_offisielle_serieark(seriedata, serieår)

os.makedirs(UT, exist_ok=True)

print(datetime.now(), f"Skriver til filer.")

for filnavn, bytesIO in excelfiler.items():
    with open(f"{UT}/{filnavn}.xlsx", "wb") as f:
        f.write(bytesIO.getvalue())
        print(f" + {UT}/{filnavn}.xlsx")

print(datetime.now(), "Fullført.")  