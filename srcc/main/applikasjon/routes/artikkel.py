from flask import render_template
from srcc.main.applikasjon.fellesinfo import seriedata, cache
from srcc.main.applikasjon.spørringer import db_hent_artikkel

def artikkel(tittel):

    with seriedata.connect() as peker:
        artikkel = db_hent_artikkel(peker, tittel)

    return render_template(
        "artikkel.html",
        publisert=artikkel[0],
        skrevet_av=artikkel[1],
        tittel=tittel,
        image=artikkel[3],
        bildeinnhold=artikkel[4],
        fotograf=artikkel[5],
        inngress=artikkel[6],
        innhold=artikkel[7],
        cache=cache.data
    )