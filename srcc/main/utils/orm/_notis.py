from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, String, DATE, UniqueConstraint, CheckConstraint

class Notis(DeklarativBase):

    __tablename__ = "nettside.notiser"
    
    notis_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    generert = Column(DATE, nullable=False)
    prioritet = Column(Integer, nullable=False)
    notistype = Column(String, nullable=False)
    undertype = Column(String, nullable=False)
    
    __table_args__ = (
        UniqueConstraint('generert', 'prioritet'),
        CheckConstraint("notistype in ('serieutvalget kontroll', 'klubbforbedring', 'kommende stevne')"),
        CheckConstraint("undertype in ('1','2','3')"),
    )