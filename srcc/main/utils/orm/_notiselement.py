from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, String, ForeignKey, PrimaryKeyConstraint, CheckConstraint
from sqlalchemy.orm import relationship

class Notiselement(DeklarativBase):

    __tablename__ = "nettside.notiselementer"
    
    notis_id = Column(Integer, ForeignKey("nettside.notiser.notis_id", onupdate="CASCADE"), nullable=False)
    elementtype = Column(String, nullable=False)
    prioritet = Column(Integer, nullable=False)
    felt1 = Column(String, nullable=True)
    felt2 = Column(String, nullable=True)
    felt3 = Column(String, nullable=True)
    felt4 = Column(String, nullable=True)
    felt5 = Column(String, nullable=True)
    felt6 = Column(String, nullable=True)

    klubb = relationship('Notis')
    
    __table_args__ = (
        PrimaryKeyConstraint('notis_id', 'elementtype', 'prioritet'),
        CheckConstraint("elementtype in ('klubb','utøver','lag','stevne','kontroll','oppdatering-info','tabell','tabell-rad','tabell-rad-lag','ideallag-rad','juniorlag-rad','allroundere-rad','nykommere-rad','nøkkelutøvere-rad')"),
    )