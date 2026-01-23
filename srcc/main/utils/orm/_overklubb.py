from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, Boolean, ForeignKey, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class Overklubb(DeklarativBase):

    __tablename__ = "representasjon.overklubber"

    serieår = Column(Integer, nullable=False)
    overklubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    alder_11_14 = Column(Boolean, nullable=False)
    alder_15_19 = Column(Boolean, nullable=False)
    alder_20_pluss = Column(Boolean, nullable=False)

    klubb = relationship("Klubb")

    __table_args__ = (
        PrimaryKeyConstraint('serieår','overklubb_id'),
    )