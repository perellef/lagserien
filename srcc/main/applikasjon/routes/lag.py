from flask import render_template, abort 

from srcc.main.applikasjon.kalkulatorformidler import Kalkulatorformidler 
from srcc.main.applikasjon.fellesinfo import cache, seriedata, serieår, f_uttrekksdato
from srcc.main.applikasjon.spørringer import db_hent_klubb_id, db_hent_laginfo, db_hent_klubbkrets, db_hent_lagresultater, db_hent_nye_resultater_siste_uke, db_hent_fjernede_resultater_siste_uke, db_hent_noteringer_til_lag, db_hent_resultatplasseringer_til_klubb, db_hent_lagplassering, db_hent_potensielle_lagresultater, db_hent_historiske_plasseringer, db_hent_lagutøverdata, db_hent_lagutøverresultater, db_hent_resultater, db_hent_obligatoriske_øvelser, db_hent_løpsøvelser

from datetime import timedelta

from collections import defaultdict

def lag(kjonn, lagnavn):
    i_dag = f_uttrekksdato()
    
    klubbnavn, lagnummer = utled_klubb_og_lagnummer(lagnavn)

    if klubbnavn not in [e[0] for e in cache.data["klubber"]]:
        abort(404)

    with seriedata.connect() as peker:
        obløvelser = db_hent_obligatoriske_øvelser(peker, kjonn, serieår)
        løpsøvelser = db_hent_løpsøvelser(peker, kjonn, serieår)

        nye_resultater = set(db_hent_nye_resultater_siste_uke(peker, kjonn, i_dag))
        fjernede_resultater = set(db_hent_fjernede_resultater_siste_uke(peker, kjonn, serieår, i_dag, klubbnavn, lagnummer))

        laginfo = db_hent_laginfo(peker, kjonn, klubbnavn, lagnummer, serieår, i_dag)
        klubbkrets = db_hent_klubbkrets(peker, klubbnavn, i_dag)
        klubb_id = db_hent_klubb_id(peker, klubbnavn)

        lagresultater = db_hent_lagresultater(peker, kjonn, klubbnavn, lagnummer, serieår, i_dag)
        tidligere_lagresultater = db_hent_lagresultater(peker, kjonn, klubbnavn, lagnummer, serieår, i_dag-timedelta(7))
        potensielle_lagresultater = db_hent_potensielle_lagresultater(peker, kjonn, klubbnavn, lagnummer, serieår, i_dag)

        resultatplasseringer = db_hent_resultatplasseringer_til_klubb(peker, kjonn, serieår, i_dag, klubbnavn)

        noteringer = db_hent_noteringer_til_lag(peker, kjonn, serieår, klubbnavn, lagnummer)
        divisjon, plassering = db_hent_lagplassering(peker, kjonn, serieår, i_dag, klubbnavn, lagnummer)
        
        utøverdata = db_hent_lagutøverdata(peker, kjonn, serieår, i_dag, i_dag-timedelta(7), klubb_id, lagnummer)
        utøverresultater = defaultdict(list)

        for r in db_hent_lagutøverresultater(peker, kjonn, serieår, i_dag, klubb_id, lagnummer):
            utøverresultater[r[0]].append(r)

        utøverdata = [u + [utøverresultater[u[5]]] for u in utøverdata]

        historiske_plasseringer = db_hent_historiske_plasseringer(peker, kjonn, klubb_id, lagnummer, divisjon, plassering, serieår, klubbkrets)

        if plassering == None:
            abort(404)

        klubbresultater = db_hent_resultater(peker, kjonn, klubbnavn, serieår, i_dag)
            
    berikede_lagresultater = Kalkulatorformidler.finn_ukas_forbedringer(noteringer, lagresultater, tidligere_lagresultater, nye_resultater, fjernede_resultater, resultatplasseringer)
    berikede_lagforbedringer = Kalkulatorformidler.finn_optimale_forbedringer(kjonn, noteringer, potensielle_lagresultater, lagresultater, resultatplasseringer)

    oppstillingskrav = cache.data["krav"][divisjon]

    krav = {
        "antall-obl": oppstillingskrav[0],
        "antall-val": oppstillingskrav[1],
        "maks-obl-løp": oppstillingskrav[2],
        "maks-val-løp": oppstillingskrav[3],
        "maks-resultater-per-utøver": oppstillingskrav[4],
        "obl-øvelser": obløvelser,
        "løpsøvelser": løpsøvelser
    }

    return render_template(
        "lag.html",
        cache=cache.data,
        lagresultater=berikede_lagresultater,
        lagforbedringer=berikede_lagforbedringer,
        laginfo=laginfo,
        klubbnavn=klubbnavn,
        klubb_id=klubb_id if klubb_id in cache.data["klubblogoer"] else None,
        lagnummer=lagnummer,
        kjønn=kjonn,
        serieår=serieår,
        klubbkrets=klubbkrets,
        divisjon=divisjon,
        plassering=plassering,
        historiske_plasseringer=historiske_plasseringer,
        utøverdata=utøverdata,
        klubbresultater=klubbresultater,
        krav=krav,
    )

def utled_klubb_og_lagnummer(lagnavn):
    if len(lagnavn) > 7 and lagnavn[-5:] == ". lag":
        klubbnavn = lagnavn[:-7]
        lagnummer = int(lagnavn[-6])
    else:
        klubbnavn = lagnavn
        lagnummer = 1

    return klubbnavn, lagnummer