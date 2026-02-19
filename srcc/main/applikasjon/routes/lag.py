from flask import render_template, abort 

from srcc.main.applikasjon.kalkulatorformidler import Kalkulatorformidler 
from srcc.main.applikasjon.fellesinfo import cache, seriedata, serieår
from srcc.main.applikasjon.spørringer import db_hent_klubblag, db_hent_klubb_id, db_hent_laginfo, db_hent_klubbkrets, db_hent_lagresultater, db_hent_nye_resultater_siste_uke, db_hent_fjernede_resultater_siste_uke, db_hent_noteringer_til_lag, db_hent_ranking, db_hent_ranking_i_krets, db_hent_rekordranking, db_hent_sluttplassering, db_hent_resultatplasseringer_til_klubb, db_hent_lagplassering

from datetime import timedelta, datetime, timezone

def lag(kjonn, lagnavn):
    i_dag = datetime.now(timezone.utc).date()
    
    klubbnavn, lagnummer = utled_klubb_og_lagnummer(lagnavn)

    if klubbnavn not in cache.data["klubber"]:
        abort(404)

    with seriedata.connect() as peker:
        nye_resultater = set(db_hent_nye_resultater_siste_uke(peker, kjonn, i_dag))
        fjernede_resultater = set(db_hent_fjernede_resultater_siste_uke(peker, kjonn, i_dag, klubbnavn, lagnummer))

        laginfo = db_hent_laginfo(peker, kjonn, klubbnavn, lagnummer, serieår, i_dag)
        klubbkrets = db_hent_klubbkrets(peker, klubbnavn, i_dag)
        klubb_id = db_hent_klubb_id(peker, klubbnavn)

        rank = db_hent_ranking(peker, kjonn, serieår, klubbnavn, lagnummer)
        rekordrank,rekordår = db_hent_rekordranking(peker, kjonn, klubbnavn, lagnummer)
        kretsrank = db_hent_ranking_i_krets(peker, kjonn, serieår, i_dag, klubbnavn, lagnummer)
        
        lagresultater = db_hent_lagresultater(peker, kjonn, klubbnavn, lagnummer, serieår, i_dag)
        tidligere_lagresultater = db_hent_lagresultater(peker, kjonn, klubbnavn, lagnummer, serieår, i_dag-timedelta(7))

        klubblag = db_hent_klubblag(peker, "menn", klubbnavn, serieår, i_dag)

        resultatplasseringer = db_hent_resultatplasseringer_til_klubb(peker, kjonn, serieår, i_dag, klubbnavn)

        siste_3_år = [
            [serieår-1, db_hent_sluttplassering(peker, kjonn, serieår-1, klubbnavn, lagnummer)],
            [serieår-2, db_hent_sluttplassering(peker, kjonn, serieår-2, klubbnavn, lagnummer)],
            [serieår-3, db_hent_sluttplassering(peker, kjonn, serieår-3, klubbnavn, lagnummer)],
        ]

        noteringer = db_hent_noteringer_til_lag(peker, kjonn, serieår, klubbnavn, lagnummer)
        divisjon, plassering = db_hent_lagplassering(peker, kjonn, serieår, i_dag, klubbnavn, lagnummer)
        
        if plassering == None:
            abort(404)
            
    berikede_lagresultater = Kalkulatorformidler.finn_beriket_oppstilling(noteringer, lagresultater, tidligere_lagresultater, nye_resultater, fjernede_resultater, resultatplasseringer)
        
    return render_template(
        "lag.html",
        cache=cache.data,
        klubblag=klubblag,
        lagresultater=berikede_lagresultater,
        laginfo=laginfo,
        klubbnavn=klubbnavn,
        klubb_id=klubb_id if klubb_id in cache.data["klubblogoer"] else None,
        lagnummer=lagnummer,
        kjønn=kjonn,
        klubbkrets=klubbkrets,
        rank="-" if rank == None else rank,
        kretsrank="-" if kretsrank == None else kretsrank,
        rekordrank=rekordrank,
        rekordår=rekordår,
        siste_3_år=siste_3_år,
        divisjon=divisjon,
        plassering=plassering
    )

def utled_klubb_og_lagnummer(lagnavn):
    if len(lagnavn) > 7 and lagnavn[-5:] == ". lag":
        klubbnavn = lagnavn[:-7]
        lagnummer = int(lagnavn[-6])
    else:
        klubbnavn = lagnavn
        lagnummer = 1

    return klubbnavn, lagnummer