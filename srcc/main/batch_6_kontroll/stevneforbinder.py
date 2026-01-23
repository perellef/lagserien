from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._stevneinvitasjon import Stevneinvitasjon

from rapidfuzz import fuzz

from collections import defaultdict

overflødigheter = [
    "ungdomsskole",
    "ungdomsskule",
    "barneskole",
    "barneskule",
    "amfi",
    "idrettspark",
    "idrettssenter",
    "friidrettshall"
    "storhall",
    "arena",
    "stadion",
    "skole",
    "shallen",
    "hallen",

]

class Stevneforbinder:

    def forbind_stevneinvitasjon_med_stevne(seriedata, serieår, alle_stevneinvitasjoner):
        nye_stevneinvitasjoner = []

        alle_stevner = seriedata.hent(Stevne).all()

        brukte_stevner = set()
        stevneinvitasjoner_per_dato = defaultdict(list)
        for stevneinvitasjon in alle_stevneinvitasjoner:
            if stevneinvitasjon.stevnedato.year != serieår:
                continue
            if stevneinvitasjon.er_manuelt_satt_stevne_id:
                nye_stevneinvitasjoner.append(stevneinvitasjon)
                brukte_stevner.add(stevneinvitasjon.stevne_id)
                continue

            stevneinvitasjoner_per_dato[stevneinvitasjon.stevnedato].append(stevneinvitasjon)

        stevner_per_dato = defaultdict(list)
        for stevne in alle_stevner:
            if not stevne.er_nasjonalt:
                continue
            if stevne.stevne_id in brukte_stevner:
                continue
            stevner_per_dato[stevne.stevnedato].append(stevne)

        for dato, stevneinvitasjoner in stevneinvitasjoner_per_dato.items():
            nye_stevneinvitasjoner.extend(Stevneforbinder.forbind_på_dato(stevneinvitasjoner, stevner_per_dato[dato]))
        return nye_stevneinvitasjoner

    def forbind_på_dato(stevneinvitasjoner, stevner):
        modifiserte = []
        
        matchede = {}
        umatchede = set()
        for stevneinvitasjon in stevneinvitasjoner:
            stevneverdier = {}
            for stevne in stevner:
                matchverdi = Stevneforbinder.finn_matchverdi(stevneinvitasjon, stevne)
                stevneverdier[stevne] = matchverdi

            matchverdier = list(sorted(stevneverdier.values(), reverse=True))
            if any((
                (len(matchverdier) == 0),
                (len(matchverdier) > 0 and matchverdier[0] < 6000),
                (len(matchverdier) > 1 and matchverdier[0] - matchverdier[1] < 4000)
            )):
                umatchede.add(stevneinvitasjon)
                continue
            
            stevnematch = [(s,v) for s,v in stevneverdier.items() if v == matchverdier[0]][0]
            matchede[stevneinvitasjon] = (stevnematch)

        stevnematcher = list([e[0] for e in matchede.values()])
        stevnematcher_kollisjon = {stevne: list(sorted((verdi for _,(s,verdi) in matchede.items() if s == stevne), reverse=True)) for stevne in set(stevnematcher) if stevnematcher.count(stevne) > 1}
        
        gjenværende_stevner = (set(stevner).difference(stevnematcher)).union(stevnematcher_kollisjon)

        for stevneinvitasjon, (stevne, verdi) in list(matchede.items()):
            if stevne not in stevnematcher_kollisjon:
                continue
            if verdi - 4000 > stevnematcher_kollisjon[stevne][1]: # nest høyeste verdi
                gjenværende_stevner.discard(stevne)
                continue

            del matchede[stevneinvitasjon]
            umatchede.add(stevneinvitasjon)

        for umatchet in umatchede:
            modifiserte.append(
                Stevneinvitasjon(
                    stevne_id=None,
                    stevnedato=umatchet.stevnedato,
                    stevnetittel=umatchet.stevnetittel,
                    arena=umatchet.arena,
                    arrangør=umatchet.arrangør,
                    krets=umatchet.krets,
                    skal_vises=umatchet.skal_vises,
                    er_manuelt_satt_stevne_id=umatchet.er_manuelt_satt_stevne_id,
                ))

        for stevneinvitasjon, (stevne, _) in matchede.items():
            modifiserte.append(
                Stevneinvitasjon(
                    stevne_id=stevne.stevne_id,
                    stevnedato=stevneinvitasjon.stevnedato,
                    stevnetittel=stevneinvitasjon.stevnetittel,
                    arena=stevneinvitasjon.arena,
                    arrangør=stevneinvitasjon.arrangør,
                    krets=stevneinvitasjon.krets,
                    skal_vises=stevneinvitasjon.skal_vises,
                    er_manuelt_satt_stevne_id=stevneinvitasjon.er_manuelt_satt_stevne_id,
                ))

        return modifiserte
        
    def finn_matchverdi(stevneinvitasjon, stevne):
        v1 = fuzz.ratio(Stevneforbinder.utled_kjernenavn(stevneinvitasjon.arena), Stevneforbinder.utled_kjernenavn(stevne.arena))
        v2 = fuzz.ratio(Stevneforbinder.utled_kjernenavn(stevneinvitasjon.arena),  Stevneforbinder.utled_kjernenavn(stevne.sted.lower()))
        v3 = fuzz.ratio(stevneinvitasjon.stevnetittel.lower(), stevne.stevnetittel.lower())

        return max(v1,v2)**2 + (v3+20)**2
        
    def utled_kjernenavn(arena):
        enkeltdeler = arena.lower()
        for overflødighet in overflødigheter:
            enkeltdeler = enkeltdeler.replace(overflødighet, "")
        return ' '.join(enkeltdeler.split())
    