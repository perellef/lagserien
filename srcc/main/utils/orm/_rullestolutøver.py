from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, ForeignKey, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class Rullestolutøver(DeklarativBase):

    __tablename__ = "tildeling.rullestolutøvere"
    
    serieår = Column(Integer, nullable=False)
    utøver_id = Column(Integer, ForeignKey("uttrekk.utøvere.utøver_id", onupdate="CASCADE"), nullable=False)
    
    utøver = relationship('Utøver')

    __table_args__ = (
        PrimaryKeyConstraint('serieår','utøver_id'),
    )