from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, DATE, ForeignKey, CheckConstraint, PrimaryKeyConstraint, UniqueConstraint, ForeignKeyConstraint
from sqlalchemy.orm import relationship

class KvinneLagresultat(DeklarativBase):

    __tablename__ = "serie.kvinner_lagresultater"

    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, nullable=False)
    lagnummer = Column(Integer, nullable=False)
    resultat_id = Column(Integer, ForeignKey("bakgrunn.resultater.resultat_id", onupdate="CASCADE"), nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    oppstillingstype = Column(String, nullable=False)

    lag = relationship("KvinneLag")
    resultat = relationship("Resultat")

    __table_args__ = (
        PrimaryKeyConstraint('serieår', 'resultat_id', 'fra_og_med'),
        UniqueConstraint('serieår', 'resultat_id', 'til_og_med'),
        CheckConstraint("oppstillingstype in ('OBLIGATORISK','VALGFRI')"),
        ForeignKeyConstraint(
            ['serieår', 'klubb_id', 'lagnummer'],
            ["serie.kvinner_lag.serieår", "serie.kvinner_lag.klubb_id", "serie.kvinner_lag.lagnummer"],
            onupdate="CASCADE"
        )
    )