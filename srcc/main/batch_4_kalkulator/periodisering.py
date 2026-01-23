from datetime import timedelta

from sqlalchemy.orm import joinedload

class Periodisering:
    
    @staticmethod
    def periodiser_lagresultater(seriedata, serieår, uttrekksdato, oppstillinger, serieklasser):

        lagresultater = []
        utløpte_lagresultater = []

        løpende_lagres = (seriedata.hent(serieklasser.lagresultat)
            .options(
                joinedload(serieklasser.lagresultat.lag),
                joinedload(serieklasser.lagresultat.resultat)
            )
            .filter_by(serieår=serieår)
            .filter_by(til_og_med=None)
            .all())
        
        Serieresultat = serieklasser.serieresultat

        serieresultater = (seriedata
                .hent(Serieresultat)
                .filter(Serieresultat.fra_og_med <= uttrekksdato)
                .filter((Serieresultat.til_og_med == None) | (Serieresultat.til_og_med >= uttrekksdato))
                .filter(Serieresultat.poeng != None)
                .filter(Serieresultat.klubb_id != None)
                .all())
        
        resultatets_poeng = {e.resultat_id: e.poeng for e in serieresultater}

        finnes_allerede = set()
        for lagres in løpende_lagres:
            assert uttrekksdato > lagres.fra_og_med, "Lagresultat kan ikke ha startet i dag eller senere"

            if (
                lagres.lag in oppstillinger
                and lagres.resultat_id in resultatets_poeng
                and (resultatets_poeng[lagres.resultat_id], lagres.resultat) in oppstillinger[lagres.lag][lagres.oppstillingstype]
            ):
                finnes_allerede.add((lagres.lag, lagres.resultat_id))
                continue

            lukket_klubbres = serieklasser.lagresultat(
                serieår=lagres.serieår,
                klubb_id=lagres.klubb_id,
                lagnummer=lagres.lagnummer,
                oppstillingstype=lagres.oppstillingstype,
                fra_og_med=lagres.fra_og_med,
                til_og_med=uttrekksdato - timedelta(days=1),
                resultat_id=lagres.resultat_id
            )

            utløpte_lagresultater.append(lagres)
            lagresultater.append(lukket_klubbres)

        for lag,oppstilling in oppstillinger.items():
            for oppstillingstype in ("OBLIGATORISK", "VALGFRI"):
                for (_, resultat) in oppstilling[oppstillingstype]:
                    if (lag, resultat.resultat_id) in finnes_allerede:
                        continue
                    
                    lagres = serieklasser.lagresultat(
                        serieår=lag.serieår,
                        klubb_id=lag.klubb_id,
                        lagnummer=lag.lagnummer,
                        oppstillingstype=oppstillingstype,
                        fra_og_med=uttrekksdato,
                        til_og_med=None,
                        resultat_id=resultat.resultat_id
                    )
                    
                    lagresultater.append(lagres)

        seriedata.bulkslett(utløpte_lagresultater)
        seriedata.bulkinnsett(lagresultater)

    @staticmethod
    def periodiser_laginfo(seriedata, serieår, uttrekksdato, laginfo, serieklasser):

        ny_laginfo = []
        utløpt_laginfo = []

        løpende_laginfo = (seriedata.hent(serieklasser.laginfo)
            .options(joinedload(serieklasser.laginfo.lag))
            .filter_by(serieår=serieår)
            .filter_by(til_og_med=None))

        finnes_allerede = set()
        for info in løpende_laginfo:
            assert uttrekksdato > info.fra_og_med, "Lagresultat kan ikke ha startet i dag eller senere"

            if (
                info.lag in laginfo
                and laginfo[info.lag] == (
                    info.poeng,
                    info.poeng_obligatoriske,
                    info.poeng_valgfri,
                    info.antall_noteringer,
                    info.antall_deltakere,
                )
            ):
                finnes_allerede.add(info.lag)
                continue

            lukket_laginfo = serieklasser.laginfo(
                serieår=info.serieår,
                klubb_id=info.klubb_id,
                lagnummer=info.lagnummer,
                fra_og_med=info.fra_og_med,
                til_og_med=uttrekksdato - timedelta(days=1),
                poeng=info.poeng,
                poeng_obligatoriske=info.poeng_obligatoriske,
                poeng_valgfri=info.poeng_valgfri,
                antall_noteringer=info.antall_noteringer,
                antall_deltakere=info.antall_deltakere,
            )

            utløpt_laginfo.append(info)
            ny_laginfo.append(lukket_laginfo)

        for lag,(poeng, poeng_obligatoriske, poeng_valgfri, antall_noteringer, antall_deltakere) in laginfo.items(): 
            if lag in finnes_allerede:
                continue

            laginfo = serieklasser.laginfo(
                serieår=lag.serieår,
                klubb_id=lag.klubb_id,
                lagnummer=lag.lagnummer,
                fra_og_med=uttrekksdato,
                til_og_med=None,
                poeng=poeng,
                poeng_obligatoriske=poeng_obligatoriske,
                poeng_valgfri=poeng_valgfri,
                antall_noteringer=antall_noteringer,
                antall_deltakere=antall_deltakere
            )

            ny_laginfo.append(laginfo)

        seriedata.bulkslett(utløpt_laginfo)
        seriedata.bulkinnsett(ny_laginfo)

    @staticmethod
    def periodiser_lagplassering(seriedata, serieår, uttrekksdato, tabeller, serieklasser):
        
        nye_lagplasseringer = []
        utløpte_lagplasseringer = []

        for div,tabell in tabeller.items():
            tabelllag = {plassering: lag for plassering,lag in enumerate(tabell, start=1)}

            løpende_rader = (seriedata.hent(serieklasser.lagplassering)
                .options(joinedload(serieklasser.lagplassering.lag))
                .filter_by(serieår=serieår)
                .filter_by(til_og_med=None)
                .filter_by(divisjon=div)
                .all())

            finnes_allerede = set()
            for rad in løpende_rader:
                assert uttrekksdato > rad.fra_og_med, "Plasseringsrad kan ikke ha startet etter i dag"

                if (
                    rad.plassering in tabelllag
                    and tabelllag[rad.plassering] == rad.lag
                ):
                    finnes_allerede.add(rad.plassering)
                    continue

                lukket_rad = serieklasser.lagplassering(
                    serieår=serieår,
                    divisjon=rad.divisjon,
                    plassering=rad.plassering,
                    fra_og_med=rad.fra_og_med,
                    til_og_med=uttrekksdato - timedelta(days=1),
                    klubb_id=rad.klubb_id,
                    lagnummer=rad.lagnummer,
                )

                utløpte_lagplasseringer.append(rad)
                nye_lagplasseringer.append(lukket_rad)

            for plassering,lag in tabelllag.items(): 
                if plassering in finnes_allerede:
                    continue

                ny_rad = serieklasser.lagplassering(
                    serieår=serieår,
                    divisjon=div,
                    plassering=plassering,
                    fra_og_med=uttrekksdato,
                    til_og_med=None,
                    klubb_id=lag.klubb_id,
                    lagnummer=lag.lagnummer,
                )

                nye_lagplasseringer.append(ny_rad)
            
        seriedata.bulkslett(utløpte_lagplasseringer)
        seriedata.bulkinnsett(nye_lagplasseringer)

    def periodiser_utøver_merverdier(seriedata, serieår, uttrekksdato, merverdier, serieklasser):
        nye_utøver_merverdier = []
        utløpte_utøver_merverdier = []
        
        løpende_utøver_merverdier = (seriedata.hent(serieklasser.utøver_merverdi)
            .filter_by(serieår=serieår)
            .filter_by(til_og_med=None))

        finnes_allerede = set()
        for merverdi in løpende_utøver_merverdier:
            assert uttrekksdato > merverdi.fra_og_med, "UtøverMerverdi kan ikke ha startet i dag eller senere"

            if ((merverdi.klubb_id, merverdi.utøver_id) in merverdier
                and merverdier[(merverdi.klubb_id, merverdi.utøver_id)] == merverdi.poeng
            ):
                finnes_allerede.add((merverdi.klubb_id, merverdi.utøver_id))
                continue

            lukket_merverdi = serieklasser.utøver_merverdi(
                serieår=serieår,
                klubb_id=merverdi.klubb_id,
                utøver_id=merverdi.utøver_id,
                fra_og_med=merverdi.fra_og_med,
                til_og_med=uttrekksdato - timedelta(days=1),
                poeng=merverdi.poeng,
            )
            
            utløpte_utøver_merverdier.append(merverdi)
            nye_utøver_merverdier.append(lukket_merverdi)

        for (klubb_id, utøver_id),poeng in merverdier.items(): 
            if (klubb_id, utøver_id) in finnes_allerede:
                continue

            ny_merverdi = serieklasser.utøver_merverdi(
                serieår=serieår,
                klubb_id=klubb_id,
                utøver_id=utøver_id,
                fra_og_med=uttrekksdato,
                til_og_med=None,
                poeng=poeng,
            )
            nye_utøver_merverdier.append(ny_merverdi)

            
        seriedata.bulkslett(utløpte_utøver_merverdier)
        seriedata.bulkinnsett(nye_utøver_merverdier)

