from .deklarativ_base import DeklarativBase

from sqlalchemy import Integer, Column, String, Boolean, DATE, ForeignKey, PrimaryKeyConstraint, UniqueConstraint
from sqlalchemy.orm import relationship 

class Stevneinvitasjon(DeklarativBase):

    __tablename__ = "uttrekk.stevneinvitasjoner"

    stevne_id = Column(Integer, ForeignKey("uttrekk.stevner.stevne_id", onupdate="CASCADE"), unique=True, nullable=True)
    stevnedato = Column(DATE, nullable=False)
    stevnetittel = Column(String, nullable=False)
    arena = Column(String, nullable=False)
    arrangør = Column(String, nullable=False)
    krets = Column(String, nullable=False)
    skal_vises = Column(Boolean, nullable=False)
    er_manuelt_satt_stevne_id = Column(Boolean, nullable=False)
    
    stevne = relationship('Stevne')
    
    __table_args__ = (
        PrimaryKeyConstraint('stevnedato','stevnetittel', 'arena', 'arrangør', 'krets'),
        UniqueConstraint('stevne_id'),
    )

