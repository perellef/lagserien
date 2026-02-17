import sys
sys.path.append('./')

import os

from srcc.main.utils.dokumentasjon_uttrekk.feature import Feature
from srcc.main.utils.dokumentasjon_uttrekk.featureparser import Featureparser

def test_koden_overholder_dokumentasjonen():
    # TODO: refaktorer alt dette surret

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
        with open(filnavn, 'r', encoding="utf-8") as f:
            features.append(Featureparser.parse(f))

    for feature in features:
        feature.assert_alle_scenarioer()