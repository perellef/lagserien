from srcc.main.utils.orm._notis import Notis
from srcc.main.utils.orm._notiselement import Notiselement

from datetime import timedelta

class Notisgenerator:

    def __init__(self, serieår, uttrekksdato, neste_notisid, notisgrunnlag):
        self.serieår = serieår
        self.uttrekksdato = uttrekksdato
        self.neste_notisid = neste_notisid
        self.prioritet = 0

        self.stevner = notisgrunnlag.stevner()
        self.stevneinvitasjoner = notisgrunnlag.stevneinvitasjoner()
        self.utøvere = notisgrunnlag.utøvere()
        self.resultater = notisgrunnlag.resultater()
        self.uttrekksresultater = notisgrunnlag.uttrekksresultater()
        self.rekordplasseringer = notisgrunnlag.rekordplasseringer()
        self.rekordpoeng = notisgrunnlag.rekordpoeng()
        self.lag_idag = notisgrunnlag.lag_idag()
        self.lag_igår = notisgrunnlag.lag_igår()
        self.livetabell = notisgrunnlag.livetabell()
        self.topp_3_ideallag = notisgrunnlag.topp_3_ideallag()
        self.topp_3_allroundere = notisgrunnlag.topp_3_allroundere()
        self.topp_3_nykommere = notisgrunnlag.topp_3_nykommere()
        self.topp_3_juniorlag = notisgrunnlag.topp_3_juniorlag()
        self.topp_3_nøkkelutøvere = notisgrunnlag.topp_3_nøkkelutøvere()

    def notis(self, kategori, notistype, undertype):
        self.prioritet += 1
        return Notis(
            notis_id=self.neste_notisid+self.prioritet,
            serieår=self.serieår,
            uttrekksdato=self.uttrekksdato,
            prioritet=self.prioritet,
            kategori=kategori,
            notistype=notistype,
            undertype=undertype,
        )

    def klubbelement(self, klubb, prioritet):
        return Notiselement(
            notis_id=self.neste_notisid+self.prioritet,
            elementtype="klubb",
            prioritet=prioritet,
            felt1=str(klubb.klubb_id),
            felt2=klubb.klubbnavn,
            felt3=None,
            felt4=None,
            felt5=None
        )

    def lagelement(self, lag, kjønn, prioritet):
        return Notiselement(
            notis_id=self.neste_notisid+self.prioritet,
            elementtype="lag",
            prioritet=prioritet,
            felt1=str(lag.klubb_id),
            felt2=lag.klubb.klubbnavn,
            felt3=lag.lagnummer,
            felt4=kjønn,
            felt5=None
        )
        
    def utøverelement(self, utøver, prioritet):
        return Notiselement(
            notis_id=self.neste_notisid+self.prioritet,
            elementtype="utøver",
            prioritet=prioritet,
            felt1=str(utøver.utøver_id),
            felt2=utøver.navn,
            felt3=None,
            felt4=None,
            felt5=None
        )
         
    def notiselement(self, elementtype, prioritet, felt1, felt2, felt3, felt4, felt5, felt6):
        return Notiselement(
            notis_id=self.neste_notisid+self.prioritet,
            elementtype=elementtype,
            prioritet=prioritet,
            felt1=str(felt1) if felt1 != None else None,
            felt2=str(felt2) if felt2 != None else None,
            felt3=str(felt3) if felt3 != None else None,
            felt4=str(felt4) if felt4 != None else None,
            felt5=str(felt5) if felt5 != None else None,
            felt6=str(felt6) if felt6 != None else None
        )
    
    
    def identifiser_tabellmomenter(self, kjønn, notistype, divisjon, plassering):
        lag_over = lambda x,kj: list(sorted([lag for lag,(d,pl, _) in self.lag_idag[kj].items() if d == divisjon and pl <= x], key=lambda x: self.lag_idag[kj][x]))
        lag_igår_over = lambda x,kj: list(sorted([lag for lag,(d,pl, _) in self.lag_igår[kj].items() if d == divisjon and pl <= x], key=lambda x: self.lag_igår[kj][x]))
        lag_under_500p_under = lambda x,poeng,kj: list(sorted([lag for lag,(d,pl,p) in self.lag_idag[kj].items() if d == divisjon and pl > x and p+500 >= poeng], key=lambda x: self.lag_idag[kj][x]))
        lag_under_300p_under = lambda x,poeng,kj: list(sorted([lag for lag,(d,pl,p) in self.lag_idag[kj].items() if d == divisjon and pl > x and p+300 >= poeng], key=lambda x: self.lag_idag[kj][x]))
        lag_under_1000p_under = lambda x,poeng,kj: list(sorted([lag for lag,(d,pl,p) in self.lag_idag[kj].items() if d == divisjon and pl > x and p+1000 >= poeng], key=lambda x: self.lag_idag[kj][x]))
        lag_under_300p_over = lambda x,poeng,kj: list(sorted([lag for lag,(d,pl,p) in self.lag_idag[kj].items() if d == divisjon and pl <= x and p-300 <= poeng], key=lambda x: self.lag_idag[kj][x]))
        forbedrer_seg = lambda x,kj: self.lag_idag[kj][x][2] > (0 if x not in self.lag_igår[kj] else self.lag_igår[kj][x][2])
        lag_rett_under = lambda x,kj: [lag for lag,(d,pl,_) in self.lag_idag[kj].items() if d == divisjon and pl == x+1]
        lag_igår_rett_under = lambda x,kj: [lag for lag,(d,pl,_) in self.lag_igår[kj].items() if d == divisjon and pl == x+1]
        laginfo_igår = lambda x,kj: (None,None,0) if x not in self.lag_igår[kj] else self.lag_igår[kj][x]

        lag = lag_over(plassering, kjønn)
        lag_igår = lag_igår_over(plassering, kjønn)

        if len(lag) == 0:
            return []

        nye = [e for e in lag if e not in lag_igår]
        borte = [e for e in lag_igår if e not in lag]

        if len(nye) > 0 and len(borte) > 0:
            if len(nye) > 1:
                return [(notistype, kjønn, divisjon, "overtar", (plassering-1, plassering+1), nye)]
                # Flere nye lag plasserer seg på opprykksplass

            nytt_lag = nye[0]
            if self.lag_idag[kjønn][nytt_lag][1] <= plassering - 1:
                return [(notistype, kjønn, divisjon, "overtar-ett-lag-skyver-ut", (plassering-1, plassering+1), nye+borte)]
                # Ås IL plasserer seg på opprykk og skyver IK Tjalve ut

            under_300p_under = lag_under_300p_under(plassering, self.lag_idag[kjønn][nye[0]][2], kjønn)
            if len(under_300p_under) > 0:
                return [(notistype, kjønn, divisjon, "overtar-ett-lag-knepent", (plassering-1, plassering+1), nye+[under_300p_under[0]])]
                # Ås IL knepent foran i opprykksstrid

            return [(notistype, kjønn, divisjon, "overtar", (plassering-1, plassering+1), nye)]
            # Ås IL overtar 3. plassen

        under_300p_over = lag_under_300p_over(plassering, self.lag_idag[kjønn][lag[-1]][2], kjønn)
        under_500p_under = lag_under_500p_under(plassering, self.lag_idag[kjønn][lag[-1]][2], kjønn)
            
        jevne = under_300p_over + under_500p_under
        if len(under_300p_over) > 0 and len(jevne) >= 3 and sum(map(lambda x: forbedrer_seg(x, kjønn), jevne))/len(jevne) > 2/3-1e-6:
            # Flere lag ligger og vaker over nedrykksplass
            return [(notistype, kjønn, divisjon, "jevnt", (plassering-1, plassering+1), jevne)]

        under_1000p_under = lag_under_1000p_under(plassering, self.lag_idag[kjønn][lag[-1]][2], kjønn)
        if len(under_1000p_under) > 0:
            lag_som_tar_innpå = [e for e in under_1000p_under if 2*(self.lag_idag[kjønn][lag[-1]][2]-self.lag_idag[kjønn][e][2]) < (laginfo_igår(lag[-1], kjønn)[2]-laginfo_igår(e, kjønn)[2])]

            if len(lag_som_tar_innpå) >= 1:
                return [(notistype, kjønn, divisjon, "tar-innpå", (plassering-1, plassering+1), lag_som_tar_innpå)]
        else:

            rett_under = lag_rett_under(plassering, kjønn)
            igår_rett_under = lag_igår_rett_under(plassering, kjønn)
            if len(rett_under) > 0 and len(igår_rett_under) > 0:
                øker_forsprang = [e for e in lag if laginfo_igår(e, kjønn)[2]-(laginfo_igår(rett_under[0], kjønn)[2]) < 500 and self.lag_idag[kjønn][e][2]-self.lag_idag[kjønn][rett_under[0]][2] > 2*(laginfo_igår(e, kjønn)[2]-laginfo_igår(rett_under[0], kjønn)[2])]
                if len(øker_forsprang) >= 1:
                    return [(notistype, kjønn, divisjon, "øker-forsprang", (plassering-1, plassering+1), øker_forsprang)]
                    # Ås IL sikrer forsprang på opprykk
        return []


    def kommende_stevner(self, notiser):
        return
        for invitasjon in self.__stevneinvitasjoner:
            if invitasjon.påmeldte < 100:
                continue

            notiser.append(
                Notis(
                    notis_id=self.neste_notisid+self.prioritet,
                    serieår=self.serieår,
                    uttrekksdato=self.uttrekksdato,
                    prioritet=self.prioritet,
                    notistype="kommende-stevne",
                    undertype="1",
                )
            )

            self.prioritet += 1
            

    def nylig_registrerte_stevner(self, notiser, notiselementer):
        return

        # TODO: håndtere mange små stevner lest inn

        for stevne in self.__stevner:
            if stevne["antall-resultater"] < 100:
                continue
            if stevne["rapportert"] != self.uttrekksdato:
                continue

            notiser.append(self.notis("??", "nylig-registrert-stevne", "1"))

            notiselementer.append(
                Notiselement(
                    notis_id=self.neste_notisid+self.prioritet,
                    elementtype="stevne",
                    prioritet=1,
                    felt1=stevne.stevne_id,
                    felt2=stevne.stevnetittel,
                    felt3=None,
                    felt4=None,
                    felt5=None
                )
            )

            self.prioritet += 1


    def oppdatering(self, notiser, notiselementer):
        forbedrede_lag = 0
        for kjønn in ("menn", "kvinner"):
            for lag in self.lag_idag[kjønn]:
                forbedrede_lag += int(self.lag_idag[kjønn][lag][2] > (0 if lag not in self.lag_igår[kjønn] else self.lag_igår[kjønn][lag][2]))

        nye_stevner = len([e for e in self.stevner if e.rapportert == self.uttrekksdato])
        nye_resultater = len([e for e in self.uttrekksresultater if e.fra_og_med == self.uttrekksdato])

        if min(nye_stevner, nye_resultater, forbedrede_lag) > 0:
            notiser.append(self.notis("", "oppdatering", "1"))
            notiselementer.append(self.notiselement("oppdatering-info", 1, nye_stevner, nye_resultater, forbedrede_lag, None, None, None))

    def seriekontroll(self, notiser):
        rapportert = {el.stevne_id: el.rapportert for el in self.stevner}
        resultatdata = {el.resultat_id: (rapportert[el.stevne_id], el.statistikk_resultat_id) for el in self.resultater}

        fjernede = set(resultatdata[e.resultat_id][1] for e in self.uttrekksresultater if e.til_og_med == self.uttrekksdato-timedelta(1))
        nye = set(resultatdata[e.resultat_id][1] for e in self.uttrekksresultater if e.fra_og_med > resultatdata[e.resultat_id][0])

        korrigerte = len(fjernede.intersection(nye))
        manglende = len(nye.difference(fjernede))
        fjernede = len(fjernede.difference(nye))

        if korrigerte + manglende + fjernede < 30:
            return
        
        notiser.append(self.notis("??", "kontroll-serieutvalget", "1"))


    def rangering_allroundere(self, notiser, notiselementer):
        # utøver overtar allrounder-tronen
        # ELLER utøver forbedrer allroundertronen
        # ELLER annen utøver tar innpå allrounder-tronen
        
        if self.topp_3_allroundere[0][2] == 0:
            return

        notiser.append(self.notis("rangering", "rangering-allroundere", "1"))

        prioritet = 0
        for utøver, poeng, _, igår, forrige_uke, ekstra in self.topp_3_allroundere:
            prioritet += 1
            notiselementer.append(self.utøverelement(utøver, prioritet))
            prioritet += 1
            notiselementer.append(self.notiselement("allroundere-rad", prioritet, poeng, poeng-forrige_uke, self.utøvere[utøver.utøver_id].fødselsår, ekstra[0][0], ekstra[0][0]-ekstra[0][1], None))

    def rangering_nøkkelutøvere(self, notiser, notiselementer):
        # utøver overtar nøkkelutøver-tronen
        # ELLER utøver forbedrer nøkkelutøver-tronen
        # ELLER annen utøver tar innpå nøkkelutøver-tronen

        if self.topp_3_nøkkelutøvere[0][2] == 0:
            return
        
        notiser.append(self.notis("rangering", "rangering-nøkkelutøvere", "1"))
        
        prioritet = 0
        for (utøver, lag, kjønn),  nøkkelpoeng, _, igår, forrige_uke, ekstra in self.topp_3_nøkkelutøvere:
            prioritet += 1
            notiselementer.append(self.utøverelement(utøver, prioritet))
            prioritet += 1
            notiselementer.append(self.lagelement(lag, kjønn, prioritet))
            prioritet += 1
            notiselementer.append(self.notiselement("nøkkelutøvere-rad", prioritet, nøkkelpoeng, nøkkelpoeng-forrige_uke, self.utøvere[utøver.utøver_id].fødselsår, ekstra[0][0], ekstra[0][0]-ekstra[0][1], None))

    def rangering_nykommere(self, notiser, notiselementer):
        # utøver overtar nykommere-tronen
        # ELLER utøver forbedrer nykommere-tronen
        # ELLER annen utøver tar innpå nykommere-tronen

        if self.topp_3_nykommere[0][2] == 0:
            return

        notiser.append(self.notis("rangering", "rangering-nykommere", "1"))
        
        prioritet = 0
        for utøver, poeng, _, igår, forrige_uke, _ in self.topp_3_nykommere:
            prioritet += 1
            notiselementer.append(self.utøverelement(utøver, prioritet))
            prioritet += 1
            notiselementer.append(self.notiselement("nykommere-rad", prioritet, poeng, poeng-forrige_uke, self.utøvere[utøver.utøver_id].fødselsår, None, None, None))

    def rangering_ideallag(self, notiser, notiselementer):
        # lag overtar ideallag-tronen
        # ELLER utøver forbedrer ideallag-tronen
        # ELLER annen utøver tar innpå ideallag-tronen

        if self.topp_3_ideallag[0][2] == 0:
            return
        
        notiser.append(self.notis("rangering", "rangering-ideallag", "1"))
        
        prioritet = 0
        for (lag, kjønn),  potensial, _, igår, forrige_uke, ekstra in self.topp_3_ideallag:
            prioritet += 1
            notiselementer.append(self.lagelement(lag, kjønn, prioritet))
            prioritet += 1
            notiselementer.append(self.notiselement("ideallag-rad", prioritet, potensial, potensial-forrige_uke, self.lag_idag[kjønn][lag][0], ekstra[0][0], ekstra[0][0]-ekstra[0][1], None))


    def rangering_juniorlag(self, notiser, notiselementer):
        # lag overtar juniorlag-tronen
        # ELLER utøver forbedrer juniorlag-tronen
        # ELLER annen utøver tar innpå juniorlag-tronen

        if self.topp_3_juniorlag[0][2] == 0:
            return

        notiser.append(self.notis("rangering", "rangering-juniorlag", "1"))
        
        prioritet = 0
        for (lag, kjønn), juniorpoeng, _, igår, forrige_uke, ekstra in self.topp_3_juniorlag:
            prioritet += 1
            notiselementer.append(self.lagelement(lag, kjønn, prioritet))
            prioritet += 1
            notiselementer.append(self.notiselement("juniorlag-rad", prioritet, juniorpoeng, juniorpoeng-forrige_uke, ekstra[0][0], ekstra[0][0]-ekstra[0][1], None, None))

    def tabellmomenter(self, notiser, notiselementer):
        momenter = (self.identifiser_tabellmomenter("menn","tronen", 1, 1)
            + self.identifiser_tabellmomenter("menn", "unngå-nedrykksplass", 1, 10)
            + self.identifiser_tabellmomenter("kvinner","tronen", 1, 1)
            + self.identifiser_tabellmomenter("kvinner", "unngå-nedrykksplass", 1, 10)
            + self.identifiser_tabellmomenter("menn", "førsteplass", 2, 1)
            + self.identifiser_tabellmomenter("menn", "opprykksplass", 2, 4)
            + self.identifiser_tabellmomenter("menn", "unngå-nedrykksplass", 2, 10)
            + self.identifiser_tabellmomenter("kvinner", "førsteplass", 2, 1)
            + self.identifiser_tabellmomenter("kvinner", "opprykksplass", 2, 4)
            + self.identifiser_tabellmomenter("kvinner", "unngå-nedrykksplass", 2, 10)
            + self.identifiser_tabellmomenter("menn", "førsteplass", 3, 1)
            + self.identifiser_tabellmomenter("menn", "opprykksplass", 3, 4)
            + self.identifiser_tabellmomenter("kvinner", "førsteplass", 3, 1)
            + self.identifiser_tabellmomenter("kvinner", "opprykksplass", 3, 4))

        for notistype, kjønn, divisjon, undertype, plasseringsrange, aktuelle_lag in momenter:
            notiser.append(self.notis(f"{kjønn} {divisjon}. divisjon", notistype, undertype))
            
            prioritet = 1
            for lag in aktuelle_lag:
                notiselementer.append(self.lagelement(lag, kjønn, prioritet))
                prioritet += 1

            notiselementer.append(self.notiselement("tabell", prioritet, kjønn, divisjon, None, None, None, None))
            prioritet += 1
                
            plassering = 0
            while True:
                plassering += 1
                if (kjønn, divisjon, plassering) not in self.livetabell:
                    break
                if plassering > max(plasseringsrange[1], max(self.lag_idag[kjønn][lag][1] for lag in aktuelle_lag)):
                    break

                if all((
                    plassering < plasseringsrange[0] or plassering > plasseringsrange[1],
                    all((self.lag_idag[kjønn][lag][1] != plassering for lag in aktuelle_lag))
                )):
                    continue

                lag, _, plassforb, poeng, poengforb, noteringer, klubbkrets = self.livetabell[(kjønn, divisjon, plassering)]
                notiselementer.append(self.notiselement("tabell-rad-lag", prioritet, lag.klubb_id, lag.klubb.klubbnavn, lag.lagnummer, kjønn, None, None))
                prioritet += 1
                notiselementer.append(self.notiselement("tabell-rad", prioritet, plassering, plassforb, poeng, poengforb, noteringer, klubbkrets))
                prioritet += 1


    def over_5000_poeng_grensen(self, notiser, notiselementer):
        for kj in ("menn", "kvinner"):
            prioritet = 1
            ny_notis = False
            for lag, (divisjon, _, poeng) in self.lag_idag[kj].items():
                if divisjon < 3:
                    continue
                if lag.lagnummer > 1:
                    continue
                if poeng < 5000:
                    continue
                if lag in self.lag_igår[kj] and self.lag_igår[kj][lag][2] >= 5000:
                    continue
                
                if not ny_notis:
                    notiser.append(self.notis(f"{kj} 3. divisjon", "over-5000-poeng-grensen", "1"))
                    ny_notis = True
                notiselementer.append(self.lagelement(lag, kj, prioritet))
                prioritet += 1
            


    def stor_lagforbedring(self, notiser, notiselementer):
        return
        poengøkning = lambda lag: lag["poeng"] if lag not in self.__lagpoeng_igår else lag["poeng"]-self.__lagpoeng_igår[lag]["poeng"]
        prioritet = lambda lag: 6*poengøkning(lag) + lag["poeng"]

        terskel = {"1": 6000, "2": 5000, "3": 4000, "4": 3500, "5": 3000, "6": 2500, "7": 2000, "8": 1500, "9": 1250, "10": 1250, "11": 1000, "12": 1000}[self.uttrekksdato.get_month()]

        største_lagøkninger = list(sorted([(lag, poengøkning(lag)) for lag in self.__lagpoeng_idag if lag["lagnummer"] == 1 and poengøkning(lag) >= terskel], key=lambda x: -prioritet(x[0])))[:3]

        for lag, poeng in største_lagøkninger:
            notiser.append(
                Notis(
                    notis_id=self.neste_notisid+self.prioritet,
                    serieår=self.serieår,
                    uttrekksdato=self.uttrekksdato,
                    prioritet=self.prioritet,
                    notistype="klubbforbedring",
                    undertype="1",
                )
            )

            notiselementer.append(
                Notiselement(
                    notis_id=self.neste_notisid+self.prioritet,
                    elementtype="lag",
                    prioritet=1,
                    felt1=lag.klubb_id,
                    felt2=lag.klubb.klubbnavn,
                    felt3="menn", #TODO
                    felt4=poeng,
                    felt5=None
                )
            )

            self.neste_notisid += 1
            prioritet += 1

    def lag_rekordplassering(self, notiser, notiselementer):
        prioritet = 1
        for kj in ("menn", "kvinner"):
            for lag, (divisjon, plassering, poeng) in self.lag_idag[kj].items():
                nøkkel = (lag.klubb_id, lag.lagnummer)
                if nøkkel not in self.rekordplasseringer[kj]:
                    continue
                if poeng < 5000:
                    continue
                if divisjon != self.rekordplasseringer[kj][nøkkel][0]:
                    continue
                if plassering < self.rekordplasseringer[kj][nøkkel][1]:
                    continue
                if poeng + self.lagpotensialer[kj][lag] < self.rekordplasseringer[kj][nøkkel][2]:
                    continue

                notiser.append(self.notis(f"{kj} {divisjon}. divisjon", "historisk-plassering", "1"))
                notiselementer.append(self.lagelement(lag, kj, prioritet))

                prioritet += 1

    def lag_rekordpoeng(self, notiser, notiselementer):
        prioritet = 1
        for kj in ("menn", "kvinner"):
            for lag, (divisjon, plassering, poeng) in self.lag_idag[kj].items():
                nøkkel = (lag.klubb_id, lag.lagnummer)
                if nøkkel not in self.rekordpoeng[kj]:
                    continue
                if divisjon != self.rekordpoeng[kj][nøkkel][0]:
                    continue
                if plassering < self.rekordpoeng[kj][nøkkel][1]:
                    continue
                if poeng <= self.rekordpoeng[kj][nøkkel][2]:
                    continue

                notiser.append(self.notis(f"{kj} {divisjon}. divisjon", "historisk-poeng", "1"))
                notiselementer.append(self.lagelement(lag, kj, prioritet))

                prioritet += 1
