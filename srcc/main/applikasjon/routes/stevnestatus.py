from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache, serieår

def stevnestatus():
    return render_template("stevnestatus.html", serieår=serieår, cache=cache.data)