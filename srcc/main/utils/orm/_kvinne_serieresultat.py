from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, DATE, ForeignKey, PrimaryKeyConstraint, UniqueConstraint
from sqlalchemy.orm import relationship

class KvinneSerieresultat(DeklarativBase):

    __tablename__ = "tildeling.kvinner_serieresultater"

    resultat_id = Column(Integer, ForeignKey("uttrekk.resultater.resultat_id", onupdate="CASCADE"), nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    poeng = Column(Integer, nullable=True)
    klubb_id = Column(Integer, ForeignKey("uttrekk.klubber.klubb_id", onupdate="CASCADE"), nullable=True)
    forløp =  Column(String, nullable=False)

    resultat = relationship("Resultat")
    klubb = relationship("Klubb")

    __table_args__ = (
        PrimaryKeyConstraint('resultat_id', 'fra_og_med'),
        UniqueConstraint('resultat_id', 'til_og_med'),
    )