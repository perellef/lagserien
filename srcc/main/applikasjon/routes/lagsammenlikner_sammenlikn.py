from flask import request, jsonify
from srcc.main.applikasjon.kalkulatorformidler import Kalkulatorformidler 
from srcc.main.applikasjon.fellesinfo import seriedata
from srcc.main.applikasjon.spørringer import db_hent_laginfo, db_hent_lagresultater, db_hent_noteringer_til_lag


def lagsammenlikner_sammenlikn():
    kjønn1 = request.json.get('kjønn1', [])
    serieår1 = request.json.get('serieår1', [])
    uttrekksdato1 = request.json.get('uttrekksdato1', [])
    klubb1 = request.json.get('klubb1', [])
    lag1 = request.json.get('lag1', [])
    kjønn2 = request.json.get('kjønn2', [])
    serieår2 = request.json.get('serieår2', [])
    uttrekksdato2 = request.json.get('uttrekksdato2', [])
    klubb2 = request.json.get('klubb2', [])
    lag2 = request.json.get('lag2', [])

    lagnavn1 = klubb1 if int(lag1) == 1 else f"{klubb1} {lag1}. lag"
    lagnavn2 = klubb2 if int(lag2) == 1 else f"{klubb2} {lag2}. lag"

    with seriedata.connect() as peker:
        noteringer1 = db_hent_noteringer_til_lag(peker, kjønn1, serieår1, klubb1, lag1)
        noteringer2 = db_hent_noteringer_til_lag(peker, kjønn2, serieår2, klubb2, lag2)

        lagresultater1 = db_hent_lagresultater(peker, kjønn1, klubb1, lag1, serieår1, uttrekksdato1)
        lagresultater2 = db_hent_lagresultater(peker, kjønn2, klubb2, lag2, serieår2, uttrekksdato2)

        laginfo1 = db_hent_laginfo(peker, kjønn1, klubb1, lag1, serieår1, uttrekksdato1)
        laginfo2 = db_hent_laginfo(peker, kjønn2, klubb2, lag2, serieår2, uttrekksdato2)

    sammenlikning = Kalkulatorformidler.sammenlikn_lag(lagresultater1, noteringer1, lagresultater2, noteringer2)

    lagtittel1, lagtittel2 = lagtitler(lagnavn1, lagnavn2, kjønn1, kjønn2, serieår1, serieår2, uttrekksdato1, uttrekksdato2)

    data = [
        [lagtittel1, laginfo1[1:]] + sammenlikning[0],
        [lagtittel2, laginfo2[1:]] + sammenlikning[1],
    ]

    return jsonify(data)

def lagtitler(lagnavn1, lagnavn2, kjønn1, kjønn2, serieår1, serieår2, uttrekksdato1, uttrekksdato2):
    if (kjønn1 != kjønn2 and serieår1 != serieår2):
        return f"{lagnavn1} ({kjønn1}, {serieår1})", f"{lagnavn2} ({kjønn2}, {serieår2})"
    if (serieår1 != serieår2):
        return f"{lagnavn1} ({serieår1})", f"{lagnavn2} ({serieår2})"
    if (kjønn1 != kjønn2):
        return f"{lagnavn1} ({kjønn1})", f"{lagnavn2} ({kjønn2})"
    if (serieår1 != serieår2):
        return f"{lagnavn1} ({serieår1})", f"{lagnavn2} ({serieår2})"
    if (uttrekksdato1 != uttrekksdato2):
        return f"{lagnavn1} ({uttrekksdato1})", f"{lagnavn2} ({uttrekksdato2})"
    return lagnavn1, lagnavn2
