import sys
sys.path.append('./')

from srcc.main.batch_3_utdeling.grenseverdier import grenseverdier

import math

tillegg_ved_manuell_tid = {
    "60": 0.24,
    "60h": 0.24,
    "100": 0.24,
    "200": 0.24,
    "400": 0.14,
    "100h": 0.24,
    "110h": 0.24,
    "200h": 0.24,
    "400h": 0.14
}

poengsteg = 50 

class Poengberegner:

    @staticmethod
    def beregn_for_resultater(kjønn, resultatforløp):
        nye_resultatforløp = {}
        for resultat, (klubb, forløp) in resultatforløp.items():
            try:
                beregnet_poeng = Poengberegner.beregn_resultat(kjønn, resultat)
            except ValueError:
                beregnet_poeng = None
            nye_resultatforløp[resultat] = (beregnet_poeng, klubb, forløp)
        return nye_resultatforløp
    
    @staticmethod
    def beregn_resultat(kjønn, resultat):
        if kjønn not in ("menn", "kvinner"):
            raise ValueError(f"Støtter ikke poengberegning for kjønnet: {kjønn}.")
        if resultat.øvelseskode not in grenseverdier[kjønn]:
            raise ValueError(f"Støtter ikke poengberegning for øvelsen: {resultat.øvelseskode}.")
        return Poengberegner.beregn(kjønn, resultat.øvelseskode, resultat.prestasjon)

    @staticmethod
    def beregn(kjønn, øvelse, råprestasjon):
        grenser = grenseverdier[kjønn][øvelse]

        prestasjon = Poengberegner.til_standard_resultatformat(råprestasjon, øvelse)
        nedre_grense = Poengberegner.finn_nedre_grense_ved_binærsøk(grenser, prestasjon)
        
        if nedre_grense == -1:
            return 0

        under = grenser[nedre_grense]
        over = grenser[nedre_grense+1]
        
        return poengsteg*(nedre_grense + (prestasjon-under)/(over-under)) + 1e-6

    @staticmethod
    def til_standard_resultatformat(prestasjon, øvelse):
        resultat = prestasjon.removesuffix("+").removesuffix("mx").replace(",",".")    
        
        try:            
            if len(resultat.split("."))==4:
                resultat = str(int(resultat.split(".")[0])*60*60+int(resultat.split(".")[1])*60+int(resultat.split(".")[2]))+"."+resultat.split(".")[3]
            
            if len(resultat.split("."))==3:
                resultat = str(int(resultat.split(".")[0])*60+int(resultat.split(".")[1]))+"."+resultat.split(".")[2]
            
            if øvelse in tillegg_ved_manuell_tid and len(resultat.split("."))==2:
                if len(resultat.split(".")[1])==1:
                    return float(resultat) + tillegg_ved_manuell_tid[øvelse]
        except Exception:
            raise ValueError(f"Ukjent resultatformat: {prestasjon}")
        
        return float(resultat)

    @staticmethod
    def til_lesveennlig_format(prestasjon):
        if prestasjon > 3600:
            return f"{int(prestasjon)//3600},{(int(prestasjon)%3600)//60},{(int(prestasjon)%60)//1},{100*(prestasjon % 1):.0f}"
        if prestasjon > 60:
            return f"{(int(prestasjon)%3600)//60},{(int(prestasjon)%60)//1},{100*(prestasjon % 1):.0f}"
        return str(prestasjon).replace(".",",")
    
    @staticmethod
    def finn_nedre_grense_ved_binærsøk(grenser, flytverdi):
        økende_grenser = grenser[1]>grenser[0]
        synkende_grenser = grenser[1]<grenser[0]

        nedre, øvre = (0, len(grenser) - 1)    
        while nedre < øvre:
            midt = nedre + (øvre - nedre) // 2
            if økende_grenser and flytverdi < grenser[midt]: øvre = midt
            elif økende_grenser and flytverdi >= grenser[midt+1]: nedre = midt+1
            elif synkende_grenser and flytverdi <= grenser[midt+1]: nedre = midt+1
            elif synkende_grenser and flytverdi > grenser[midt]: øvre = midt
            else: return midt
        if nedre < len(grenser)-1: 
            return -1
        
        raise ValueError("Skal ikke kunne ha et resultat bedre enn øverste grenseverdi")

    def prestasjon_fra_poeng(kjønn, øvelse, poeng):
        if poeng % 1 != 0:
            raise ValueError(f"Poeng skal være et heltall, men var: {poeng}")
        poeng = int(poeng)

        if poeng < 0:
            raise ValueError("Ingen prestasjon gir negative poenger.")
        if poeng == 0:
            raise ValueError("Det finnes ikke en svakeste prestastasjon som gir 0 poeng.")
        if poeng > 1300:
            raise ValueError("Det er ikke definert noen prestasjon for poenger større enn 1300")
        
        grenser = grenseverdier[kjønn][øvelse]

        if poeng % 50 == 0:
            return Poengberegner.til_lesveennlig_format(grenser[poeng//50])

        under = grenser[poeng//50]
        over = grenser[poeng//50+1]

        prestasjon = math.ceil(100*(under+(over-under)*(poeng/50-poeng//50)))/100

        return Poengberegner.til_lesveennlig_format(prestasjon)