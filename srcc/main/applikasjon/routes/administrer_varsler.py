from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def administrer_varsler():
    return render_template("administrer_varsler.html", cache=cache.data)