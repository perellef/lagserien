from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, Boolean, ForeignKey, PrimaryKeyConstraint, UniqueConstraint
from sqlalchemy.orm import relationship

class KvinneSerieøvelse(DeklarativBase):

    __tablename__ = "serie.kvinner_serieøvelser"

    serieår = Column(Integer, nullable=False)
    øvelseskode = Column(String, ForeignKey("uttrekk.øvelser.øvelseskode", onupdate="CASCADE"), nullable=False)
    er_obligatorisk = Column(Boolean, nullable=False)
    er_teknisk = Column(Boolean, nullable=False)
    prioritet = Column(Integer, nullable=False)

    øvelse = relationship('Øvelse')

    __table_args__ = (
        PrimaryKeyConstraint('serieår','øvelseskode'),
        UniqueConstraint('serieår','prioritet'),
    )
