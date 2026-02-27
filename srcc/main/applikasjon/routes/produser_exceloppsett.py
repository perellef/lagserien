from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def produser_exceloppsett():
    return render_template("produser_exceloppsett.html", cache=cache.data)