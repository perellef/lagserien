import sys
sys.path.append('./')

from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.kontrollsenter.database import Database

from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._kvinne_lagplassering import KvinneLagplassering
from srcc.main.utils.orm._kvinne_laginfo import KvinneLaginfo

import os

argv = sys.argv

try:
    serieår = int(argv[1])
except Exception:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <serieår>")
    sys.exit(1)


database = Database.PRODUKSJON

seriedata = Seriedata(database)
seriedata.åpne()

assert seriedata.hent(Serie).filter_by(serieår=serieår).count() == 1, f"Kan ikke produsere csv av sluttplasseringer til en serie som ikke finnes: {serieår}"

# FORMAT: 
# kjønn;serieår;divisjon;plassering;klubb_id;klubbnavn;lagnummer;poeng
# kvinner;2003;2;1;53;Haugesund IL;1;16635

klubbnavn = {klubb.klubb_id: klubb.klubbnavn for klubb in seriedata.hent(Klubb).all()}

for kjønn, Laginfo, Lagplassering in zip(("menn","kvinner"), (MannLaginfo, KvinneLaginfo), (MannLagplassering, KvinneLagplassering)):
    lagplasseringer = [(lagpl.divisjon, lagpl.plassering, lagpl.klubb_id, lagpl.lagnummer) for lagpl in seriedata.hent(Lagplassering).filter_by(serieår=serieår).filter_by(til_og_med=None).all()]
    lagpoeng = {(laginf.klubb_id, laginf.lagnummer): laginf.poeng for laginf in seriedata.hent(Laginfo).filter_by(serieår=serieår).filter_by(til_og_med=None).all()}

    for div, plassering, klubb_id, lagnr in sorted(lagplasseringer):
        poeng = lagpoeng[(klubb_id, lagnr)]
        if div < 3 or poeng >= 5000:
            print(f"{kjønn};{serieår};{div};{plassering};{klubb_id};{klubbnavn[klubb_id]};{lagnr};{poeng}\n", end="")