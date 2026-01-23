
from sqlalchemy.orm import as_declarative
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy.inspection import inspect 

from functools import lru_cache

@as_declarative()
class DeklarativBase:
    @declared_attr
    def __tablename__(cls):
        return cls.__name__.lower()
    
    @classmethod
    @lru_cache(maxsize=None)
    def attributter(cls):
        return [kolonne.key for kolonne in inspect(cls).mapper.column_attrs]

    @classmethod
    @lru_cache(maxsize=None)
    def relasjoner(cls):
        return [kolonne.key for kolonne in inspect(cls).mapper.relationships]

    @classmethod
    @lru_cache
    def primærnøkkel(cls):
        return [x.name for x in inspect(cls).primary_key]

    def primærverdi(self):
        return tuple(getattr(self, attr) for attr in type(self).primærnøkkel())
    
    def to_dict(self):
        return {attr: getattr(self, attr) for attr in type(self).attributter()}

    def __hash__(self):
        if not hasattr(self, "_hash_cache"):
            self._hash_cache = hash(tuple(getattr(self, attr) for attr in type(self).attributter()))
        return self._hash_cache
    
    def __eq__(self, andre):
        return self.__hash__() == andre.__hash__()
    
    def __repr__(self):
        return str(tuple(getattr(self, attr) for attr in type(self).attributter()))
    
    def __str__(self):
        return str(tuple(getattr(self, attr) for attr in type(self).attributter()))