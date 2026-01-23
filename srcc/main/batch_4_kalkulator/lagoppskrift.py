from functools import reduce

class Lagoppskrift:

    def __init__(self, oppstilling, skippede, f):
        obl, val, reserver = oppstilling.obl(), oppstilling.val(), oppstilling.reserver()

        self.__oppstilling = oppstilling
        self.__skippede = skippede

        oppstilling.simuler(f)

        self.__sjekksum = oppstilling.sjekksum()
        self.__poeng = oppstilling.poeng()
        self.__handlinger = oppstilling.handlinger()

        self.__obl_uten = obl.vis_uten()
        self.__obl_med = obl.vis_med()
        self.__val_uten = val.vis_uten()
        self.__val_med = val.vis_med()
        self.__reserver_uten = reserver.vis_uten()
        self.__reserver_med = reserver.vis_med()

        oppstilling.reverser()

    def __gt__(self, andre):
        return self.__poeng < andre.__poeng # omvendt for at prioritetskøen skal prioritere oppskrifter høy poeng 

    def poeng(self):
        return self.__poeng
    
    def sjekksum(self):
        return (
            self.__sjekksum[0].__hash__(),
            self.__sjekksum[1].__hash__(),
            self.__sjekksum[2].__hash__(),
        )

    def lag(self):
        return self.__oppstilling.lag(self.__skippede, self.__handlinger)
    
    def er_skippet(self, resultat):
        return any((skippet >> resultat.resultatindeks & 1 == 1 for skippet in self.__skippede.values()))
    
    def __str__(self):
        s = []
        s.append(f" ====== LAGOPPSKRIFT [{self.__poeng}] =========")
        s.append(" [ OBLIGATORISK ]")
        for res in self.__oppstilling.obl():
            if self.er_skippet(res):
                s.append(f" # {res}")
            else:
                s.append(f"   {res}")
            if len(self.__obl_uten) > 0:
                if res == self.__obl_uten[0]:
                    if len(self.__obl_med) > 0: 
                        s[-1] = f" * {self.__obl_uten[0]} -> {self.__obl_med[0]}"
                    else:     
                        s[-1] = f" * {self.__obl_uten[0]} -> <ingenting>"
        if len(self.__obl_uten) == 0 and len(self.__obl_med) > 0:
            s.append(f" * <ingenting> -> {self.__obl_med[0]}")

        s.append(" [ VALGFRIE ]")
        for res in self.__oppstilling.val():
            if self.er_skippet(res):
                s.append(f" # {res}")
            else:
                s.append(f"   {res}")
            if len(self.__val_uten) > 0:
                if res == self.__val_uten[0]:
                    if len(self.__val_med) > 0: 
                        s[-1] = f" * {self.__val_uten[0]} -> {self.__val_med[0]}"
                    else:     
                        s[-1] = f" * {self.__val_uten[0]} -> <ingenting>"
        if len(self.__val_uten) == 0 and len(self.__val_med) > 0:
            s.append(f" * <ingenting> -> {self.__val_med[0]}")

        s.append(" [ RESERVER ]")
        for res in self.__oppstilling.reserver():
            if self.er_skippet(res):
                s.append(f" # {res}")
            else:
                s.append(f"   {res}")
            if len(self.__reserver_uten) > 0:
                if res == self.__reserver_uten[0]:
                    if len(self.__reserver_med) > 0: 
                        s[-1] = f" * {self.__reserver_uten[0]} -> {self.__reserver_med[0]}"
                    else:     
                        s[-1] = f" * {self.__reserver_uten[0]} -> <ingenting>"
        if len(self.__reserver_uten) == 0 and len(self.__reserver_med) > 0:
            s.append(f" * <ingenting> -> {self.__reserver_med[0]}")
        s.append(" =====================================")

        return '\n'.join(s)
  