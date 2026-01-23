from flask import request, jsonify
from srcc.main.applikasjon.kalkulatorformidler import Kalkulatorformidler

def lagoppstiller_oppstill_lag():
    resultater = request.json.get('resultater', [])
    oppstillingsregler = request.json.get('oppstillingsregler', [])

    utdata = Kalkulatorformidler.beregn_oppstilling(resultater,  oppstillingsregler)
    
    return jsonify(utdata)