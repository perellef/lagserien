from srcc.main.batch_4_kalkulator.obligatorisk_oppstilling import ObligatoriskOppstilling
from srcc.main.batch_4_kalkulator.valgfri_oppstilling import ValgfriOppstilling
from srcc.main.batch_4_kalkulator.reserveresultater import Reserveresultater

from srcc.main.batch_4_kalkulator.lagoppstilling import Lagoppstilling

class OptimalLagoppstilling:

    @staticmethod
    def fra(oppstilling):
        sjekksum = (
            oppstilling.sjekksum()[0].__hash__(),
            oppstilling.sjekksum()[1].__hash__()
        )
        return OptimalLagoppstilling(oppstilling.obl(), oppstilling.val(), sjekksum) 

    def __init__(self, obl, val, sjekksum):
        self.__obl = list(obl)
        self.__val = list(val)
        self.__sjekksum = sjekksum

    def sjekksum(self):
        return self.__sjekksum

    def obl(self):
        return list(sorted(self.__obl, key=lambda x: x.prioritet))

    def val(self):
        return list(sorted(self.__val, key=lambda x: x.poeng, reverse=True))
    
    def poeng_valgfrie(self):
        return sum(res.poeng for res in self.__val)

    def poeng_obligatoriske(self):
        return sum(res.poeng for res in self.__val)

    def poeng(self):
        return sum(res.poeng for res in self.__obl+self.__val)

    def kan_isolert_forbedre_valgfri(self, resultat, krav):
        if not resultat.er_teknisk:
            løpsres = [e.poeng for e in self.__val if not e.er_teknisk]
            if len(løpsres) == krav.maks_valgfri_løp:
                return resultat.poeng >= min(løpsres)

        if krav.antall_valgfri > len(self.__val):
            return True
        return resultat.poeng >= min(e.poeng for e in self.__val)
    
    def kan_isolert_forbedre_obligatoriske(self, resultat, krav):
        if not resultat.er_obligatorisk:
            return False
        if not resultat.er_teknisk:
            øvelser = {e.øvelse: e.poeng for e in self.__obl if not e.er_teknisk}
                
            if len(øvelser) == krav.maks_obligatoriske_løp:
                if resultat.øvelse in øvelser:
                    return resultat.poeng >= øvelser[resultat.øvelse]
                
                return resultat.poeng >= min(øvelser.values())

        øvelser = {e.øvelse: e.poeng for e in self.__obl if e}
        if resultat.øvelse in øvelser:
            return resultat.poeng >= øvelser[resultat.øvelse]
        return krav.antall_obligatoriske > len(self.__obl) or resultat.poeng >= min(øvelser.values())
    
    def antall_notasjoner(self):
        return len(self.__obl) + len(self.__val)

    def utøvere(self):
        return tuple(sorted((res.utøver for res in set(self.__obl+self.__val)), key=lambda x: x.utøver_id))
    
    def antall_deltakere(self):
        return len(self.utøvere())
    
    def __enkeltpoenger(self):
        return sorted([e.poeng for e in self.__obl + self.__val], reverse=True)
    
    def __obligatorisk_score(self):
        return sum(e.poeng for e in self.__obl)
    
    def __gt__(self, andre):
        if self.poeng() != andre.poeng():
            return self.poeng() > andre.poeng()
        if self.__obligatorisk_score() != andre.__obligatorisk_score():
            return self.__obligatorisk_score() > andre.__obligatorisk_score()
        return self.__enkeltpoenger() > andre.__enkeltpoenger()
    
    def __str__(self):
        s = f"OPTIMAL OPPSTILLING - {self.poeng()}" 
        s += '\n' + '\n   '.join([" [ OBLIGATORISK ]"] + [str(res) for res in self.__obl])
        s += '\n' + '\n   '.join([" [ VALGFRI ]"] + [str(res) for res in self.__val])
        return s