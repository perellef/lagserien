from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, ForeignKey, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class KvinneTopplag(DeklarativBase):

    __tablename__ = "serie.kvinner_topplag"
    
    serieår = Column(Integer, nullable=False)
    klubb_id = Column(Integer, ForeignKey("uttrekk.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    lagnummer = Column(Integer, nullable=False)
    divisjon = Column(Integer, nullable=False)
    
    klubb = relationship('Klubb')

    __table_args__ = (
        PrimaryKeyConstraint('serieår', 'klubb_id', 'lagnummer'),
    )