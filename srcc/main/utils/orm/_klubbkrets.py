from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, DATE, String, Integer, ForeignKey, PrimaryKeyConstraint, UniqueConstraint, CheckConstraint
from sqlalchemy.orm import relationship

class Klubbkrets(DeklarativBase):

    __tablename__ = "uttrekk.klubbkretser"

    klubb_id = Column(Integer, ForeignKey("bakgrunn.klubber.klubb_id", onupdate="CASCADE"), nullable=False)
    fra_og_med = Column(DATE, nullable=False)
    til_og_med = Column(DATE, nullable=True)
    krets = Column(String, nullable=False)

    klubb = relationship("Klubb")

    __table_args__ = (
        PrimaryKeyConstraint('klubb_id','fra_og_med'),
        UniqueConstraint('klubb_id','til_og_med'),
    )

