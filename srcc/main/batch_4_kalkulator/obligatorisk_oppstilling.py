from srcc.main.batch_4_kalkulator.oppstilling import Oppstilling

from collections import defaultdict

class ObligatoriskOppstilling:

    @staticmethod
    def tom(resultater, serieøvelser_obl):
        return ObligatoriskOppstilling(Oppstilling.tom(resultater), defaultdict(int), set(serieøvelser_obl), 0)

    def __init__(self, oppstilling, utøverantall, ledige_serieøvelser, poeng):
        self.__oppstilling = oppstilling
        self.__utøverantall = utøverantall

        #TODO ledige løps- og tekniske serieøvelser hver for seg
        self.__ledige_øvelser = ledige_serieøvelser
        self.__poeng = poeng

        # simuler
        self.__uten = []
        self.__med = []
        self.__handlinger = []
        self.__reversering = []

    def resultater(self):
        return list(sorted(self.__oppstilling.resultater(), key=lambda x: x.prioritet))

    def poeng(self):
        return self.__poeng
    
    def antall_løpsøvelser(self):
        return self.__oppstilling.antall_løpsøvelser()

    def utøverantall(self, utøver):
        return self.__utøverantall[utøver]
        
    def utøverresultater(self, utøver):
        return [res for res in self if res.utøver == utøver]

    def ledige_øvelser(self):
        return self.__ledige_øvelser
    
    def ledige_løpsøvelser(self):
        return set(e for e in self.__ledige_øvelser if not e.er_teknisk)
    
    def ledige_tekniske_øvelser(self):
        return set(e for e in self.__ledige_øvelser if e.er_teknisk)
    
    def svakeste_resultat(self, kun_tek=False, kun_løp=False, i_øvelser=None):
        return self.__oppstilling.svakeste_resultat(kun_tek=kun_tek, kun_løp=kun_løp, i_øvelser=i_øvelser)

    def jevngode_resultater(self, resultat):
        return [("obl", res) for res in self if res.poeng == resultat.poeng]

    def kopier(self):
        return ObligatoriskOppstilling(
            self.__oppstilling.kopier(),
            self.__utøverantall.copy(),
            set(self.__ledige_øvelser),
            self.__poeng
        )

    def simuler_uten(self, resultat, reversering=False):
        self.__oppstilling.simuler_uten(resultat)
        self.__utøverantall[resultat.utøver] -= 1
        if not self.__oppstilling.har_resultat_i_øvelse(resultat.serieøvelse):
            self.__ledige_øvelser.add(resultat.serieøvelse)
        self.__poeng -= resultat.poeng

        if not reversering:
            self.__uten.append(resultat)
            self.__handlinger.append((self.simuler_uten, resultat))
            self.__reversering.insert(0,(self.simuler_med, resultat))

    def simuler_med(self, resultat, reversering=False):
        self.__oppstilling.simuler_med(resultat)
        self.__utøverantall[resultat.utøver] += 1
        self.__ledige_øvelser.remove(resultat.serieøvelse)
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
    
    def permutasjoner_med_utøverresultat_fjernet(self, utøver):
        return [self.uten(res) for res in self if res.utøver == utøver]

    def sjekksum(self):
        return self.__oppstilling.sjekksum()

    def __hash__(self):
        return self.__oppstilling.__hash__()
    
    def __len__(self):
        return self.__oppstilling.__len__()

    def __iter__(self):
        return iter(sorted(self.__oppstilling, key=lambda x: x.prioritet))

    def __str__(self):
        return '\n   '.join([" [ OBLIGATORISK ]"] + [str(res) for res in self])
        