from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, DATE, ForeignKey, UniqueConstraint
from sqlalchemy.orm import relationship

class Resultat(DeklarativBase):

    __tablename__ = "bakgrunn.resultater"
    
    resultat_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    stevne_id = Column(Integer, ForeignKey("bakgrunn.stevner.stevne_id", onupdate="CASCADE"), nullable=False)
    utøver_id = Column(Integer, ForeignKey("bakgrunn.utøvere.utøver_id", onupdate="CASCADE"), nullable=False)
    øvelseskode = Column(String, ForeignKey("bakgrunn.øvelser.øvelseskode", onupdate="CASCADE"), nullable=False)
    prestasjon = Column(String, nullable=False)
    dato = Column(DATE, nullable=False)
    statistikk_resultat_id = Column(Integer, nullable=False, autoincrement=True)
    
    stevne = relationship('Stevne')
    utøver = relationship('Utøver')
    øvelse = relationship('Øvelse')

    __table_args__ = (
        UniqueConstraint('stevne_id', 'utøver_id', 'øvelseskode', 'prestasjon', 'dato', 'statistikk_resultat_id'),
    )