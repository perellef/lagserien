from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def om_serien():
    return render_template("om_serien.html", cache=cache.data)