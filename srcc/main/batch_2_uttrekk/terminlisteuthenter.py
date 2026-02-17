import sys
sys.path.append('./')

from srcc.main.utils.orm._stevneinvitasjon import Stevneinvitasjon

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager

from bs4 import BeautifulSoup
from datetime import date

url = "https://www.friidrett.no/terminliste/"

class Terminlisteuthenter:

    @staticmethod
    def finn_stevneinvitasjoner(serieår, seriedata):

        options = Options()
        options.add_argument("--headless")  # Run in headless mode (no GUI)
        options.add_argument("--disable-gpu")
        options.add_argument("--window-size=1920,1080")
        options.add_argument("--no-sandbox")  # Bypass OS security model
        options.add_argument("--disable-dev-shm-usage")

        service = Service(ChromeDriverManager().install())
        service.log_output = None  # Suppresses logs
        
        forsøk = 0
        while True:
            if forsøk == 5:
                raise ConnectionRefusedError
            
            try:
                driver = webdriver.Chrome(service=service, options=options)
                driver.set_page_load_timeout(20)
                driver.get(url)
                break
            except TimeoutException:
                driver.quit()
                print("Page load timed out!")
                forsøk += 1

        vis_alle_knapp = driver.find_elements(By.XPATH, "//button[p[contains(text(), 'Vis alle')]]")
        stevneantall_span = driver.find_elements(By.XPATH, "//button[p[contains(text(), 'Vis alle')]]//span")

        assert len(vis_alle_knapp) == 1, f"Skal finnes nøyaktig én 'Vis alle' knapp, men fantes {len(vis_alle_knapp)}"
        assert len(stevneantall_span) == 1, f"Skal finnes nøyaktig ett sted som angir antall forventede stevneinvitasjoner, men fantes {len(stevneantall_span)}"

        forventet_antall_stevneinvitasjoner = int(stevneantall_span[0].text[1:-1])

        vis_alle_knapp[0].click()
        terminliste = driver.find_elements(By.XPATH, "//a[contains(@href, '?eventId=')]")

        assert forventet_antall_stevneinvitasjoner == len(terminliste), f"Antallet forventede stevneinvitasjoner {forventet_antall_stevneinvitasjoner} matcher ikke det antall hentede: {len(terminstevner)}"

        måneder = ["jan", "feb", "mar", "apr", "mai", "jun", "jul", "aug", "sep", "okt", "nov", "des"]

        stevner_info = set()
        for terminliste_element in terminliste: 
            soup = BeautifulSoup(terminliste_element.get_attribute("innerHTML"), 'html.parser')

            dag, måned, år, stevneinfo, *_ = [p.text for p in soup.find_all('p')]
            
            if int(år) != serieår:
                continue
            
            arrangør, arena = stevneinfo.split(" - ", maxsplit=1)

            dato = date(int(år), måneder.index(måned)+1, int(dag))

            stevnetittel = soup.find('h3').text
            krets = soup.find('h4').text

            stevner_info.add((dato, stevnetittel, arena, arrangør, krets))

        nye_stevneinvitasjoner = []
        for (dato, stevnetittel, arena, arrangør, krets) in stevner_info:
            stevneinvitasjon = Stevneinvitasjon(
                stevne_id=None,
                stevnedato=dato,
                stevnetittel=stevnetittel,
                arena=arena,
                arrangør=arrangør,
                krets=krets,
                skal_vises=True,
                er_manuelt_satt_stevne_id=False
            )
            nye_stevneinvitasjoner.append(stevneinvitasjon)

        driver.quit()

        utløpte_stevneinvitasjoner = list(seriedata.hent(Stevneinvitasjon).filter(Stevneinvitasjon.stevnedato < date.today()).all())
        
        return utløpte_stevneinvitasjoner + nye_stevneinvitasjoner
