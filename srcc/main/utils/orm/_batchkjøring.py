from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, String, TIMESTAMP, DATE, PrimaryKeyConstraint, CheckConstraint

class Batchkjøring(DeklarativBase):

    __tablename__ = "metadata.batchkjøringer"

    batch = Column(Integer, nullable=False)
    serieår = Column(Integer, nullable=True)
    uttrekksdato = Column(DATE, nullable=True)
    status = Column(String, nullable=False)
    start = Column(TIMESTAMP, nullable=False)
    slutt = Column(TIMESTAMP, nullable=True)

    __table_args__ = (
        PrimaryKeyConstraint('start'),
        CheckConstraint('batch in (0,1,2,3,4,5,6)'),
        CheckConstraint("status in ('pågår','avbrutt','ferdig','feilet')"),
    )