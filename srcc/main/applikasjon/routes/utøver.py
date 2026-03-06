from flask import render_template, abort 
from srcc.main.applikasjon.fellesinfo import cache, seriedata, serieår
from srcc.main.applikasjon.spørringer import db_hent_utøverinfo, db_hent_utøverens_lagresultater, db_hent_utøverresultater
from kalkulatorformidler import Kalkulatorformidler

def utøver(utover_id):
    with seriedata.connect() as peker:
        utøverinfo = db_hent_utøverinfo(peker, utover_id)

        if utøverinfo == None:
            abort(404)
        navn, fødselsår = utøverinfo

        resultater = db_hent_utøverresultater(peker, utover_id)
        lagresultater = db_hent_utøverens_lagresultater(peker, utover_id)

    
    poengberegnede = {}
    for k,v in resultater.items():
        poengberegnede[k] = []
        for res in v:
            try:
                poeng = Kalkulatorformidler.beregn_resultatpoeng(res[-1], res[-2], res[1])
            except ValueError:
                poeng = "?"
            poengberegnede[k].append([poeng]+res)
        poengberegnede[k] = [[int(e[0]) if isinstance(e[0], float) else e[0]]+e[1:-3] for e in sorted(poengberegnede[k], key=lambda x: (-x[-3],-1 if isinstance(x[0], str) else x[0]), reverse=True)]

    return render_template(
        "utøver.html",
        cache=cache.data,
        navn=navn,
        fødselsår=fødselsår,
        resultater=poengberegnede,
        lagresultater=lagresultater,
        serieår=serieår,
    )
    