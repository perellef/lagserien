from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def adminside():
    return render_template("adminside.html", cache=cache.data)