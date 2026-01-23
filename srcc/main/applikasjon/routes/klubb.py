from flask import render_template, abort
from srcc.main.applikasjon.fellesinfo import cache, seriedata, serieår
from srcc.main.applikasjon.spørringer import db_hent_klubbkrets, db_hent_klubb_id, db_hent_klubblag, db_hent_klubbresultater_med_overgangsinfo 

from datetime import datetime, timezone

def klubb(klubbnavn):

    if klubbnavn not in cache.data["klubber"]:
        abort(404)

    i_dag = datetime.now(timezone.utc) 

    with seriedata.connect() as peker:
        klubb_id = db_hent_klubb_id(peker, klubbnavn)
        krets = db_hent_klubbkrets(peker, klubbnavn, i_dag)
        
        menn_klubblag = db_hent_klubblag(peker, "menn", klubbnavn, serieår, i_dag)
        kvinner_klubblag = db_hent_klubblag(peker, "kvinner", klubbnavn, serieår, i_dag)
        
        klubbresultater = db_hent_klubbresultater_med_overgangsinfo(peker, klubbnavn, serieår, i_dag)

    return render_template(
        "klubb.html",
        cache=cache.data,
        klubbnavn=klubbnavn,
        krets=krets,
        klubb_id=klubb_id if klubb_id in cache.data["klubblogoer"] else None,
        menn_klubblag=menn_klubblag,
        kvinner_klubblag=kvinner_klubblag,
        klubbresultater=klubbresultater,
    )