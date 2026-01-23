from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, DATE, ForeignKey, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class Ferierepresentasjon(DeklarativBase):

    __tablename__ = "representasjon.ferierepresentasjoner"
    
    serieår = Column(Integer, nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=False)
    klubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    utøver_id = Column(Integer, ForeignKey("bakgrunn.utøvere.utøver_id", onupdate="CASCADE"), nullable=False)
    
    klubb = relationship("Klubb")
    utøver = relationship("Utøver")

    __table_args__ = (
        PrimaryKeyConstraint('serieår','klubb_id','utøver_id'),
    )
