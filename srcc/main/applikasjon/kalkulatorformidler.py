
import sys
sys.path.append('./')

from srcc.main.batch_4_kalkulator.kalkulatorbatch import Kalkulatorbatch
from srcc.main.batch_4_kalkulator.oppstillingsgenerator_forbedringer import OppstillingsgeneratorForbedringer
from srcc.main.batch_4_kalkulator.kalkulator import Kalkulator
from srcc.main.batch_4_kalkulator.diverse import Resultattype
from srcc.main.utils.beholdere.liste import Liste 

from srcc.main.utils.testverktøy._testdatabygger import Testdatabygger
from srcc.main.kontrollsenter.tilganger import Tilganger

from collections import defaultdict

from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat 
from srcc.main.utils.orm._resultat import Resultat 
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._mann_topplag import MannTopplag

from datetime import date

# TODO: uhardkod disse
løpsøvelser = ["60m", "100m", "200m", "400m", "800m", "1500m", "3000m", "5000m", "10000m", "3000m hinder", "60m hekk", "100m hekk", "110m hekk", "400m hekk", "3000m kapp.", "5000m kapp.", "10000m kapp."]
tekniske_øvelser = ["Høyde", "Stav", "Lengde", "Tresteg", "Høyde u.t", "Lengde u.t", "Kule", "Diskos", "Slegge", "Spyd"] 
 
class Kalkulatorformidler:

    @staticmethod
    def beregn_oppstilling(resultater,  oppstillingsregler):
        utøvere = {}
        for i,(_,_,navn,utøver_id,_) in enumerate(resultater, start=1):
            if navn not in utøvere:
                utøvere[navn] = Utøver(utøver_id=utøver_id, navn=f"{navn} ({utøver_id})", fødselsår=None)

        øvelser = {}
        for _,øvelsesnavn,_,_,_ in resultater:
            if øvelsesnavn not in øvelser:
                øvelser[øvelsesnavn] = Øvelse(øvelseskode=øvelsesnavn, øvelsesnavn=øvelsesnavn)

        råresultater = [(int(poeng), øvelser[øvelsesnavn].øvelseskode, utøvere[navn].utøver_id, kilde) for poeng, øvelsesnavn, navn, _,kilde in resultater]
       
        brukte = set()
        menn_serieresultater = []
        resultater = []
        poenger = {}
        for i,(poeng, øvelseskode, utøver_id, kilde) in enumerate(sorted(råresultater, reverse=True)):
            if (utøver_id, øvelseskode) in brukte:
                continue
            brukte.add((utøver_id, øvelseskode))
            
            resultater.append(Resultat(resultat_id=i, stevne_id=1, utøver_id=utøver_id, øvelseskode=øvelseskode, prestasjon=kilde, dato=date(2100,1,1), statistikk_resultat_id=i))
            menn_serieresultater.append(MannSerieresultat(resultat_id=i, fra_og_med=date(2100,1,1), til_og_med=None, poeng=poeng, klubb_id=1, forløp=""))
            poenger[i] = poeng

        oppstillingskrav = [Oppstillingskrav(serieår=2100, divisjon=3, antall_obligatoriske=12, antall_valgfri=8, maks_obligatoriske_løp=9, maks_valgfri_løp=5, maks_resultater_per_utøver=5)]
        menn_topplag = []
        for i,regel in enumerate(oppstillingsregler, start=1):
            oppstillingskrav.append(Oppstillingskrav(serieår=2100, divisjon=i+3, antall_obligatoriske=int(regel[0]), antall_valgfri=int(regel[1]), maks_obligatoriske_løp=int(regel[0])-int(regel[2]), maks_valgfri_løp=int(regel[1])-int(regel[3]), maks_resultater_per_utøver=5))
            menn_topplag.append(MannTopplag(serieår=2100, klubb_id=1, lagnummer=i, divisjon=i+3))
        
        serieøvelser_løp = [MannSerieøvelse(serieår=2100, øvelseskode=øvelse, er_obligatorisk=True, er_teknisk=False, prioritet=i) for i,øvelse in enumerate(løpsøvelser, start=1)]
        serieøvelser_tekniske = [MannSerieøvelse(serieår=2100, øvelseskode=øvelse, er_obligatorisk=True, er_teknisk=True, prioritet=i+len(serieøvelser_løp)) for i,øvelse in enumerate(tekniske_øvelser, start=1)]
        menn_serieøvelser = serieøvelser_løp+serieøvelser_tekniske

        seriedata = (Testdatabygger(Tilganger.KALKULATOR)
            .med(Serie, [Serie(serieår=2100, fra_og_med=date(2100,1,1), til_og_med=date(2100,12,31))])
            .med(Oppstillingskrav, oppstillingskrav)
            .med(Utøver, list(utøvere.values()))
            .med(Øvelse, list(øvelser.values()))
            .med(Klubb, [Klubb(klubb_id=1, klubbnavn="123", kjernenavn="123")])
            .med(Stevne, [Stevne(stevne_id=1, stevnedato=date.fromisoformat("9999-01-01"), stevnetittel="", arena="", sted="", er_nasjonalt=False, rapportert=date.fromisoformat("9999-01-01")),])
            .med(Resultat, resultater)
            .med(MannSerieresultat, menn_serieresultater)
            .med(MannSerieøvelse, menn_serieøvelser)
            .med(MannTopplag, menn_topplag)
            .bygg()
        )

        Kalkulatorbatch.kjør(seriedata, 2100, date(2100,12,31))

        def prioritet(oppstillingstype, lagresultat):
            if oppstillingstype == "OBLIGATORISK":
                return (løpsøvelser+tekniske_øvelser).index(lagresultat.resultat.øvelseskode)
            if oppstillingstype == "VALGFRI":
                return lagresultat.resultat_id
            raise ValueError("Oppstillingstype må være enten OBLIGATORISK ELLER VALGFRI")

        alle_lag =  defaultdict(lambda: defaultdict(list))
        for lagresultat in seriedata.hent(MannLagresultat):
            verdier = [poenger[lagresultat.resultat_id], lagresultat.resultat.øvelseskode, lagresultat.resultat.utøver.navn, lagresultat.resultat.prestasjon, prioritet(lagresultat.oppstillingstype, lagresultat)]
            alle_lag[lagresultat.lagnummer][lagresultat.oppstillingstype].append(verdier)

        krav_per_div = {el.divisjon: el for el in oppstillingskrav}
        krav_per_lag = {el.lagnummer: krav_per_div[el.divisjon] for el in seriedata.hent(MannLagplassering)}
        for lagnummer in alle_lag:
            manglende_obligatoriske = krav_per_lag[lagnummer].antall_obligatoriske - len(alle_lag[lagnummer]["OBLIGATORISK"])
            for _ in range(manglende_obligatoriske):
                alle_lag[lagnummer]["OBLIGATORISK"].append(["", "", "", "", 100000])
            manglende_valgfri = krav_per_lag[lagnummer].antall_valgfri - len(alle_lag[lagnummer]["VALGFRI"])
            for _ in range(manglende_valgfri):
                alle_lag[lagnummer]["VALGFRI"].append(["", "", "", "", 100000])

        laginfoer =  defaultdict(int)
        for laginfo in seriedata.hent(MannLaginfo):
            laginfoer[laginfo.lagnummer] = laginfo.poeng

        lag_usortert = {lagnr: {oppstillingstype: list(map(lambda x: x[:4], list(sorted(lagresultater, key=lambda x: x[4])))) for oppstillingstype, lagresultater in oppstillinger.items()} for lagnr,oppstillinger in alle_lag.items()}

        return [(laginfoer[el[0]], el[1]) for el in list(sorted(lag_usortert.items(), key=lambda x: x[0]))]

    @staticmethod
    def analyser_lagforbedringer(klubbresultater, lagresultater, oppstillingskrav, serieøvelser, øvelser):
        alle_øvelser = set(el[1] for el in serieøvelser)
        obl_øvelser = set(el[1] for el in serieøvelser if el[2])
        tek_øvelser = set(el[1] for el in serieøvelser if el[3])

        øvelsesprioritet = {el[1]: el[4] for el in serieøvelser}
        utøvere = {el[4]: el[5] for el in klubbresultater}

        initiell_obl = [(el[1],el[5], el[4]) for el in lagresultater if el[0] == "OBLIGATORISK"]
        initiell_val = [(el[1],el[5], el[4]) for el in lagresultater if el[0] == "VALGFRI"]        
        optimal_poeng = sum(el[1] for el in lagresultater)

        lagoppstillinger = [(optimal_poeng, initiell_obl, initiell_val)]

        utøverantall = defaultdict(int)
        for el in lagresultater:
            utøverantall[el[4]] += 1
        belastede_utøvere = set(k for k,v in utøverantall.items() if v == 5)
        if len(belastede_utøvere) > 0:
            suboptimale_oppstillinger = Kalkulatorformidler.kjør_for_ekstra_forbedringer(klubbresultater, serieøvelser, oppstillingskrav)
            for opp in suboptimale_oppstillinger:
                lagoppstillinger.append((opp.poeng(), [(el.poeng, el.øvelseskode, el.utøver_id) for el in opp.obl()], [(el.poeng, el.øvelseskode, el.utøver_id) for el in opp.val()]))

        forbedringsområder = []
        for oppstilling_poeng, obl, val in lagoppstillinger:
            for øvelseskladd, poeng, hvem, oppst in Kalkulatorformidler.finn_forbedringsområder(obl, val, oppstillingskrav, obl_øvelser, tek_øvelser, alle_øvelser, belastede_utøvere):
                forbedringsområder.append((øvelseskladd, poeng + optimal_poeng - oppstilling_poeng + 1, hvem, oppst))

        brukt = set()
        forbedringer = []
        for øvelseskladd, poeng, hvem, oppst in sorted(forbedringsområder, key=lambda x: x[1]):
            for øvelse in øvelseskladd:

                if hvem == "alle":
                    if len(belastede_utøvere) == 0:
                        hvem_da = "hvem som helst"
                    else:
                        hvem_da = "under 5 resultater"
                else:
                    hvem_da = hvem

                if (øvelse, hvem_da) not in brukt:
                    brukt.add((øvelse, hvem_da))
                    forbedringer.append((øvelse, hvem_da, poeng, oppst))

        
        resultatIDer = {}
        forrige = {"OBLIGATORISK": [], "VALGFRI": []}
        
        i = 0
        for initiell, oppst, sort_f in zip([initiell_obl, initiell_val], ["OBLIGATORISK", "VALGFRI"], [lambda x: øvelsesprioritet[x[1]], lambda x: -x[0]]):
            for el in sorted(initiell, key=sort_f):
                forrige[oppst].append([el[0], øvelser[el[1]], 'kommer', el[2] if el[2] not in utøvere else utøvere[el[2]], '', '', '', i])
                resultatIDer[el] = i
                i += 1

        berikede_oppstillinger = [Kalkulatorformidler.finn_beriket_oppstilling(oppstillingskrav, forrige, forrige, set(), set(), {})]
        for (øvelse, hvem_da, poeng, (obl, val)) in forbedringer:
            ny_obl, ny_val = Kalkulatorformidler.oppdater_oppstilling_med_nytt_resultat(oppstillingskrav, obl, val, (poeng, øvelse, hvem_da), obl_øvelser, tek_øvelser, serieøvelser, utøvere)
            
            neste = {"OBLIGATORISK": [], "VALGFRI": []}
            for initiell, oppst in zip([ny_obl, ny_val], ["OBLIGATORISK", "VALGFRI"]):
                for el in initiell:
                    if el in resultatIDer:
                        neste[oppst].append([el[0], øvelser[el[1]], 'kommer', el[2] if el[2] not in utøvere else utøvere[el[2]], '' if el[2] in utøvere or el[2] == '' else "ny", '', '', resultatIDer[el]])
                    else:
                        neste[oppst].append([el[0], øvelser[el[1]], 'kommer', el[2] if el[2] not in utøvere else utøvere[el[2]], '' if el[2] in utøvere or el[2] == '' else "ny", '', '', i])
                        i += 1

            berikede_oppstillinger.append(Kalkulatorformidler.finn_beriket_oppstilling(oppstillingskrav, neste, forrige, set(), set(), {}))

        oppstillinger = [{
            "OBLIGATORISK": [[e[0], e[2], e[3], e[4], e[5], e[-2], e[6]] for e in b_oppst["OBLIGATORISK"]],
            "VALGFRI": [[e[0], e[2], e[3], e[4], e[5], e[-2], e[6]] for e in b_oppst["VALGFRI"]]
        } for b_oppst in berikede_oppstillinger]
         
        oppstillinger = [oppstillinger[0]] + list(e[1] for e in sorted(zip(forbedringer, oppstillinger[1:]), key=lambda x: (x[0][2], øvelsesprioritet[x[0][0]])))
        forbedringer = [(poeng,øvelser[øvelse],utøvere[hvem] if hvem in utøvere else hvem) for (øvelse, hvem, poeng, _) in sorted(forbedringer, key=lambda x: (x[2], øvelsesprioritet[x[0]]))]
        
        return forbedringer, oppstillinger
    
    @staticmethod
    def finn_forbedringsområder(obl, val, oppstillingskrav, obl_øvelser, tek_øvelser, alle_øvelser, belastede_utøvere):
        antall_obl = oppstillingskrav[0]
        antall_val = oppstillingskrav[1]
        maks_obl_løp = oppstillingskrav[2]
        maks_val_løp = oppstillingskrav[3]
        
        obl_tek = [el for el in obl if el[1] in tek_øvelser]
        obl_løp = [el for el in obl if el[1] not in tek_øvelser]
        val_tek = [el for el in val if el[1] in tek_øvelser]
        val_løp = [el for el in val if el[1] not in tek_øvelser]

        svakest_obl_løp_poeng = min([el[0] for el in obl if el[1] not in tek_øvelser], default=0)
        svakest_obl_poeng = min([el[0] for el in obl], default=0)
        
        brukte_obl_øvelser = set(el[1] for el in obl)
        ubrukte_obl_øvelser = obl_øvelser.difference(brukte_obl_øvelser)
        ubrukte_obl_tek_øvelser = ubrukte_obl_øvelser.intersection(tek_øvelser)
        ubrukte_obl_løp_øvelser = ubrukte_obl_øvelser.difference(tek_øvelser)

        svakest_val_poeng = min([el[0] for el in val if el[1] in tek_øvelser], default=0)
        svakest_val_løp_poeng = min([el[0] for el in val if el[1] not in tek_øvelser], default=0)
        
        if len(belastede_utøvere) == 0:
            forbedringsområder = [((el[1],), el[0], "hvem som helst", [obl, val]) for el in obl+val]
        else:
            forbedringsområder = [((el[1],), el[0], "under 5 resultater", [obl, val]) for el in obl+val]
            forbedringsområder += [((el[1],), el[0], el[2], [obl, val]) for el in obl+val if el[2] in belastede_utøvere]

        if len(obl_løp) + len(obl_tek) < antall_obl:
            if len(obl_løp) < maks_obl_løp:
                forbedringsområder.append((ubrukte_obl_øvelser, 0, "alle", [obl, val]))
            else:
                forbedringsområder.append((ubrukte_obl_tek_øvelser, 0, "alle", [obl, val]))
                forbedringsområder.append((ubrukte_obl_løp_øvelser, svakest_obl_løp_poeng, "alle", [obl, val]))
        else:
            if len(obl_løp) < maks_obl_løp:
                forbedringsområder.append((ubrukte_obl_øvelser, svakest_obl_poeng, "alle", [obl, val]))
            else:
                forbedringsområder.append((ubrukte_obl_tek_øvelser, svakest_obl_poeng, "alle", [obl, val]))
                forbedringsområder.append((ubrukte_obl_øvelser, svakest_obl_løp_poeng, "alle", [obl, val]))

        if len(val_løp) + len(val_tek) < antall_val:
            if len(val_løp) < maks_val_løp:
                forbedringsområder.append((alle_øvelser, 0, "alle", [obl, val]))
            else:
                forbedringsområder.append((tek_øvelser, 0, "alle", [obl, val]))
                forbedringsområder.append((alle_øvelser.difference(tek_øvelser), svakest_val_løp_poeng, "alle", [obl, val]))
        else:
            if len(val_løp) < maks_val_løp:
                forbedringsområder.append((alle_øvelser, svakest_val_poeng, "alle", [obl, val]))
            else:
                forbedringsområder.append((alle_øvelser, svakest_val_løp_poeng, "alle", [obl, val]))
                forbedringsområder.append((tek_øvelser, svakest_val_poeng, "alle", [obl, val]))
        
        return forbedringsområder

    @staticmethod
    def kjør_for_ekstra_forbedringer(klubbresultater, serieøvelser, krav):
        vilkårlig_klubb = Klubb(klubb_id=1, klubbnavn="123", kjernenavn="123")
        
        øvelser = {el[1]: Øvelse(øvelseskode=el[1], øvelsesnavn=el[1]) for el in serieøvelser}
        serieøvelser_per = {}
        for serieår, øvelseskode, er_obl, er_tek, prioritet in serieøvelser:
            serieøvelser_per[øvelseskode] = MannSerieøvelse(serieår=serieår, øvelseskode=øvelseskode, er_obligatorisk=er_obl, er_teknisk=er_tek, prioritet=prioritet)
            serieøvelser_per[øvelseskode].øvelse = øvelser[øvelseskode]
    
        serieresultater = {}
        for resultat_id, poeng, øvelseskode, _, utøver_id, _  in klubbresultater:
            øvelse = Øvelse(øvelseskode=øvelseskode, øvelsesnavn=øvelseskode)
            utøver = Utøver(utøver_id=utøver_id, navn=f"{utøver_id}", fødselsår=None)
            resultat = Resultat(resultat_id=resultat_id, stevne_id=1, utøver_id=utøver_id, øvelseskode=øvelseskode, prestasjon="abc", dato=date(2100,1,1), statistikk_resultat_id=resultat_id)
            resultat.øvelse = øvelse
            resultat.utøver = utøver

            serieresultat = MannSerieresultat(resultat_id=resultat_id, fra_og_med=date(2100,1,1), til_og_med=None, poeng=poeng, klubb_id=1, forløp="")

            serieresultat.klubb = vilkårlig_klubb
            serieresultat.resultat = resultat
            serieresultater[resultat_id] = serieresultat
        oppstillingskrav = Oppstillingskrav(serieår=2100, divisjon=3, antall_obligatoriske=krav[0], antall_valgfri=krav[1], maks_obligatoriske_løp=krav[2], maks_valgfri_løp=krav[3], maks_resultater_per_utøver=krav[4])

        resultater = Liste([Resultattype(res, serieøvelser_per[res.resultat.øvelseskode]) for res in serieresultater.values()])    
        aktuelle_resultater = Kalkulator.finn_aktuelle_resultater(resultater.sort(reverse=True), oppstillingskrav)
        for i,resultat in enumerate(aktuelle_resultater, start=1):
            resultat.sett_resultatindeks(i)

        oppstillingsgenerator = OppstillingsgeneratorForbedringer(oppstillingskrav, aktuelle_resultater)
        
        oppstillinger = oppstillingsgenerator.generer()
        return oppstillinger

    @staticmethod
    def oppdater_oppstilling_med_nytt_resultat(oppstillingskrav, obl, val, nytt_resultat, obl_øvelser, tek_øvelser, serieøvelser, utøvere):
        antall_obl = oppstillingskrav[0]
        antall_val = oppstillingskrav[1]
        maks_obl_løp = oppstillingskrav[2]
        maks_val_løp = oppstillingskrav[3]

        øvelsesprioritet = {el[1]: el[4] for el in serieøvelser}
        ny_poeng, ny_øvelse, ny_utøver = nytt_resultat

        obl_løp = [el for el in obl if el[1] not in tek_øvelser]
        obl_res = {el[1]: el for el in obl}
        svakeste_obl_løp = min([el[0] for el in obl_løp], default=0)
        svakeste_obl = min([el[0] for el in obl], default=0)

        def innsettes_i_obl():
            if ny_øvelse in obl_res:
                return ny_poeng > obl_res[ny_øvelse][0], ny_poeng > obl_res[ny_øvelse][0], False
            
            if ny_øvelse not in obl_øvelser:
                return False, False, False
            # forutsetter obl resultat

            if ny_øvelse in tek_øvelser and len(obl) < antall_obl:
                return True, False, False

            if ny_øvelse in tek_øvelser:
                return ny_poeng > svakeste_obl, ny_poeng > svakeste_obl, False
            # forutsetter obl løpsresultat

            if len(obl) < antall_obl and len(obl_løp) < maks_obl_løp:
                return True, False, False

            if len(obl_løp) < maks_obl_løp:
                return  ny_poeng > svakeste_obl, ny_poeng > svakeste_obl, False

            return ny_poeng > svakeste_obl_løp, ny_poeng > svakeste_obl_løp, True
                               
        sortert_obl = [el for el in sorted(obl)]
        sortert_obl_løp = [el for el in sortert_obl if el[1] not in tek_øvelser]
        obl_tek = [el for el in obl if el[1] in tek_øvelser]

        i_obl, videreforfl_til_val, kun_tek = innsettes_i_obl()
        if i_obl:
            if videreforfl_til_val:
                if ny_øvelse in obl_res:
                    ny_obl = [el for el in sortert_obl if el[1] != ny_øvelse] + [nytt_resultat]
                    ny_val = val + [obl_res[ny_øvelse]]
                elif kun_tek:
                    ny_obl = sortert_obl_løp[1:] + obl_tek + [nytt_resultat]
                    ny_val = val + [sortert_obl_løp[0]]
                else:
                    ny_obl = sortert_obl[1:] + [nytt_resultat]
                    ny_val = val + [sortert_obl[0]]
            else:
                ny_obl = sortert_obl + [nytt_resultat]
                ny_val = val
        else:
            ny_obl = obl
            ny_val = val + [nytt_resultat]

        antall_ny_utøver = len([el for el in obl+val if el[2] == ny_utøver]) + 1
        if antall_ny_utøver > 5:
            ny_val = [el for el in ny_val if (el[1],el[2]) != (ny_øvelse, ny_utøver) or el[0] == ny_poeng]
        
        val_løp = [el for el in sorted(ny_val) if el[1] not in tek_øvelser]
        if len(ny_val) > antall_val or len(val_løp) > maks_val_løp:
            val_tek = [el for el in sorted(ny_val) if el[1] in tek_øvelser]

            if len(val_løp) > maks_val_løp or len(val_tek) == 0 or val_løp[0] <= val_tek[0]:
                ny_val = val_tek + val_løp[1:]
            else:
                ny_val = val_tek[1:] + val_løp 
        
        ny_obl = sorted(ny_obl, key=lambda x: øvelsesprioritet[x[1]]) 
        ny_val = sorted(ny_val, reverse=True)

        for oppst in (ny_obl, ny_val):
            for i,(poeng, øvelse, utøver) in enumerate(oppst):
                if (øvelse,utøver) == (ny_øvelse, ny_utøver) and ny_utøver in utøvere:
                    oppst[i] = (poeng, øvelse, utøvere[ny_utøver])
                
        return ny_obl, ny_val
    
    @staticmethod
    def sammenlikn_lag(lagresultater1, noteringer1, lagresultater2, noteringer2):
        relevans = lambda oppstilling: list(map(lambda el: [el[1],el[3],el[0]], oppstilling))

        obl1 = relevans(lagresultater1["OBLIGATORISK"])
        obl2 = relevans(lagresultater2["OBLIGATORISK"])
        val1 = relevans(lagresultater1["VALGFRI"])
        val2 = relevans(lagresultater2["VALGFRI"])

        obl1_øvelser = set(map(lambda x: x[0], obl1))
        obl2_øvelser = set(map(lambda x: x[0], obl2))

        obl1_match = [el for el in obl1 if el[0] in obl2_øvelser]
        obl2_match = [el for el in obl2 if el[0] in obl1_øvelser]
        obl1_rest = list(sorted([el for el in obl1 if el[0] not in obl2_øvelser], key=lambda x: -int(x[2])))
        obl2_rest = list(sorted([el for el in obl2 if el[0] not in obl1_øvelser], key=lambda x: -int(x[2])))

        diff_match = [el2[2]-el1[2] for el1,el2 in zip(obl1_match, obl2_match)]
        diff_rest = [el2[2]-el1[2] for el1,el2 in zip(obl1_rest, obl2_rest)]
        if len(obl1_rest) > len(obl2_rest):
            diff_obl1 = [-verdi for verdi in diff_match+diff_rest]+[el[2] for el in obl1_rest[len(obl2_rest):]]
            diff_obl2 = diff_match+diff_rest+[-el[2] for el in obl1_rest[len(obl2_rest):noteringer2[0]-len(obl2_match)]]
        else:
            diff_obl1 = [-verdi for verdi in diff_match+diff_rest]+[-el[2] for el in obl2_rest[len(obl1_rest):noteringer1[0]-len(obl1_match)]]
            diff_obl2 = diff_match+diff_rest+[el[2] for el in obl2_rest[len(obl1_rest):]]

        diff_val = [el2[2]-el1[2] for el1,el2 in zip(val1, val2)]
        if len(val1) > len(val2):
            diff_val1 = [-verdi for verdi in diff_val] + [el[2] for el in val1[len(val2):]]
            diff_val2 = diff_val + [-el[2] for el in val1[len(val2):noteringer2[1]]]
        else:
            diff_val1 =  [-verdi for verdi in diff_val] + [-el[2] for el in val2[len(val1):noteringer1[1]]]
            diff_val2 =  diff_val + [el[2] for el in val2[len(val1):]]
        
        obl1_uferdig = [el[:3] + [d] for el,d in zip(obl1_match+obl1_rest, diff_obl1)]
        obl2_uferdig = [el[:3] + [d] for el,d in zip(obl2_match+obl2_rest, diff_obl2)]
        val1_uferdig = [el[:3] + [d] for el,d in zip(val1, diff_val1)]
        val2_uferdig = [el[:3] + [d] for el,d in zip(val2, diff_val2)]

        obl1_ferdig = obl1_uferdig+[["", "", "", el] for el in diff_obl1[len(obl1_uferdig):]]+[4*[""]]*(noteringer1[0]-len(diff_obl1))+[4*["ignorer"]]*max(0, noteringer2[0]-noteringer1[0])
        obl2_ferdig = obl2_uferdig+[["", "", "", el] for el in diff_obl2[len(obl2_uferdig):]]+[4*[""]]*(noteringer2[0]-len(diff_obl2))+[4*["ignorer"]]*max(0, noteringer1[0]-noteringer2[0])
        val1_ferdig = val1_uferdig+[["", "", "", el] for el in diff_val1[len(val1_uferdig):]]+[4*[""]]*(noteringer1[1]-len(diff_val1))+[4*["ignorer"]]*max(0, noteringer2[1]-noteringer1[1])
        val2_ferdig = val2_uferdig+[["", "", "", el] for el in diff_val2[len(val2_uferdig):]]+[4*[""]]*(noteringer2[1]-len(diff_val2))+[4*["ignorer"]]*max(0, noteringer1[1]-noteringer2[1])

        return [[obl1_ferdig, val1_ferdig], [obl2_ferdig, val2_ferdig]] 
    
    @staticmethod
    def sammenlikn_endret_lag(noteringer, forrige, neste):
        relevans = lambda oppstilling: set(map(lambda el: (el[-1],el[1],el[3],el[0]), oppstilling))

        obl1 = relevans(neste["OBLIGATORISK"])
        obl2 = relevans(forrige["OBLIGATORISK"])
        val1 = relevans(neste["VALGFRI"])
        val2 = relevans(forrige["VALGFRI"])

        obl_like = obl1 & obl2
        val_like = val1 & val2
        obl1_ulike = obl1.difference(obl_like)
        obl2_ulike = obl2.difference(obl_like)
        val1_ulike = sorted(val1.difference(val_like), key=lambda x: (-x[3], x[1], x[2]))
        val2_ulike = sorted(val2.difference(val_like), key=lambda x: (-x[3], x[1], x[2]))

        obl1_øvelser = {x[1]: x for x in obl1_ulike}
        obl2_øvelser = {x[1]: x for x in obl2_ulike}

        obl_ulike_øvelseslike = [(obl1_øvelser[øvelse], obl2_øvelser[øvelse]) for øvelse in set(obl1_øvelser) & set(obl2_øvelser)]
        obl1_ulike_øvelsesulike = sorted(obl1_ulike.difference(set(a for a,_ in obl_ulike_øvelseslike)), key=lambda x: (-x[3], x[1], x[2]))
        obl2_ulike_øvelsesulike = sorted(obl2.difference(obl_like).difference(set(b for _,b in obl_ulike_øvelseslike)), key=lambda x: (-x[3], x[1], x[2]))

        obldiff = []
        for el in obl_like:
            obldiff.append([list(el)+[0, "uendret", "",""]])
        for til, fra in obl_ulike_øvelseslike:
            obldiff.append([
                list(til)+[til[3]-fra[3], "inn", "",""],
                list(fra)+[0, "ut", "",""]
            ])
        for til,fra in zip(obl1_ulike_øvelsesulike, obl2_ulike_øvelsesulike):
            obldiff.append([
                list(til)+[til[3]-fra[3], "inn", "",""],
                list(fra)+[0, "ut", "",""]
            ])
        for til in obl1_ulike_øvelsesulike[len(obl2_ulike_øvelsesulike):]:
            obldiff.append([
                list(til)+[til[3], "inn","",''],
                [-1,'','','', 0, 'ut', '','']
            ])
        for fra in obl2_ulike_øvelsesulike[len(obl1_ulike_øvelsesulike):]:
            obldiff.append([
                [-1,'','','',-fra[3], 'inn','',''],
                list(fra)+[0, "ut", "",""],
            ])
        if noteringer[0] > max(len(obl1),len(obl2)):
            obldiff.append([
                [-1,'','','', 0, 'uendret','','']
            ]*(noteringer[0]-max(len(obl1),len(obl2))))

        valdiff = []
        for el in val_like:
            valdiff.append([list(el)+[0, "uendret", "",""]])
        for til,fra in zip(val1_ulike, val2_ulike):
            valdiff.append([list(til)+[til[3]-fra[3], "inn", "",""]])
            valdiff.append([list(fra)+[0, "ut", "", ""]])
        for til in val1_ulike[len(val2_ulike):]:
            valdiff.append([list(til)+[til[3], "inn", "",""]])
            valdiff.append([[-1,'','','', 0, "ut", "", ""]])
        for fra in val2_ulike[len(val1_ulike):]:
            valdiff.append([[-1,'','','', -fra[3], 'inn', '','']])
            valdiff.append([list(fra)+[0, "ut", "",""]])
        if noteringer[1] > max(len(val1),len(val2)):
            valdiff.append([
                [-1,'','','', 0, 'uendret','','']
            ]*(noteringer[1]-max(len(val1),len(val2))))

        for el in valdiff:
            for e in el:
                if e[5] == "ut" and tuple(e[:4]) in obl1:
                    e[5] = "ut-opp"
                elif e[5] == "inn" and tuple(e[:4]) in obl2:
                    e[5] = "inn-ned"
        for el in obldiff:
            for e in el:
                if e[5] == "ut" and tuple(e[:4]) in val1:
                    e[5] = "ut-ned"
                elif e[5] == "inn" and tuple(e[:4]) in val2:
                    e[5] = "inn-opp"

        return obldiff, valdiff

    @staticmethod
    def finn_beriket_oppstilling(noteringer, lagresultater, tidligere_lagresultater, nye_resultater, fjernede_resultater, resultatplasseringer):
        resultatdict = {(res[-1]): res for res in lagresultater["OBLIGATORISK"]+lagresultater["VALGFRI"]+tidligere_lagresultater["OBLIGATORISK"]+tidligere_lagresultater["VALGFRI"]}
        resultatdict[-1] = ['','','','','','','','']

        obldiff, valdiff = Kalkulatorformidler.sammenlikn_endret_lag(noteringer, tidligere_lagresultater, lagresultater)

        berikede_neste = {"OBLIGATORISK": [], "VALGFRI": []}
        for oppst, diff in zip(berikede_neste, (obldiff, valdiff)):
            sortert_diff = sorted(diff, key=lambda x: list(resultatdict).index(x[0][0]))
            diff_flatten = [e for el in sortert_diff for e in el]

            for e in diff_flatten:
                if e[0] in nye_resultater:
                    e[-2] = "ny"
                if e[0] in fjernede_resultater:
                    if e[-3] == "inn":
                        e[-2] = "ny"
                    else:
                        e[-2] = "fjernet"
                if e[0] != -1 and e[-3] != "ut" and e[0] in resultatplasseringer:
                    e[-1] = resultatplasseringer[e[0]]

                berikede_neste[oppst].append([e[-4],e[-1]]+resultatdict[e[0]][:-1]+e[-3:-1])

        berikede_neste["VALGFRI"] = list(sorted(berikede_neste["VALGFRI"], key=lambda x: (0 if x[2] == '' else -x[2], x[3], x[5])))

        return berikede_neste