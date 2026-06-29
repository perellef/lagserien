from srcc.main.batch_6_notiser.notisgenerator import Notisgenerator
from srcc.main.batch_6_notiser.notisgrunnlag import Notisgrunnlag
from srcc.main.utils.orm._notis import Notis
from srcc.main.utils.orm._batchkjøring import Batchkjøring

from datetime import timedelta

class Notisbatch:

    batchnummer = 6

    @staticmethod
    def kjør(seriedata, serieår, uttrekksdato):
        neste_notisid = max([e.notis_id for e in seriedata.hent(Notis).all()], default=0) + 1

        tidligere_kjøringer = [e.uttrekksdato for e in (seriedata.hent(Batchkjøring).filter_by(serieår=serieår).filter_by(batch=4).all()) if e.uttrekksdato < uttrekksdato]
        if len(tidligere_kjøringer) == 0:
            return
    
        forrige = max(tidligere_kjøringer)
        forrige_uke = max([e for e in tidligere_kjøringer if e <= uttrekksdato - timedelta(7)], default=uttrekksdato - timedelta(7))
        
        notisgrunnlag = Notisgrunnlag(seriedata, serieår, forrige_uke, forrige, uttrekksdato)
        notisgenerator = Notisgenerator(serieår, uttrekksdato, neste_notisid, notisgrunnlag)

        notiser = []
        notiselementer = []

        notisgenerator.oppdatering(notiser, notiselementer)
        notisgenerator.rangering_ideallag(notiser, notiselementer)
        notisgenerator.rangering_allroundere(notiser, notiselementer)
        notisgenerator.rangering_nykommere(notiser, notiselementer)
        notisgenerator.rangering_juniorlag(notiser, notiselementer)
        notisgenerator.rangering_nøkkelutøvere(notiser, notiselementer)
        notisgenerator.tabellmomenter(notiser, notiselementer)
        notisgenerator.over_5000_poeng_grensen(notiser, notiselementer)
        #notisgenerator.lag_rekordplassering(notiser, notiselementer)
        #notisgenerator.lag_rekordpoeng(notiser, notiselementer)
        #notisgenerator.seriekontroll(notiser) # TODO: fikse - er feil

        seriedata.bulkinnsett(notiser)
        seriedata.bulkinnsett(notiselementer)