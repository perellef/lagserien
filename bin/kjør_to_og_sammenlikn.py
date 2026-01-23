import sys
sys.path.append('./')

from srcc.main.utils.featuretoggle import FeatureToggle
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch

argv = sys.argv

# TODO: fikse skript

print("Dessverre fungerer ikke dette skriptet enda.")
exit(1)

try:
    # TODO: legg til støtte for uttrekksdato
    serieår = int(argv[1])
    feature1 = None if argv[2]=="ingen" else FeatureToggle.finn_feature(argv[2])
    feature2 = None if argv[3]=="ingen" else FeatureToggle.finn_feature(argv[3])
except Exception:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} <serieår> [ingen/<feature>] <feature>")
    sys.exit(1)

if feature1 != None:
    feature1.aktiver()

kontrollsenter1 = Kalkulatorsenter(serieår)
FeatureToggle.print_oversikt()
kontrollsenter1.kjør_batch()

if feature1 != None:
    feature1.deaktiver()
if feature2 != None:
    feature2.aktiver()

kontrollsenter2 = Kalkulatorsenter(serieår)
FeatureToggle.print_oversikt()
kontrollsenter2.kjør_batch()

tabelldata1 = kontrollsenter1.seriedata()
tabelldata2 = kontrollsenter2.seriedata()

print(tabelldata1==tabelldata2)