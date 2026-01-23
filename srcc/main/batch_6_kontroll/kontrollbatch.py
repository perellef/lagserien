from srcc.main.batch_6_kontroll.stevneuthenter import Stevneuthenter
from srcc.main.batch_6_kontroll.terminlisteuthenter import Terminlisteuthenter
from srcc.main.batch_6_kontroll.stevneforbinder import Stevneforbinder

from srcc.main.utils.orm._stevneinvitasjon import Stevneinvitasjon
from srcc.main.utils.orm._serie import Serie

from datetime import date

class Kontrollbatch:

    batchnummer = 6
    
    @staticmethod
    def kjør(seriedata, serieår, uttrekksdato):
        assert uttrekksdato == date.today(), f"Uttrekksdato for kontrollbatch må være dagens dato ({date.today()}), men var: {uttrekksdato}"
        # TODO: støtte at den registrerer stevner for here serieåret. 
        # Nå støtter den kun ett helt kalenderår, men serien kan også
        # vare f.eks 2020.10.01 -> 2021.12.31, og da må dette støttes. 

        Stevneuthenter.registrer_stevner(serieår, seriedata, uttrekksdato)
        stevneinvitasjoner = Terminlisteuthenter.finn_stevneinvitasjoner(serieår, seriedata)

        tilordnede_stevneinvitasjoner = Stevneforbinder.forbind_stevneinvitasjon_med_stevne(seriedata, serieår, stevneinvitasjoner)

        seriedata.slett_alle(Stevneinvitasjon)
        seriedata.bulkinnsett(tilordnede_stevneinvitasjoner)
