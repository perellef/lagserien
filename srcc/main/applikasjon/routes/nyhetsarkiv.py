from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def nyheter():
    return render_template("nyhetsarkiv.html", cache=cache.data)