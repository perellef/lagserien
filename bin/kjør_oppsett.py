import sys
sys.path.append('./')

from srcc.main.batch_0_oppsett.oppsettbatch import Oppsettbatch
from srcc.main.kontrollsenter.kontrollpanel import Kontrollpanel

from datetime import date

argv = sys.argv

try:
    if len(argv) > 1:
        raise ValueError
except Exception as e:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]}")
    sys.exit(1)

Kontrollpanel.kjør(Oppsettbatch, serieår=0, uttrekksdato=date.today())
