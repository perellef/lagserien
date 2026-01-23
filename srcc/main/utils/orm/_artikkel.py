from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, TIMESTAMP, CheckConstraint

class Artikkel(DeklarativBase):

    __tablename__ = "nettside.artikler"

    publisert = Column(TIMESTAMP, primary_key=True, nullable=False)
    skrevet_av = Column(String, nullable=True)
    tittel = Column(String, nullable=False)
    image = Column(String, nullable=False)
    bildeinnhold = Column(String, nullable=False)
    fotograf = Column(String, nullable=False)
    inngress = Column(String, nullable=False)
    innhold = Column(String, nullable=False)

    __table_args__ = (
        CheckConstraint("tittel <> ''"),
        CheckConstraint("skrevet_av <> ''"),
        CheckConstraint("tittel <> ''"),
        CheckConstraint("image <> ''"),
        CheckConstraint("bildeinnhold <> ''"),
        CheckConstraint("fotograf <> ''"),
        CheckConstraint("inngress <> ''"),
        CheckConstraint("innhold <> ''"),
    )