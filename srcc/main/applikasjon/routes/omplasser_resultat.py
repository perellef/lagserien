from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache, seriedata
from srcc.main.applikasjon.spørringer import db_hent_resultatbytter

def omplasser_resultat():
    with seriedata.connect() as peker:
        resultatbytter = db_hent_resultatbytter(peker)

    return render_template("omplasser_resultat.html", cache=cache.data, resultatbytter=resultatbytter)