import sys
sys.path.append('./')

import os

from srcc.main.utils.dokumentasjon_bakgrunn.featureparser import Featureparser 

argv = sys.argv
try:
    if len(argv) < 2 or len(argv) > 3:
        raise ValueError()
    filprefiks = argv[1]
    scenario_prefiks = argv[2] if len(argv) == 3 else None


except Exception as e:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} [filprefiks/*]")
    sys.exit()


def find_files_with_extension(directory, extension):
    matching_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(extension):
                matching_files.append(os.path.join(root, file))
    return matching_files

extension = '.feature'
filer = find_files_with_extension("dokumentasjon/", extension)

features = []

for filnavn in filer:
    if filprefiks != "*" and not filnavn.split("\\")[-1].startswith(filprefiks):
        continue
    print(filnavn)
    with open(filnavn, 'r', encoding="utf-8") as f:
        features.append(Featureparser.parse(f))
print()

if scenario_prefiks is None:
    for feature in features:
        feature.assert_alle_scenarioer()
else:
    for feature in features:
        feature.assert_scenario_fra_prefiks(scenario_prefiks)
