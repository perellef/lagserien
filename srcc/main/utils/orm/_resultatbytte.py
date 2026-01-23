from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, ForeignKey, TIMESTAMP
from sqlalchemy.orm import relationship

class Resultatbytte(DeklarativBase):

    __tablename__ = "bakgrunn.resultatbytter"

    statistikk_resultat_id = Column(Integer, primary_key=True, nullable=False)
    klubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=True)
    registrert = Column(TIMESTAMP, nullable=False)
    notat = Column(String, nullable=False)
    
    klubb = relationship("Klubb")
