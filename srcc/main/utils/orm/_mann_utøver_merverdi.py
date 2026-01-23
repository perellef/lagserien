from .deklarativ_base import DeklarativBase

from sqlalchemy import ForeignKey, Column, Integer, DATE, PrimaryKeyConstraint, UniqueConstraint
from sqlalchemy.orm import relationship

class MannUtøverMerverdi(DeklarativBase):

    __tablename__ = "serie.menn_utøver_merverdi"
    
    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    utøver_id = Column(Integer, ForeignKey("bakgrunn.utøvere.utøver_id", onupdate="CASCADE"), nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    poeng = Column(Integer, nullable=False)

    klubb = relationship("Klubb")
    utøver = relationship("Utøver")

    __table_args__ = (
        PrimaryKeyConstraint('serieår', 'klubb_id', 'utøver_id', 'fra_og_med'),
        UniqueConstraint('serieår', 'klubb_id', 'utøver_id', 'til_og_med'),
    )
