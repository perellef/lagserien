from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, TIMESTAMP
from sqlalchemy.orm import relationship

class NettsideBesøk(DeklarativBase):

    __tablename__ = "nettside.nettside_besøk"
    
    tidspunkt = Column(TIMESTAMP, primary_key=True, nullable=False)
    bruker_uuid = Column(String, nullable=False)
    side = Column(String, nullable=False)
