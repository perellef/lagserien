import sys
sys.path.append('./')

from srcc.main.batch_1_grunnlag.grunnlagsbatch import Grunnlagsbatch
from srcc.main.batch_2_uttrekk.uttrekksbatch import Uttrekksbatch
from srcc.main.batch_3_utdeling.utdelingsbatch import Utdelingsbatch
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch
from srcc.main.batch_6_notiser.notisbatch import Notisbatch
from srcc.main.kontrollsenter.kontrollpanel import Kontrollpanel

from datetime import date

argv = sys.argv

uttrekksdato = date.today()

BATCHER = {
    "1": Grunnlagsbatch,
    "2": Uttrekksbatch,
    "3": Utdelingsbatch,
    "4": Kalkulatorbatch,
    "6": Notisbatch,
}

kwargs = {}
try:
    batchnummer = argv[1]
    serieår = int(argv[2])

    if batchnummer not in BATCHER:
        print(f"OBS: Batchnummer må være {', '.join(list(BATCHER)[:-1])} eller {list(BATCHER)[-1]}, men var: {batchnummer}.")
        sys.exit(1)

    arg_i = 3
    while arg_i < len(argv):
        if argv[arg_i] == "--uttrekksdato":
            uttrekksdato = date.fromisoformat(argv[arg_i+1].replace(".","-"))
            if uttrekksdato > date.today():
                print(f"OBS: Uttrekksdato kan ikke være etter i dag.")
                sys.exit(1)
        else:
            raise ValueError

        arg_i += 2

except Exception as e:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <batchnummer> <serieår> [--uttrekksdato]")
    sys.exit(1)

print("Argumenter:")
print("----------")
print(f"Serieår: {serieår}")
print(f"Uttrekksdato: {uttrekksdato}")
print("")

Kontrollpanel.testkjør(BATCHER[batchnummer], serieår=serieår, uttrekksdato=uttrekksdato)