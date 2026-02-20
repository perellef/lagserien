import sys
sys.path.append('./')

from bs4 import BeautifulSoup
import requests
from datetime import date, timezone

from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._resultat import Resultat

from datetime import datetime
from collections import defaultdict

from srcc.main.utils.varsel import Varsel

import time
        
til_øvelseskode = {
    "2": "60",
    "4": "100",
    "5": "200",
    "7": "400",
    "9": "800",
    "11": "1500",
    "13": "3000",
    "14": "5000",
    "15": "10000",
    "120": "3000H",
    "121": "3000H",
    "21": "60h",
    "24": "60h",
    "35": "100h",
    "42": "110h",
    "45": "200h",
    "57": "400h",
    "59": "400h",
    "122": "3000K",
    "124": "5000K",
    "156": "10000K",
    "209": "20000K",
    "68": "høyde",
    "69": "hut",
    "70": "stav",
    "71": "lengde",
    "74": "lut",
    "75": "tresteg",
    "86": "kule",
    "83": "kule",
    "90": "diskos",
    "93": "diskos",
    "103": "slegge",
    "106": "slegge",
    "96": "spyd",
    "98": "spyd"
}

url = "http://www.minfriidrettsstatistikk.info/php/SeriePoengPrKlubb.php"

class Statistikkhenting:

    @staticmethod
    def innles_statistikk(serieår, seriedata, klubbkretser, menn_resultatforløp, kvinner_resultatforløp):
        resultathash = Statistikkhenting.__finn_resultathash(seriedata)
        kjernenavn_overflødigheter = Statistikkhenting.__finn_kjernenavn_overflødigheter()
        seriedata.lukk()

        data = Statistikkhenting.last_inn_statistikk(serieår)
        innsettdata = Statistikkhenting.klargjør_data(data, menn_resultatforløp, kvinner_resultatforløp, klubbkretser, resultathash, kjernenavn_overflødigheter)

        seriedata.åpne()
        return list(innsettdata[Klubb]), list(innsettdata[Utøver]), list(innsettdata[Resultat])
    
    @staticmethod
    def __finn_resultathash(seriedata):
        resultathash = {}
        for resultat in seriedata.hent(Resultat).all():
            resultathash[(resultat.stevne_id, resultat.utøver_id, resultat.øvelseskode, resultat.prestasjon, resultat.dato, resultat.statistikk_resultat_id)] = resultat
        return resultathash
    
    @staticmethod
    def __lastInnKlubbID():    
        try:
            data = BeautifulSoup(requests.get(url, timeout=1000).text, "lxml")
        except (requests.ConnectionError, requests.Timeout):
            raise RuntimeError(f"Mangler nett-tilgang og får ikke lastet inn klubbid-er.")
        klubber = data.find("select",{"name":"showclub"})

        return [int(el["value"]) for el in list(klubber)[1:]]
    
    @staticmethod
    def last_inn_statistikk(serieår):
        klubb_ider = Statistikkhenting.__lastInnKlubbID()
        
        data = (defaultdict(dict), defaultdict(dict))

        for i,klubb_id in enumerate(klubb_ider, start=1):
            if i % 100 == 0:
                print(datetime.now(timezone.utc), f"{i//100}/{len(klubb_ider)//100}")

            for kjønn, kjønn_data in zip(["M","W"], data):
                krets, klubbnavn, resultatdata  = Statistikkhenting.skrap_klubbstatistikk(serieår, kjønn, klubb_id)

                kjønn_data[krets][(klubbnavn, klubb_id)] = resultatdata    
        return data

    @staticmethod
    def skrap_klubbstatistikk(serieår, kjønn, klubb_id):
        inputs = {'showclub': str(klubb_id), 'showgender': kjønn, 'showyear': str(serieår), "submit": "BEREGN"}

        forsøk = 0
        while True:
            try:
                response = requests.post(url, data=inputs, timeout=1000)
                htmldata = BeautifulSoup(response.text, "lxml")
                response.close()
            except (requests.ConnectionError, requests.Timeout):
                print("RuntimeError")
                raise RuntimeError(f"Mangler nett-tilgang og får ikke hentet statistikk til {klubb_id}.")                   

            try:
                html_klubb, html_resultater = htmldata.findAll("table", {"id":"liten"})
                break

            except ValueError:
                print("ValueError")
                time.sleep(5)

            forsøk += 1
            if forsøk >= 3:
                raise SystemError("Klarte ikke hente data")
            
        klubbnavn, krets_fullt, _ = [rad.text for rad in html_klubb.findAll("td")]
        krets = krets_fullt.removesuffix(" friidrettskrets")

        resultatdata = [[verdi.text for verdi in rad.findAll("td")] for rad in html_resultater] 
            
        return krets, klubbnavn, resultatdata 

    @staticmethod
    def klargjør_data(data, menn_resultatforløp, kvinner_resultatforløp, klubbkretser, resultathash, kjernenavn_overflødigheter):
        datoformater = lambda x: date.fromisoformat('-'.join(x.split(".")[::-1]))
        
        innsettdata = {Klubb: set(), Utøver: set(), Resultat: set()}
        for kjønn_data, resultatforløp in zip(data, (menn_resultatforløp, kvinner_resultatforløp)):
            for krets, klubbdata in kjønn_data.items():
                for (klubbnavn, klubb_id), resultatdata in klubbdata.items():
                    
                    innsettdata[Klubb].add(klubb := Klubb(klubb_id=klubb_id, klubbnavn=klubbnavn, kjernenavn=Statistikkhenting.__utled_kjernenavn(klubbnavn, kjernenavn_overflødigheter)))
                    klubbkretser[klubb_id] = krets.removesuffix(" Friidrettskrets")

                    for _, øvelse_id, navn, f_år, utøver_id, prestasjon, statistikk_resultat_id, _, sted, stevne_id, dato in resultatdata[1:]:
                        resultat = Statistikkhenting.__innsett_resultat_og_relatert(innsettdata, øvelse_id, navn, f_år, int(utøver_id), prestasjon, int(stevne_id), datoformater(dato), int(statistikk_resultat_id), resultathash)
                        resultatforløp[resultat] = klubb

        return innsettdata

    @staticmethod
    def __lag_resultat(resultathash, data, stevne_id, utøver_id, øvelseskode, prestasjon, dato, statistikk_resultat_id):
        
        if (r_tpl := (stevne_id, utøver_id, øvelseskode, prestasjon, dato, statistikk_resultat_id)) in resultathash:
            resultat = resultathash[r_tpl]
        else:
            resultat = Resultat(stevne_id=stevne_id, utøver_id=utøver_id, øvelseskode=øvelseskode, prestasjon=prestasjon, dato=dato, statistikk_resultat_id=statistikk_resultat_id)
            resultathash[r_tpl] = resultat
            data[Resultat].add(resultat)
        return resultat

    @staticmethod
    def __innsett_resultat_og_relatert(data, øvelse_id, navn, f_år, utøver_id, prestasjon, stevne_id, dato, statistikk_resultat_id, resultathash): 
        null_hvis_0000 = lambda x: int(x) if x != '0000' else None 
        
        resultat = Statistikkhenting.__lag_resultat(resultathash, data, stevne_id, utøver_id, til_øvelseskode[øvelse_id], prestasjon, dato, statistikk_resultat_id)
        data[Utøver].add(Utøver(utøver_id=utøver_id, navn=navn.strip(), fødselsår=null_hvis_0000(f_år)))

        return resultat

    def __finn_kjernenavn_overflødigheter():
        with open("srcc/main/batch_2_uttrekk/kjernenavn_overflødig.txt" ,"r", encoding='utf-8') as f:
            return [e.strip("\n") for e in f.readlines()]
        
    def __utled_kjernenavn(klubbnavn, kjernenavn_overflødigheter):
        enkeltdeler = klubbnavn.split(" ")
        for overflødighet in kjernenavn_overflødigheter:
            try: enkeltdeler.remove(overflødighet)
            except ValueError: pass
        return ' '.join(enkeltdeler)
