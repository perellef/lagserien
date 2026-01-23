from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def lagforbedrer():
    return render_template("lagforbedrer.html", cache=cache.data)