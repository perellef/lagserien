import sys
sys.path.append('./')

from bs4 import BeautifulSoup
import requests
from datetime import date, timedelta
import re

from srcc.main.utils.orm._stevne import Stevne

url = "https://www.minfriidrettsstatistikk.info/php/Stevner.php"

class Stevneuthenter:

    @staticmethod
    def registrer_stevner(serieår, seriedata, uttrekksdato):
        til_dato = lambda x: date.fromisoformat('-'.join(x.split(".")[::-1]))
        er_nasjonalt = lambda x: not (len(x.split("/")) > 1 and x.split("/")[-1][-4:].isupper())    

        stevner = {stevne.stevne_id: stevne for stevne in seriedata.hent(Stevne).all()}
        for er_utendørs, år in (["N", serieår], ["Y", serieår], ["N", serieår+1]):
            full_url = f"{url}?outdoor={er_utendørs}&showseason={år}"

            try:
                data = BeautifulSoup(requests.get(full_url, timeout=1000).text, "lxml")
            except (requests.ConnectionError, requests.Timeout):
                raise RuntimeError(f"Mangler nett-tilgang og får ikke lastet inn klubbid-er.")

            all_stevnedata = data.find_all("tr")
            for stevnedata in list(all_stevnedata)[1:]:
                
                match = re.search(r'posttoresultlist\((\d+)\)', str(stevnedata))
                if not match:
                    raise ValueError("Klarte ikke å hente ut statistikkstevne_id fra stevne i statistikken")
                
                stevne_id = int(match.group(1))

                stevneinfo = [el.get_text() for el in stevnedata.find_all("td")]

                stevner[stevne_id] = Stevne(
                    stevne_id=stevne_id,
                    stevnedato=til_dato(stevneinfo[0]),
                    stevnetittel=stevneinfo[1],
                    arena=stevneinfo[2],
                    sted=stevneinfo[3],
                    er_nasjonalt=er_nasjonalt(stevneinfo[3]),
                    rapportert=stevner[stevne_id].rapportert if (stevne_id in stevner) else date.today()
                )

        seriedata.bulkinnsett_erstatt(list(stevner.values()))