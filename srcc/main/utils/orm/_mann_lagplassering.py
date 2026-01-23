from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, DATE, PrimaryKeyConstraint, UniqueConstraint, ForeignKeyConstraint
from sqlalchemy.orm import relationship

class MannLagplassering(DeklarativBase):

    __tablename__ = "serie.menn_lagplasseringer"

    serieår = Column(Integer, nullable=False)
    divisjon = Column(Integer, nullable=False)
    plassering = Column(Integer, nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    klubb_id = Column(Integer, nullable=False)
    lagnummer = Column(Integer, nullable=False)

    lag = relationship("MannLag")

    __table_args__ = (
        PrimaryKeyConstraint('serieår','divisjon','plassering','fra_og_med'),
        UniqueConstraint('serieår','divisjon','plassering','til_og_med'),
        UniqueConstraint('serieår','klubb_id','lagnummer','fra_og_med'),
        UniqueConstraint('serieår','klubb_id','lagnummer','til_og_med'),
        ForeignKeyConstraint(
            ['serieår', 'klubb_id', 'lagnummer'],
            ["serie.menn_lag.serieår", "serie.menn_lag.klubb_id", "serie.menn_lag.lagnummer"],
            onupdate="CASCADE"
        )
    )