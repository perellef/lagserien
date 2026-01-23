from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse

from srcc.main.utils.beholdere.liste import Liste
from datetime import date

nullutøver = Utøver(utøver_id=1111111, navn="null", fødselsår=None)
nulløvelse = Øvelse(øvelseskode="null", øvelsesnavn="ignorer meg")

class Resultattype:

    def __init__(self, serieresultat, serieøvelse):
        resultat = serieresultat.resultat

        assert resultat.øvelse != None, "Progammeringsfeil. Øvelse er 'None'."
        assert resultat.utøver != None, "Progammeringsfeil. Utøver er 'None'."

        self.er_teknisk = serieøvelse.er_teknisk
        self.er_obligatorisk = serieøvelse.er_obligatorisk
        self.øvelse = resultat.øvelse
        self.øvelseskode = resultat.øvelseskode
        self.poeng = serieresultat.poeng
        self.utøver_id = resultat.utøver_id
        self.utøver = resultat.utøver
        self.resultat_id = resultat.resultat_id
        self.resultatindeks = None
        self.resultat = resultat
        self.prestasjon = resultat.prestasjon
        self.serieøvelse = serieøvelse
        self.prioritet = serieøvelse.prioritet

    def sett_resultatindeks(self, indeks):
        self.resultatindeks = indeks
    
    def __str__(self):
        return f"{self.poeng} - {self.øvelse.øvelsesnavn} - {self.utøver.navn}"
    
    def __gt__(self, andre):
        if self.poeng != andre.poeng:
            return self.poeng > andre.poeng
        if self.øvelse.øvelseskode != andre.øvelse.øvelseskode:
            return self.øvelse.øvelseskode < andre.øvelseskode
        return self.utøver.utøver_id < andre.utøver_id
    
    def __hash__(self):
        return hash((type(self), self.resultat_id))

    def __eq__(self, andre):
        return self.__hash__() == andre.__hash__()
    
    def er_jevngod(self, andre):
        if andre == None:
            return False
        return self.poeng == andre.poeng
    
    @staticmethod
    def null(serieøvelse=None):
        øvelse = nulløvelse if serieøvelse == None else serieøvelse.øvelse
        er_obligatorisk = True if serieøvelse == None else serieøvelse.er_obligatorisk
        er_teknisk = True if  serieøvelse == None else serieøvelse.er_teknisk

        resultat = Resultat(
            resultat_id=0,
            stevne_id=0,
            utøver_id=nullutøver.utøver_id,
            øvelseskode=øvelse.øvelseskode,
            prestasjon="abc",
            statistikk_resultat_id=0
        )
        serieresultat = MannSerieresultat( # kjønn uvesentlig
            resultat_id=0,
            fra_og_med=date.fromisoformat('2100-01-01'),
            til_og_med=date.fromisoformat('2100-01-01'),
            poeng=0,
            klubb_id=None,
            forløp="abc"
        )
        serieresultat.resultat = resultat
        serieøvelse = MannSerieøvelse( # kjønn uvesentlig
            serieår=2021,
            øvelseskode=øvelse.øvelseskode,
            er_obligatorisk=er_obligatorisk,
            er_teknisk=er_teknisk,
            prioritet=Peker.prioritet()
        )
        serieøvelse.øvelse = øvelse

        resultat.øvelse = øvelse
        resultat.utøver = nullutøver

        return Resultattype(serieresultat, serieøvelse)


class Serieoppstilling:

    def __init__(self, obl, val):
        self.__obl = list(sorted(obl, key=lambda x: x.prioritet))
        self.__val = list(sorted(val, reverse=True))

        self.__enkeltpoenger = Liste.concat(self.__obl, self.__val).map(poeng).sort(reverse=True)
        self.__seriepoeng = self.__enkeltpoenger.sum()
        self.__seriepoeng_obl = Liste(self.__obl).map(poeng).sum()
    
    def obl(self):
        return self.__obl

    def val(self):
        return self.__val
    
    def nullrensk(self):
        ny_obl = [res for res in self.__obl if res.poeng > 0]
        ny_val = [res for res in self.__val if res.poeng > 0]
        
        return Serieoppstilling(ny_obl, ny_val)
    
    def utøvere(self):
        return set(Liste.concat(self.__obl, self.__val).map(utøver))   
    
    def __gt__(self, andre):
        styrkeegenskaper = (
            lambda x: x.__seriepoeng,
            lambda x: x.__enkeltpoenger,
            lambda x: x.__seriepoeng_obl,
        )

        for egenskap in styrkeegenskaper:
            if egenskap(self) > egenskap(andre):
                return True
            if egenskap(self) < egenskap(andre):
                return False
            
        return False
    
    def __str__(self):
        output = "[ OBL ]"
        for el in self.__obl:
            output += f"\n {el}"
        output += "\n"
        
        output += "[ VAL ]"
        for el in self.__val:
            output += f" \n{el}"
        return output


class Peker:
    i = 0
    @staticmethod
    def prioritet():
        Peker.i += 1
        return Peker.i

poeng = lambda x: x.poeng
øvelse = lambda x: x.øvelse
utøver = lambda x: x.utøver
er_teknisk = lambda x: x.er_teknisk
er_løp = lambda x: not x.er_teknisk
er_obligatorisk = lambda x: x.er_obligatorisk