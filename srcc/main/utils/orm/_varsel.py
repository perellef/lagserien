from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, TIMESTAMP, String, Boolean

class Varsel(DeklarativBase):

    __tablename__ = "nettside.varsler"

    tidspunkt = Column(TIMESTAMP, primary_key=True, nullable=False)
    tittel = Column(String, nullable=False)
    spørring = Column(String, nullable=False)
    lagt_inn_av = Column(String, nullable=False)
    er_slettet = Column(Boolean, nullable=False)