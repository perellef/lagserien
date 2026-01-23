from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def verktøy():
    return render_template("verktøy.html", cache=cache.data)