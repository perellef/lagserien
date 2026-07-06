import sys
sys.path.append('./')

from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch
from srcc.main.kontrollsenter.kontrollpanel import Kontrollpanel

from datetime import date

argv = sys.argv

uttrekksdato = None
klubber = None

kwargs = {}
try:
    serieår = int(argv[1])
    første_uttrekksdato = date.fromisoformat(argv[2].replace(".","-"))
    siste_uttrekksdato = date.fromisoformat(argv[3].replace(".","-"))

    if len(argv) > 4:
        raise ValueError
        

except Exception as e:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <serieår> <første_uttrekksdato> <siste_uttrekksdato> ")
    sys.exit(1)

print("Argumenter:")
print("----------")
print(f"Serieår: {serieår}")
print(f"Første-uttrekksdato: {første_uttrekksdato}")
print(f"Siste-uttrekksdato: {siste_uttrekksdato}")
print("")

Kontrollpanel.kjør_over_periode(
    Kalkulatorbatch,
    serieår=serieår,
    første_uttrekksdato=første_uttrekksdato,
    siste_uttrekksdato=siste_uttrekksdato
)