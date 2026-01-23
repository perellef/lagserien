from srcc.main.batch_4_kalkulator.lagoppskrift import Lagoppskrift
from srcc.main.batch_4_kalkulator.obligatorisk_oppstilling import ObligatoriskOppstilling
from srcc.main.batch_4_kalkulator.valgfri_oppstilling import ValgfriOppstilling
from srcc.main.batch_4_kalkulator.reserveresultater import Reserveresultater

import itertools as it

class Lagoppstilling:

    prioritet_belastede_utøvere = None

    def __init__(self, obl, val, reserver, skippede):
        self.__obl = obl
        self.__val = val
        self.__reserver = reserver
        self.__skippede = skippede

    def simuler(self, f):
        f()

    def handlinger(self):
        return (self.__obl.handlinger(), self.__val.handlinger(), self.__reserver.handlinger()) 

    def reverser(self):
        self.__obl.reverser()
        self.__val.reverser()
        self.__reserver.reverser()

    def obl(self):
        return self.__obl
    
    def val(self):
        return self.__val
    
    def reserver(self):
        return self.__reserver
    
    def lag(self, skippede, handlinger):
        return Lagoppstilling(
            self.__obl.lag(handlinger[0]),
            self.__val.lag(handlinger[1]),
            self.__reserver.lag(handlinger[2]),
            skippede.copy()
        )

    def poeng(self):
        return self.__obl.poeng() + self.__val.poeng()

    def sjekksum(self):
        return (self.__obl.sjekksum(), self.__val.sjekksum(), self.__reserver.sjekksum())
    
    def har_belastet_utøver(self, maks_resultater_per_utøver):
        for utøver in Lagoppstilling.prioritet_belastede_utøvere:
            if self.__utøverantall(utøver) > maks_resultater_per_utøver:
                return True
        return False
    
    def har_overstigende_obligatoriske_løpsøvelser(self, maks_løpsøvelser):
        return self.__obl.antall_løpsøvelser() > maks_løpsøvelser

    def har_overstigende_valgfrie_løpsresultater(self, maks_løpsøvelser):
        return self.__val.antall_løpsresultater() > maks_løpsøvelser
    
    def har_nedfallbart_resultat(self, maks_obl_løp):
        if self.__obl.antall_løpsøvelser() >= maks_obl_løp:
            return False
        
        if self.__val.har_resultat_i_løpsøvelser(self.__obl.ledige_løpsøvelser()):
            return True
    
        reserve_obl = self.__reserver.beste_resultat(i_øvelser=self.__obl.ledige_løpsøvelser())
        reserve_tek = self.__reserver.beste_resultat(kun_tek=True)
        if reserve_obl == None:
            return False
        if reserve_tek == None:
            return True
        return reserve_obl.poeng > reserve_tek.poeng
    
    def har_andre_haleresultater(self):
        svakeste_val_løp = self.__val.svakeste_resultat(kun_løp=True)
        svakeste_val_tek = self.__val.svakeste_resultat(kun_tek=True)
        
        aktuelle_haleresultater = [svakeste_val_løp, svakeste_val_tek] + self.__obl.resultater() 
    
        return any((self.__reserver.har_jevngodt_resultat(haleres) for haleres in aktuelle_haleresultater))
    
    def er_jevngode(self, resultat1, resultat2):
        if any((
            resultat1 == None,
            resultat2 == None
        )):
            return False
        
        return resultat1.poeng == resultat2.poeng

    def __utøverantall(self, utøver):
        return self.__obl.utøverantall(utøver) + self.__val.utøverantall(utøver)

    def __finn_prioriterte_overbelastet_utøver(self, maks_resultater_per_utøver):
        for utøver in Lagoppstilling.prioritet_belastede_utøvere:
            if self.__utøverantall(utøver) > maks_resultater_per_utøver:
                return utøver
        raise ValueError("Skal finnes en belastende utøver, men var ingen")
    
    def permuter_reduksjon_av_prioritert_overbelastet_utøver(self, maks_resultater_per_utøver):
        belastet_utøver = self.__finn_prioriterte_overbelastet_utøver(maks_resultater_per_utøver)

        belastede_obl = self.__obl.utøverresultater(belastet_utøver)
        belastede_val = self.__val.utøverresultater(belastet_utøver)

        skippede = self.__skippede.copy()
        oppskrifter = []
        for belastede, er_obl, er_val in zip([belastede_val,belastede_obl], [False, True], [True, False]):
            for resultat in belastede:
                if self.er_skippet(resultat):
                    continue
                if bin(skippede[belastet_utøver]).count('1') > maks_resultater_per_utøver:
                    øvelseskoder = []
                    ier = set(i for i,el in enumerate(bin(skippede[belastet_utøver])) if el == '1')
                    for el in self.__obl:
                        if el.resultatindeks in ier:
                            øvelseskoder.append(el.øvelseskode)
                    for el in self.__val:
                        if el.resultatindeks in ier:
                            øvelseskoder.append(el.øvelseskode)
                    break

                oppskrift = Lagoppskrift(self, skippede.copy(), lambda: self.erstatt(resultat, er_obligatorisk=er_obl, er_valgfri=er_val))
                oppskrifter.append(oppskrift)

                skippede[belastet_utøver] ^= (2**resultat.resultatindeks)

        return oppskrifter
    
    def er_skippet(self, resultat):
        return self.__skippede[resultat.utøver] >> resultat.resultatindeks & 1 == 1
    
    def erstatt(self, resultat, er_obligatorisk=False, er_valgfri=False):
        if er_obligatorisk:
            self.__obl.simuler_uten(resultat)
            self.__lagoppstilling_der_obligatorisk_berikes()
        elif er_valgfri:
            self.__val.simuler_uten(resultat)
            self.__lagoppstilling_der_valgfri_berikes()
        else:
            raise ValueError
    
    def __lagoppstilling_der_valgfri_berikes(self, kun_tek=False):
        reserve = self.__reserver.beste_resultat(kun_tek=kun_tek)
        if reserve is None:
            return
        else:
            self.__val.simuler_med(reserve)
            self.__reserver.simuler_uten(reserve)

    def __lagoppstilling_der_obligatorisk_berikes(self, kun_tek=False):
        ledige_øvelser = self.__obl.ledige_tekniske_øvelser() if kun_tek else self.__obl.ledige_øvelser()

        resultat_val = self.__val.beste_resultat(i_øvelser=ledige_øvelser)
        reserve = self.__reserver.beste_resultat(i_øvelser=ledige_øvelser)

        if resultat_val == None and reserve == None:
            return
        elif resultat_val == None or (reserve != None and reserve.poeng >= resultat_val.poeng):
            self.__obl.simuler_med(reserve)
            self.__reserver.simuler_uten(reserve)
        else:
            reserve_val = self.__reserver.beste_resultat()
            if reserve_val is None:
                self.__obl.simuler_med(resultat_val)
                self.__val.simuler_uten(resultat_val)
            else:
                self.__obl.simuler_med(resultat_val)
                self.__val.simuler_uten(resultat_val)
                self.__val.simuler_med(reserve_val)
                self.__reserver.simuler_uten(reserve_val)

    def reduser_obligatoriske_løpsøvelser(self):
        return Lagoppskrift(self, self.__skippede, lambda: self.fjern_obligatorisk_løpsøvelse())

    def fjern_obligatorisk_løpsøvelse(self):
        obl_svakeste_løpsresultat = self.__obl.svakeste_resultat(kun_løp=True)
    
        self.__obl.simuler_uten(obl_svakeste_løpsresultat)
        self.__lagoppstilling_der_obligatorisk_berikes(kun_tek=True)

        val_svakeste_resultat = self.__val.svakeste_resultat()
        if val_svakeste_resultat == None:
            self.__val.simuler_med(obl_svakeste_løpsresultat)
        elif obl_svakeste_løpsresultat.poeng > val_svakeste_resultat.poeng:
            self.__val.simuler_uten(val_svakeste_resultat)
            self.__val.simuler_med(obl_svakeste_løpsresultat)
            self.__reserver.simuler_med(val_svakeste_resultat)
        else:
            self.__reserver.simuler_med(obl_svakeste_løpsresultat)

    def nedfell_teknisk_resultat(self):
        if self.__val.har_resultat_i_løpsøvelser(self.__obl.ledige_løpsøvelser()):
            return Lagoppskrift(self, self.__skippede, lambda: self.nedfell_teknisk_og_innhent_fra_valgfrie())
        else:
            return Lagoppskrift(self, self.__skippede, lambda: self.nedfell_teknisk_og_innhent_fra_reserver())
        
    def nedfell_teknisk_og_innhent_fra_valgfrie(self):
        val_løpsresultat = self.__val.beste_resultat(i_øvelser=self.__obl.ledige_løpsøvelser() )
        obl_teknisk_resultat = self.__obl.svakeste_resultat(kun_tek=True)

        self.__obl.simuler_uten(obl_teknisk_resultat)
        self.__obl.simuler_med(val_løpsresultat)
        self.__val.simuler_uten(val_løpsresultat)
        self.__val.simuler_med(obl_teknisk_resultat)

    def nedfell_teknisk_og_innhent_fra_reserver(self):
        reserve_obl_løp = self.__reserver.beste_resultat(i_øvelser=self.__obl.ledige_løpsøvelser())
        svakeste_obl_tek = self.__obl.svakeste_resultat(kun_tek=True)
        svakeste_val_løp = self.__val.svakeste_resultat(kun_løp=True)

        self.__obl.simuler_uten(svakeste_obl_tek)
        self.__obl.simuler_med(reserve_obl_løp)
        self.__reserver.simuler_uten(reserve_obl_løp)

        if svakeste_obl_tek.poeng > svakeste_val_løp.poeng:
            self.__val.simuler_uten(svakeste_val_løp)
            self.__val.simuler_med(svakeste_obl_tek)
            self.__reserver.simuler_med(svakeste_val_løp)
        else:
            self.__reserver.simuler_med(svakeste_obl_tek)
    
    def reduser_valgfrie_løpsresultater(self):
        return Lagoppskrift(self, self.__skippede, lambda: self.fjern_valgfri_løpsøvelse())

    def fjern_valgfri_løpsøvelse(self):
        val_svakeste_løpsresultat = self.__val.svakeste_resultat(kun_løp=True)
        self.__val.simuler_uten(val_svakeste_løpsresultat)

        self.__lagoppstilling_der_valgfri_berikes(kun_tek=True)
        self.__reserver.simuler_med(val_svakeste_løpsresultat)
    
    def permuter_for_ulike_haleresultater(self):        
        svakeste_val_løp = self.__val.svakeste_resultat(kun_løp=True)
        svakeste_val_tek = self.__val.svakeste_resultat(kun_tek=True)
        
        aktuelle_haleresultater = [svakeste_val_løp, svakeste_val_tek] + self.__obl.resultater() 
        for haleresultat in aktuelle_haleresultater:
            if haleresultat == None:
                continue
            jevngode_resultater = self.__alle_jevngode_resultater(haleresultat)
            if len(jevngode_resultater) == 1:
                continue
            if all((_type_ != "reserver" for _type_,_ in jevngode_resultater)):
                continue
            
            return self.__permuter_jevngode_resultater(jevngode_resultater)
    
        raise ValueError("Skal ha minst ett annet haleresultat")

    def __alle_jevngode_resultater(self, resultat):
        return self.__obl.jevngode_resultater(resultat) + self.__val.jevngode_resultater(resultat) + self.__reserver.jevngode_resultater(resultat)

    def __permuter_jevngode_resultater(self, jevngode_resultater):
        grupper = self.__grupper_resultater(jevngode_resultater)
        permutasjoner = self.__finn_gyldige_permutasjoner(jevngode_resultater, grupper)

        return [Lagoppskrift(self, self.__skippede, lambda: self.__erstatt_resultater(grupper, resultatfordeling)) for resultatfordeling in permutasjoner]
    
    def __erstatt_resultater(self, grupper, resultatfordeling):
        for obl_res in grupper["obl"]:
            self.__obl.simuler_uten(obl_res)
        for val_res in grupper["val"]:
            self.__val.simuler_uten(val_res)
        for reserve in grupper["reserver"]:
            self.__reserver.simuler_uten(reserve)

        for obl_res in resultatfordeling["obl"]:
            self.__obl.simuler_med(obl_res)
        for val_res in resultatfordeling["val"]:
            self.__val.simuler_med(val_res)

    def __grupper_resultater(self, jevngode_resultater):
        grupper = {"obl": [], "val": [], "reserver": []}
        for _type_, resultat in jevngode_resultater:
            grupper[_type_].append(resultat)
        return grupper

    def __finn_gyldige_permutasjoner(self, jevngode_resultater, grupper):
        permutasjoner = []
        def _rek_(delgrupper, resultater, delpermutasjon):
            if len(delgrupper) == 0:
                permutasjoner.append(delpermutasjon)
                return

            for neste_gruppe in it.combinations(resultater, delgrupper[0][1]):
                _rek_(delgrupper[1:], resultater-set(neste_gruppe), delpermutasjon | {delgrupper[0][0]: neste_gruppe})

        _rek_([(k,len(v)) for k,v in grupper.items()], set(map(lambda x: x[1], jevngode_resultater)), {})
        
        ledige_obl_øvelser = self.__obl.ledige_øvelser().union(set(res.serieøvelse for res in grupper["obl"]))
        
        gyldige_permutasjoner = []
        for permutasjon in permutasjoner:
            nye_obl_øvelser = [res.serieøvelse for res in permutasjon["obl"]]
            if len(set(nye_obl_øvelser)) != len(nye_obl_øvelser):
                continue
            if any((øvelse not in ledige_obl_øvelser for øvelse in nye_obl_øvelser)):
                continue
            gyldige_permutasjoner.append(permutasjon)
        
        return gyldige_permutasjoner

    def svakeste_enkeltpoeng(self):
        svakeste_obl = self.__obl.svakeste_resultat()
        svakeste_val = self.__val.svakeste_resultat()

        if svakeste_obl is None:
            return 0
        if svakeste_val is None:
            return 0
        return min(svakeste_obl.poeng, svakeste_val.poeng)

    def __hash__(self):
        return hash((hash(self.__obl), hash(self.__val), hash(self.__reserver)))
    
    def __gt__(self, andre):
        return self.poeng() > andre.poeng()
    
    def __eq__(self, andre):
        if self.poeng() != andre.poeng():
            return False
        return self.__hash__() == andre.__hash__()

    def __str__(self):
        return f"[ ----------------------- ]\n{self.__obl}\n{self.__val}\n{self.__reserver}\n[ ----------------------- ]"

    @staticmethod
    def initier(resultater, obligatoriske, valgfri, reserver):
        serieøvelser_obl = set(res.serieøvelse for res in resultater if res.er_obligatorisk)

        obl = ObligatoriskOppstilling.tom(resultater, serieøvelser_obl)
        for resultat in obligatoriske:
            obl.simuler_med(resultat)

        val = ValgfriOppstilling.tom(resultater)
        for resultat in valgfri:
            val.simuler_med(resultat)

        res = Reserveresultater.tom(resultater)
        for resultat in reserver:
            res.simuler_med(resultat)

        return Lagoppstilling(obl.kopier(), val.kopier(), res.kopier(), 0)