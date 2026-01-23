from functools import reduce

class Set:

    def __init__(self, iterable):
        self.__set = set(iterable)

    @staticmethod
    def of(*lst):
        ...

    @staticmethod
    def combine(*lst):
        ...

    def map(self, func):
        return Set(map(func, self.__set))
    
    def filter(self, pred):
        return Set(filter(pred, self.__set))
    
    def reduce(self, acc, func):
        return reduce(func, self.__set, acc)
    
    def union(self, other):
        ...

    def intersection(self, other):
        ...
    
    def difference(self, other):
        ...

    def adjust_if(self, pred, func):
        return self.map(lambda x: func(x) if pred(x) else x)
    
    def group_by(self, func):
        ...

    def flatten(self):
        ...

    def min(self, key=None):
        return min(self, key=key)
    
    def max(self, key=None):
        return max(self, key=key)
    
    def sum(self):
        return sum(self.__set)
    
    def count(self, pred=lambda x: True):
        return len(self.map(pred))

    def any(self, pred):
        return any((pred(x) for x in self.__set))
    
    def all(self, pred):
        return all((pred(x) for x in self.__set))
    
    def none(self, pred):
        return not any((pred(x) for x in self.__set))
    
    def copy(self):
        ...

    def __str__(self):
        return str([str(el) for el in self.__set])
    
    def __eq__(self, other):
        return self.__set == other.__set