from flask import request, jsonify
from srcc.main.applikasjon.fellesinfo import seriedata
from srcc.main.applikasjon.spørringer import db_hent_resultater 

def lagoppstiller_hent_resultater():
    kjønn = request.json.get('kjønn', [])
    serieår = request.json.get('serieår', [])
    klubbnavn = request.json.get('klubb', [])
    dato = request.json.get('dato', [])
    
    with seriedata.connect() as peker:
        resultater = db_hent_resultater(peker, kjønn, klubbnavn, serieår, dato)

    return jsonify(resultater)