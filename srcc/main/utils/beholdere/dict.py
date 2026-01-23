from functools import reduce

class Dict():

    def __init__(self, dictionary):
        assert isinstance(dictionary, dict)
        self.__dict = dictionary
    
    def keys(self):
        from .liste import Liste
        return Liste(self.__dict.keys())

    def values(self):
        from .liste import Liste
        return Liste(self.__dict.values())
    
    def items(self):
        from .liste import Liste
        return Liste(self.__dict.items())
    
    def __iter__(self):
        return iter(self.__dict.keys())
    
    def get(self, key):
        return self.__dict[key]
    
    def to_dict(self):
        return self.__dict

    def __len__(self):
        return len(self.__dict)
    
    def __str__(self):
        return "{" + ','.join(f"{k}: {v}" for k,v in self.__dict.items()) + "}"
    
    def __eq__(self, other): #TODO: lag test til denne
        if len(self) != len(other):
            return False
        for el1,el2 in zip(self.items(), other.items()):
            if el1 != el2:
                return False
        return True