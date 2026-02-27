from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, DATE, PrimaryKeyConstraint, ForeignKey, UniqueConstraint, CheckConstraint, ForeignKeyConstraint
from sqlalchemy.orm import relationship

class MannLagpotensialFelt(DeklarativBase):

    __tablename__ = "serie.menn_lagpotensial_felter"
    
    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, nullable=False)
    lagnummer = Column(Integer, nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    øvelseskode = Column(String, ForeignKey("uttrekk.øvelser.øvelseskode", onupdate="CASCADE"), nullable=False)
    utøver_id = Column(Integer, ForeignKey("uttrekk.utøvere.utøver_id", onupdate="CASCADE"), nullable=False)
    poeng = Column(Integer, nullable=False)
    oppstillingstype = Column(String, nullable=False)
    resultat_id = Column(Integer, ForeignKey("uttrekk.resultater.resultat_id", onupdate="CASCADE"), nullable=True)

    lag = relationship("MannLag")
    utøver = relationship('Utøver')
    øvelse = relationship('Øvelse')
    resultat = relationship("Resultat")

    __table_args__ = (
        PrimaryKeyConstraint('serieår', 'klubb_id', 'lagnummer', 'fra_og_med', 'øvelseskode', 'utøver_id'),
        UniqueConstraint('serieår', 'klubb_id', 'lagnummer', 'til_og_med', 'øvelseskode', 'utøver_id'),
        CheckConstraint("oppstillingstype in ('OBLIGATORISK','VALGFRI')"),
        ForeignKeyConstraint(
            ['serieår', 'klubb_id', 'lagnummer'],
            ["serie.menn_lag.serieår", "serie.menn_lag.klubb_id", "serie.menn_lag.lagnummer"],
            onupdate="CASCADE"
        ) 
    )
