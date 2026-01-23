from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, ForeignKey, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class UtøverUnntattOverbygning(DeklarativBase):

    __tablename__ = "representasjon.utøvere_unntatt_overbygning"

    serieår = Column(Integer, nullable=False)
    utøver_id = Column(Integer, ForeignKey("bakgrunn.utøvere.utøver_id", onupdate="CASCADE"), nullable=False)
    moderklubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    
    utøver = relationship('Utøver')
    moderklubb = relationship('Klubb')

    __table_args__ = (
        PrimaryKeyConstraint('serieår','utøver_id'),
    )
