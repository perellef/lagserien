from srcc.main.batch_0_oppsett.oppsettbatch import Oppsettbatch
from srcc.main.batch_1_grunnlag.grunnlagsbatch import Grunnlagsbatch
from srcc.main.batch_2_uttrekk.uttrekksbatch import Uttrekksbatch
from srcc.main.batch_3_utdeling.utdelingsbatch import Utdelingsbatch
from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch
#from srcc.main.batch_5_serierapport ... TODO

from srcc.main.kontrollsenter.skjema import Skjema

from enum import Enum

class Tilganger(Enum):

    # TODO: oppsett fjernes når løpet går av seg selv
    OPPSETT = (
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.UTTREKK, Skjema.NETTSIDE, Skjema.RAPPORT),
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.UTTREKK, Skjema.NETTSIDE, Skjema.RAPPORT),
        (Skjema.NETTSIDE,),
    )
    SERIEGRUNNLAG = (
        (Skjema.METADATA, Skjema.GYLDIGHET, Skjema.BAKGRUNN, Skjema.REPRESENTASJON, Skjema.KALKULATORMAT),
        (Skjema.METADATA, Skjema.GYLDIGHET, Skjema.REPRESENTASJON, Skjema.KALKULATORMAT),
        (Skjema.GYLDIGHET, Skjema.REPRESENTASJON, Skjema.KALKULATORMAT),
    )
    UTTREKK = (
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.UTTREKK),
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.UTTREKK),
        (Skjema.UTTREKK, Skjema.BAKGRUNN),
    )
    MANIPULATOR = (
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.GYLDIGHET, Skjema.REPRESENTASJON, Skjema.MANIPULATOR, Skjema.UTTREKK),
        (Skjema.METADATA, Skjema.MANIPULATOR),
        (Skjema.MANIPULATOR,),
    )
    KALKULATOR = (
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.UTTREKK, Skjema.KALKULATORMAT, Skjema.MANIPULATOR, Skjema.SERIE),
        (Skjema.METADATA, Skjema.SERIE),
        (Skjema.SERIE,),
    )
    SERIERAPPORT = (
        (), #Skjema.METADATA, Skjema.BAKGRUNN, Skjema.SERIE),
        (), #Skjema.METADATA, Skjema.RAPPORT),
        (),
    )
    STEVNEKONTROLL = (
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.NETTSIDE,),
        (Skjema.METADATA, Skjema.NETTSIDE,),
        (),
    )
    ALT = (
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.GYLDIGHET, Skjema.REPRESENTASJON, Skjema.MANIPULATOR, Skjema.UTTREKK, Skjema.KALKULATORMAT, Skjema.SERIE, Skjema.RAPPORT),
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.GYLDIGHET, Skjema.REPRESENTASJON, Skjema.MANIPULATOR, Skjema.UTTREKK, Skjema.KALKULATORMAT, Skjema.SERIE, Skjema.RAPPORT),
        (Skjema.METADATA, Skjema.BAKGRUNN, Skjema.GYLDIGHET, Skjema.REPRESENTASJON, Skjema.MANIPULATOR, Skjema.UTTREKK, Skjema.KALKULATORMAT, Skjema.SERIE, Skjema.RAPPORT),
    )

    def __init__(self, hent, innsett, slett):
        self.__hent = hent
        self.__innsett = innsett
        self.__slett = slett

    @staticmethod
    def til(batch):
        return Tilganger.batchtilgang[batch]
    
    def er_autorisert(self, operasjon, cls):
        if operasjon == 'hente':
            return cls in self.henting_tabeller()
        elif operasjon == 'innsette':
            return cls in self.innsetting_tabeller()
        elif operasjon == 'slette':
            return cls in self.sletting_tabeller()
        else:
            raise ValueError(f"Ukjent operasjon: {operasjon}")
        
    def henting_skjemaer(self):
        return self.__hent
    
    def innsetting_skjemaer(self):
        return self.__innsett

    def sletting_skjemaer(self):
        return self.__slett
    
    def henting_tabeller(self):
        return [e for el in self.__hent for e in el]
    
    def innsetting_tabeller(self):
        return [e for el in self.__innsett for e in el]
    
    def sletting_tabeller(self):
        return [e for el in self.__slett for e in el]

Tilganger.batchtilgang = {
    Oppsettbatch: Tilganger.OPPSETT,
    Grunnlagsbatch: Tilganger.SERIEGRUNNLAG,
    Uttrekksbatch: Tilganger.UTTREKK,
    Utdelingsbatch: Tilganger.MANIPULATOR,
    Kalkulatorbatch: Tilganger.KALKULATOR,
}