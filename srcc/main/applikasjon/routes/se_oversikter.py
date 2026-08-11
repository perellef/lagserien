from flask import render_template
from srcc.main.applikasjon.fellesinfo import seriedata, cache
from srcc.main.applikasjon.spørringer import db_hent_besøksdata_antall_klikk, db_hent_besøksdata_antall_brukere

def se_oversikter():
    with seriedata.connect() as peker:
        besøksdata_antall_klikk = db_hent_besøksdata_antall_klikk(peker)
        besøksdata_antall_brukere = db_hent_besøksdata_antall_brukere(peker)

    return render_template(
        "se_oversikter.html",
        besøksdata_antall_klikk=besøksdata_antall_klikk,
        besøksdata_antall_brukere=besøksdata_antall_brukere,
        cache=cache.data
    )