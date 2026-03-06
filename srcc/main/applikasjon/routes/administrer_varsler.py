from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache, seriedata
from srcc.main.applikasjon.spørringer import db_hent_varsler, custom_spørring

def administrer_varsler():
    with seriedata.connect() as peker:
        varsler = db_hent_varsler(peker)
        resultater = [custom_spørring(peker, spørring) for _, spørring in varsler]
    
    varsler = [[s, t.strip().replace("\r\n", "<br>").replace("\n", "<br>")] for s,t in varsler]
    
    print(varsler[0][1])
    return render_template("administrer_varsler.html", cache=cache.data, varsler=varsler, resultater=resultater)