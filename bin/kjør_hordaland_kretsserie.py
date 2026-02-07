import sys
sys.path.append('./')

from bin.skript.excel_serieark import ExcelSerieark

from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.kontrollsenter.database import Database
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._mann_topplag import MannTopplag
from srcc.main.utils.orm._kvinne_topplag import KvinneTopplag
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._kvinne_serieresultat import KvinneSerieresultat
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav

from srcc.main.batch_6_kontroll.kontrollbatch import Kontrollbatch
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

seriedata.slett_alle(MannTopplag)
seriedata.slett_alle(KvinneTopplag)

menn_div1lag = [(61, "Norna-Salhus", 1), (75, "Gneist",1) , (109, "Fana", 1), (2180, "Fyllingen", 1), (181, "Stord", 1), (145, "Ask", 1), (65, "Gular", 1)]
menn_div2lag = [(104, "Osterøy",1), (75, "Gneist", 2), (71, "Lakse  våg", 1), (61, "Norna-Salhus", 2), (75, "Gneist", 3), (65, "Gular", 2), (109, "Fana", 2), (100, "Fri", 1), (126, "Os", 1), (214, "Mjøsdalen", 1), (2180, "Fyllingen", 2), (145, "Ask", 2)]
kvinner_div1lag = [(61, "Norna-Salhus", 1), (75, "Gneist", 1), (61, "Norna-Salhus", 2), (109, "Fana", 1), (2180, "Fyllingen", 1), (71, "Laksevåg", 1)]
kvinner_div2lag = [(63, "Bergens", 1), (145, "Ask", 1), (87, "Varegg", 1), (132, "Bjarg", 1), (181, "Stord", 1), (65, "Gular", 1), (100, "Fri", 1), (126, "Os", 1), (61, "Norna-Salhus", 3), (87, "Varegg", 2), (75, "Gneist", 2), (145, "Ask", 2)]
        
menn_topplag = []
for klubb_id, _, lagnummer in menn_div1lag:
    menn_topplag.append(MannTopplag(serieår=serieår, divisjon=1, klubb_id=klubb_id, lagnummer=lagnummer))
for klubb_id, _, lagnummer in menn_div2lag:
    menn_topplag.append(MannTopplag(serieår=serieår, divisjon=2, klubb_id=klubb_id, lagnummer=lagnummer))

kvinner_topplag = []
for klubb_id, _, lagnummer in kvinner_div1lag:
    kvinner_topplag.append(KvinneTopplag(serieår=serieår, divisjon=1, klubb_id=klubb_id, lagnummer=lagnummer))
for klubb_id, _, lagnummer in kvinner_div2lag:
    kvinner_topplag.append(KvinneTopplag(serieår=serieår, divisjon=2, klubb_id=klubb_id, lagnummer=lagnummer))

seriedata.bulkinnsett(menn_topplag)
seriedata.bulkinnsett(kvinner_topplag)

seriedata.slett_og_bulkinnsett([
    Oppstillingskrav(serieår=serieår, divisjon=1, antall_obligatoriske=13, antall_valgfri=12, maks_obligatoriske_løp=9, maks_valgfri_løp=8, maks_resultater_per_utøver=5),
    Oppstillingskrav(serieår=serieår, divisjon=2, antall_obligatoriske=12, antall_valgfri=8, maks_obligatoriske_løp=9, maks_valgfri_løp=5, maks_resultater_per_utøver=5),
    Oppstillingskrav(serieår=serieår, divisjon=3, antall_obligatoriske=9, antall_valgfri=6, maks_obligatoriske_løp=9, maks_valgfri_løp=5, maks_resultater_per_utøver=5),
])

kjør(Kontrollbatch)
kjør(Uttrekksbatch)
kjør(Utdelingsbatch)

i_dag = date.today()

klubbkretsene = (seriedata.hent(Klubbkrets)
        .filter(Klubbkrets.fra_og_med <= uttrekksdato)
        .filter((Klubbkrets.til_og_med == None) | (Klubbkrets.til_og_med >= uttrekksdato))
        .all())
klubbkretser = {klubbkrets.klubb_id: klubbkrets.krets for klubbkrets in klubbkretsene}

GJELDENDE_KRETS = "Hordaland"

kvinner_serieresultater = [e for e in seriedata.hent(KvinneSerieresultat).all() if e.klubb_id != None and klubbkretser[e.klubb_id] == GJELDENDE_KRETS] 
menn_serieresultater = [e for e in seriedata.hent(MannSerieresultat).all() if e.klubb_id != None and klubbkretser[e.klubb_id] == GJELDENDE_KRETS] 

seriedata.slett_og_bulkinnsett(menn_serieresultater)
seriedata.slett_og_bulkinnsett(kvinner_serieresultater)

kjør(Kalkulatorbatch)

print(datetime.now(), f"Produserer excelfiler.", end="\n\n")
excelfiler = ExcelSerieark.produser_offisielle_serieark(seriedata, serieår)

os.makedirs(UT, exist_ok=True)

print(datetime.now(), f"Skriver til filer.")

for filnavn, bytesIO in excelfiler.items():
    if filnavn.startswith("kretsrapport_"):
        continue
    with open(f"{UT}/{filnavn}.xlsx", "wb") as f:
        f.write(bytesIO.getvalue())
        print(f" + {UT}/{filnavn}.xlsx")

print(datetime.now(), "Fullført.")  
