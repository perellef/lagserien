from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, CheckConstraint

class Klubb(DeklarativBase):

    __tablename__ = "uttrekk.klubber"

    klubb_id = Column(Integer, primary_key=True, nullable=False)
    klubbnavn = Column(String, unique=True, nullable=False)
    kjernenavn = Column(String, nullable=False)

    __table_args__ = (
        CheckConstraint("kjernenavn <> ''"),
    )
