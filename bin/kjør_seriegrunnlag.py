import sys
sys.path.append('./')

from srcc.main.utils.featuretoggle import FeatureToggle
from srcc.main.batch_1_grunnlag.grunnlagsbatch import Grunnlagsbatch
from srcc.main.kontrollsenter.kontrollpanel import Kontrollpanel

from datetime import date

argv = sys.argv

uttrekksdato = date.today()
klubber = None

kwargs = {}
try:
    serieår = int(argv[1])
    feature = None

    if len(argv) > 2:
        if len(argv) > 3:
            raise ValueError
        feature = FeatureToggle.finn_feature(argv[2])

except Exception as e:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <serieår> ( <feature> )")
    sys.exit(1)

if feature != None:
    feature.aktiver()

FeatureToggle.print_oversikt()

print("Argumenter:")
print("----------")
print(f"Serieår: {serieår}")
print(f"Uttrekksdato: {uttrekksdato}")
print("")

Kontrollpanel.kjør(Grunnlagsbatch, serieår, uttrekksdato)