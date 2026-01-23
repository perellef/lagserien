from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def tidligere_år():
    return render_template("tidligere_år.html", cache=cache.data)