from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache

def skjema():
    return render_template("skjema.html", cache=cache.data, feilet=False, feilmelding="")