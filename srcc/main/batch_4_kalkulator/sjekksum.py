class Sjekksum:

    @staticmethod
    def tom():
        return Sjekksum(0)

    def __init__(self, _sum_):
        self.__sum = _sum_

    def simuler_med(self, x):
        self.__sum += (1 << x)

    def simuler_uten(self, x):
        self.__sum -= (1 << x) 

    def kopier(self):
        return Sjekksum(self.__sum)
    
    def __eq__(self, andre):
        return self.__sum == andre.__sum
    
    def __hash__(self):
        return self.__sum