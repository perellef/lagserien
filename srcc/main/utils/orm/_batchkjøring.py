from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, TIMESTAMP, DATE, PrimaryKeyConstraint, CheckConstraint

class Batchkjøring(DeklarativBase):

    __tablename__ = "metadata.batchkjøringer"

    batch = Column(Integer, nullable=False)
    serieår = Column(Integer, nullable=True)
    uttrekksdato = Column(DATE, nullable=True)
    start = Column(TIMESTAMP, nullable=False)
    slutt = Column(TIMESTAMP, nullable=False)

    __table_args__ = (
        PrimaryKeyConstraint('batch','serieår','uttrekksdato'),
        CheckConstraint('batch in (0,1,2,3,4,5,6)'),
    )