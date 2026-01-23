from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, DATE, PrimaryKeyConstraint, UniqueConstraint, ForeignKeyConstraint
from sqlalchemy.orm import relationship

class MannLaginfo(DeklarativBase):

    __tablename__ = "serie.menn_laginfo"

    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, nullable=False)
    lagnummer = Column(Integer, nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    poeng = Column(Integer, nullable=False)
    poeng_obligatoriske = Column(Integer, nullable=False)
    poeng_valgfri = Column(Integer, nullable=False)
    antall_noteringer = Column(Integer, nullable=False)
    antall_deltakere = Column(Integer, nullable=False)
    
    lag = relationship("MannLag")

    __table_args__ = (
        PrimaryKeyConstraint('serieår', 'klubb_id', 'lagnummer', 'fra_og_med'),
        UniqueConstraint('serieår', 'klubb_id', 'lagnummer', 'til_og_med'),
        ForeignKeyConstraint(
            ['serieår', 'klubb_id', 'lagnummer'],
            ["serie.menn_lag.serieår", "serie.menn_lag.klubb_id", "serie.menn_lag.lagnummer"],
            onupdate="CASCADE"
        ) 
    )