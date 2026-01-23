from srcc.main.batch_1_grunnlag.topplagsetter import Topplagsetter
from srcc.main.batch_1_grunnlag.konfiginnhenting import Konfiginnhenting

class Grunnlagsbatch:

    batchnummer = 1

    @staticmethod
    def kjør(seriedata, serieår, uttrekksdato):

        Topplagsetter.sett_topplag(serieår, seriedata)
        Konfiginnhenting.innsett_konfig(serieår, seriedata)