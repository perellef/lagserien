from srcc.main.batch_4_kalkulator.oppstilling import Oppstilling

from collections import defaultdict

class ValgfriOppstilling:
    
    @staticmethod
    def tom(resultater):
        return ValgfriOppstilling(Oppstilling.tom(resultater), defaultdict(int), 0)

    def __init__(self, oppstilling, utøverantall, poeng):
        self.__oppstilling = oppstilling
        self.__utøverantall = utøverantall
        self.__poeng = poeng

        # simuler
        self.__uten = []
        self.__med = []
        self.__handlinger = []
        self.__reversering = []
    
    def utøverantall(self, utøver):
        return self.__utøverantall[utøver]
        
    def utøverresultater(self, utøver):
        return [res for res in self if res.utøver == utøver]

    def antall_løpsresultater(self):
        return self.__oppstilling.antall_løpsresultater()
    
    def poeng(self):
        return self.__poeng

    def kopier(self):
        return ValgfriOppstilling(
            self.__oppstilling.kopier(),
            self.__utøverantall.copy(),
            self.__poeng
        )
        
    def simuler_uten(self, resultat, reversering=False):#
        self.__oppstilling.simuler_uten(resultat)
        self.__utøverantall[resultat.utøver] -= 1
        self.__poeng -= resultat.poeng

        if not reversering:
            self.__uten.append(resultat)
            self.__handlinger.append((self.simuler_uten, resultat))
            self.__reversering.insert(0, (self.simuler_med, resultat))

    def simuler_med(self, resultat, reversering=False):
        self.__oppstilling.simuler_med(resultat)
        self.__utøverantall[resultat.utøver] += 1
        self.__poeng += resultat.poeng
        
        if not reversering:
            self.__med.append(resultat)
            self.__handlinger.append((self.simuler_med, resultat))
            self.__reversering.insert(0, (self.simuler_uten, resultat))

    def lag(self, handlinger):
        for f, resultat in handlinger:
            f(resultat)
        ny = self.kopier()
        self.reverser()
        return ny
        
    def reverser(self):
        for f, resultat in self.__reversering:
            f(resultat, reversering=True)
        self.__uten = []
        self.__med = []
        self.__handlinger = []
        self.__reversering = []
    
    def vis_med(self):
        return list(self.__med)

    def vis_uten(self):
        return list(self.__uten)

    def handlinger(self):
        return list(self.__handlinger)

    def beste_resultat(self, kun_tek=False, kun_løp=False, i_øvelser=None):
        return self.__oppstilling.beste_resultat(kun_tek=kun_tek, kun_løp=kun_løp, i_øvelser=i_øvelser)
    
    def svakeste_resultat(self, kun_tek=False, kun_løp=False, i_øvelser=None):
        return self.__oppstilling.svakeste_resultat(kun_tek=kun_tek, kun_løp=kun_løp, i_øvelser=i_øvelser)

    def har_resultat_i_løpsøvelser(self, løpsøvelser):
        return self.__oppstilling.har_resultat_i_løpsøvelser(løpsøvelser)
    
    def jevngode_resultater(self, resultat):
        return [("val", res) for res in self if res.poeng == resultat.poeng]
    
    def sjekksum(self):
        return self.__oppstilling.sjekksum()

    def __hash__(self):
        return self.__oppstilling.__hash__()
    
    def __len__(self):
        return self.__oppstilling.__len__()

    def __iter__(self):
        return self.__oppstilling.__iter__()

    def __str__(self):
        return '\n   '.join([" [ VALGFRIE ]"] + [str(res) for res in self])