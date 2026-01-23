from enum import Enum

class FeatureToggle(Enum):

    feature_xxx = ("xxx", "Til testing - må ikke fjernes", "noe")
    
    def __init__(self, navn, beskrivelse, dato):
        self.__navn = navn
        self.__beskrivelse = beskrivelse
        self.__dato = dato
        self.__er_aktivert = False
    
    def aktiver(self):
        self.__er_aktivert = True

    def deaktiver(self):
        self.__er_aktivert = False

    def er_aktivert(self):
        return self.__er_aktivert

    def er_deaktivert(self):
        return not self.__er_aktivert

    def hvis_aktivert(self, func):
        return HvisAktivert(func, self.er_aktivert())

    def aktiverte_features():
        return set(feature for feature in list(FeatureToggle) if feature.er_aktivert())

    def deaktiverte_features():
        return set(feature for feature in list(FeatureToggle) if feature.er_deaktivert())
    
    def alle_features():
        return list(FeatureToggle)

    def finn_feature(navn):
        for feature in FeatureToggle.alle_features():
            if feature.navn() == navn:
                return feature
        raise ValueError(f"Fant ingen feature med navn: {navn}")     

    def navn(self):
        return self.__navn

    def print_oversikt():
        print("\nAktiverte features")
        print("------------------")
        for feature in FeatureToggle.aktiverte_features():
            print(feature.__navn)
        print()
        print("Deaktiverte features")
        print("--------------------")
        for feature in FeatureToggle.deaktiverte_features():
            print(feature.__navn)
        print()

class HvisAktivert:
    def __init__(self, funk, er_aktivert):
        self.__funk = funk
        self.__er_aktivert = er_aktivert
    
    def ellers(self, ellers_funk):
        if self.__er_aktivert:
            return self.__funk()
        return ellers_funk()
        