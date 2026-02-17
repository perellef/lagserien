import sys
sys.path.append('./')

from srcc.main.utils.dokumentasjon_uttrekk.råtabell import Råtabell

from srcc.main.utils.dokumentasjon_uttrekk.domenespråk import Domenepråk
from srcc.main.utils.dokumentasjon_uttrekk.defaultobjekter import defaultobjekter
from srcc.main.utils.dokumentasjon_uttrekk.defaultverdier import defaultverdier

class Tabelloversetter:
    
    @staticmethod
    def fra_råtabell(cls, råtabell):
        attributter = [Domenepråk.til_kodeattributt(attr) for attr in råtabell.header()]

        defaultobjekter = Tabelloversetter.__finn_defaultobjekter(råtabell)

        inkomplette_kwargs = Tabelloversetter.__oversett_til_kwargs(attributter, råtabell)
        kwargs = Tabelloversetter.__sett_inn_defaultverdier(cls, attributter, inkomplette_kwargs)

        objekter = [cls(**kwarg) for kwarg in kwargs]    

        return objekter, defaultobjekter
    
    @staticmethod
    def __oversett_til_kwargs(attributter, råtabell):
        return [{kodeattr: Domenepråk.til_kodeverdi(domeneattr, verdi) for kodeattr,domeneattr,verdi in zip(attributter,råtabell.header(),rad)} for rad in råtabell.rader()]

    @staticmethod
    def __sett_inn_defaultverdier(cls, attributter, dict_objekter):
        overflødige_attributter = set(attributter) - set(cls.attributter())
        manglende_attributter = set(cls.attributter()) - set(attributter)
        if len(overflødige_attributter) > 0:
            raise ValueError(f"Attributtene {', '.join(overflødige_attributter)} er overflødige.")
        return [d | {attr: defaultverdier[(cls,attr)](d) for attr in manglende_attributter} for d in dict_objekter]
        
    @staticmethod
    def __finn_defaultobjekter(råtabell):
        domene_kwargs = [{attr:v for attr,v in zip(råtabell.header(),rad)} for rad in råtabell.rader()]

        implisitte_objekter = {a: defaultobjekter[a] for a in råtabell.header() if a in defaultobjekter}
        verdier = {a: set(dict_objekt[a] for dict_objekt in domene_kwargs) for a in implisitte_objekter}

        return [(type(f(next(iter(verdier[a])))), [f(v) for v in verdier[a] if f(v) is not None]) for a,f in implisitte_objekter.items()]
        
    @staticmethod
    def til_råtabell(tabellheader, cls, objekter):
        header = [Domenepråk.fra_kodeattributt(attr) for attr in cls.attributter()]
        rader = [[Domenepråk.fra_kodeverdi(attr, v) for attr,v in zip(header, obj.to_dict().values())] for obj in objekter]
        
        return Tabelloversetter.__omjuster_tabell(header, rader, tabellheader)

    @staticmethod
    def __omjuster_tabell(header, rader, ønsket_header):
        indekser = [header.index(attr) for attr in ønsket_header]

        omjustert_header = [header[i] for i in indekser]
        omjusterte_rader = [[rad[i] for i in indekser] for rad in rader]

        return Råtabell(omjustert_header, omjusterte_rader)