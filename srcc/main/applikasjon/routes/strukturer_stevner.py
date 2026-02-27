from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def strukturer_stevner():
    return render_template("strukturer_stevner.html", cache=cache.data)