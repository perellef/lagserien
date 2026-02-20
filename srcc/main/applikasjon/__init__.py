from flask import Flask, request, session

from srcc.main.applikasjon.fellesinfo import cache
from srcc.main.applikasjon.databaselogger import queue, lytt_og_loggfør_i_db

from srcc.main.applikasjon.routes.adminside import adminside
from srcc.main.applikasjon.routes.forside import forside
from srcc.main.applikasjon.routes.nyhetsarkiv import nyheter
from srcc.main.applikasjon.routes.om_serien import om_serien
from srcc.main.applikasjon.routes.livetabell import livetabell
from srcc.main.applikasjon.routes.rangeringer import rangeringer
from srcc.main.applikasjon.routes.tidligere_år import tidligere_år
from srcc.main.applikasjon.routes.verktøy import verktøy
from srcc.main.applikasjon.routes.artikkel import artikkel
from srcc.main.applikasjon.routes.klubb import klubb
from srcc.main.applikasjon.routes.lag import lag
from srcc.main.applikasjon.routes.stevnestatus import stevnestatus
from srcc.main.applikasjon.routes.poengkalkulator import poengkalkulator
from srcc.main.applikasjon.routes.lagoppstiller import lagoppstiller
from srcc.main.applikasjon.routes.lagsammenlikner import lagsammenlikner
from srcc.main.applikasjon.routes.lagforbedrer import lagforbedrer
from srcc.main.applikasjon.routes.lagsammenlikner_sammenlikn import lagsammenlikner_sammenlikn
from srcc.main.applikasjon.routes.lagoppstiller_hent_resultater import lagoppstiller_hent_resultater
from srcc.main.applikasjon.routes.lagoppstiller_oppstill_lag import lagoppstiller_oppstill_lag
from srcc.main.applikasjon.routes.lagforbedrer_analyser import lagforbedrer_analyser

import logging
import threading
import os
import uuid

logging.basicConfig(level=logging.INFO)

ADMIN_NØKKEL = os.environ.get("ADMIN_NØKKEL")

def create_app():
    
    app = Flask(__name__)
    app.secret_key = os.environ.get("FLASK_SECRET_KEY")

    app.route("/") (forside)
    app.route("/nyhetsarkiv") (nyheter)
    app.route("/nyhetsarkiv/<path:tittel>") (artikkel)
    app.route("/stevnestatus") (stevnestatus)
    app.route("/livetabell") (livetabell)
    app.route("/rangeringer") (rangeringer)
    app.route("/livetabell/<path:klubbnavn>") (klubb)
    app.route("/livetabell/<path:lagnavn> (<kjonn>)") (lag)
    app.route("/tidligere_år") (tidligere_år)
    app.route("/verktøy") (verktøy)
    app.route("/verktøy/poengkalkulator") (poengkalkulator)
    app.route("/verktøy/lagoppstiller") (lagoppstiller)
    app.route("/verktøy/lagsammenlikner") (lagsammenlikner)
    app.route("/verktøy/lagforbedrer") (lagforbedrer)
    app.route("/om_serien") (om_serien)
    app.route(f"/adminside/{ADMIN_NØKKEL}") (adminside)

    app.route('/verktøy/lagoppstiller/hent_resultater', methods=['POST']) (lagoppstiller_hent_resultater)
    app.route("/verktøy/lagoppstiller/beregn", methods=['POST']) (lagoppstiller_oppstill_lag)
    app.route("/verktøy/lagsammenlikner/sammenlikn", methods=['POST']) (lagsammenlikner_sammenlikn)
    app.route("/verktøy/lagforbedrer/analyser", methods=['POST']) (lagforbedrer_analyser)

    threading.Thread(target=cache.lytt_etter_og_oppdater_cache, daemon=True).start()
    threading.Thread(target=lytt_og_loggfør_i_db, daemon=True).start()
    
    @app.before_request
    def log_path():
        path = request.path
        if not any((
            path.startswith("/static"),
            path == "/favicon.ico"
        )):
            if "bruker_uuid" not in session:
                session["bruker_uuid"] = str(uuid.uuid4())

            logging.info(f"User {session['bruker_uuid']} requested path: {path}")
            queue.put((session['bruker_uuid'], path))


    return app

