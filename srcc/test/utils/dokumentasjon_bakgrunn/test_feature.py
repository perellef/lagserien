import sys
sys.path.append('./')

from srcc.main.utils.dokumentasjon_uttrekk.feature import Feature
from srcc.main.utils.dokumentasjon_uttrekk.bakgrunn import Bakgrunn
from srcc.main.utils.dokumentasjon_uttrekk.scenario import Scenario
from srcc.main.utils.dokumentasjon_uttrekk.råtabell import Råtabell

def en_tom_feature():
    return Feature(None, None, None)

def test_utfør_gitt_oppretter_tabeller_slik_at_defaulttabeller_ikke_overskriver_eksisterende_objekter():

    feature = en_tom_feature()

    utøver_råtabell = Råtabell(["Navn", "Fødselsår"], [["Per", "2000"]])
    rullestolutøver_råtabell = Råtabell(["Serieår", "Utøver"], [["2020", "Per"]])

    feature.utfør_gitt("Gitt følgende utøvere:", utøver_råtabell)
    feature.utfør_gitt("Gitt følgende rullestolutøvere:", rullestolutøver_råtabell)
    feature.utfør_når("Når seriedata benyttes", None)
    feature.utfør_så("Så skal utøvere bli:", utøver_råtabell)