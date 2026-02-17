from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer, Boolean, ForeignKey, CheckConstraint, PrimaryKeyConstraint
from sqlalchemy.orm import relationship

class Øvelsesregel(DeklarativBase):

    __tablename__ = "tildeling.øvelsesregler"

    serieår = Column(Integer, nullable=False)
    øvelseskode = Column(String, ForeignKey("uttrekk.øvelser.øvelseskode", onupdate="CASCADE"), nullable=False)
    mellomtidgruppe = Column(String, nullable=True)
    mellomtidgruppe_distanse = Column(Integer, nullable=True)
    forutsetter_elektronisk_tidtaking = Column(Boolean, nullable=False)

    øvelse = relationship('Øvelse')

    __table_args__ = (
        PrimaryKeyConstraint('serieår','øvelseskode'),
        CheckConstraint('(mellomtidgruppe is null and mellomtidgruppe_distanse is null) OR (mellomtidgruppe is not null and mellomtidgruppe_distanse is not null)'),
    )