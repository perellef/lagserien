from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache
from srcc.main.applikasjon.spørringer import custom_spørring

def analyser_data():
    return render_template("analyser_data.html", cache=cache.data)