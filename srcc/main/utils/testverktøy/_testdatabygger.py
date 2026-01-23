import sys
sys.path.append('./')

from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.kontrollsenter.database import Database
from srcc.main.kontrollsenter.tilganger import Tilganger

DATABASE = Database.TOM

class Testdatabygger:

    def __init__(self, tilganger):
        self.__tilganger = tilganger
        self.__seriedata = Seriedata(DATABASE)
        self.__seriedata.initier()
        self.__seriedata.åpne()

    def med(self, _, objekter):
        session = self.__seriedata._Seriedata__session
        for objekt in objekter:
            session.merge(objekt)
            session.commit()
        return self

    def bygg(self):
        self.__seriedata._Seriedata__tilganger = self.__tilganger
        return self.__seriedata