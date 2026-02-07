from sqlalchemy import create_engine, insert, delete, and_, or_, text
from sqlalchemy.inspection import inspect
from sqlalchemy.orm import sessionmaker

from srcc.main.utils.orm.deklarativ_base import DeklarativBase

BULKSIZE = 500

class Seriedata:

    def __init__(self, database):
        self.__engine = create_engine(database.value)
        self.__SessionFactory = sessionmaker(bind=self.__engine)

    def initier(self):
        DeklarativBase.metadata.create_all(bind=self.__engine)

    def åpne(self):
        self.__session = self.__SessionFactory()
        
    def begin(self):
        self.__session.begin()
        
    def commit(self):
        self.__session.commit()

    def rollback(self):
        self.__session.rollback()

    def lukk(self):
        self.__session.close()

    def connect(self):
        return self.__engine.connect()

    def hent(self, cls):
        return self.__session.query(cls)
    
    def innsett_muteres(self, objekt):
        self.__session.add(objekt)
        self.__session.flush()

    def bulkinnsett_muteres(self, objekter):
        if not objekter:
            return
        
        for i in range(0,len(objekter),BULKSIZE):
            bulkobjekter = objekter[i:i+BULKSIZE]
            self.__session.add_all(bulkobjekter)
        self.__session.flush()

    def bulkinnsett(self, objekter):
        if not objekter:
            return
        
        cls = type(objekter[0])
        for i in range(0,len(objekter),BULKSIZE):
            bulkobjekter = objekter[i:i+BULKSIZE] 
            dict_objekter = [obj.to_dict() for obj in bulkobjekter]

            insert_statement = insert(cls).values(dict_objekter)
            self.__session.execute(insert_statement)

    def slett_alt(self, cls):
        self.__session.execute(delete(cls))

    def slett_og_bulkinnsett(self, objekter):
        if not objekter:
            return
        
        cls = type(objekter[0])
    
        self.slett_alt(cls)
        
        for i in range(0,len(objekter),BULKSIZE):
            bulkobjekter = objekter[i:i+BULKSIZE] 
            dict_objekter = [obj.to_dict() for obj in bulkobjekter]

            insert_statement = insert(cls).values(dict_objekter)
            self.__session.execute(insert_statement)

    def bulkinnsett_erstatt(self, objekter):
        if not objekter:
            return

        cls = type(objekter[0])
        
        eksisterende_objekter = {obj.primærverdi(): obj for obj in self.hent(cls).all()}

        keys = set(eksisterende_objekter)
        gjenværende_objekter = [obj for obj in objekter if obj.primærverdi() not in keys]
        
        update_data = []
        for obj in objekter:
            if obj.primærverdi() not in eksisterende_objekter:
                continue
            nøkler = dict(zip(cls.primærnøkkel(), obj.primærverdi()))
            
            update_values = {column.name: getattr(obj, column.name) for column in cls.__table__.columns if column.name not in cls.primærnøkkel()}
            update_data.append({**nøkler, **update_values})

        self.__session.bulk_update_mappings(cls, update_data)

        self.bulkinnsett(gjenværende_objekter)

    def bulkinnsett_ignorer(self, objekter):
        if not objekter:
            return

        cls = type(objekter[0])

        eksisterende_objekter = set(obj.primærverdi() for obj in self.hent(cls).all())
        gjenværende_objekter = [obj for obj in objekter if obj.primærverdi() not in eksisterende_objekter]
        
        self.bulkinnsett(gjenværende_objekter)

    def bulkslett(self, objekter):
        if not objekter:
            return
        cls = type(objekter[0])

        for i in range(0,len(objekter),BULKSIZE):
            
            bulkobjekter = objekter[i:i+BULKSIZE] 

            primærnøkkel = inspect(cls).primary_key
            objektverdier = [tuple(getattr(obj, key.name) for key in primærnøkkel) for obj in bulkobjekter]

            filter_conditions = [and_(*[getattr(cls, key.name) == value for key, value in zip(primærnøkkel, key_values)]) for key_values in objektverdier]
            final_filter_condition = or_(*filter_conditions)

            delete_statement = delete(cls).where(final_filter_condition)

            self.__session.execute(delete_statement)
        self.__session.flush()

    def slett_alle(self, cls):
        self.__session.query(cls).delete()
