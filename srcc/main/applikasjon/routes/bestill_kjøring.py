from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache, seriedata
from srcc.main.applikasjon.spørringer import db_hent_batchkjøringer

def bestill_kjøring():
    with seriedata.connect() as peker:
        batchkjøringer = db_hent_batchkjøringer(peker)

    return render_template("bestill_kjøring.html", cache=cache.data, batchkjøringer=batchkjøringer)