from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, Boolean, String, DATE

class Stevne(DeklarativBase):

    __tablename__ = "uttrekk.stevner"

    stevne_id = Column(Integer, primary_key=True, nullable=False)
    stevnedato = Column(DATE, nullable=False)
    stevnetittel = Column(String, nullable=False)
    arena = Column(String, nullable=False)
    sted = Column(String, nullable=False)
    er_nasjonalt = Column(Boolean, nullable=True)
    rapportert = Column(DATE, nullable=False)