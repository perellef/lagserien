import sys
sys.path.append('./')

from srcc.main.utils.dokumentasjon_bakgrunn.bakgrunn import Bakgrunn
from srcc.main.utils.dokumentasjon_bakgrunn.feature import Feature
from srcc.main.utils.dokumentasjon_bakgrunn.scenario import Scenario
from srcc.main.utils.dokumentasjon_bakgrunn.råtabell import Råtabell

import re

FEATURE_MØNSTER = 'Feature: .*'
BAKGRUNN_MØNSTER = 'Bakgrunn:'
SCENARIO_MØNSTER = 'Scenario: .*'

GITT_MØNSTER = 'Gitt .*'
OG_MØNSTER = 'Og .*'
NÅR_MØNSTER = 'Når .*'
SÅ_MØNSTER = 'Så .*'
EKSEMPEL_MØNSTER = 'Eksempler:'

class Featureparser:

    @staticmethod
    def parse(fil):
        linjer = [Featureparser.strip(linje) for linje in fil.readlines() if not linje.isspace()]

        if len(linjer) == 0 or not re.match(FEATURE_MØNSTER, linjer[0]):
            raise ValueError("Feature-fil skal starte med 'Feature: <tittel>'")
        
        featuretittel = linjer[0][8:].lstrip()   

        seksjoner = Featureparser.inndel_i_seksjoner(linjer[1:])

        bakgrunn = Featureparser.inndel_bakgrunnseksjon(*seksjoner["Bakgrunn"])
        scenarioer = [Featureparser.inndel_scenarioseksjon(ann,scen) for ann,scen in seksjoner["Scenarioer"].values()]


        bakgrunn_cls = Bakgrunn(seksjoner["Bakgrunn"][0], bakgrunn["Gitt"])
        scenarioer_cls = []

        for (tittel, (ann,_)),scenario in zip(seksjoner["Scenarioer"].items(), scenarioer):
            scenario_cls = Scenario(tittel, ann, scenario["Gitt"], scenario["Når"], scenario["Så"], scenario["Eksempler"])
            scenarioer_cls.append(scenario_cls)

        return Feature(featuretittel, bakgrunn_cls, scenarioer_cls)

    @staticmethod
    def strip(linje):
        return linje.lstrip().rstrip("\n")

    @staticmethod
    def er_tabellrad(linje):
        return linje.lstrip(" ")[0] == '|'

    @staticmethod
    def inndel_i_seksjoner(linjer):

        seksjoner = {"Scenarioer": {}}

        i = 0
        denne_seksjonen = None
        annoteringer = []
        while i < len(linjer):

            if linjer[i].startswith('@'):
                annoteringer.append(linjer[i][1:])

            elif re.match(BAKGRUNN_MØNSTER, linjer[i]):
                if len(annoteringer) > 0:
                    raise ValueError("Feature-fil skal kun ha annotering foran en Feature-seksjon")
                if "Bakgrunn" in seksjoner:
                    raise ValueError("Feature-fil skal ikke ha flere Bakgrunn-seksjoner")
                if len(seksjoner["Scenarioer"]) > 0:
                    raise ValueError("Feature-fil skal ikke ha Scenario- før Bakgrunn-seksjon")
                
                seksjoner["Bakgrunn"] = (annoteringer, (denne_seksjonen := []))
                annoteringer = []

            elif re.match(SCENARIO_MØNSTER , linjer[i]):
                
                scenario = linjer[i][10:].lstrip() 
                if scenario in seksjoner["Scenarioer"]:
                    raise ValueError(f"Feature-fil inneholder allerede Scenario: '{scenario}'")

                seksjoner["Scenarioer"][scenario] = (annoteringer, (denne_seksjonen := []))
                annoteringer = []

            else:
                if len(annoteringer) > 0:
                    raise ValueError("Feature-fil skal kun ha annotering foran en Feature-seksjon")

                denne_seksjonen.append(linjer[i])

            i += 1

        if not "Bakgrunn" in seksjoner:
            seksjoner["Bakgrunn"] = ([], [])
                    
        return seksjoner

    @staticmethod
    def inndel_bakgrunnseksjon(annotasjoner, linjer):

        seksjon = {"Gitt": {}}

        i = 0
        denne_seksjonen = None
        while i < len(linjer):
            if re.match(NÅR_MØNSTER, linjer[i]):
                raise ValueError("Feature-fil skal ikke inneholde Bakgrunn-seksjon med Når.")
            elif re.match(SÅ_MØNSTER, linjer[i]):
                raise ValueError("Feature-fil skal ikke inneholde Bakgrunn-seksjon med Så.")
            elif re.match(GITT_MØNSTER, linjer[i]):
                if len(seksjon["Gitt"]) > 0:
                    raise ValueError("Feature-fil kan ikke inneholde Bakgrunn-seksjon med flere Gitt. Bruk i så fall Og.")

                seksjon["Gitt"][linjer[i]] = (denne_seksjonen := [])

            elif re.match(OG_MØNSTER, linjer[i]):
                if len(seksjon)==0:
                    raise ValueError("Feature-fil kan ikke ha Bakgrunn-seksjon som starter med Og.")

                og = linjer[i][2:]
                seksjon["Gitt"]["Gitt" + og] = (denne_seksjonen := [])
                
            elif not Featureparser.er_tabellrad(linjer[i]):
                raise ValueError(f"Feature-fil inneholder ikke-tolkbar linje: '{linjer[i]}'")

            else:
                denne_seksjonen.append(linjer[i])

            i += 1
        
        return {inndeling: {k: Featureparser.tabellifiser(v) for k,v in seksjon[inndeling].items()} for inndeling in seksjon}
        
    @staticmethod
    def inndel_scenarioseksjon(annotasjoner, linjer):

        seksjon = {"Gitt": {}, "Når": {}, "Så": {}, "Eksempler": None}

        i = 0
        denne_seksjonen = None
        while i < len(linjer):

            if re.match(GITT_MØNSTER, linjer[i]):
                if len(seksjon["Gitt"]) > 0:
                    raise ValueError("Feature-fil kan ikke inneholde Scenario med flere Gitt. Bruk i så fall Og.")

                seksjon["Gitt"][linjer[i]] = (denne_seksjonen := [])

            elif re.match(NÅR_MØNSTER, linjer[i]):
                if len(seksjon["Gitt"]) == 0:
                    raise ValueError("Feature-fil kan ikke inneholde Scenario der Når kommer før Gitt.")
                if len(seksjon["Når"]) > 0:
                    raise ValueError("Feature-fil kan ikke inneholde Scenario med flere Når. Bruk i så fall Og.")

                seksjon["Når"][linjer[i]] = (denne_seksjonen := [])

            elif re.match(SÅ_MØNSTER, linjer[i]):
                if len(seksjon["Når"]) == 0:
                    raise ValueError("Feature-fil kan ikke inneholde Scenario der Så kommer før Når.")
                if len(seksjon["Så"]) > 0:
                    raise ValueError("Feature-fil kan ikke inneholde Scenario med flere Så. Bruk i så fall Og.")

                seksjon["Så"][linjer[i]] = (denne_seksjonen := [])

            elif re.match(OG_MØNSTER, linjer[i]):
                
                og = linjer[i][2:]
                if len(seksjon["Så"]) > 0: 
                    seksjon["Så"]["Så skal" + og] = (denne_seksjonen := [])
                elif len(seksjon["Når"]) > 0: 
                    seksjon["Når"]["Når" + og] = (denne_seksjonen := [])
                elif len(seksjon["Gitt"]) > 0: 
                    seksjon["Gitt"]["Gitt" + og] = (denne_seksjonen := [])
                else:
                    raise ValueError("Feature-fil kan ikke ha Scenario-seksjon som starter med Og.")
            
            elif re.match(EKSEMPEL_MØNSTER, linjer[i]):
                seksjon["Eksempler"] = Featureparser.eksempel_tabellifiser(linjer[i+1:])
                break
            elif not Featureparser.er_tabellrad(linjer[i]):
                raise ValueError(f"Feature-fil inneholder ikke-tolkbar linje: '{linjer[i]}'")
            
            else:
                denne_seksjonen.append(linjer[i])

            i += 1

        return {
            "Gitt": {k: Featureparser.tabellifiser(v) for k,v in seksjon["Gitt"].items()},
            "Når": {k: Featureparser.tabellifiser(v) for k,v in seksjon["Når"].items()},
            "Så": {k: Featureparser.tabellifiser(v) for k,v in seksjon["Så"].items()},
            "Eksempler": seksjon["Eksempler"]
        }

    @staticmethod
    def tabellifiser(linjer):

        stripsplit_linje = lambda linje: [el.strip() for el in linje.strip().split('|') if el != '']

        if len(linjer) == 0:
            return None

        er_kantrad = lambda linje: set(linje) == set(' -|') 

        if er_kantrad(linjer[0]):
            raise ValueError("Tabell skal starte med header")
        
        header = stripsplit_linje(linjer[0])

        if len(linjer) <= 1 or not Featureparser.er_tabellrad(linjer[1]):
            raise ValueError("Tabell er inkomplett")
        
        if not er_kantrad(linjer[1]):
            raise ValueError("Tabell skal ha kantrad etter header")
            
        i = 2
        rader = []
        while True:
            if len(linjer) <= i or not Featureparser.er_tabellrad(linjer[i]):
                raise ValueError("Tabell er inkomplett")
            
            if er_kantrad(linjer[i]):
                break
            
            rader.append(stripsplit_linje(linjer[i]))
            i += 1

        if len(linjer) > i+1:
            raise ValueError("Tabell inneholder feilplasserte kantlinjer")
        
        return Råtabell(header, rader)
    
    @staticmethod
    def eksempel_tabellifiser(linjer):

        stripsplit_linje = lambda linje: [el.strip() for el in linje.split('|') if el != '']

        if len(linjer) == 0:
            raise ValueError("Eksempeltabell skal ha header")

        header = stripsplit_linje(linjer[0])

        if len(linjer) <= 1:
            raise ValueError("Tabell er inkomplett")
        
        rader = []
        for linje in linjer[1:]:
            if not Featureparser.er_tabellrad(linje):
                raise ValueError("Tabell er inkomplett")
            
            rader.append(stripsplit_linje(linje))
        
        return Råtabell(header, rader)