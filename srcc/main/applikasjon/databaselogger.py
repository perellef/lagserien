
from srcc.main.applikasjon.fellesinfo import seriedata

from queue import Queue, Empty
from datetime import datetime
from sqlalchemy import text

import logging

logging.basicConfig(level=logging.INFO)

queue = Queue()
def lytt_og_loggfør_i_db():
    while True:
        try:
            raddata = queue.get(timeout=1)
        except Empty:
            continue
        loggfør(*raddata)

def loggfør(uuid, path):
    with seriedata.connect() as peker:
        try: 
            peker.execute(
                text("""INSERT INTO "nettside.nettside_besøk" VALUES (:tidspunkt, :bruker_uuid, :path)"""),
                {
                    "tidspunkt": datetime.now(),
                    "bruker_uuid": uuid,
                    "path": path
                })
            peker.commit()
        except Exception as e:
            peker.rollback()
            logging.error(f"Failed to insert to database: {e}")