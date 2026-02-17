from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, DATE, ForeignKey, PrimaryKeyConstraint, UniqueConstraint
from sqlalchemy.orm import relationship

class KvinneUttrekksresultat(DeklarativBase):

    __tablename__ = "uttrekk.kvinner_uttrekksresultater"

    resultat_id = Column(Integer, ForeignKey("uttrekk.resultater.resultat_id", onupdate="CASCADE"), nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    klubb_id = Column(Integer, ForeignKey("uttrekk.klubber.klubb_id", onupdate="CASCADE"), nullable=True)

    resultat = relationship("Resultat")
    klubb = relationship("Klubb")

    __table_args__ = (
        PrimaryKeyConstraint('resultat_id', 'fra_og_med'),
        UniqueConstraint('resultat_id', 'til_og_med'),
    )