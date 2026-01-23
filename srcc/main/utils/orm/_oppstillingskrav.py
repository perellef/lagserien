from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, PrimaryKeyConstraint

class Oppstillingskrav(DeklarativBase):

    __tablename__ = "kalkulatormat.oppstillingskrav"

    serieår = Column(Integer, nullable=False)
    divisjon = Column(Integer, nullable=False)
    antall_obligatoriske = Column(Integer, nullable=False)
    antall_valgfri = Column(Integer, nullable=False)
    maks_obligatoriske_løp = Column(Integer, nullable=False)
    maks_valgfri_løp = Column(Integer, nullable=False)
    maks_resultater_per_utøver = Column(Integer, nullable=False)

    __table_args__ = (
        PrimaryKeyConstraint('serieår', 'divisjon'),
    )