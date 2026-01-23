from srcc.main.batch_4_kalkulator.oppstilling import Oppstilling

class Reserveresultater:
    
    @staticmethod
    def tom(resultater):
        return Reserveresultater(Oppstilling.tom(resultater))

    def __init__(self, oppstilling):
        self.__oppstilling = oppstilling
        
        # simuler
        self.__uten = []
        self.__med = []
        self.__handlinger = []
        self.__reversering = []

    def kopier(self):
        return Reserveresultater(self.__oppstilling.kopier())
            
    def beste_resultat(self, kun_løp=False, kun_tek=False, i_øvelser=None):
        return self.__oppstilling.beste_resultat(kun_løp=kun_løp, kun_tek=kun_tek, i_øvelser=i_øvelser)

    def utøverresultater(self, utøver):
        return [(1, "reserver", res) for res in self if res.utøver == utøver]
    
    def har_jevngodt_resultat(self, resultat):
        if resultat == None:
            return False
        for res in self:
            if res.poeng == resultat.poeng:
                return True
            elif res.poeng < resultat.poeng:
                return False
        return False

    def jevngode_resultater(self, resultat):
        jevngode = []
        for res in self:
            if res.poeng == resultat.poeng:
                jevngode.append(("reserver", res))
            elif res.poeng < resultat.poeng:
                break
        return jevngode 

    def simuler_uten(self, resultat, reversering=False):
        self.__oppstilling.simuler_uten(resultat)

        if not reversering:
            self.__uten.append(resultat)
            self.__handlinger.append((self.simuler_uten, resultat))
            self.__reversering.insert(0, (self.simuler_med, resultat))

    def simuler_med(self, resultat, reversering=False):
        self.__oppstilling.simuler_med(resultat)
        
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
    
    def sjekksum(self):
        return self.__oppstilling.sjekksum()

    def __hash__(self):
        return self.__oppstilling.__hash__()
    
    def __len__(self):
        return self.__oppstilling.__len__()

    def __iter__(self):
        return self.__oppstilling.__iter__()

    def __str__(self):
        return '\n   '.join([" [ RESERVER ]"] + [str(res) for res in self])