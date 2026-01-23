from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, ForeignKey, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class Klubbtilhørighet(DeklarativBase):

    __tablename__ = "representasjon.klubbtilhørigheter"
    
    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    utøver_id = Column(Integer, ForeignKey("bakgrunn.utøvere.utøver_id", onupdate="CASCADE"), nullable=False)
    
    klubb = relationship("Klubb")
    utøver = relationship("Utøver")

    __table_args__ = (
        PrimaryKeyConstraint('serieår','klubb_id','utøver_id'),
    )