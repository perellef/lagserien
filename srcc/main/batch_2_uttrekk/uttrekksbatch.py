from srcc.main.batch_2_uttrekk.statistikkhenting import Statistikkhenting
from srcc.main.batch_2_uttrekk.uttrekksperiodiserer import Uttrekksperiodiserer

from datetime import date

class Uttrekksbatch:

    batchnummer = 2

    @staticmethod
    def kjør(seriedata, serieår, uttrekksdato):
        assert uttrekksdato == date.today(), f"Uttrekksdato for uttrekksbatch må være dagens dato ({date.today()}), men var: {uttrekksdato}"

        menn_resultatforløp = {}
        kvinner_resultatforløp = {}

        klubbkretser = {}

        Statistikkhenting.innsett_statistikk(serieår, seriedata, klubbkretser, menn_resultatforløp, kvinner_resultatforløp)
        Uttrekksperiodiserer.periodiser_uttrekksresultater(seriedata, serieår, uttrekksdato, menn_resultatforløp, kvinner_resultatforløp)
        Uttrekksperiodiserer.periodiser_klubbkretser(seriedata, uttrekksdato, klubbkretser)
        