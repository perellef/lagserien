from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, DATE, PrimaryKeyConstraint, UniqueConstraint, ForeignKeyConstraint
from sqlalchemy.orm import relationship

class KvinneLagpotensial(DeklarativBase):

    __tablename__ = "serie.kvinner_lagpotensial"
    
    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, nullable=False)
    lagnummer = Column(Integer, nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    poeng = Column(Integer, nullable=False)

    lag = relationship("KvinneLag")

    __table_args__ = (
        PrimaryKeyConstraint('serieår', 'klubb_id', 'lagnummer', 'fra_og_med'),
        UniqueConstraint('serieår', 'klubb_id', 'lagnummer', 'til_og_med'),
        ForeignKeyConstraint(
            ['serieår', 'klubb_id', 'lagnummer'],
            ["serie.kvinner_lag.serieår", "serie.kvinner_lag.klubb_id", "serie.kvinner_lag.lagnummer"],
            onupdate="CASCADE"
        ) 
    )
