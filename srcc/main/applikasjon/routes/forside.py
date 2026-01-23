from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def forside():
    return render_template("forside.html", cache=cache.data)