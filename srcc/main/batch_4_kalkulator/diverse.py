from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse

from srcc.main.utils.beholdere.liste import Liste

class Resultattype:

    def __init__(self, resultat, poeng, serieøvelse):
        assert resultat.øvelse != None, "Progammeringsfeil. Øvelse er 'None'."
        assert resultat.utøver != None, "Progammeringsfeil. Utøver er 'None'."

        self.er_teknisk = serieøvelse.er_teknisk
        self.er_obligatorisk = serieøvelse.er_obligatorisk
        self.øvelse = resultat.øvelse
        self.øvelseskode = resultat.øvelseskode
        self.poeng = poeng
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
    def imiter(poeng, serieøvelse, utøver):
        resultat = Resultat(
            resultat_id=0,
            stevne_id=0,
            utøver_id=utøver.utøver_id,
            øvelseskode=serieøvelse.øvelseskode,
            prestasjon="abc",
            statistikk_resultat_id=0
        )
        serieøvelse.øvelse = serieøvelse.øvelse

        resultat.øvelse = serieøvelse.øvelse
        resultat.utøver = utøver
        
        return Resultattype(resultat, poeng, serieøvelse)
