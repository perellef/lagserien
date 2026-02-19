from srcc.main.batch_2_uttrekk.stevneuthenter import Stevneuthenter
from srcc.main.batch_2_uttrekk.terminlisteuthenter import Terminlisteuthenter
from srcc.main.batch_2_uttrekk.stevneforbinder import Stevneforbinder
from srcc.main.batch_2_uttrekk.statistikkhenting import Statistikkhenting
from srcc.main.batch_2_uttrekk.uttrekksperiodiserer import Uttrekksperiodiserer

from srcc.main.utils.orm._stevneinvitasjon import Stevneinvitasjon
from srcc.main.utils.orm._serie import Serie

from datetime import date

class Uttrekksbatch:

    batchnummer = 2

    @staticmethod
    def kjør(seriedata, serieår, uttrekksdato):
        assert uttrekksdato == date.today(), f"Uttrekksdato for uttrekksbatch må være dagens dato ({date.today()}), men var: {uttrekksdato}"

        stevner = Stevneuthenter.registrer_stevner(serieår, seriedata, uttrekksdato)
        seriedata.bulkinnsett_erstatt(stevner)

        stevneinvitasjoner = list(seriedata.hent(Stevneinvitasjon).filter(Stevneinvitasjon.stevnedato < date.today()).all())
        Terminlisteuthenter.finn_stevneinvitasjoner(serieår, stevneinvitasjoner)

        tilordnede_stevneinvitasjoner = Stevneforbinder.forbind_stevneinvitasjon_med_stevne(seriedata, serieår, stevneinvitasjoner)

        seriedata.slett_alle(Stevneinvitasjon)
        seriedata.bulkinnsett(tilordnede_stevneinvitasjoner)

        menn_resultatforløp = {}
        kvinner_resultatforløp = {}

        klubbkretser = {}

        Statistikkhenting.innsett_statistikk(serieår, seriedata, klubbkretser, menn_resultatforløp, kvinner_resultatforløp)
        Uttrekksperiodiserer.periodiser_uttrekksresultater(seriedata, serieår, uttrekksdato, menn_resultatforløp, kvinner_resultatforløp)
        Uttrekksperiodiserer.periodiser_klubbkretser(seriedata, uttrekksdato, klubbkretser)
        