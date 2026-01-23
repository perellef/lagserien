from flask import render_template
from srcc.main.applikasjon.fellesinfo import seriedata, cache
from srcc.main.applikasjon.spørringer import db_hent_besøksdata

def adminside():
    
    with seriedata.connect() as peker:
        besøkstall = db_hent_besøksdata(peker)

    return render_template(
        "adminside.html",
        besøkstall=besøkstall,
        cache=cache.data
    )