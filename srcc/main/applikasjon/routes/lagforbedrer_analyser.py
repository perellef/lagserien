from flask import request, jsonify
from srcc.main.applikasjon.kalkulatorformidler import Kalkulatorformidler 
from srcc.main.applikasjon.fellesinfo import seriedata, serieår
from srcc.main.applikasjon.spørringer import db_hent_klubbresultater, db_hent_lagets_resultater, db_hent_oppstillingskrav_til_lag, db_hent_serieøvelser, db_hent_øvelsene

from datetime import date

def lagforbedrer_analyser():
    kjønn = request.json.get('kjønn', [])
    klubb = request.json.get('klubb', [])

    uttrekksdato = date.today()

    with seriedata.connect() as peker:
        klubbresultater = db_hent_klubbresultater(peker, kjønn, klubb, serieår, uttrekksdato)
        lagresultater = db_hent_lagets_resultater(peker, kjønn, klubb, 1, serieår, uttrekksdato)
        oppstillingskrav = db_hent_oppstillingskrav_til_lag(peker, kjønn, serieår, klubb, 1)
        serieøvelser = db_hent_serieøvelser(peker, kjønn, serieår)
        øvelser = db_hent_øvelsene(peker)

    analyser_lagforbedringer = Kalkulatorformidler.analyser_lagforbedringer(kjønn, klubbresultater, lagresultater, oppstillingskrav[2:], serieøvelser, øvelser)

    return jsonify(analyser_lagforbedringer)

