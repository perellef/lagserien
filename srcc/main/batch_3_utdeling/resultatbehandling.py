from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._overklubb import Overklubb
from srcc.main.utils.orm._overbygning import Overbygning
from srcc.main.utils.orm._klubb_unntatt_overbygning import KlubbUnntattOverbygning
from srcc.main.utils.orm._utøver_unntatt_overbygning import UtøverUnntattOverbygning
from srcc.main.utils.orm._rullestolutøver import Rullestolutøver
from srcc.main.utils.orm._øvelsesregel import Øvelsesregel
from srcc.main.utils.orm._resultatbytte import Resultatbytte
from srcc.main.utils.orm._klubbkrets import Klubbkrets

from sqlalchemy.orm import joinedload
from sqlalchemy import func
from collections import defaultdict

ALDERSGRENSE = 11

class Resultatbehandling:

    @staticmethod
    def fjern_resultater_til_klubber_utenfor_seriekretsene(seriedata, resultatforløp):
        
        # TODO: gjøre bakoverkompatibel
        klubbkretser = seriedata.hent(Klubbkrets).filter_by(til_og_med=None).all()

        klubbens_krets = {}
        kretsantall = defaultdict(int)
        for klubbkrets in klubbkretser:
            kretsantall[klubbkrets.krets] += 1
            klubbens_krets[klubbkrets.klubb_id] = klubbkrets.krets

        for resultat,(klubb,forløp) in resultatforløp.items():
            if klubb == None:
                continue
            
            if klubb.klubb_id not in klubbens_krets: # Tilpasning dokumentasjon
                continue
            if kretsantall[klubbens_krets[klubb.klubb_id]] >= 20:
                continue

            resultatforløp[resultat] = (None, forløp + " Fjernet (resultatets klubb ikke i seriekrets).")


    @staticmethod
    def fjern_mellomtider_til_serieresultat(seriedata, serieår, resultatforløp):
        er_mellomtid = lambda x: str(x.prestasjon).endswith("+")

        for resultat,(klubb,forløp) in resultatforløp.items():

            if klubb == None:
                continue
            if not er_mellomtid(resultat):
                continue
            if not Resultatbehandling.__er_mellomtid_til_serieresultat(resultat, seriedata, serieår):
                continue

            resultatforløp[resultat] = (None, forløp + " Fjernet (mellomtid til serieresultat).")

    @staticmethod
    def __er_mellomtid_til_serieresultat(res1, seriedata, serieår):

        stevneresultater = seriedata.hent(Resultat).filter_by(utøver_id=res1.utøver_id, stevne_id=res1.stevne_id, dato=res1.dato).all()
        øvelsesregel1 = seriedata.hent(Øvelsesregel).filter_by(serieår=serieår, øvelseskode=res1.øvelseskode).one()

        for res2 in stevneresultater:
            øvelsesregel2 = seriedata.hent(Øvelsesregel).filter_by(serieår=serieår, øvelseskode=res2.øvelseskode).one()
            if (øvelsesregel2.mellomtidgruppe == None):
                continue
            
            if all((
                øvelsesregel1.mellomtidgruppe == øvelsesregel2.mellomtidgruppe,
                øvelsesregel1.mellomtidgruppe_distanse < øvelsesregel2.mellomtidgruppe_distanse
            )):
                return True
                
        return False

    @staticmethod
    def fjern_manuelle_resultater_i_elektroniske_øvelser(seriedata, serieår, resultatforløp):
        er_manuell = lambda x: len(str(x.prestasjon).rstrip("+").split(",")[-1]) <= 1

        for resultat,(klubb,forløp) in resultatforløp.items():
            
            if klubb == None:
                continue
            if not er_manuell(resultat):
                continue

            øvelsesregel = seriedata.hent(Øvelsesregel).filter_by(serieår=serieår, øvelseskode=resultat.øvelseskode).one()
            if not øvelsesregel.forutsetter_elektronisk_tidtaking:
                continue
            
            resultatforløp[resultat] = (None, forløp + " Fjernet (manuell tid i øvelse som forutsetter elektronisk).")
                        
    @staticmethod    
    def fjern_yngre_utovere(resultatforløp):
        for resultat,(klubb,forløp) in resultatforløp.items():
            if klubb == None:
                continue

            konkurranseår = resultat.dato.year
            utøver = resultat.utøver

            if utøver.fødselsår == None:
                continue
            if konkurranseår - utøver.fødselsår >= ALDERSGRENSE:
                continue
            
            resultatforløp[resultat] = (None, forløp + f" Fjernet (utøver under seriens {ALDERSGRENSE}-års aldersgrense).")
                 
    @staticmethod      
    def fjern_rullestolresultater(seriedata, serieår, resultatforløp):
        rullestolutøvere_id = set([e.utøver_id for e in seriedata.hent(Rullestolutøver).filter_by(serieår=serieår).all()])
        
        for resultat,(klubb,forløp) in resultatforløp.items():

            if klubb == None:
                continue
            if resultat.utøver_id not in rullestolutøvere_id:
                continue
            
            resultatforløp[resultat] = (None, forløp + f" Fjernet (resultat av rullestolutøver).")
            
    @staticmethod
    def flytt_overbygningsresultater(seriedata, serieår, resultatforløp):
        overbygninger = (seriedata
                .hent(Overbygning)
                .options(joinedload(Overbygning.moderklubb))
                .filter_by(serieår=serieår)
                .all())

        for overbygning in overbygninger:
            overklubb = (seriedata
                    .hent(Overklubb)
                    .options(joinedload(Overklubb.klubb))     
                    .filter_by(serieår=serieår, overklubb_id=overbygning.overklubb_id)
                    .one())
            utøvere_unntatt_overbygning = (seriedata
                    .hent(UtøverUnntattOverbygning)
                    .options(joinedload(UtøverUnntattOverbygning.utøver)) 
                    .filter_by(serieår=serieår, moderklubb_id=overbygning.moderklubb_id)
                    .all())

            for resultat,(klubb,forløp) in resultatforløp.items():

                if klubb != overbygning.moderklubb:
                    continue

                utøver = resultat.utøver
                if utøver.fødselsår == None:
                    continue

                utøveralder = resultat.dato.year - utøver.fødselsår
        
                if not any((
                    overklubb.alder_11_14 and (utøveralder in [11,12,13,14]),
                    overklubb.alder_15_19 and (utøveralder in [15,16,17,18,19]),
                    overklubb.alder_20_pluss and (utøveralder >= 20)
                )):
                    continue
                
                if any((unntatt.utøver == utøver) for unntatt in utøvere_unntatt_overbygning):
                    resultatforløp[resultat] = (overbygning.moderklubb, forløp + " Ikke flyttet (utøver unntatt overbygning).")
                else:
                    resultatforløp[resultat] = (overbygning.overklubb.klubb, forløp + " Flyttet (overbygning).")
      
    @staticmethod        
    def tilbakeflytt_utøverunntatte_overbygningsresultater(seriedata, serieår, resultatforløp):
        overbygninger = (seriedata
            .hent(Overbygning)
            .options(joinedload(Overbygning.moderklubb))
            .filter_by(serieår=serieår)
            .all())

        for overbygning in overbygninger:
            overklubb = (seriedata
                    .hent(Overklubb)
                    .options(joinedload(Overklubb.klubb))     
                    .filter_by(serieår=serieår, overklubb_id=overbygning.overklubb_id)
                    .one())
            utøvere_unntatt_overbygning = (seriedata
                    .hent(UtøverUnntattOverbygning)
                    .options(joinedload(UtøverUnntattOverbygning.utøver)) 
                    .filter_by(serieår=serieår, moderklubb_id=overbygning.moderklubb_id)
                    .all())
            
            overklubbresulater = [resultat for resultat,(klubb,_) in resultatforløp.items() if klubb == overklubb.klubb]
            unntatte_utøvere = set(utøver.utøver_id for utøver in utøvere_unntatt_overbygning)
            
            for resultat in overklubbresulater:
                if resultat.utøver_id not in unntatte_utøvere:
                    continue
                
                _,forløp = resultatforløp[resultat]
                resultatforløp[resultat] = (overbygning.moderklubb, forløp + " Tilbakeflyttet (utøver unntatt overbygning).")

    def overskriv_klubb_ved_resultatbytte(seriedata, uttrekksdato, resultatforløp):
        resultatbytter = (seriedata
                .hent(Resultatbytte)
                .options(
                    joinedload(Resultatbytte.klubb),                    
                )
                .filter(func.date(Resultatbytte.registrert) <= uttrekksdato)
                .all())
        
        resultatbytter = {resbytte.statistikk_resultat_id: resbytte.klubb for resbytte in resultatbytter}

        for resultat, (utledet_klubb, forløp) in resultatforløp.items():
            if resultat.statistikk_resultat_id not in resultatbytter:
                continue
            
            manuelt_satt_klubb = resultatbytter[resultat.statistikk_resultat_id]
            if utledet_klubb == manuelt_satt_klubb:
                continue
            
            if manuelt_satt_klubb == None:
                resultatforløp[resultat] = (manuelt_satt_klubb, forløp + f" Manuelt fjernet.")
            else:
                resultatforløp[resultat] = (manuelt_satt_klubb, forløp + f" Manuelt satt til {manuelt_satt_klubb.klubbnavn}.")
            
    @staticmethod        
    def tilbakeflytt_klubbunntatte_overbygningsresultater(seriedata, serieår, uttrekksdato, resultatforløp):
        klubber_unntatt_overbygning = seriedata.hent(KlubbUnntattOverbygning).filter_by(serieår=serieår).all()
        resultatbytter = set(x.statistikk_resultat_id for x in seriedata.hent(Resultatbytte).filter(func.date(Resultatbytte.registrert) <= uttrekksdato).all())

        for klubb_unntatt_overbygning in klubber_unntatt_overbygning:
            moderklubb = klubb_unntatt_overbygning.moderklubb
            overklubb = klubb_unntatt_overbygning.overklubb

            moderklubbresulater = [resultat for resultat,(klubb,_) in resultatforløp.items() if klubb == moderklubb]
            overklubbresulater = [resultat for resultat,(klubb,_) in resultatforløp.items() if klubb == overklubb.klubb]

            moderutøvere = {resultat.utøver for resultat in moderklubbresulater}

            for resultat in overklubbresulater:
                if resultat.statistikk_resultat_id in resultatbytter:
                    continue

                if resultat.utøver not in moderutøvere:
                    continue
                
                utøver = resultat.utøver
                if utøver.fødselsår == None:
                    continue
                
                utøveralder = resultat.dato.year - utøver.fødselsår

                if not any((
                    overklubb.alder_11_14 and (utøveralder in [11,12,13,14]),
                    overklubb.alder_15_19 and (utøveralder in [15,16,17,18,19]),
                    overklubb.alder_20_pluss and (utøveralder >= 20)
                )):
                    continue
                
                _,forløp = resultatforløp[resultat]
                resultatforløp[resultat] = (moderklubb, forløp + " Tilbakeflyttet (klubb unntatt overbygning).")
