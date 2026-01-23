from srcc.main.batch_4_kalkulator.sjekksum import Sjekksum

class Oppstilling:

    @staticmethod
    def tom(resultater):
        return Oppstilling(resultater, {}, {}, Sjekksum.tom())

    def __init__(self, resultater, resultatpekere_løp, resultatpekere_tek, sjekksum):
        self.__resultater = resultater
        self.__resultatpekere_tek = resultatpekere_tek
        self.__resultatpekere_løp = resultatpekere_løp
        self.__sjekksum = sjekksum
    
    def antall_løpsøvelser(self):
        return len(self.__resultatpekere_løp)
    
    def antall_løpsresultater(self):
        return sum(map(len, self.__resultatpekere_løp.values()))

    def antall_tekniske_øvelser(self):
        return len(self.__resultatpekere_tek.values())
    
    def løpsresultater(self):
        return [res for resultater in self.__resultatpekere_løp.values() for res in resultater]
    
    def tekniske_resultater(self):
        return [res for resultater in self.__resultatpekere_tek.values() for res in resultater]
    
    def resultater(self):
        return self.løpsresultater() + self.tekniske_resultater()

    def __beste_resultat_i_serieøvelse(self, serieøvelse):
        resultatpekere = self.__resultatpekere_tek if serieøvelse.er_teknisk else self.__resultatpekere_løp
        
        if serieøvelse not in resultatpekere:
            return None
        return resultatpekere[serieøvelse][0]
        
    def __svakeste_resultat_i_serieøvelse(self, serieøvelse):
        resultatpekere = self.__resultatpekere_tek if serieøvelse.er_teknisk else self.__resultatpekere_løp
        return resultatpekere[serieøvelse][-1]

    def __aktuelle_øvelser(self, kun_tek=False, kun_løp=False, i_øvelser=None):
        if i_øvelser is not None:
            if kun_tek:
                raise ValueError("Skal ikke både måtte ta hensyn til i_øvelser og kun_tek")
            return i_øvelser
        
        tek_øvelser = set(self.__resultatpekere_tek)
        løpsøvelser = set(self.__resultatpekere_løp) 
        if kun_tek:
            return tek_øvelser
        if kun_løp:
            return løpsøvelser
        return tek_øvelser.union(løpsøvelser)

    def har_resultat_i_øvelse(self, serieøvelse):
        if serieøvelse.er_teknisk:
            return serieøvelse in self.__resultatpekere_tek
        else:
            return serieøvelse in self.__resultatpekere_løp

    def beste_resultat(self, kun_tek=False, kun_løp=False, i_øvelser=None):
        øvelser = self.__aktuelle_øvelser(kun_tek=kun_tek, kun_løp=kun_løp, i_øvelser=i_øvelser)
        resultater = [res for øvelse in øvelser if (res := self.__beste_resultat_i_serieøvelse(øvelse)) is not None]
        if len(resultater) == 0:
            return None
        return max(resultater)
    
    def svakeste_resultat(self, kun_tek=False, kun_løp=False, i_øvelser=None):
        øvelser = self.__aktuelle_øvelser(kun_tek=kun_tek, kun_løp=kun_løp, i_øvelser=i_øvelser)
        resultater = [self.__svakeste_resultat_i_serieøvelse(øvelse) for øvelse in øvelser]
        if len(resultater) == 0:
            return None
        return min(resultater)
 
    def har_resultat_i_løpsøvelser(self, løpsøvelser):
        return løpsøvelser.intersection(set(self.__resultatpekere_løp)) != set()
    
    def kopier(self):
        return Oppstilling(
            self.__resultater,
            {k: list(v) for k,v in self.__resultatpekere_løp.items()},
            {k: list(v) for k,v in self.__resultatpekere_tek.items()},
            self.__sjekksum.kopier()
        )
            
    def simuler_uten(self, resultat):
        resultatpekere = (self.__resultatpekere_tek if resultat.er_teknisk else self.__resultatpekere_løp)
        if len(resultatpekere[resultat.serieøvelse]) == 1:
            resultatpekere.pop(resultat.serieøvelse)
        else:
            resultatpekere[resultat.serieøvelse].remove(resultat)
        self.__sjekksum.simuler_uten(resultat.resultatindeks)

    def simuler_med(self, resultat):
        if resultat.er_teknisk:
            resultatpekere = self.__resultatpekere_tek
        else:
            resultatpekere = self.__resultatpekere_løp
        if resultat.serieøvelse not in resultatpekere:
            resultatpekere[resultat.serieøvelse] = []
        resultatpekere = resultatpekere[resultat.serieøvelse]

        if len(resultatpekere) == 0 or resultat.resultatindeks > resultatpekere[-1].resultatindeks:
            resultatpekere.append(resultat)
        else:
            for i in range(len(resultatpekere)):
                if resultat.resultatindeks < resultatpekere[i].resultatindeks:
                    resultatpekere.insert(i, resultat)
                    break

        self.__sjekksum.simuler_med(resultat.resultatindeks)
    
    def sjekksum(self):
        return self.__sjekksum._Sjekksum__sum

    def __hash__(self):
        return self.__sjekksum.__hash__()
    
    def __len__(self):
        return sum([len(el) for el in self.__resultatpekere_løp.values()]) + sum([len(el) for el in self.__resultatpekere_tek.values()])

    def __iter__(self):
        return iter(sorted(self.resultater(), reverse=True))

    def __str__(self):
        s = '\n'.join(['\n'.join([str(resultat) for resultat in resultater]) for resultater in self.__resultatpekere_tek.values() if len(resultater)>0])
        s += '\n'+'\n'.join(['\n'.join([str(resultat) for resultat in resultater]) for resultater in self.__resultatpekere_løp.values() if len(resultater)>0])
        return s