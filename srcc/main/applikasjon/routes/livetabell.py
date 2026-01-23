from flask import render_template
from srcc.main.applikasjon.fellesinfo import cache, serieår

from datetime import datetime

import pytz
import os
import re
    
def livetabell():
    oslo = pytz.timezone("Europe/Oslo")

    if cache.data["sist_oppdatert"] is None:
        sist_oppdatert = ""
    else:
        dt_utc = datetime.strptime(cache.data["sist_oppdatert"], "%Y-%m-%d %H:%M:%S.%f")
        dt_oslo = dt_utc.astimezone(oslo)    
        sist_oppdatert = dt_oslo.strftime("%d.%m.%Y kl. %H:%M")

    return render_template(
        "livetabell.html",
        serieår=serieår,
        cache=cache.data,
        sist_oppdatert=sist_oppdatert,
        zipfil=finn_zipfil_med_serieoppsett()
    )

def finn_zipfil_med_serieoppsett():
    dir = 'srcc/main/applikasjon/static/assets/excelfiler'
    pattern = re.compile(r'^serieoppsett_\d{4}-\d{2}-\d{2}\.zip$')
    
    for filnavn in os.listdir(dir):
        if pattern.match(filnavn):
            return filnavn
    
    return None