from srcc.main.utils.dokumentasjon_uttrekk.råtabell import Råtabell

class Scenario:

    def __init__(self, tittel, annotasjoner, gitt, når, så, eksempler):
        self.__tittel = tittel
        self.__annotasjoner = annotasjoner

        if eksempler == None:
            self.__eksempler = [Scenario.Eksempel(gitt, når, så)]
        else:
            self.__eksempler = self.eksempler_med_eksempelverdier(gitt, når, så, eksempler)
            
    def har_annotasjon(self, annotasjon):
        return annotasjon in self.__annotasjoner

    def eksempler_med_eksempelverdier(self, gitt, når, så, eksempler):
        eksemplene = []
        for rad in eksempler.rader():
            nye_gitt = gitt.copy()
            nye_når = når.copy()
            nye_så = så.copy()
            for variabel,verdi in zip(eksempler.header(),rad):                
                nye_gitt = Scenario.smett_inn_eksempelverdier(nye_gitt, variabel, verdi)
                nye_når = Scenario.smett_inn_eksempelverdier(nye_når, variabel, verdi)
                nye_så = Scenario.smett_inn_eksempelverdier(nye_så, variabel, verdi)
                
            eksemplene.append(Scenario.Eksempel(nye_gitt, nye_når, nye_så))
        return eksemplene
    
    @staticmethod
    def smett_inn_eksempelverdier(seksjon, variabel, verdi):
        return {Scenario.innsett_eksempelverdi_utsagn(utsagn, variabel, verdi): Scenario.innsett_eksempelverdi_tabell(tabell, variabel, verdi) for utsagn,tabell in seksjon.items()}

    @staticmethod
    def innsett_eksempelverdi_utsagn(utsagn, variabel, verdi):    
        return utsagn.replace(variabel, verdi)

    @staticmethod
    def innsett_eksempelverdi_tabell(tabell, variabel, til_verdi):
        if tabell == None:
            return tabell
        
        nye_rader = [[verdi.replace(variabel, til_verdi) for verdi in rad] for rad in tabell.rader()]
        ny_tabell = Råtabell(tabell.header().copy(), nye_rader)

        return ny_tabell
                    
    def eksempler(self):
        return self.__eksempler
    
    def tittel(self):
        return self.__tittel

    def __str__(self):
        return self.__tittel
    
    class Eksempel:

        def __init__(self, gitt, når, så):
            self.__gitt = gitt
            self.__når = når
            self.__så = så

        def gitt(self):
            return self.__gitt
        
        def når(self):
            return self.__når
        
        def så(self):
            return self.__så