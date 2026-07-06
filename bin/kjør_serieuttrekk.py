import sys
sys.path.append('./')

from srcc.main.batch_2_uttrekk.uttrekksbatch import Uttrekksbatch
from srcc.main.kontrollsenter.kontrollpanel import Kontrollpanel

from datetime import date

argv = sys.argv

uttrekksdato = date.today()

kwargs = {}
try:
    serieår = int(argv[1])

    arg_i = 2
    while arg_i < len(argv):
        if argv[arg_i] == "--uttrekksdato":
            uttrekksdato = date.fromisoformat(argv[arg_i+1].replace(".","-"))
            if uttrekksdato > date.today():
                print(f"OBS: Uttrekksdato kan ikke være etter i dag.")
                sys.exit(1)
        else:
            raise ValueError

        arg_i += 2
   
except Exception:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <serieår>")
    sys.exit(1)

print("Argumenter:")
print("----------")
print(f"Serieår: {serieår}")
print(f"Uttrekksdato: {uttrekksdato}")
print("")

Kontrollpanel.kjør(Uttrekksbatch, serieår, uttrekksdato)