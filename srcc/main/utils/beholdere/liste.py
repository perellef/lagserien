from functools import reduce

class Liste:

    def __init__(self, iterable):
        self.__liste = list(iterable)

    @staticmethod
    def of(*lst):
        return Liste([l for l in lst])
    
    @staticmethod
    def concat(*lst):
        return Liste([l for l in lst]).flatten()
    
    @staticmethod 
    def merge(*lst):
        return Liste.concat(*lst).distinct()

    def map(self, func):
        return Liste(map(func, self.__liste))
    
    def filter(self, pred):
        return Liste(filter(pred, self.__liste))
    
    def reduce(self, acc, func):
        return reduce(func, self.__liste, acc)
    
    def adjust_if(self, pred, func):
        return self.map(lambda x: func(x) if pred(x) else x)
    
    def group_by(self, func):
        from .dict import Dict

        groups = {}
        for el in self.__liste:
            val = func(el)
            if val not in groups:
                groups[val] = []
            groups[val].append(el)
             
        return Dict({k: Liste(v) for k,v in groups.items()})
    
    def sort(self, key=None, reverse=False):
        return Liste(sorted(self.__liste, key=key, reverse=reverse))
    
    def distinct(self, func=lambda y: y):
        sett = set()
        return Liste(x for x in self.__liste if func(x) not in sett and not sett.add(func(x)))
    
    def flatten(self):
        return Liste(el for elem in self.__liste for el in elem)
    
    def skip(self, n=1):
        if n<0 or n>len(self.__liste):
            raise ValueError
        return Liste(self.__liste[n:])
    
    def min(self, key=lambda x: x, with_ties=False):
        if not with_ties:
            return min(self.__liste, key=key)
        max_element = self.map(key).min()
        return self.filter(lambda x: key(x)==max_element)
    
    def max(self, key=lambda x: x, with_ties=False):
        if not with_ties:
            return max(self.__liste, key=key)
        max_element = self.map(key).max()
        return self.filter(lambda x: key(x)==max_element)
    
    def get(self, index):
        return self.__liste[index]
    
    def first(self, n=None):
        if n == None:
            if len(self.__liste)==0:
                return None
            return self.__liste[0]
        else:
            if n > len(self.__liste):
                return self.copy()
            return Liste(self.__liste[:n])
    
    def last(self, n=None):
        if n == None:
            if len(self.__liste)==0:
                return None
            return self.__liste[-1]
        else:
            if n > len(self.__liste):
                return self.copy()
            return Liste(self.__liste[-n:])
    
    def sum(self):
        return sum(self.__liste)
    
    def count(self, pred=lambda _: True):
        return self.filter(pred).__len__()

    def any(self, pred):
        return any((pred(x) for x in self.__liste))
    
    def all(self, pred):
        return all((pred(x) for x in self.__liste))

    def none(self, pred):
        return not any((pred(x) for x in self.__liste))

    def is_sorted(self, reverse=False):
        pairs_OK = lambda x,y: x < y if not reverse else y < x
        return all(pairs_OK(x,y) for x, y in zip(self.__liste, self.__liste[1:]))

    def exclude(self, lst):
        return self.filter(lambda x: x not in lst)
    
    def copy(self):
        return Liste(self)
    
    def __str__(self):
        return "[" + ', '.join(self.map(str)) + "]"
    
    def __hash__(self):
        return hash(tuple(self))

    def __iter__(self):
        return iter(self.__liste)
    
    def __len__(self):
        return len(self.__liste)
    
    def __eq__(self, other):
        return self.__liste == list(other)
    
    def __gt__(self, other):
        return self.__liste > list(other)