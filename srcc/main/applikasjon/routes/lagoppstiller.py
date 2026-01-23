from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def lagoppstiller():
    return render_template("lagoppstiller.html", cache=cache.data)