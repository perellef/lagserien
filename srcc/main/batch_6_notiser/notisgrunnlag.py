from srcc.main.utils.orm._arkiv_mann_sluttplasseringer import ArkivMannSluttplassering
from srcc.main.utils.orm._arkiv_kvinne_sluttplasseringer import ArkivKvinneSluttplassering
from srcc.main.utils.orm._stevne import Stevne
from srcc.main.utils.orm._stevneinvitasjon import Stevneinvitasjon
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat
from srcc.main.utils.orm._mann_lag import MannLag
from srcc.main.utils.orm._kvinne_lag import KvinneLag
from srcc.main.utils.orm._mann_laginfo import MannLaginfo
from srcc.main.utils.orm._kvinne_laginfo import KvinneLaginfo
from srcc.main.utils.orm._mann_lagplassering import MannLagplassering
from srcc.main.utils.orm._kvinne_lagplassering import KvinneLagplassering
from srcc.main.utils.orm._mann_lagpotensial import MannLagpotensial
from srcc.main.utils.orm._kvinne_lagpotensial import KvinneLagpotensial
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._kvinne_serieresultat import KvinneSerieresultat
from srcc.main.utils.orm._mann_lagresultat import MannLagresultat
from srcc.main.utils.orm._kvinne_lagresultat import KvinneLagresultat
from srcc.main.utils.orm._mann_utøver_merverdi import MannUtøverMerverdi
from srcc.main.utils.orm._kvinne_utøver_merverdi import KvinneUtøverMerverdi
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._klubbkrets import Klubbkrets
from srcc.main.utils.orm._serie import Serie

from sqlalchemy.orm import selectinload
from collections import defaultdict

class Notisgrunnlag:

    def __init__(self, seriedata, serieår, forrige_uke, igår, idag):
        self.__forrige_uke = igår#forrige_uke
        self.__igår = igår
        self.__idag = idag
        self.__seriedata = seriedata
        self.__serieår = serieår

        print("stevner")
        self.__stevner = self.__hent_stevner(seriedata)
        print("stevneinvitasjoner")
        self.__stevneinvitasjoner = self.__hent_stevneinvitasjoner(seriedata)
        print("utøvere")
        self.__utøvere = self.__hent_utøvere(seriedata)
        print("resultater")
        self.__resultater = self.__hent_resultater(seriedata)
        print("uttrekksresultater")
        self.__uttrekksresultater = self.__hent_uttrekksresultater(seriedata, idag)
        print("historiske plasseringer")
        self.__rekordplasseringer = {
            "menn": self.__hent_rekordplasseringer(seriedata, ArkivMannSluttplassering),
            "kvinner": self.__hent_rekordplasseringer(seriedata, ArkivKvinneSluttplassering),
        }
        print("historiske poeng")
        self.__rekordpoeng = {
            "menn": self.__hent_rekordpoeng(seriedata, ArkivMannSluttplassering),
            "kvinner": self.__hent_rekordpoeng(seriedata, ArkivKvinneSluttplassering),
        }
        print("lag idag")
        self.__lag = {
            uttrekksdato: {
                "menn": self.__hent_lag(seriedata, serieår, uttrekksdato, MannLaginfo, MannLagplassering),
                "kvinner": self.__hent_lag(seriedata, serieår, uttrekksdato, KvinneLaginfo, KvinneLagplassering),
            } for uttrekksdato in (idag, igår, forrige_uke)
        }

        print("noteringer")
        self.__noteringer = {
            "menn": self.__hent_noteringer(seriedata, serieår, MannLagresultat),
            "kvinner": self.__hent_noteringer(seriedata, serieår, KvinneLagresultat),
        }
        
        print("klubbkrets")
        self.__klubbkrets = self.__hent_klubbkrets(seriedata)

        print("livetabell")
        self.__livetabell = self.__utled_livetabell()

        print("lagpotensialer")
        self.__lagpotensialer = {
            uttrekksdato: {
                "menn": self.__hent_lagpotensialer(seriedata, serieår, uttrekksdato, MannLagpotensial),
                "kvinner": self.__hent_lagpotensialer(seriedata, serieår, uttrekksdato, KvinneLagpotensial),
            } for uttrekksdato in (idag, igår, forrige_uke)
        }

        print("serieresultater")
        self.__serieresultater = {
            uttrekksdato: {
                "menn": self.__hent_serieresultater(seriedata, serieår, uttrekksdato, MannSerieresultat),
                "kvinner": self.__hent_serieresultater(seriedata, serieår, uttrekksdato, KvinneSerieresultat),
            } for uttrekksdato in (idag, igår, forrige_uke)
        }
        
        print("serieresultater_ifjor")
        self.__serieresultater_ifjor = {
                "menn": self.__hent_serieresultater(seriedata, serieår-1, idag, MannSerieresultat),
                "kvinner": self.__hent_serieresultater(seriedata, serieår-1, idag, KvinneSerieresultat),
            }

        print("topp 3 data")
        self.__topp_3_nykommere = self.__utled_topp3_data(self.__nykommere)
        self.__topp_3_ideallag = self.__utled_topp3_data(self.__ideallag, reverse=False)
        self.__ekstradata(self.__topp_3_ideallag, self.__lagpoeng)
        self.__topp_3_juniorlag = self.__utled_topp3_data(self.__juniorpoeng)
        self.__ekstradata(self.__topp_3_juniorlag, self.__juniorutøvere)
        self.__topp_3_nøkkelutøvere = self.__utled_topp3_data(self.__nøkkelutøvere)
        self.__ekstradata(self.__topp_3_nøkkelutøvere, self.__seriepoeng)
        self.__topp_3_allroundere = self.__utled_topp3_data(self.__allroundere)
        self.__ekstradata(self.__topp_3_allroundere, self.__utøverøvelser)

    def __utled_livetabell(self):
        livetabell = {}
        for kjønn in ("menn", "kvinner"):
            for lag, (div, plass, poeng) in self.__lag[self.__idag][kjønn].items():
                poengforb = poeng - (0 if lag not in self.__lag[self.__forrige_uke][kjønn] else self.__lag[self.__forrige_uke][kjønn][lag][2])
                plassforb = 0 if lag not in self.__lag[self.__forrige_uke][kjønn] else -plass+self.__lag[self.__forrige_uke][kjønn][lag][1]

                livetabell[(kjønn, div, plass)] = (
                    lag,
                    plass,
                    plassforb,
                    poeng,
                    poengforb,
                    self.__noteringer[kjønn][lag],
                    self.__klubbkrets[lag.klubb_id]
                )
        return livetabell

    def __utled_topp3_data(self, f, key=lambda x: x, reverse=True):
        data_nå = f(self.__idag)
        data_igår = f(self.__igår)
        data_forrige_uke = f(self.__forrige_uke)

        topp_3_nå = list(sorted(data_nå.items(), key=lambda x: key(x[1]), reverse=reverse))[:3]
        plasseringer_igår = {k: i for i,k in enumerate(sorted(data_igår, key=lambda x: key(data_igår[x]), reverse=reverse), start=1)}

        utvikling_siden_igår = lambda x: 0 if x not in data_igår else data_igår[x] 
        utvikling_siden_forrige_uke = lambda x: 0 if x not in data_igår else data_forrige_uke[x] 
        plassforbedring = lambda x,pl: (len(data_nå) if x not in plasseringer_igår else plasseringer_igår[x])-pl

        return [(k, v, plassforbedring(k,i), utvikling_siden_igår(k), utvikling_siden_forrige_uke(k), []) for i,(k,v) in enumerate(topp_3_nå, start=1)]

    def __ekstradata(self, data, f):
        ekstra_data_nå = f(self.__idag)
        ekstra_data_forrige_uke = f(self.__forrige_uke)

        for i,(k, *_) in enumerate(data):
            utvikling_siden_forrige_uke = 0 if k not in ekstra_data_forrige_uke else ekstra_data_forrige_uke[k]
            data[i][-1].append((ekstra_data_nå[k], utvikling_siden_forrige_uke))

    def __nykommere(self, uttrekksdato):
        poeng_per_utøver = defaultdict(list)
        for kjønn in ("menn", "kvinner"):
            for utøver,dct in self.__serieresultater[uttrekksdato][kjønn].items():
                for sres in dct.values():
                    poeng_per_utøver[utøver].append(sres.poeng)

        poeng_per_utøver_ifjor = defaultdict(list)
        for kjønn in ("menn", "kvinner"):
            for utøver,dct in self.__serieresultater_ifjor[kjønn].items():
                for sres in dct.values():
                    poeng_per_utøver_ifjor[utøver].append(sres.poeng)

        poeng_per_utøver = {k: sum(list(sorted(v, reverse=True))[:5]) for k,v in poeng_per_utøver.items()}
        poeng_per_utøver_ifjor = {k: sum(list(sorted(v, reverse=True))[:5]) for k,v in poeng_per_utøver_ifjor.items()}
        return {k: poeng_per_utøver[k]-v for k,v in poeng_per_utøver_ifjor.items() if k in poeng_per_utøver}

    def __hent_stevner(self, seriedata):
        return seriedata.hent(Stevne).all()

    def __hent_stevneinvitasjoner(self, seriedata):
        return seriedata.hent(Stevneinvitasjon).all()
    
    def __hent_utøvere(self, seriedata):
        return {ut.utøver_id: ut for ut in seriedata.hent(Utøver).all()}
    
    def __hent_resultater(self, seriedata):
        return seriedata.hent(Resultat).all()
    
    def __hent_uttrekksresultater(self, seriedata, uttrekksdato):
        return seriedata.hent(MannUttrekksresultat).filter((MannUttrekksresultat.fra_og_med <= uttrekksdato)).union(seriedata.hent(KvinneUttrekksresultat).filter((KvinneUttrekksresultat.fra_og_med <= uttrekksdato))).all()
 
    def __hent_rekordplasseringer(self, seriedata, ArkivSluttplassering):
        plasseringer = seriedata.hent(ArkivSluttplassering).all()

        rekordplasseringer = {}
        for pl in plasseringer:
            nøkkel = (pl.divisjon, pl.klubb_id, pl.lagnummer)
            if nøkkel not in rekordplasseringer:
                rekordplasseringer[nøkkel] = (pl.serieår, pl.plassering, pl.poeng)
                continue
            
            if pl.plassering < rekordplasseringer[nøkkel][1]:
                rekordplasseringer[nøkkel] = (pl.serieår, pl.plassering, pl.poeng)
        return rekordplasseringer

    def __hent_rekordpoeng(self, seriedata, ArkivSluttplassering):
        plasseringer = seriedata.hent(ArkivSluttplassering).all()

        rekordpoeng = {}
        for pl in plasseringer:
            nøkkel = (pl.divisjon, pl.klubb_id, pl.lagnummer)
            if nøkkel not in rekordpoeng:
                rekordpoeng[nøkkel] = (pl.serieår, pl.plassering, pl.poeng)
                continue
                
            if pl.poeng > rekordpoeng[nøkkel][1]:
                rekordpoeng[nøkkel] = (pl.serieår, pl.plassering, pl.poeng)
        return rekordpoeng

    def __hent_lag(self, seriedata, serieår, uttrekksdato, Laginfo, Lagplassering):
        laginfoer = {laginfo.lag: laginfo.poeng for laginfo in (seriedata.hent(Laginfo)
                .options(
                    selectinload(Laginfo.lag)
                )
                .filter(Laginfo.serieår == serieår)
                .filter(Laginfo.fra_og_med <= uttrekksdato)
                .filter((Laginfo.til_og_med == None) | (Laginfo.til_og_med >= uttrekksdato))
                .all())}
        
        lagplasseringer = (seriedata.hent(Lagplassering)
                .options(
                    selectinload(Lagplassering.lag)
                )
                .filter(Lagplassering.serieår == serieår)
                .filter(Lagplassering.fra_og_med <= uttrekksdato)
                .filter((Lagplassering.til_og_med == None) | (Lagplassering.til_og_med >= uttrekksdato))
                .all())

        return {lagpl.lag: (lagpl.divisjon, lagpl.plassering, laginfoer[lagpl.lag]) for lagpl in lagplasseringer}

    def __hent_noteringer(self, seriedata, serieår, Lagresultat):
        enkeltnoteringer = (seriedata.hent(Lagresultat)
                .options(
                    selectinload(Lagresultat.lag)
                )
                .filter(Lagresultat.serieår == serieår)
                .filter(Lagresultat.fra_og_med <= self.__idag)
                .filter((Lagresultat.til_og_med == None) | (Lagresultat.til_og_med >= self.__idag))
                .all())
        
        noteringer = defaultdict(int)
        for lagr in enkeltnoteringer:
            noteringer[lagr.lag] += 1

        return {lag: nots for lag,nots in noteringer.items()}

    def __hent_klubbkrets(self, seriedata):
        return {e.klubb_id: e.krets for e in seriedata.hent(Klubbkrets)
                .filter(Klubbkrets.fra_og_med <= self.__idag)
                .filter((Klubbkrets.til_og_med == None) | (Klubbkrets.til_og_med >= self.__idag))
                .all()}

    def __hent_lagpotensialer(self, seriedata, serieår, uttrekksdato, Lagpotensial):
        return {lagp.lag: lagp.poeng for lagp in (seriedata.hent(Lagpotensial)
                .options(
                    selectinload(Lagpotensial.lag)
                )
                .filter(Lagpotensial.serieår == serieår)
                .filter(Lagpotensial.fra_og_med <= uttrekksdato)
                .filter((Lagpotensial.til_og_med == None) | (Lagpotensial.til_og_med >= uttrekksdato))
                .all())}

    def __hent_serieresultater(self, seriedata, serieår, uttrekksdato, Serieresultat):
        serieresultater = (seriedata.hent(Serieresultat)
                .options(
                    selectinload(Serieresultat.resultat).selectinload(Resultat.utøver),
                )
                .join(Resultat, Resultat.resultat_id == Serieresultat.resultat_id)
                .join(Serie, (Serie.fra_og_med <= Resultat.dato) & (Serie.til_og_med >= Resultat.dato))
                .filter(Serie.serieår == serieår)
                .filter(Serieresultat.fra_og_med <= uttrekksdato)
                .filter((Serieresultat.til_og_med == None) | (Serieresultat.til_og_med >= uttrekksdato))
                .all())
        
        per_utøver = defaultdict(dict)
        for sresultat in serieresultater:
            if sresultat.poeng == None:
                continue
            per_utøver[sresultat.resultat.utøver][sresultat.resultat_id] = sresultat
        return dict(per_utøver)

    def __utøverøvelser(self, uttrekksdato):
        øvelser = {}
        for kjønn in ("menn", "kvinner"):
            for k,v in self.__serieresultater[uttrekksdato][kjønn].items():
                øvelser[k] = len(v)
        return øvelser

    def __ideallag(self, uttrekksdato):
        ideallag = {}
        for kjønn in ("menn", "kvinner"):
            for k,v in self.__lagpotensialer[uttrekksdato][kjønn].items():
                if self.__lag[uttrekksdato][kjønn][k][2] <= 5000:
                    continue
                ideallag[(k,kjønn)] = v
        return ideallag
    
    def __allroundere(self, uttrekksdato):
        poeng_per_utøver = defaultdict(int)
        for utøver,dct in self.__serieresultater[uttrekksdato]["menn"].items():
            for sres in dct.values():
                poeng_per_utøver[utøver] += sres.poeng
        for utøver,dct in self.__serieresultater[uttrekksdato]["kvinner"].items():
            for sres in dct.values():
                poeng_per_utøver[utøver] += sres.poeng
        return poeng_per_utøver

    def __juniorpoeng(self, uttrekksdato):
        juniorpoeng = defaultdict(int)
        for kjønn, Lagresultat in zip(("menn", "kvinner"), (MannLagresultat, KvinneLagresultat)):
            
            lagresultater = (self.__seriedata.hent(Lagresultat)       
                .options(
                    selectinload(Lagresultat.lag),
                    selectinload(Lagresultat.resultat).selectinload(Resultat.utøver),
                )
                .filter_by(serieår=self.__serieår)
                .filter(Lagresultat.fra_og_med <= uttrekksdato)
                .filter((Lagresultat.til_og_med == None) | (Lagresultat.til_og_med >= uttrekksdato))
                .all())
            
            for lres in lagresultater:
                fødtår = lres.resultat.utøver.fødselsår
                if fødtår != None and lres.resultat.dato.year - fødtår >= 20:
                    continue
    
                juniorpoeng[(kjønn, lres.lag)] += self.__serieresultater[uttrekksdato][kjønn][lres.resultat.utøver][lres.resultat_id].poeng
        return juniorpoeng

    def __juniorutøvere(self, uttrekksdato):
        juniorutøvere = defaultdict(int)
        for kjønn, Lagresultat in zip(("menn", "kvinner"), (MannLagresultat, KvinneLagresultat)):
            
            lagresultater = (self.__seriedata.hent(Lagresultat)       
                .options(
                    selectinload(Lagresultat.lag),
                    selectinload(Lagresultat.resultat).selectinload(Resultat.utøver),
                )
                .filter_by(serieår=self.__serieår)
                .filter(Lagresultat.fra_og_med <= uttrekksdato)
                .filter((Lagresultat.til_og_med == None) | (Lagresultat.til_og_med >= uttrekksdato))
                .all())
            
            brukt = set()
            for lres in lagresultater:
                if lres.resultat.utøver_id in brukt:
                    continue
                brukt.add(lres.resultat.utøver)

                fødtår = lres.resultat.utøver.fødselsår
                if fødtår != None and lres.resultat.dato.year - fødtår >= 20:
                    continue

                juniorutøvere[(kjønn, lres.lag)] += 1
        return juniorutøvere

    def __nøkkelutøvere(self, uttrekksdato):
        utøverpoengdel = defaultdict(int)
        for kjønn, UtøverMerverdi, Laginfo, Lagresultat in zip(("menn", "kvinner"), (MannUtøverMerverdi, KvinneUtøverMerverdi), (MannLaginfo, KvinneLaginfo), (MannLagresultat, KvinneLagresultat)):
            lagresultater = (self.__seriedata.hent(Lagresultat)
                .options(
                    selectinload(Lagresultat.resultat),
                    selectinload(Lagresultat.lag)
                )     
                .filter_by(serieår=self.__serieår)
                .filter(Lagresultat.fra_og_med <= uttrekksdato)
                .filter((Lagresultat.til_og_med == None) | (Lagresultat.til_og_med >= uttrekksdato))
                .all())
            
            utøverlag = {lagresultat.resultat.utøver_id: lagresultat.lag for lagresultat in lagresultater}

            utøvere_merverdier = (self.__seriedata.hent(UtøverMerverdi)       
                .filter_by(serieår=self.__serieår)
                .filter(UtøverMerverdi.fra_og_med <= uttrekksdato)
                .filter((UtøverMerverdi.til_og_med == None) | (UtøverMerverdi.til_og_med >= uttrekksdato))
                .all())

            merverdisum = defaultdict(int)
            for merverdi in utøvere_merverdier:
                lag = utøverlag[merverdi.utøver_id]
                merverdisum[(lag.klubb_id, lag.lagnummer)] += merverdi.poeng

            lagpoeng = {(info.klubb_id, info.lagnummer): info.poeng for info in (self.__seriedata.hent(Laginfo)  
                .filter_by(serieår=self.__serieår)
                .filter(Laginfo.fra_og_med <= uttrekksdato)
                .filter((Laginfo.til_og_med == None) | (Laginfo.til_og_med >= uttrekksdato))
                .all())}
            
            for merverdi in utøvere_merverdier:
                lag = utøverlag[merverdi.utøver_id]
                poengdel = int(merverdi.poeng/merverdisum[(lag.klubb_id, lag.lagnummer)]*(lagpoeng[(lag.klubb_id, lag.lagnummer)]))
                utøverpoengdel[(merverdi.utøver, lag, kjønn)] = poengdel
        return utøverpoengdel

        
    def __seriepoeng(self, uttrekksdato):
        per_utøverlag = defaultdict(int)
        for kjønn, Lagresultat in zip(("menn", "kvinner"), (MannLagresultat, KvinneLagresultat)):
            lagresultater = (self.__seriedata.hent(Lagresultat)
                .options(
                    selectinload(Lagresultat.resultat).selectinload(Resultat.utøver),
                    selectinload(Lagresultat.lag)
                )     
                .filter_by(serieår=self.__serieår)
                .filter(Lagresultat.fra_og_med <= uttrekksdato)
                .filter((Lagresultat.til_og_med == None) | (Lagresultat.til_og_med >= uttrekksdato))
                .all())

            for lres in lagresultater:
                poeng = self.__serieresultater[uttrekksdato][kjønn][lres.resultat.utøver][lres.resultat_id].poeng
                per_utøverlag[(lres.resultat.utøver,lres.lag, kjønn)] += poeng
        return per_utøverlag

    def __lagpoeng(self, uttrekksdato):
        return {(k,"menn"): v[2] for k,v in self.__lag[uttrekksdato]["menn"].items()} | {(k,"kvinner"): v[2] for k,v in self.__lag[uttrekksdato]["kvinner"].items()}

    def stevner(self): return self.__stevner
    def stevneinvitasjoner(self): return self.__stevneinvitasjoner
    def utøvere(self): return self.__utøvere
    def resultater(self): return self.__resultater
    def uttrekksresultater(self): return self.__uttrekksresultater
    def rekordplasseringer(self): return self.__rekordplasseringer
    def rekordpoeng(self): return self.__rekordpoeng
    def lag_idag(self): return self.__lag[self.__idag]
    def lag_igår(self): return self.__lag[self.__igår]
    def lagpotensialer(self): return self.__lagpotensialer[self.__idag]
    def livetabell(self): return self.__livetabell
    def topp_3_nykommere(self): return self.__topp_3_nykommere
    def topp_3_ideallag(self): return self.__topp_3_ideallag
    def topp_3_allroundere(self): return self.__topp_3_allroundere
    def topp_3_juniorlag(self): return self.__topp_3_juniorlag
    def topp_3_nøkkelutøvere(self): return self.__topp_3_nøkkelutøvere

