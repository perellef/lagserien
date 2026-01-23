
class Tabellarbeid:
    
    @staticmethod
    def sett_opp_tabell(laginfo, oppstillinger, topplag):

        def divisjon(lag): 
            try: 
                return topplag[(lag.klubb_id, lag.lagnummer)]
            except KeyError:
                return 3

        tabeller = {}

        for lag in laginfo:
            div = divisjon(lag)
            if div not in tabeller:
                tabeller[divisjon(lag)] = []
            tabell = tabeller[divisjon(lag)]

            Tabellarbeid.tabellinnsett_lag(tabell, lag, laginfo, oppstillinger)    

        return tabeller

    @staticmethod
    def tabellinnsett_lag(tabell, lag, laginfo, oppstillinger):
        
        er_bedre_lag = lambda lag1,lag2:  Tabellarbeid.slår_lag(lag1, lag2, laginfo, oppstillinger)

        for i,annet_lag in enumerate(tabell):
            if er_bedre_lag(lag, annet_lag):
                tabell.insert(i,lag)
                return
            
        tabell.append(lag)

    @staticmethod
    def slår_lag(lag1, lag2, laginfo, oppstillinger):

        seriepoeng = lambda lag: laginfo[lag][0]

        if seriepoeng(lag1) != seriepoeng(lag2):
            return seriepoeng(lag1) > seriepoeng(lag2)
        
        enkeltpoenger = lambda lag: list(sorted([e[0] for e in oppstillinger[lag]["OBLIGATORISK"]+oppstillinger[lag]["VALGFRI"]], reverse=True))
        
        enkeltpoenger1 = enkeltpoenger(lag1)
        enkeltpoenger2 = enkeltpoenger(lag2)

        for poeng1,poeng2 in zip(enkeltpoenger1, enkeltpoenger2):
            if poeng1 != poeng2:
                return poeng1 > poeng2
            
        return False
