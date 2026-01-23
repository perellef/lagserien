from .deklarativ_base import DeklarativBase

from sqlalchemy import ForeignKey, Column, Integer, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class KvinneLag(DeklarativBase):

    __tablename__ = "serie.kvinner_lag"
    
    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    lagnummer = Column(Integer, nullable=False)
    
    klubb = relationship("Klubb")

    __table_args__ = (
        PrimaryKeyConstraint('serieår','klubb_id','lagnummer'),
    )
