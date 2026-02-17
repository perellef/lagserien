from srcc.main.utils.orm._arkiv_kvinne_sluttplasseringer import ArkivKvinneSluttplassering
from srcc.main.utils.orm._arkiv_mann_sluttplasseringer import ArkivMannSluttplassering
from srcc.main.utils.orm._artikkel import Artikkel
from srcc.main.utils.orm._batchkjøring import Batchkjøring
from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._klubb_unntatt_overbygning import KlubbUnntattOverbygning
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.utils.orm._kvinne_lag import KvinneLag
from srcc.main.utils.orm._kvinne_laginfo import KvinneLaginfo
from srcc.main.utils.orm._kvinne_lagresultat import KvinneLagresultat
from srcc.main.utils.orm._kvinne_lagplassering import KvinneLagplassering
from srcc.main.utils.orm._kvinne_serieresultat import KvinneSerieresultat
from srcc.main.utils.orm._kvinne_serieøvelse import KvinneSerieøvelse
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat
from srcc.main.utils.orm._kvinne_topplag import KvinneTopplag
from srcc.main.utils.orm._mann_lag import MannLag
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._mann_serieøvelse import MannSerieøvelse
from srcc.main.utils.orm._mann_topplag import MannTopplag
from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._oppstillingskrav import Oppstillingskrav
from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._øvelsesregel import Øvelsesregel
from srcc.main.utils.orm._overbygning import Overbygning
from srcc.main.utils.orm._overklubb import Overklubb
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._resultatbytte import Resultatbytte
from srcc.main.utils.orm._rullestolutøver import Rullestolutøver
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._stevneinvitasjon import Stevneinvitasjon
from srcc.main.utils.orm._utøver_unntatt_overbygning import UtøverUnntattOverbygning
from srcc.main.utils.orm._utøver import Utøver


from enum import Enum

class Skjema(Enum):

     METADATA = (Batchkjøring,)
     BAKGRUNN = (Serie, Klubb, Stevne, Øvelse, Utøver, Resultat, Resultatbytte)
     GYLDIGHET = (Øvelsesregel, Rullestolutøver)
     REPRESENTASJON = (Klubbtilhørighet, Ferierepresentasjon, Overklubb, Overbygning, KlubbUnntattOverbygning, UtøverUnntattOverbygning)
     KALKULATORMAT = (KvinneTopplag, MannTopplag, KvinneSerieøvelse, MannSerieøvelse, Oppstillingskrav)
     UTTREKK = (Klubbkrets, MannUttrekksresultat, KvinneUttrekksresultat)
     MANIPULATOR = (MannSerieresultat, KvinneSerieresultat)
     SERIE = (KvinneLag, KvinneLaginfo, KvinneLagresultat, KvinneLagplassering, MannLag, MannLaginfo, MannLagresultat, MannLagplassering)
     RAPPORT = (ArkivKvinneSluttplassering, ArkivMannSluttplassering)
     NETTSIDE = (Artikkel, Stevneinvitasjon)

     def __init__(self, *cls):
          self.__cls = cls
     
     def __iter__(self):
          return iter(self.__cls)
