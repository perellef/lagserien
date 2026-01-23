from srcc.main.kontrollsenter.tilganger import Tilganger
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._kvinne_lagresultat import KvinneLagresultat
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._kvinne_laginfo import KvinneLaginfo
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._kvinne_lagplassering import KvinneLagplassering
from srcc.main.utils.orm._arkiv_mann_sluttplasseringer import ArkivMannSluttplassering
from srcc.main.utils.orm._arkiv_kvinne_sluttplasseringer import ArkivKvinneSluttplassering
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._kvinne_serieøvelse import KvinneSerieøvelse
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._kvinne_serieresultat import KvinneSerieresultat
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from datetime import date
from collections import defaultdict

from sqlalchemy.orm import selectinload, joinedload

import xlsxwriter
import io

formater = {
    'bakgrunn': {'bg_color': '#8AB8EA', 'pattern': 1},
    'bakgrunn_venstre_tabellkant': {'bg_color': '#8AB8EA', 'pattern': 1, 'left': 5},
    'bakgrunn_høyre_tabellkant': {'bg_color': '#8AB8EA', 'pattern': 1, 'right': 5},
    'bakgrunn_øvre_tabellkant': {'bg_color': '#8AB8EA', 'pattern': 1, 'top': 5},
    'bakgrunn_nedre_tabellkant': {'bg_color': '#8AB8EA', 'pattern': 1, 'bottom': 5},
    'skille': {'bg_color': '#041465', 'pattern': 1},
    'tabelloverskrift': {'bold': True, 'font_color': '#FFFFFF', 'font_name': 'Arial', 'font_size': 14, 'bg_color': '#041465', 'pattern': 1, 'align': 'center'},
    'tabellunderoverskrift': {'bold': True, 'font_color': '#000000', 'font_name': 'Arial', 'font_size': 12, 'bg_color': '#8AB8EA', 'pattern': 1},
    'tabellattributt': {'bold': True, 'font_color': '#FFFFFF', 'font_name': 'Arial', 'font_size': 10, 'bg_color': '#041465', 'pattern': 1, 'left': 1, 'right': 1, 'top': 1, 'bottom': 1},
    'tabellverdi': {'bold': True, 'font_color': '#974706', 'font_name': 'Arial', 'font_size': 10, 'bg_color': '#DADCDC', 'pattern': 1},
    'tabellverdi_høyre': {'bold': True, 'font_color': '#974706', 'font_name': 'Arial', 'font_size': 10, 'bg_color': '#DADCDC', 'pattern': 1, 'align': 'right'},
    'tabellverdi_kantet': {'bold': True, 'font_color': '#974706', 'font_name': 'Arial', 'font_size': 10, 'bg_color': '#DADCDC', 'pattern': 1, 'left': 1, 'right': 1, 'top': 1, 'bottom': 1},
    'tabellverdi_kantet_dato': {'bold': True, 'font_color': '#974706', 'font_name': 'Arial', 'font_size': 10, 'bg_color': '#DADCDC', 'pattern': 1, 'left': 1, 'right': 1, 'top': 1, 'bottom': 1, 'num_format': 'dd.mm'},
    'tabellverdi_kantet_venstre': {'bold': True, 'font_color': '#974706', 'font_name': 'Arial', 'font_size': 10, 'bg_color': '#DADCDC', 'pattern': 1, 'left': 1, 'right': 1, 'top': 1, 'bottom': 1, 'align': 'left'},
    'tabellverdi_kantet_høyre': {'bold': True, 'font_color': '#974706', 'font_name': 'Arial', 'font_size': 10, 'bg_color': '#DADCDC', 'pattern': 1, 'left': 1, 'right': 1, 'top': 1, 'bottom': 1, 'align': 'right'},
    'uthevet_felt': {'bold': True, 'font_color': '#974706', 'font_name': 'Arial', 'font_size': 10, 'bg_color': '#DADCDC', 'pattern': 1, 'left': 5, 'right': 5, 'top': 5, 'bottom': 5},
    'stort_felt': {'bold': True, 'font_color': '#974706', 'font_name': 'Arial', 'font_size': 18, 'bg_color': '#DADCDC', 'pattern': 1, 'align': 'center'}
}


def til_lagnavn(klubbnavn, lagnummer):
    if lagnummer == 1:
        return klubbnavn
    return f"{klubbnavn} {lagnummer}. lag"

def til_fjorårsplassering(arkiv_sluttplasseringer, lag, div):
    try:
        fjorårsdivisjon, fjorårsplassering = arkiv_sluttplasseringer[(lag.klubb_id, lag.lagnummer)]
    except KeyError:
        return "-"
    
    if fjorårsdivisjon == div:
        return fjorårsplassering
    return f"{fjorårsdivisjon}d{fjorårsplassering}"

class Worksheet:
    def __init__(self, ws, formater):
        self.__ws = ws
        
        self.__ws.conditional_format('A1:XFD1048576', {
            'type': 'blanks',
            'format': formater["bakgrunn"]
        })

        self.__formater = formater

    def write(self, rad=None, kol=None, stil=None, verdi=None):
        self.__ws.write(rad-1, kol-1, verdi, self.__formater[stil])

    def write_datetime(self, rad=None, kol=None, stil=None, verdi=None):
        self.__ws.write_datetime(rad-1, kol-1, verdi, self.__formater[stil])

    def set_column(self, fra_kol=None, til_kol=None, verdi=None):
        self.__ws.set_column(fra_kol-1, til_kol-1, verdi)

    def set_row(self, rad, verdi=None):
        self.__ws.set_row(rad-1, verdi)

    def merge_range(self, fra_rad=None, fra_kol=None, til_rad=None, til_kol=None, stil=None, verdi=None):
        self.__ws.merge_range(fra_rad-1, fra_kol-1, til_rad-1, til_kol-1, verdi, self.__formater[stil])

class ExcelSerieark:

    @staticmethod
    def produser_offisielle_serieark(seriedata, serieår):
        aktuell_dato = seriedata.hent(Serie).filter_by(serieår=serieår).one().avsluttet
        if aktuell_dato is None:
            aktuell_dato = date.today()
        
        klubbkretser = (seriedata.hent(Klubbkrets)
                .filter((Klubbkrets.til_og_med == None) | (Klubbkrets.til_og_med >= aktuell_dato))
                .filter((Klubbkrets.fra_og_med <= aktuell_dato))
                .all())

        kretser = sorted(set(el.krets for el in klubbkretser))

        "Definerer filer og ark i egen dict"

        div_1_2 = io.BytesIO()
        menn_3 = io.BytesIO()
        kvinner_3 = io.BytesIO()
        kretsrapporter = [io.BytesIO() for _ in kretser]
        
        wb_div_1_2 = xlsxwriter.Workbook(div_1_2, {'in_memory': True})
        wb_menn_3 = xlsxwriter.Workbook(menn_3, {'in_memory': True})
        wb_kvinner_3 = xlsxwriter.Workbook(kvinner_3, {'in_memory': True})
        wb_kretsrapporter = [xlsxwriter.Workbook(kretsrapport, {'in_memory': True}) for kretsrapport in kretsrapporter]
        
        wb_formater = {}
        for wb in (wb_div_1_2, wb_menn_3, wb_kvinner_3, *wb_kretsrapporter):
            wb_formater[wb] = {}
            for formatnavn, format in formater.items():
                wb_formater[wb][formatnavn] = wb.add_format(format.copy())

        ark = {
            "menn": {
                "1.d": {},
                "2.d": {},
                "3.d": {},
            },
            "kvinner": {
                "1.d": {},
                "2.d": {},
                "3.d": {},
            }
        }

        # lager faner
        for kj,dokument in zip(["menn","kvinner"],[wb_menn_3,wb_kvinner_3]):

            # 1. og 2. divisjon

            for div in ["1.d","2.d"]:
                ark[kj][div][None] = {}
                for fane in ["Tabell","Detaljer"]:
                    ark[kj][div][None][fane] = Worksheet(wb_div_1_2.add_worksheet(f"{fane} {kj} {div}"), wb_formater[wb_div_1_2]) 

            # 3. divisjon

            ark[kj]["3.d"][None] = {}
            ark[kj]["3.d"][None]["Tabell"] = Worksheet(dokument.add_worksheet("Tabell"), wb_formater[dokument])
            for krets in kretser:
                ark[kj]["3.d"][None][krets] = Worksheet(dokument.add_worksheet(krets), wb_formater[dokument])

        for wb_kretsrapport, krets in zip(wb_kretsrapporter, kretser): 
            for kj in ["menn","kvinner"]:

                # Kretsrapport
                ark[kj][f"3.d"][krets] = {
                    "Tabell": Worksheet(wb_kretsrapport.add_worksheet(f"{kj} tabell"),  wb_formater[wb_kretsrapport]),
                    "Detaljer": Worksheet(wb_kretsrapport.add_worksheet(f"{kj} detaljer"),  wb_formater[wb_kretsrapport])
                }


        for kj,Lagplassering,Laginfo,Lagresultat,Serieresultat,Serieøvelse,ArkivSluttplassering in zip(["menn","kvinner"], [MannLagplassering, KvinneLagplassering], [MannLaginfo, KvinneLaginfo], [MannLagresultat, KvinneLagresultat], [MannSerieresultat, KvinneSerieresultat], [MannSerieøvelse, KvinneSerieøvelse], [ArkivMannSluttplassering, ArkivKvinneSluttplassering]):
                
            laginfoer = seriedata.hent(Laginfo).filter_by(serieår=serieår).filter(Laginfo.fra_og_med <= aktuell_dato).filter((Laginfo.til_og_med == None) | (Laginfo.til_og_med >= aktuell_dato)).all()
            lagresultater = (seriedata.hent(Lagresultat)
                    .options(
                        joinedload(Lagresultat.lag),
                        selectinload(Lagresultat.resultat).selectinload(Resultat.utøver),
                        selectinload(Lagresultat.resultat).selectinload(Resultat.øvelse),
                        selectinload(Lagresultat.resultat).selectinload(Resultat.stevne)
                    )
                    .filter_by(serieår=serieår)
                    .filter((Lagresultat.til_og_med == None) | (Lagresultat.til_og_med >= aktuell_dato))
                    .all())
            arkiv_sluttplasseringer = {(el.klubb_id, el.lagnummer): (el.divisjon, el.plassering) for el in seriedata.hent(ArkivSluttplassering).filter_by(serieår=serieår-1).all()}
            serieresultater = seriedata.hent(Serieresultat).filter((Serieresultat.til_og_med == None) | (Serieresultat.til_og_med >= aktuell_dato)).all()
            serieøvelser = seriedata.hent(Serieøvelse).filter_by(serieår=serieår).all()

            klubbkretser = {el.klubb_id: el.krets for el in seriedata.hent(Klubbkrets).filter((Klubbkrets.fra_og_med <= aktuell_dato) & ((Klubbkrets.til_og_med == None) | (aktuell_dato <= Klubbkrets.til_og_med))).all()}
            klubbnavn = {el.klubb_id: el.klubbnavn for el in seriedata.hent(Klubb).all()}

            øvelser_prioritet = {serieøvelse.øvelseskode: serieøvelse.prioritet for serieøvelse in serieøvelser}
            poenger = {serieresultat.resultat_id: serieresultat.poeng for serieresultat in serieresultater}

            lagresultater_lag = defaultdict(list)
            for lagresultat in lagresultater:
                lagresultater_lag[lagresultat.lag].append(lagresultat)
            for lag,lagresulatene in lagresultater_lag.items():
                lagresultater_lag[lag] = (
                    list(sorted(filter(lambda x: x.oppstillingstype=='OBLIGATORISK', lagresulatene), key=lambda x: øvelser_prioritet[x.resultat.øvelseskode])),
                    list(sorted(filter(lambda x: x.oppstillingstype=='VALGFRI', lagresulatene), key=lambda x: (poenger[x.resultat_id], x.resultat.øvelse.øvelsesnavn, x.resultat.utøver.navn), reverse=True))
                )
            laginfoer_lag = {laginfo.lag: laginfo for laginfo in laginfoer}
            for div in [1,2,3]: 

                oppstillingskrav = seriedata.hent(Oppstillingskrav).filter_by(serieår=serieår, divisjon=div).one()

                N_obl = oppstillingskrav.antall_obligatoriske
                N_val = oppstillingskrav.antall_valgfri

                lagplasseringer = seriedata.hent(Lagplassering).filter_by(serieår=serieår).filter(Lagplassering.fra_og_med <= aktuell_dato).filter_by(divisjon=div).filter((Lagplassering.til_og_med == None) | (Lagplassering.til_og_med >= aktuell_dato)).order_by(Lagplassering.plassering).all()
                
                for kretsrapport in [None, *kretser]:
                    kretsindeks_teller = {}
                    for krets in kretser:
                        kretsindeks_teller[krets] = 0

                    if div != 3 and kretsrapport != None:
                        continue 

                    "Fyller alle excelark med verdier"
                    
                    # setter opp tabellark
                    tabellark = ark[kj][f"{div}.d"][kretsrapport]["Tabell"]
                    tabellark.merge_range(fra_rad=1, fra_kol=1, til_rad=1, til_kol=6, stil='tabelloverskrift', verdi=f"{div}. DIVISJON {kj.upper()} {serieår} TOTALT")
                    
                    tabellark.set_row(rad=1, verdi=18)
                    for rad in range(2,len(lagplasseringer)+3):
                        tabellark.set_row(rad=rad+1, verdi=13)
                    
                    for kol,bredde in enumerate([4.36,24.55,7.64,8.73,7.64,16.45]):
                        tabellark.set_column(fra_kol=kol+1, til_kol=kol+1, verdi=bredde)

                    for arknavn,detaljark in ark[kj][f"{div}.d"][kretsrapport].items():
                        if arknavn=="Tabell":
                            continue

                        for side in [0,10]:
                            for kol,bredde in enumerate([0.56,19.36,38.82,7.73,10.73,9.18,21.27,6.36,0.56,4.73]):
                                detaljark.set_column(fra_kol=kol+side+1, til_kol=kol+side+1, verdi=bredde)        

                    # setter opp lagoppsett-ark    
                    for lagplassering in lagplasseringer:
                        
                        krets = klubbkretser[lagplassering.klubb_id]
                        if kretsrapport not in (None, krets):
                            continue

                        if div in (1,2):
                            pos = lagplassering.plassering-1
                            tabellpos = lagplassering.plassering-1
                            plassering = pos+1 if laginfoer_lag[lagplassering.lag].poeng >= 5000 or div < 3 else "​"
                            
                            detaljark = ark[kj][f"{div}.d"][kretsrapport]["Detaljer"]
                        elif kretsrapport == None:
                            pos = kretsindeks_teller[krets]
                            tabellpos = lagplassering.plassering-1
                            kretsindeks_teller[krets] += 1
                            plassering = lagplassering.plassering if laginfoer_lag[lagplassering.lag].poeng >= 5000 or div < 3 else "​"

                            detaljark = ark[kj]["3.d"][kretsrapport][krets]
                        else:
                            pos = kretsindeks_teller[krets]
                            tabellpos = pos+1
                            plassering = pos+1 if laginfoer_lag[lagplassering.lag].poeng >= 5000 or div < 3 else "​"
                            kretsindeks_teller[krets] += 1

                            detaljark = ark[kj]["3.d"][kretsrapport]["Detaljer"]

                        " Setter inn overordnet laginfo i tilhørende tabellark "
                        
                        # TODO: ny måte å finne plassering på (3 ulike utfall (eller 2?))

                        tabellark.write(rad=tabellpos+3, kol=1, stil="tabellverdi", verdi=plassering)
                        tabellark.write(rad=tabellpos+3, kol=2, stil="tabellverdi", verdi=til_lagnavn(klubbnavn[lagplassering.klubb_id], lagplassering.lagnummer))
                        tabellark.write(rad=tabellpos+3, kol=3, stil="tabellverdi", verdi=f"({laginfoer_lag[lagplassering.lag].antall_noteringer}/{laginfoer_lag[lagplassering.lag].antall_deltakere})")
                        tabellark.write(rad=tabellpos+3, kol=4, stil="tabellverdi", verdi=laginfoer_lag[lagplassering.lag].poeng)
                        tabellark.write(rad=tabellpos+3, kol=5, stil="tabellverdi_høyre", verdi=til_fjorårsplassering(arkiv_sluttplasseringer, lagplassering.lag, div))
                        tabellark.write(rad=tabellpos+3, kol=6, stil="tabellverdi", verdi=krets)
                
                        " Setter inn detaljert laginfo i tilhørende detaljark "

                        al = pos % 2
                        
                        rad = int((1/2)*(pos-al))*(N_obl+N_val+22)+1
                        kol = 10*al
                        
                        for h in range(rad,rad+N_obl+N_val+21):
                            detaljark.write(rad=h, kol=kol+10, stil="skille", verdi="​")
                            detaljark.set_row(rad=h, verdi=13)
                        for h in range(1,11):
                            detaljark.write(rad=rad+N_obl+N_val+21, kol=kol+h, stil="skille", verdi="​")      
                                
                        " Lager obligatorisk og valgfri resultatbokser "
                        verdifunksjoner = [
                            lambda x: x.resultat.øvelse.øvelsesnavn,
                            lambda x: x.resultat.utøver.navn,
                            lambda x: 0 if x.resultat.utøver.fødselsår is None else x.resultat.utøver.fødselsår,
                            lambda x: x.resultat.prestasjon,
                            lambda x: poenger[x.resultat_id],
                            lambda x: x.resultat.stevne.sted,
                            lambda x: x.resultat.dato
                        ]   

                        for k,l,indeks in zip([0,N_obl+6],[N_obl,N_val], [0,1]):
                            attributter = ['ØVELSE','NAVN','FØDT ÅR','RESULTAT','POENG','STED','DATO']
                            for p, attributt in enumerate(attributter):
                                detaljark.write(rad=rad+k+7, kol=kol+p+2, stil='tabellattributt', verdi=attributt)
                            
                            oppstilling = lagresultater_lag[lagplassering.lag][indeks]
                            for oi,lagresultat in enumerate(oppstilling):
                                for i, f in enumerate(verdifunksjoner):
                                    if i==3:
                                        detaljark.write(rad=rad+k+oi+8, kol=kol+2+i, stil="tabellverdi_kantet_høyre", verdi=f(lagresultat))
                                    elif i==6:
                                        detaljark.write_datetime(rad=rad+k+oi+8, kol=kol+2+i, stil="tabellverdi_kantet_dato", verdi=f(lagresultat))
                                    else:
                                        detaljark.write(rad=rad+k+oi+8, kol=kol+2+i, stil="tabellverdi_kantet", verdi=f(lagresultat))

                                detaljark.write(rad=rad+k+oi+8, kol=kol+1, stil="bakgrunn_høyre_tabellkant", verdi="")
                                detaljark.write(rad=rad+k+oi+8, kol=kol+9, stil="bakgrunn_venstre_tabellkant", verdi="")
                            
                            for oi in range(len(oppstilling), l):
                                detaljark.write(rad=rad+k+oi+8, kol=kol+1, stil="bakgrunn_høyre_tabellkant", verdi="")
                                detaljark.write(rad=rad+k+oi+8, kol=kol+9, stil="bakgrunn_venstre_tabellkant", verdi="")
                                for i in range(len(verdifunksjoner)):
                                    detaljark.write(rad=rad+k+oi+8, kol=kol+2+i, stil="tabellverdi_kantet", verdi="​")
                                    
                            detaljark.write(rad=rad+k+7, kol=kol+1, stil='bakgrunn_høyre_tabellkant', verdi="")
                            detaljark.write(rad=rad+k+7, kol=kol+9, stil='bakgrunn_venstre_tabellkant', verdi="")
                            
                            for i in range(len(verdifunksjoner)):
                                detaljark.write(rad=rad+k+6, kol=kol+2+i, stil="bakgrunn_nedre_tabellkant", verdi="")
                                detaljark.write(rad=rad+k+l+8, kol=kol+2+i, stil="bakgrunn_øvre_tabellkant", verdi="")
                        
                        detaljark.write(rad=rad+1, kol=kol+2, stil='tabellattributt', verdi='Krets')
                        detaljark.write(rad=rad+2, kol=kol+2, stil='tabellattributt', verdi='Klubb')
                        detaljark.write(rad=rad+3, kol=kol+2, stil='tabellattributt', verdi='År')
                        detaljark.write(rad=rad+1, kol=kol+3, stil='tabellverdi_kantet', verdi=krets)
                        detaljark.write(rad=rad+2, kol=kol+3, stil='tabellverdi_kantet', verdi=til_lagnavn(klubbnavn[lagplassering.klubb_id], lagplassering.lagnummer))
                        detaljark.write(rad=rad+3, kol=kol+3, stil='tabellverdi_kantet_venstre', verdi=serieår)

                        detaljark.merge_range(fra_rad=rad+1, fra_kol=kol+6, til_rad=rad+2, til_kol=kol+7, stil="stort_felt", verdi=plassering)
                        
                        detaljark.write(rad=rad+5, kol=kol+2, stil='tabellunderoverskrift', verdi="OBLIGATORISKE ØVELSER")
                        detaljark.write(rad=rad+N_obl+11, kol=kol+2, stil='tabellunderoverskrift', verdi="VALGFRIE ØVELSER")

                        detaljark.write(rad=rad+N_obl+9, kol=kol+2, stil='tabellattributt', verdi="Antall noteringer:")
                        detaljark.write(rad=rad+N_obl+9, kol=kol+5, stil='tabellattributt', verdi="Sum:")
                        detaljark.write(rad=rad+N_obl+9, kol=kol+3, stil='uthevet_felt', verdi=len(lagresultater_lag[lagplassering.lag][0]))
                        detaljark.write(rad=rad+N_obl+9, kol=kol+6, stil='uthevet_felt', verdi=laginfoer_lag[lagplassering.lag].poeng_obligatoriske)
                
                        detaljark.write(rad=rad+N_obl+N_val+15, kol=kol+2, stil='tabellattributt', verdi="Antall noteringer:")
                        detaljark.write(rad=rad+N_obl+N_val+15, kol=kol+5, stil='tabellattributt', verdi="Sum:")
                        detaljark.write(rad=rad+N_obl+N_val+15, kol=kol+3, stil='uthevet_felt', verdi=len(lagresultater_lag[lagplassering.lag][1]))
                        detaljark.write(rad=rad+N_obl+N_val+15, kol=kol+6, stil='uthevet_felt', verdi=laginfoer_lag[lagplassering.lag].poeng_valgfri)
                
                        detaljark.write(rad=rad+N_obl+N_val+17, kol=kol+2, stil='tabellattributt', verdi="Noteringer totalt:")
                        detaljark.write(rad=rad+N_obl+N_val+17, kol=kol+5, stil='tabellattributt', verdi="Totalsum:")
                        detaljark.write(rad=rad+N_obl+N_val+19, kol=kol+2, stil='tabellattributt', verdi="Antall deltakere:")
                        detaljark.write(rad=rad+N_obl+N_val+17, kol=kol+3, stil='uthevet_felt', verdi=laginfoer_lag[lagplassering.lag].antall_noteringer)
                        detaljark.write(rad=rad+N_obl+N_val+17, kol=kol+6, stil='uthevet_felt', verdi=laginfoer_lag[lagplassering.lag].poeng)
                        detaljark.write(rad=rad+N_obl+N_val+19, kol=kol+3, stil='uthevet_felt', verdi=laginfoer_lag[lagplassering.lag].antall_deltakere)
                    
        wb_div_1_2.close()
        wb_menn_3.close()
        wb_kvinner_3.close()
        for wb_kretsrapport in wb_kretsrapporter:
            wb_kretsrapport.close()

        return {
            "div_1_2": div_1_2,
            "menn_3": menn_3,
            "kvinner_3": kvinner_3,
        } | {"kretsrapport_" + krets.lower().replace(" ","_"): kretsrapport for krets, kretsrapport in zip(kretser, kretsrapporter)}
