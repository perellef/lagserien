from .deklarativ_base import DeklarativBase

from sqlalchemy import ForeignKey, Column, Integer, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class ArkivMannSluttplassering(DeklarativBase):

    __tablename__ = "rapport.arkiv_menn_sluttplasseringer"
    
    serieår = Column(Integer, nullable=False)
    divisjon = Column(Integer, nullable=False)
    plassering = Column(Integer, nullable=False)
    klubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=True)
    lagnummer = Column(Integer, nullable=False)
    poeng = Column(Integer, nullable=False)
    
    klubb = relationship("Klubb")

    __table_args__ = (
        PrimaryKeyConstraint('serieår','divisjon','plassering'),
    )
