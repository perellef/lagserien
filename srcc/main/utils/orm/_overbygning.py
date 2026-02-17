from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, ForeignKey, PrimaryKeyConstraint, ForeignKeyConstraint
from sqlalchemy.orm import relationship

class Overbygning(DeklarativBase):

    __tablename__ = "tildeling.overbygninger"

    serieår = Column(Integer, nullable=False)
    moderklubb_id = Column(Integer, ForeignKey("uttrekk.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    overklubb_id = Column(Integer, nullable=False)

    moderklubb = relationship("Klubb")
    overklubb = relationship("Overklubb")

    __table_args__ = (
        PrimaryKeyConstraint('serieår','moderklubb_id'),
        ForeignKeyConstraint(
            ['serieår', 'overklubb_id'],
            ["tildeling.overklubber.serieår", "tildeling.overklubber.overklubb_id"],
            onupdate="CASCADE"
        ) 
    )