import sys
sys.path.append('./')

from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger
from srcc.main.kontrollsenter.tilganger import Tilganger

from srcc.main.utils.dokumentasjon_bakgrunn.utsagn import Utsagn

class Feature:

    class Tilstand:
        def __init__(self):
            self.testdatabygger = Testdatabygger(Tilganger.ALT)
            self.seriedata = None
            self.defaulttabeller = [] 
            self.tabeller = []

    def __init__(self, tittel, bakgrunn, scenarioer):
        self.__tittel = tittel
        self.__bakgrunn = bakgrunn
        self.__scenarioer = scenarioer

        self.__tilstand = Feature.Tilstand()

    def assert_alle_scenarioer(self):
        print("FEATURE: " + self.__tittel)
        for scenario in self.__scenarioer:
            if scenario.har_annotasjon("ignore"):
                print(f"Ignoreres: {scenario}")
                continue
            self.assert_scenario(scenario)

    def assert_scenario_fra_prefiks(self, tittel_prefiks):
        for scenario in self.__scenarioer:
            if scenario.tittel().lower().startswith(tittel_prefiks.lower()):
                print(type(scenario))
                self.assert_scenario(scenario)

    def assert_scenario(self, scenario):
        print("SCENARIO: " + scenario.tittel())
        for eksempel in scenario.eksempler():
            self.assert_eksempel(eksempel)

    def assert_eksempel(self, eksempel):
        self.__tilstand = Feature.Tilstand()

        handlingsforløp = [
            (self.__bakgrunn.gitt, self.utfør_gitt),
            (eksempel.gitt, self.utfør_gitt),
            (eksempel.når, self.utfør_når),
            (eksempel.så, self.utfør_så)
        ]

        for seksjon, utfør in handlingsforløp:
            for utsagn, råtabell in seksjon().items():
                utfør(utsagn, råtabell)

    def utfør_gitt(self, utsagn, råtabell):
        handling = Utsagn.tolk(utsagn, råtabell)
        defaulttabeller, tabeller = handling()

        self.__tilstand.defaulttabeller.extend(defaulttabeller)
        self.__tilstand.tabeller.extend(tabeller)

    def utfør_når(self, utsagn, råtabell):

        tabeller = self.__tilstand.defaulttabeller + self.__tilstand.tabeller

        for cls, objekter in tabeller:
            self.__tilstand.testdatabygger.med(cls, objekter)
            
        self.__tilstand.seriedata = self.__tilstand.testdatabygger.bygg()

        handling = Utsagn.tolk(utsagn, råtabell)
        handling(self.__tilstand.seriedata)

    def utfør_så(self, utsagn, råtabell):
        handling = Utsagn.tolk(utsagn, råtabell)
        handling(self.__tilstand.seriedata)
