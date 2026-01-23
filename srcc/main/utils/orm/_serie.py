from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, DATE

class Serie(DeklarativBase):

    __tablename__ = "bakgrunn.serier"
    
    serieår = Column(Integer, primary_key=True, nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=False)
    avsluttet = Column(DATE, nullable=True)