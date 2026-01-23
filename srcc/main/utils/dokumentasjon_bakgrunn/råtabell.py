import difflib

class Råtabell:

    def fjern(self, *attributter):
        if len(attributter) == 0:
            return self
        ny = self.__fjern(attributter[0])
        return ny.fjern(*attributter[1:])

    def __fjern(self, attributt):
        i = self.__header.index(attributt)
        nye_rader = [rad[:i]+rad[i+1:] for rad in self.__rader]
        return Råtabell(self.__header[:i]+self.__header[i+1:], nye_rader)

    def attributt(self, attributt):
        i = self.__header.index(attributt)
        return [rad[i] for rad in self.__rader]

    def __samstem_kolonnebredder(tbl1, tbl2):
        return tbl1.__str__(ekstern=tbl2), tbl2.__str__(ekstern=tbl1)

    def __init__(self, header, rader):
        self.__header = header 
        self.__rader = rader

    def __str__(self, ekstern=None):
        
        bredderader = [self.__header]+self.__rader
        if ekstern != None:
            bredderader += [ekstern.header()] + ekstern.rader()

        kolbredde = [max(len(celle) for celle in kol) for kol in zip(*bredderader)]
        kolonnejuster = lambda rad: "| " + " | ".join(f"{str(cell):<{bredde}}" for cell, bredde in zip(rad, kolbredde)) + " |"

        kantrad = "| " + " | ".join(bredde*'-' for bredde in kolbredde) + " |"

        output = kolonnejuster(self.__header)
        output += "\n"+kantrad
        for rad in sorted(self.__rader):
            output += "\n"+kolonnejuster(rad)
        output += "\n"+kantrad
        return output
    
    def header(self):
        return self.__header
    
    def rader(self):
        return self.__rader
    
    def __eq__(self, andre):
        return str(self) == str(andre)
    
    def tabelldiff(self, andre):
        samstemte = Råtabell.__samstem_kolonnebredder(self, andre)
        return '\n'.join(list(difflib.unified_diff(samstemte[0].splitlines(), samstemte[1].splitlines()))[3:])