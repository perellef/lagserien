from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache, serieår

def rangeringer():
    return render_template("rangeringer.html", cache=cache.data, serieår=serieår)