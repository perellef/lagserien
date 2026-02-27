from flask import request, jsonify
from srcc.main.applikasjon.fellesinfo import seriedata
from srcc.main.applikasjon.spørringer import custom_spørring

def analyser_data_utfør():
    spørring = request.json.get('spørring', [])

    with seriedata.connect() as peker:
        resultat = custom_spørring(peker, spørring)

    return jsonify(resultat)