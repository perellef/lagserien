from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String

class Øvelse(DeklarativBase):

    __tablename__ = "bakgrunn.øvelser"

    øvelseskode = Column(String, primary_key=True, nullable=False)
    øvelsesnavn = Column(String, unique=True, nullable=False)
