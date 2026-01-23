from srcc.main.utils.beholdere.liste import Liste
from srcc.main.batch_4_kalkulator.diverse import utøver, øvelse, nullutøver, nulløvelse, er_løp

class OppstillingException(Exception):
    pass

class Oppstillingsvalidator:

    @staticmethod
    def valider_oppstilling(oppstilling, krav):
        Oppstillingsvalidator.valider_ingen_nullresultater(oppstilling)
        Oppstillingsvalidator.valider_ikke_overstigende_resultater_i_obl(oppstilling, krav.antall_obligatoriske)
        Oppstillingsvalidator.valider_ikke_overstigende_resultater_i_val(oppstilling, krav.antall_valgfri)
        Oppstillingsvalidator.valider_ikke_overstigende_løpsresultater_i_obl(oppstilling, krav.maks_obligatoriske_løp)
        Oppstillingsvalidator.valider_ikke_overstigende_løpsresultater_i_val(oppstilling, krav.maks_valgfri_løp)
        Oppstillingsvalidator.valider_ingen_overbelastede_utøvere(oppstilling, krav.maks_resultater_per_utøver)
        Oppstillingsvalidator.valider_ingen_gjenbrukte_obl_øvelser(oppstilling)
    
    @staticmethod
    def valider_ingen_nullresultater(oppstilling):
        nullresultater = Oppstillingsvalidator.__finn_nullresultater(oppstilling)
        if len(nullresultater) > 0: raise OppstillingException(f"Lagoppstillingen:\n\n{oppstilling}\n\nskulle ikke hatt nullresultater, men hadde: {', '.join(map(str, nullresultater))}.")

    @staticmethod
    def valider_ikke_overstigende_resultater_i_obl(oppstilling, antall_obligatoriske):
        if len(oppstilling.obl()) > antall_obligatoriske: raise OppstillingException(f"Lagoppstillingen:\n\n{oppstilling}\n\nskulle hatt kun {antall_obligatoriske} obligatoriske resultater, men hadde: {len(oppstilling.obl())}.")
    
    @staticmethod
    def valider_ikke_overstigende_resultater_i_val(oppstilling, antall_valgfri):
        if len(oppstilling.val()) > antall_valgfri: raise OppstillingException(f"Lagoppstillingen:\n\n{oppstilling}\n\nskulle hatt kun {antall_valgfri} obligatoriske resultater, men hadde: {len(oppstilling.val())}.")

    @staticmethod
    def valider_ikke_overstigende_løpsresultater_i_obl(oppstilling, maks_obligatoriske_løp):
        antall_obl_løp = len([res for res in oppstilling.obl() if er_løp(res)])
        if antall_obl_løp > maks_obligatoriske_løp: raise OppstillingException(f"Lagoppstillingen:\n\n{oppstilling}\n\nskulle hatt maksimalt {maks_obligatoriske_løp} obligatoriske løpsresultater, men hadde: {antall_obl_løp}.")
    
    @staticmethod
    def valider_ikke_overstigende_løpsresultater_i_val(oppstilling, maks_valgfri_løp):
        antall_val_løp = len([res for res in oppstilling.val() if er_løp(res)])
        if antall_val_løp > maks_valgfri_løp: raise OppstillingException(f"Lagoppstillingen:\n\n{oppstilling}\n\nskulle hatt maksimalt {maks_valgfri_løp} valgfri løpsresultater, men hadde: {antall_val_løp}.")

    @staticmethod
    def valider_ingen_overbelastede_utøvere(oppstilling, maks_resultater_per_utøver):
        overbelastede_utøvere = Oppstillingsvalidator.__finn_overbelastede_utøvere(oppstilling, maks_resultater_per_utøver)
        if len(overbelastede_utøvere) > 0: raise OppstillingException(f"Lagoppstillingen:\n\n{oppstilling}\n\nskulle ikke hatt utøvere med mer enn {maks_resultater_per_utøver} resultater, men hadde: {', '.join(map(str, overbelastede_utøvere))}")

    @staticmethod
    def valider_ingen_gjenbrukte_obl_øvelser(oppstilling):
        gjenbrukte_obl_øvelser = Oppstillingsvalidator.__finn_gjenbrukte_obl_øvelser(oppstilling)
        if len(gjenbrukte_obl_øvelser) > 0: raise OppstillingException(f"Lagoppstillingen:\n\n{oppstilling}\n\nskulle ikke hatt obligatoriske øvelser som ble gjenbrukt, men hadde: {', '.join(map(str, gjenbrukte_obl_øvelser))}")

    @staticmethod
    def __finn_nullresultater(oppstilling):
        return (Liste.concat(oppstilling.obl(), oppstilling.val())
            .filter(lambda res: any((
                res.øvelse == nulløvelse,
                res.utøver == nullutøver,
                res.poeng == 0))
            )
        )

    @staticmethod
    def __finn_overbelastede_utøvere(oppstilling, maks_resultater_per_utøver):
        return (Liste.concat(oppstilling.obl(), oppstilling.val())
            .group_by(utøver)
            .items()
            .filter(lambda item: len(item[1])>maks_resultater_per_utøver)
            .map(lambda item: item[0]))
    
    @staticmethod
    def __finn_gjenbrukte_obl_øvelser(oppstilling):
        return (Liste(oppstilling.obl())
            .group_by(øvelse)
            .items()
            .filter(lambda item: len(item[1])>1)
            .map(lambda item: item[0]))
    