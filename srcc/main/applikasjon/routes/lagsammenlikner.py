from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def lagsammenlikner():
    return render_template("lagsammenlikner.html", cache=cache.data)
    