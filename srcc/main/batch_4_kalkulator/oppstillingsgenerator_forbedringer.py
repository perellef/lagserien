from srcc.main.batch_4_kalkulator.lagoppstilling import Lagoppstilling
from srcc.main.batch_4_kalkulator.lagoppskrift import Lagoppskrift
from srcc.main.batch_4_kalkulator.diverse import øvelse
from srcc.main.batch_4_kalkulator.optimal_lagoppstilling import OptimalLagoppstilling
from srcc.main.batch_4_kalkulator.oppstillingsvalidator import Oppstillingsvalidator

from collections import defaultdict
import heapq
from srcc.main.utils.beholdere.liste import Liste 

class OppstillingsgeneratorForbedringer:

    def __init__(self, krav, resultater):
        self.__krav = krav

        # regel
        self.ANTALL_OBL = krav.antall_obligatoriske
        self.ANTALL_VAL = krav.antall_valgfri
        self.MAKS_OBL_LØP = krav.maks_obligatoriske_løp
        self.MAKS_VAL_LØP = krav.maks_valgfri_løp
        self.MAKS_RESULTATER_PER_UTØVER = krav.maks_resultater_per_utøver
        
        # oppstilling
        _initiell_ = self.__sett_initiell_oppstilling(resultater.sort(reverse=True))
        self.__oppskrifter = [_initiell_]
        
        # funnet
        self.__lagoppstillinger = []
        self.__poengterskel = 0
        self.__sjekksummer = set()

    def __sett_initiell_oppstilling(self, resultater):
        obligatoriske = (resultater
                .filter(lambda x: x.er_obligatorisk)
                .group_by(øvelse)
                .values()
                .map(lambda x: x.first())
                .first(self.ANTALL_OBL))
        
        valgfri = (resultater
                .filter(lambda x: x not in obligatoriske)
                .first(self.ANTALL_VAL))

        reserver = resultater.filter(lambda x: x not in obligatoriske and x not in valgfri)

        prioritet_belastede_utøvere = (resultater
            .group_by(lambda x: x.utøver)
            .values()
            .filter(lambda x: x.count() > self.MAKS_RESULTATER_PER_UTØVER)
            .sort(lambda x: x.map(lambda y: y.poeng).sum(), reverse=True)
            .map(lambda x: x.first().utøver))

        Lagoppstilling.prioritet_belastede_utøvere = prioritet_belastede_utøvere
        initiell_oppstilling = Lagoppstilling.initier(list(resultater), obligatoriske, valgfri, reserver)

        return Lagoppskrift(initiell_oppstilling, defaultdict(int), lambda: None)

    def generer(self):
        while len(self.__oppskrifter) > 0:
            oppskrift = heapq.heappop(self.__oppskrifter)  
            if oppskrift.poeng() + 1000 < self.__poengterskel:
                break
            if oppskrift.sjekksum() in self.__sjekksummer:
                continue
            self.__sjekksummer.add(oppskrift.sjekksum())
            oppstilling = oppskrift.lag()

            if oppskrift.poeng() - oppstilling.svakeste_enkeltpoeng() + 1000 < self.__poengterskel:
                continue

            if self.normaliser(oppstilling):
                continue

            self.valider_gyldig(oppstilling)
            self.oppdater_optimal(oppstilling)


        return self.unike_oppstillinger(self.__lagoppstillinger)
    
    def unike_oppstillinger(self, oppstillinger):
        assert len(oppstillinger) > 0, f"Oppstillingsgenerator genererte ingen oppstilling."

        return (Liste(oppstillinger)
            .sort(reverse=True)
            .distinct(lambda x: x.sjekksum()))

    def valider_gyldig(self, oppstilling):
        Oppstillingsvalidator.valider_oppstilling(oppstilling, self.__krav)

    def under_poengterskel(self, oppstilling):
        return oppstilling.poeng() < max(self.__poengterskel, 1) 

    def oppdater_optimal(self, oppstilling):
        lagoppstilling = OptimalLagoppstilling.fra(oppstilling)
        self.__lagoppstillinger.append(lagoppstilling)

    def normaliser(self, oppstilling):
        if oppstilling.har_belastet_utøver(self.MAKS_RESULTATER_PER_UTØVER):
            oppskrifter = oppstilling.permuter_reduksjon_av_prioritert_overbelastet_utøver(self.MAKS_RESULTATER_PER_UTØVER)
            self.utvid_oppskrifter(*oppskrifter)
            return True

        if oppstilling.har_overstigende_obligatoriske_løpsøvelser(self.MAKS_OBL_LØP):
            oppskrifter = oppstilling.reduser_obligatoriske_løpsøvelser()
            self.utvid_oppskrifter(oppskrifter)
            return True

        if oppstilling.har_overstigende_valgfrie_løpsresultater(self.MAKS_VAL_LØP):
            
            if oppstilling.har_nedfallbart_resultat(self.MAKS_OBL_LØP):
                oppskrifter = oppstilling.nedfell_teknisk_resultat()
                self.utvid_oppskrifter(oppskrifter)
                return True

            oppskrifter = oppstilling.reduser_valgfrie_løpsresultater()
            self.utvid_oppskrifter(oppskrifter)
            return True

        if oppstilling.har_andre_haleresultater():
            oppskrifter = oppstilling.permuter_for_ulike_haleresultater()
            self.utvid_oppskrifter(*oppskrifter)
            return True
        return False

    def utvid_oppskrifter(self, *oppskrifter):
        for oppskrift in oppskrifter:
            heapq.heappush(self.__oppskrifter, oppskrift)