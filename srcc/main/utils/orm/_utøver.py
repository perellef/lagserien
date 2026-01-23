from .deklarativ_base import DeklarativBase

from sqlalchemy import Column, String, Integer

class Utøver(DeklarativBase):

    __tablename__ = "bakgrunn.utøvere"

    utøver_id =  Column(Integer, primary_key=True, nullable=False)
    navn =  Column(String, nullable=False)
    fødselsår =  Column(Integer, nullable=True)