from flask import request, jsonify
from srcc.main.applikasjon.kalkulatorformidler import Kalkulatorformidler
from srcc.main.applikasjon.fellesinfo import seriedata, serieår, f_uttrekksdato
from srcc.main.applikasjon.spørringer import db_hent_klubblag, db_hent_årets_oppstillingskrav, db_hent_topplag

def lagoppstiller_utforsk_lag():
    kjønn = request.json.get('kjønn', [])
    klubbnavn = request.json.get('klubbnavn', [])
    resultater = request.json.get('resultater', [])

    i_dag = f_uttrekksdato()

    with seriedata.connect() as peker:
        klubblag = db_hent_klubblag(peker, kjønn, klubbnavn, serieår, i_dag)
        oppstillingskrav = db_hent_årets_oppstillingskrav(peker, serieår)
        topplag = db_hent_topplag(peker, kjønn, serieår, klubbnavn)

    utdata = Kalkulatorformidler.beregn_oppstilling(resultater,  oppstillingskrav, topplag)
    utdata = [[e[0] if i >= len(klubblag) else e[0]-klubblag[i][3]]+list(e) for i,e in enumerate(utdata)]

    return jsonify(utdata)