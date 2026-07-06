import sys
sys.path.append('./')

from srcc.main.batch_1_grunnlag.grunnlagsbatch import Grunnlagsbatch
from srcc.main.kontrollsenter.kontrollpanel import Kontrollpanel

from datetime import date

argv = sys.argv

uttrekksdato = date.today()
klubber = None

kwargs = {}
try:
    serieår = int(argv[1])

    if len(argv) > 2:
        raise ValueError

except Exception as e:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <serieår>")
    sys.exit(1)

print("Argumenter:")
print("----------")
print(f"Serieår: {serieår}")
print(f"Uttrekksdato: {uttrekksdato}")
print("")

Kontrollpanel.kjør(Grunnlagsbatch, serieår, uttrekksdato)