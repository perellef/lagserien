from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, DATE, ForeignKey, CheckConstraint, PrimaryKeyConstraint, UniqueConstraint, ForeignKeyConstraint
from sqlalchemy.orm import relationship

class MannLagresultat(DeklarativBase):

    __tablename__ = "serie.menn_lagresultater"

    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, nullable=False)
    lagnummer = Column(Integer, nullable=False)
    resultat_id = Column(Integer, ForeignKey("uttrekk.resultater.resultat_id", onupdate="CASCADE"), nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    oppstillingstype = Column(String, nullable=False)

    lag = relationship("MannLag")
    resultat = relationship("Resultat")

    __table_args__ = (
        PrimaryKeyConstraint('serieår', 'resultat_id', 'fra_og_med'),
        UniqueConstraint('serieår', 'resultat_id', 'til_og_med'),
        CheckConstraint("oppstillingstype in ('OBLIGATORISK','VALGFRI')"),
        ForeignKeyConstraint(
            ['serieår', 'klubb_id', 'lagnummer'],
            ["serie.menn_lag.serieår", "serie.menn_lag.klubb_id", "serie.menn_lag.lagnummer"],
            onupdate="CASCADE"
        )
    )