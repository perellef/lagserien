from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def poengkalkulator():
    return render_template("poengkalkulator.html", cache=cache.data)