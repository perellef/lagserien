from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, Integer, String, DATE, UniqueConstraint, CheckConstraint

class Notis(DeklarativBase):

    __tablename__ = "nettside.notiser"
    
    notis_id = Column(Integer, primary_key=True, nullable=False)
    serieår = Column(Integer, nullable=False)
    uttrekksdato = Column(DATE, nullable=False)
    prioritet = Column(Integer, nullable=False)
    kategori = Column(String, nullable=False)
    notistype = Column(String, nullable=False)
    undertype = Column(String, nullable=False)
    
    __table_args__ = (
        UniqueConstraint('serieår', 'uttrekksdato', 'prioritet'),
        CheckConstraint("kategori in ('','menn 1. divisjon','menn 2. divisjon','menn 3. divisjon','kvinner 1. divisjon','kvinner 2. divisjon','kvinner 3. divisjon','rangering')"),
        CheckConstraint("notistype in ('kommende-stevne', 'nylig-registrert-stevne', 'oppdatering', 'tronen', 'førsteplass', 'opprykksplass' ,'unngå-nedrykksplass', 'over-5000-poeng-grensen', 'klubbforbedring', 'historisk-plassering', 'historisk-poeng', 'serieutvalget kontroll', 'rangering-allroundere', 'rangering-nøkkelutøvere', 'rangering-nykommere', 'rangering-ideallag', 'rangering-kommersterke', 'rangering-juniorlag', 'rangering-vekstklubber', 'rangering-storklubber')"),
        CheckConstraint("undertype in ('1','overtar', 'overtar-ett-lag-skyver-ut', 'overtar-ett-lag-knepent', 'jevnt', 'tar-innpå', 'øker-forsprang')"),
    )