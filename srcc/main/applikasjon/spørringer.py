from datetime import timedelta
from sqlalchemy import text
import re

def execute(peker, spørring, args):
    counter = iter(range(1, 100))
    
    ferdig_spørring = re.sub(r"\{placeholder\}", lambda _: ":"+str(next(counter)), spørring)
    kwargs = {str(i): arg for i,arg in enumerate(args, start=1)}
    resultat = peker.execute(text(ferdig_spørring), kwargs)

    return [list(e) for e in resultat]    
        
def custom_spørring(peker, spørring):
    spørring = spørring.split(';', 1)[0].strip()

    ulovlige_ord = ['truncate', 'rename', 'insert', 'update', 'delete', 'drop', 'alter', 'create', 'rollback', 'commit', 'cascade', 'set', 'grant', 'revoke']
    if any(ord.lower() in ulovlige_ord for ord in re.split(r'\s+', spørring)):
        return []
    
    resultat = peker.execute(text(spørring), {})

    return [list(e) for e in resultat.fetchmany(100)]   

def db_hent_serier(peker):  
    resultat = execute(peker, '''
        WITH siste_kjøring AS (
            SELECT kjøring.serieår, CAST(kjøring.uttrekksdato AS text) AS uttrekksdato
            FROM "metadata.batchkjøringer" AS kjøring
                LEFT JOIN "metadata.batchkjøringer" AS senere_kjøring ON (
                    kjøring.serieår = senere_kjøring.serieår
                    AND kjøring.batch = senere_kjøring.batch
                    AND kjøring.uttrekksdato < senere_kjøring.uttrekksdato
                )
            WHERE kjøring.batch = 4
                AND senere_kjøring.batch IS NULL
        )
        SELECT serie.serieår, avsluttet, uttrekksdato
        FROM "uttrekk.serier" AS serie
            JOIN siste_kjøring ON (siste_kjøring.serieår = serie.serieår)
        ;
    ''', ())

    serier = {}
    for serieår, avsluttet, siste_dato in resultat:
        serier[str(serieår)] = {"avsluttet": avsluttet, "siste_dato": siste_dato}
    return serier

def db_hent_batchkjøringer(peker):
    return execute(peker, '''
        SELECT *
        FROM "metadata.batchkjøringer"
        ORDER BY slutt DESC
        LIMIT 100
    ''', ())

def db_hent_varsler(peker):
    return execute(peker, '''
        SELECT tittel, spørring
        FROM "nettside.varsler"
        WHERE NOT er_slettet
        ORDER BY tidspunkt
    ''', ())

def db_hent_resultatbytter(peker):
    return execute(peker, '''
        SELECT *
        FROM "uttrekk.resultatbytter"
        ORDER BY registrert DESC
        LIMIT 100
    ''', ())

def db_hent_sist_kjørt(peker, serieår):
    resultat = execute(peker, '''
        SELECT CAST(slutt AS text)
        FROM "metadata.batchkjøringer"
        WHERE serieår = {placeholder} and batch = 4
        ORDER BY uttrekksdato DESC
        LIMIT 1
        ;
    ''', (serieår,))
    if len(resultat) == 0:
        return None
    return resultat[0][0]

def db_hent_seriens_øvelser(peker, serieår):
    return execute(peker, '''
        SELECT øvelse.øvelsesnavn
        FROM "uttrekk.øvelser" AS øvelse
            LEFT JOIN "serie.menn_serieøvelser" AS mann_serieøvelse ON (øvelse.øvelseskode = mann_serieøvelse.øvelseskode)
            LEFT JOIN "serie.kvinner_serieøvelser" AS kvinne_serieøvelse ON (øvelse.øvelseskode = kvinne_serieøvelse.øvelseskode)
        WHERE coalesce(mann_serieøvelse.prioritet, kvinne_serieøvelse.prioritet) IS NOT NULL
            AND mann_serieøvelse.serieår = {placeholder}
            AND kvinne_serieøvelse.serieår = {placeholder}
        ORDER BY coalesce(mann_serieøvelse.prioritet, kvinne_serieøvelse.prioritet)
        ;
    ''', (serieår, serieår))

def db_hent_øvelsene(peker):
    resultat = execute(peker, '''
        SELECT øvelseskode, øvelsesnavn
        FROM "uttrekk.øvelser" AS øvelse
        ;
    ''', ())
    return {x[0]: x[1] for x in resultat}
    
def db_hent_serieøvelser(peker, kjønn, serieår):
    return execute(peker, f'''
        SELECT *
        FROM "serie.{kjønn}_serieøvelser"
        WHERE serieår = {{placeholder}}
        ;
    ''', (serieår,))
    
def db_hent_klubber(peker):
    return execute(peker, '''
        SELECT klubbnavn, klubb_id
        FROM "uttrekk.klubber"
        ORDER BY klubbnavn;
    ''', ())

def db_hent_utøvere(peker):
    return execute(peker, '''
        SELECT navn, fødselsår, utøver_id
        FROM "uttrekk.utøvere"
        ORDER BY navn, fødselsår;
    ''', ())

def db_hent_klubb_id(peker, klubbnavn):
    resultat = execute(peker, '''
        SELECT klubb_id
        FROM "uttrekk.klubber"
        WHERE klubbnavn = {placeholder}
        ;
    ''', (klubbnavn,))
    return resultat[0][0]

def db_hent_lagplasseringer(peker, serieår, dato, kjønn, divisjon):
    return execute(peker, f'''
        WITH livetabell AS (
            SELECT tidligere_tabell.plassering AS forrige_plassering,
                tabell.plassering AS neste_plassering,
                COUNT(*) OVER () AS lag_totalt,
                CASE
                    WHEN lag.lagnummer = 1 THEN klubbnavn 
                    ELSE CONCAT(klubbnavn, ' ', lag.lagnummer, '. lag')
                END AS lagnavn,
                coalesce(laginfo.poeng_obligatoriske+laginfo.poeng_valgfri,0) AS neste_poeng,
                coalesce(laginfo.poeng_obligatoriske+laginfo.poeng_valgfri,0)-coalesce(tidligere_laginfo.poeng_obligatoriske+tidligere_laginfo.poeng_valgfri,0) AS endring_poeng,
                laginfo.antall_noteringer AS antall_noteringer,
                laginfo.antall_deltakere AS antall_deltakere,
                klubbkrets.krets AS krets,
                lag.klubb_id AS klubb_id
            FROM "serie.{kjønn}_lag" AS lag
                JOIN "uttrekk.klubbkretser" AS klubbkrets ON (
                    klubbkrets.klubb_id = lag.klubb_id
                    AND {{placeholder}} BETWEEN klubbkrets.fra_og_med AND coalesce(klubbkrets.til_og_med, '9999-01-01')
                )
                JOIN "uttrekk.klubber" AS klubb ON (lag.klubb_id = klubb.klubb_id)
                LEFT JOIN "serie.{kjønn}_lagplasseringer" AS tabell ON (
                    lag.serieår = tabell.serieår
                    AND lag.klubb_id = tabell.klubb_id
                    AND lag.lagnummer = tabell.lagnummer
                    AND {{placeholder}} BETWEEN tabell.fra_og_med AND coalesce(tabell.til_og_med, '9999-01-01')
                )
                LEFT JOIN "serie.{kjønn}_laginfo" AS laginfo ON (
                    tabell.serieår = laginfo.serieår
                    AND tabell.klubb_id = laginfo.klubb_id
                    AND tabell.lagnummer = laginfo.lagnummer
                    AND {{placeholder}} BETWEEN laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                )
                LEFT JOIN "serie.{kjønn}_lagplasseringer" AS tidligere_tabell ON (
                    laginfo.serieår = tidligere_tabell.serieår
                    AND laginfo.klubb_id = tidligere_tabell.klubb_id
                    AND laginfo.lagnummer = tidligere_tabell.lagnummer
                    AND {{placeholder}} BETWEEN tidligere_tabell.fra_og_med AND coalesce(tidligere_tabell.til_og_med, '9999-01-01')
                )
                LEFT JOIN "serie.{kjønn}_laginfo" AS tidligere_laginfo ON (
                    laginfo.serieår = tidligere_laginfo.serieår
                    AND laginfo.klubb_id = tidligere_laginfo.klubb_id
                    AND laginfo.lagnummer = tidligere_laginfo.lagnummer
                    AND {{placeholder}} BETWEEN tidligere_laginfo.fra_og_med AND coalesce(tidligere_laginfo.til_og_med, '9999-01-01')
                )
            WHERE lag.serieår = {{placeholder}}
                AND (tabell.serieår IS NOT NULL OR tidligere_tabell.serieår IS NOT NULL)
                AND (tabell.divisjon = {{placeholder}})
            ORDER BY tabell.plassering
        )
        SELECT COALESCE(forrige_plassering, lag_totalt) - neste_plassering,
            CASE WHEN {{placeholder}} < 3 OR neste_poeng >= 5000 THEN CAST(neste_plassering AS text) ELSE '' END,
            lagnavn, 
            neste_poeng,
            endring_poeng,
            antall_noteringer,
            antall_deltakere, 
            krets,
            klubb_id
        FROM livetabell
        ;
    ''', (dato, dato, dato, dato-timedelta(7), dato-timedelta(7), serieår, divisjon, divisjon))

def db_hent_kretser(peker, dato):
    resultat = execute(peker, '''
        SELECT DISTINCT krets
        FROM "uttrekk.klubbkretser" AS klubbkrets
            JOIN (SELECT * FROM "tildeling.menn_serieresultater"
                  UNION
                  SELECT * FROM "tildeling.kvinner_serieresultater") a ON (a.klubb_id = klubbkrets.klubb_id)
        WHERE {placeholder} BETWEEN klubbkrets.fra_og_med AND coalesce(klubbkrets.til_og_med, '9999-01-01')
        ORDER BY krets
        ;
    ''', (dato,))
    
    return [el[0] for el in resultat]

def db_hent_besøksdata(peker):
    resultat = execute(peker, f'''
        WITH relevante_brukere AS (
            SELECT bruker_uuid
            FROM "nettside.nettside_besøk"
            WHERE side = '/'
                OR side LIKE '%nyhetsarkiv%'
                OR side LIKE '%livetabell%'
                OR side LIKE '%tidligere_år%'
                OR side LIKE '%verktøy%'
                OR side LIKE '%stevnestatus%'
                OR side LIKE '%om_serien%'
            GROUP BY bruker_uuid
            HAVING count(*) > 1
        )
        SELECT CAST(tidspunkt as DATE), count(*)
        FROM "nettside.nettside_besøk" besøk
            JOIN relevante_brukere on (besøk.bruker_uuid = relevante_brukere.bruker_uuid)
        WHERE side = '/'
            OR side LIKE '%nyhetsarkiv%'
            OR side LIKE '%livetabell%'
            OR side LIKE '%tidligere_år%'
            OR side LIKE '%verktøy%'
            OR side LIKE '%stevnestatus%'
            OR side LIKE '%om_serien%'
        GROUP BY cast(tidspunkt as DATE)
        ORDER BY cast(tidspunkt as DATE)
        ;
    ''', ())

    return [(str(x), y) for x,y in resultat]

def db_hent_noteringer_til_lag(peker, kjønn, serieår, klubbnavn, lagnummer):
    return execute(peker, f'''
        SELECT antall_obligatoriske, antall_valgfri
        FROM "uttrekk.klubber" AS klubb
            JOIN "serie.oppstillingskrav" AS krav ON (1 = 1)
            LEFT JOIN "serie.{kjønn}_topplag" AS topplag ON (
                krav.serieår = topplag.serieår
                AND topplag.klubb_id = klubb.klubb_id
                AND topplag.lagnummer = {{placeholder}}
            )
        WHERE krav.serieår = {{placeholder}}
            AND klubbnavn = {{placeholder}} 
            AND coalesce(topplag.divisjon, 3) = krav.divisjon
    ''', (lagnummer, serieår, klubbnavn))[0]

def db_hent_lagplassering(peker, kjonn, serieår, uttrekksdato, klubbnavn, lagnummer):
    result = execute(peker, f'''
        SELECT divisjon, plassering
        FROM "serie.{kjonn}_lagplasseringer" AS lagplassering
            JOIN "uttrekk.klubber" AS klubb ON (lagplassering.klubb_id = klubb.klubb_id)
        WHERE serieår = {{placeholder}}
            AND {{placeholder}} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
            AND klubb.klubbnavn = {{placeholder}}
            AND lagnummer = {{placeholder}}
    ''', (serieår, uttrekksdato, klubbnavn, lagnummer))
    if len(result) == 0:
        return (None, None)
    return result[0]

def db_hent_rangering_allroundere(peker, serieår, dato):
    return execute(peker, '''
        WITH
            utøverpoeng_nå AS (
                SELECT SUM(poeng) AS poeng, resultat.utøver_id, count(*) AS antall
                FROM (
                    SELECT * FROM "tildeling.menn_serieresultater" WHERE {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                    UNION
                    SELECT * FROM "tildeling.kvinner_serieresultater" WHERE {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ) AS serieresultat
                    JOIN "uttrekk.resultater" AS resultat ON (serieresultat.resultat_id = resultat.resultat_id)
                    JOIN "uttrekk.serier" AS serie ON (serie.fra_og_med <= resultat.dato AND resultat.dato <= serie.til_og_med)
                    WHERE serie.serieår = {placeholder}
                    AND serieresultat.klubb_id IS NOT NULL
                    AND poeng > 0
                    GROUP BY resultat.utøver_id
            ),
            utøverpoeng_forrige_uke AS (
                SELECT SUM(poeng) AS poeng, resultat.utøver_id, count(*) AS antall
                FROM (
                    SELECT * FROM "tildeling.menn_serieresultater" WHERE {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                    UNION
                    SELECT * FROM "tildeling.kvinner_serieresultater" WHERE {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ) AS serieresultat
                    JOIN "uttrekk.resultater" AS resultat ON (serieresultat.resultat_id = resultat.resultat_id)
                    JOIN "uttrekk.serier" AS serie ON (serie.fra_og_med <= resultat.dato AND resultat.dato <= serie.til_og_med)
                    WHERE serie.serieår = {placeholder}
                    AND serieresultat.klubb_id IS NOT NULL
                    GROUP BY resultat.utøver_id
            )
        SELECT nå.poeng, nå.poeng-coalesce(forrige_uke.poeng, 0) AS dpoeng, navn, utøver.utøver_id, fødselsår, nå.antall, nå.antall - coalesce(forrige_uke.antall, 0) AS dantall
        FROM utøverpoeng_nå AS nå
            LEFT JOIN utøverpoeng_forrige_uke AS forrige_uke ON (nå.utøver_id = forrige_uke.utøver_id)
            JOIN "uttrekk.utøvere" AS utøver ON (nå.utøver_id = utøver.utøver_id)
        ORDER BY nå.poeng DESC
        LIMIT 100
        ;
    ''', (dato, dato, serieår, dato-timedelta(7), dato-timedelta(7), serieår))

def db_hent_rangering_nøkkelutøvere(peker, serieår, dato):
    return execute(peker, '''
        SELECT FLOOR(poeng), dpoeng, navn, utøver_id, fødselsår, seriepoeng, dseriepoeng, klubb_id AS klubb_id, CONCAT(CASE WHEN lagnummer = 1 THEN klubbnavn ELSE CONCAT(klubbnavn, ' ', lagnummer, '. lag') END, ' (', kjønn, ')')
        FROM (
            (WITH
                lagresultat_nå AS (
                    SELECT * FROM "serie.menn_lagresultater" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                lagresultat_før AS (
                    SELECT * FROM "serie.menn_lagresultater" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                serieresultat_nå AS (
                    SELECT * FROM "tildeling.menn_serieresultater" WHERE {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                serieresultat_før AS (
                    SELECT * FROM "tildeling.menn_serieresultater" WHERE {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                laginfo_nå AS (
                    SELECT * FROM "serie.menn_laginfo" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                laginfo_før AS (
                    SELECT * FROM "serie.menn_laginfo" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                merverdi_nå AS (
                    SELECT * FROM "serie.menn_utøver_merverdi" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                merverdi_før AS (
                    SELECT * FROM "serie.menn_utøver_merverdi" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                utøver_klubblag AS (
                    SELECT DISTINCT klubb_id, lagnummer, utøver_id
                    FROM lagresultat_nå
                        JOIN "uttrekk.resultater" AS resultat ON (lagresultat_nå.resultat_id = resultat.resultat_id)
                ),
                merverdi_lagfraksjon_nå AS (
                    SELECT lag.klubb_id, CAST(laginfo_nå.poeng AS float)/SUM(merverdi_nå.poeng) AS poeng, lag.lagnummer
                    FROM utøver_klubblag AS lag
                        JOIN merverdi_nå ON (lag.klubb_id = merverdi_nå.klubb_id and lag.utøver_id = merverdi_nå.utøver_id)
                        JOIN laginfo_nå ON (laginfo_nå.klubb_id = lag.klubb_id AND laginfo_nå.lagnummer = lag.lagnummer)
                    GROUP BY lag.klubb_id, lag.lagnummer, laginfo_nå.poeng
                ),
                merverdi_lagfraksjon_før AS (
                    SELECT lag.klubb_id, CAST(laginfo_før.poeng AS float)/SUM(merverdi_før.poeng) AS poeng, lag.lagnummer
                    FROM utøver_klubblag AS lag
                        JOIN merverdi_før ON (lag.klubb_id = merverdi_før.klubb_id and lag.utøver_id = merverdi_før.utøver_id)
                        JOIN laginfo_før ON (laginfo_før.klubb_id = lag.klubb_id AND laginfo_før.lagnummer = lag.lagnummer)
                    GROUP BY lag.klubb_id, lag.lagnummer, laginfo_før.poeng
                ),
                utøver_seriepoeng_nå AS (
                    SELECT sum(poeng) AS poeng, resultat.utøver_id, lagresultat_nå.klubb_id
                    FROM lagresultat_nå
                        JOIN "uttrekk.resultater" AS resultat ON (lagresultat_nå.resultat_id = resultat.resultat_id)
                        JOIN serieresultat_nå ON (resultat.resultat_id = serieresultat_nå.resultat_id)
                    GROUP BY resultat.utøver_id, lagresultat_nå.klubb_id
                ),
                utøver_seriepoeng_før AS (
                    SELECT sum(poeng) AS poeng, resultat.utøver_id, lagresultat_før.klubb_id
                    FROM lagresultat_før
                        JOIN "uttrekk.resultater" AS resultat ON (lagresultat_før.resultat_id = resultat.resultat_id)
                        JOIN serieresultat_før ON (resultat.resultat_id = serieresultat_før.resultat_id)
                    GROUP BY resultat.utøver_id, lagresultat_før.klubb_id
                )
            SELECT 'menn' AS kjønn, merverdi_nå.poeng*fraksjon_nå.poeng AS poeng, FLOOR(merverdi_nå.poeng*fraksjon_nå.poeng-coalesce(merverdi_før.poeng*fraksjon_før.poeng, 0)) AS dpoeng, navn, utøver.utøver_id, fødselsår, seriep_nå.poeng AS seriepoeng, seriep_nå.poeng-coalesce(seriep_før.poeng,0) AS dseriepoeng, lag.klubb_id AS klubb_id, klubbnavn, lag.lagnummer
            FROM utøver_klubblag AS lag
                JOIN merverdi_nå ON (merverdi_nå.utøver_id = lag.utøver_id AND merverdi_nå.klubb_id = lag.klubb_id)
                LEFT JOIN merverdi_før ON (merverdi_før.utøver_id = lag.utøver_id AND merverdi_før.klubb_id = lag.klubb_id)
                JOIN merverdi_lagfraksjon_nå AS fraksjon_nå ON (lag.klubb_id = fraksjon_nå.klubb_id AND lag.lagnummer = fraksjon_nå.lagnummer)
                LEFT JOIN merverdi_lagfraksjon_før AS fraksjon_før ON (lag.klubb_id = fraksjon_før.klubb_id AND lag.lagnummer = fraksjon_før.lagnummer)
                JOIN "uttrekk.utøvere" AS utøver ON (merverdi_nå.utøver_id = utøver.utøver_id)
                JOIN "uttrekk.klubber" AS klubb ON (klubb.klubb_id = lag.klubb_id)
                JOIN utøver_seriepoeng_nå AS seriep_nå ON (seriep_nå.utøver_id = utøver.utøver_id AND seriep_nå.klubb_id = merverdi_nå.klubb_id)
                LEFT JOIN utøver_seriepoeng_før AS seriep_før ON (seriep_før.utøver_id = utøver.utøver_id AND seriep_før.klubb_id = merverdi_nå.klubb_id))
            UNION
            (WITH
                lagresultat_nå AS (
                    SELECT * FROM "serie.kvinner_lagresultater" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                lagresultat_før AS (
                    SELECT * FROM "serie.kvinner_lagresultater" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                serieresultat_nå AS (
                    SELECT * FROM "tildeling.kvinner_serieresultater" WHERE {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                serieresultat_før AS (
                    SELECT * FROM "tildeling.kvinner_serieresultater" WHERE {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                laginfo_nå AS (
                    SELECT * FROM "serie.kvinner_laginfo" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                laginfo_før AS (
                    SELECT * FROM "serie.kvinner_laginfo" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                merverdi_nå AS (
                    SELECT * FROM "serie.kvinner_utøver_merverdi" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                merverdi_før AS (
                    SELECT * FROM "serie.kvinner_utøver_merverdi" WHERE serieår = {placeholder} AND {placeholder} between fra_og_med AND coalesce(til_og_med, '9999-01-01')
                ),
                utøver_klubblag AS (
                    SELECT DISTINCT klubb_id, lagnummer, utøver_id
                    FROM lagresultat_nå
                        JOIN "uttrekk.resultater" AS resultat ON (lagresultat_nå.resultat_id = resultat.resultat_id)
                ),
                merverdi_lagfraksjon_nå AS (
                    SELECT lag.klubb_id, CAST(laginfo_nå.poeng AS float)/SUM(merverdi_nå.poeng) AS poeng, lag.lagnummer
                    FROM utøver_klubblag AS lag
                        JOIN merverdi_nå ON (lag.klubb_id = merverdi_nå.klubb_id and lag.utøver_id = merverdi_nå.utøver_id)
                        JOIN laginfo_nå ON (laginfo_nå.klubb_id = lag.klubb_id AND laginfo_nå.lagnummer = lag.lagnummer)
                    GROUP BY lag.klubb_id, lag.lagnummer, laginfo_nå.poeng
                ),
                merverdi_lagfraksjon_før AS (
                    SELECT lag.klubb_id, CAST(laginfo_før.poeng AS float)/SUM(merverdi_før.poeng) AS poeng, lag.lagnummer
                    FROM utøver_klubblag AS lag
                        JOIN merverdi_før ON (lag.klubb_id = merverdi_før.klubb_id and lag.utøver_id = merverdi_før.utøver_id)
                        JOIN laginfo_før ON (laginfo_før.klubb_id = lag.klubb_id AND laginfo_før.lagnummer = lag.lagnummer)
                    GROUP BY lag.klubb_id, lag.lagnummer, laginfo_før.poeng
                ),
                utøver_seriepoeng_nå AS (
                    SELECT sum(poeng) AS poeng, resultat.utøver_id, lagresultat_nå.klubb_id
                    FROM lagresultat_nå
                        JOIN "uttrekk.resultater" AS resultat ON (lagresultat_nå.resultat_id = resultat.resultat_id)
                        JOIN serieresultat_nå ON (resultat.resultat_id = serieresultat_nå.resultat_id)
                    GROUP BY resultat.utøver_id, lagresultat_nå.klubb_id
                ),
                utøver_seriepoeng_før AS (
                    SELECT sum(poeng) AS poeng, resultat.utøver_id, lagresultat_før.klubb_id
                    FROM lagresultat_før
                        JOIN "uttrekk.resultater" AS resultat ON (lagresultat_før.resultat_id = resultat.resultat_id)
                        JOIN serieresultat_før ON (resultat.resultat_id = serieresultat_før.resultat_id)
                    GROUP BY resultat.utøver_id, lagresultat_før.klubb_id
                )
            SELECT 'kvinner' AS kjønn, merverdi_nå.poeng*fraksjon_nå.poeng AS poeng, FLOOR(merverdi_nå.poeng*fraksjon_nå.poeng-coalesce(merverdi_før.poeng*fraksjon_før.poeng, 0)) AS dpoeng, navn, utøver.utøver_id, fødselsår, seriep_nå.poeng AS seriepoeng, seriep_nå.poeng-coalesce(seriep_før.poeng,0) AS dseriepoeng, lag.klubb_id AS klubb_id, klubbnavn, lag.lagnummer
            FROM utøver_klubblag AS lag
                JOIN merverdi_nå ON (merverdi_nå.utøver_id = lag.utøver_id AND merverdi_nå.klubb_id = lag.klubb_id)
                LEFT JOIN merverdi_før ON (merverdi_før.utøver_id = lag.utøver_id AND merverdi_før.klubb_id = lag.klubb_id)
                JOIN merverdi_lagfraksjon_nå AS fraksjon_nå ON (lag.klubb_id = fraksjon_nå.klubb_id AND lag.lagnummer = fraksjon_nå.lagnummer)
                LEFT JOIN merverdi_lagfraksjon_før AS fraksjon_før ON (lag.klubb_id = fraksjon_før.klubb_id AND lag.lagnummer = fraksjon_før.lagnummer)
                JOIN "uttrekk.utøvere" AS utøver ON (merverdi_nå.utøver_id = utøver.utøver_id)
                JOIN "uttrekk.klubber" AS klubb ON (klubb.klubb_id = lag.klubb_id)
                JOIN utøver_seriepoeng_nå AS seriep_nå ON (seriep_nå.utøver_id = utøver.utøver_id AND seriep_nå.klubb_id = merverdi_nå.klubb_id)
                LEFT JOIN utøver_seriepoeng_før AS seriep_før ON (seriep_før.utøver_id = utøver.utøver_id AND seriep_før.klubb_id = merverdi_nå.klubb_id))
            ) a
        ORDER BY poeng DESC
        LIMIT 100   
    ''', (serieår, dato, serieår, dato-timedelta(7), dato, dato-timedelta(7), serieår, dato, serieår, dato-timedelta(7), serieår, dato, serieår, dato-timedelta(7), serieår, dato, serieår, dato-timedelta(7), dato, dato-timedelta(7), serieår, dato, serieår, dato-timedelta(7), serieår, dato, serieår, dato-timedelta(7)))

def db_hent_rangering_nykommere(peker, serieår, dato):
    return execute(peker, '''
        WITH 
            utøver_2025 AS (
                SELECT DISTINCT ON (utøver_id, øvelseskode) utøver_id, øvelseskode, poeng, ROW_NUMBER() OVER (PARTITION BY utøver_id ORDER BY poeng DESC) AS rn
                FROM "uttrekk.resultater" AS resultat
                    JOIN "uttrekk.serier" AS serie ON (resultat.dato BETWEEN serie.fra_og_med AND serie.til_og_med)
                    JOIN (
                        SELECT * FROM "tildeling.menn_serieresultater" WHERE poeng IS NOT NULL AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                        UNION
                        SELECT * FROM "tildeling.kvinner_serieresultater"  WHERE poeng IS NOT NULL AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                    ) AS serieresultat ON (resultat.resultat_id = serieresultat.resultat_id)
                WHERE serieår = {placeholder}
                ORDER BY utøver_id, øvelseskode, poeng DESC
            ),
            utøver_2026_nå AS (
                SELECT DISTINCT ON (utøver_id, øvelseskode) utøver_id, øvelseskode, poeng, ROW_NUMBER() OVER (PARTITION BY utøver_id ORDER BY poeng DESC) AS rn
                FROM "uttrekk.resultater" AS resultat
                    JOIN "uttrekk.serier" AS serie ON (resultat.dato BETWEEN serie.fra_og_med AND serie.til_og_med)
                    JOIN (
                        SELECT * FROM "tildeling.menn_serieresultater" WHERE poeng IS NOT NULL AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                        UNION
                        SELECT * FROM "tildeling.kvinner_serieresultater" WHERE poeng IS NOT NULL AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                    ) AS serieresultat ON (resultat.resultat_id = serieresultat.resultat_id)
                WHERE serieår = {placeholder}
                ORDER BY utøver_id, øvelseskode, poeng DESC
            ),
            utøver_2026_forrige_uke AS (
                SELECT DISTINCT ON (utøver_id, øvelseskode) utøver_id, øvelseskode, poeng, ROW_NUMBER() OVER (PARTITION BY utøver_id ORDER BY poeng DESC) AS rn
                FROM "uttrekk.resultater" AS resultat
                    JOIN "uttrekk.serier" AS serie ON (resultat.dato BETWEEN serie.fra_og_med AND serie.til_og_med)
                    JOIN (
                        SELECT * FROM "tildeling.menn_serieresultater" WHERE poeng IS NOT NULL AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                        UNION
                        SELECT * FROM "tildeling.kvinner_serieresultater" WHERE poeng IS NOT NULL AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                    ) AS serieresultat ON (resultat.resultat_id = serieresultat.resultat_id)
                WHERE serieår = {placeholder}
                ORDER BY utøver_id, øvelseskode, poeng DESC
            ),
            agg_2025 AS (
                SELECT utøver_id, sum(poeng) AS poeng FROM utøver_2025 WHERE rn <= 5 GROUP BY utøver_id
            ),
            agg_2026_nå AS (
                SELECT utøver_id, sum(poeng) AS poeng FROM utøver_2026_nå WHERE rn <= 5 GROUP BY utøver_id
            ),
            agg_2026_forrige_uke AS (
                SELECT utøver_id, sum(poeng) AS poeng FROM utøver_2026_forrige_uke WHERE rn <= 5 GROUP BY utøver_id
            )
        SELECT n2026.poeng - a2025.poeng, n2026.poeng-coalesce(f2026.poeng, 0), navn, utøver.utøver_id, fødselsår, CAST(n2026.poeng AS text), CAST(a2025.poeng AS text)
        FROM agg_2025 AS a2025
            JOIN agg_2026_nå AS n2026 ON (a2025.utøver_id = n2026.utøver_id)
            LEFT JOIN agg_2026_forrige_uke AS f2026 ON (n2026.utøver_id = f2026.utøver_id)
            JOIN "uttrekk.utøvere" AS utøver ON (utøver.utøver_id = n2026.utøver_id)
        WHERE n2026.poeng - a2025.poeng > 0
        ORDER BY n2026.poeng - a2025.poeng DESC
        LIMIT 100
    ''', (dato, dato, serieår-1, dato, dato, serieår, dato-timedelta(7), dato-timedelta(7), serieår))

def db_hent_rangering_ideallag(peker, serieår, dato):
    return execute(peker, '''
        WITH
            potensial_nå AS (
                SELECT 'menn' AS kjønn, potensial.poeng as potensial, potensial.klubb_id, potensial.lagnummer, laginfo.poeng as lagpoeng, potensial.serieår, divisjon
                FROM "serie.menn_lagpotensial" AS potensial
                    JOIN "serie.menn_laginfo" AS laginfo ON (
                        potensial.serieår = laginfo.serieår
                        AND potensial.klubb_id = laginfo.klubb_id
                        AND potensial.lagnummer = laginfo.lagnummer
                    )
                    JOIN "serie.menn_lagplasseringer" AS lagpl ON (
                        potensial.serieår = lagpl.serieår
                        AND potensial.klubb_id = lagpl.klubb_id
                        AND potensial.lagnummer = lagpl.lagnummer
                    )
                WHERE {placeholder} between potensial.fra_og_med AND coalesce(potensial.til_og_med, '9999-01-01')
                    AND {placeholder} between laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                    AND {placeholder} between lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
                UNION
                SELECT 'kvinner' AS kjønn, potensial.poeng as potensial, potensial.klubb_id, potensial.lagnummer, laginfo.poeng as lagpoeng, potensial.serieår, divisjon
                FROM "serie.kvinner_lagpotensial" AS potensial
                    JOIN "serie.kvinner_laginfo" AS laginfo ON (
                        potensial.serieår = laginfo.serieår
                        AND potensial.klubb_id = laginfo.klubb_id
                        AND potensial.lagnummer = laginfo.lagnummer
                    )
                    JOIN "serie.kvinner_lagplasseringer" AS lagpl ON (
                        potensial.serieår = lagpl.serieår
                        AND potensial.klubb_id = lagpl.klubb_id
                        AND potensial.lagnummer = lagpl.lagnummer
                    )
                WHERE {placeholder} between potensial.fra_og_med AND coalesce(potensial.til_og_med, '9999-01-01')
                    AND {placeholder} between laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                    AND {placeholder} between lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
            ),
            potensial_forrige_uke AS (
                SELECT 'menn' AS kjønn, potensial.poeng as potensial, potensial.klubb_id, potensial.lagnummer, laginfo.poeng as lagpoeng, potensial.serieår
                FROM "serie.menn_lagpotensial" AS potensial
                    JOIN "serie.menn_laginfo" AS laginfo ON (
                        potensial.serieår = laginfo.serieår
                        AND potensial.klubb_id = laginfo.klubb_id
                        AND potensial.lagnummer = laginfo.lagnummer
                    )
                WHERE {placeholder} between potensial.fra_og_med AND coalesce(potensial.til_og_med, '9999-01-01')
                AND {placeholder} between laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                UNION
                SELECT 'kvinner' AS kjønn, potensial.poeng as potensial, potensial.klubb_id, potensial.lagnummer, laginfo.poeng as lagpoeng, potensial.serieår
                FROM "serie.kvinner_lagpotensial" AS potensial
                    JOIN "serie.kvinner_laginfo" AS laginfo ON (
                        potensial.serieår = laginfo.serieår
                        AND potensial.klubb_id = laginfo.klubb_id
                        AND potensial.lagnummer = laginfo.lagnummer
                    )
                WHERE {placeholder} between potensial.fra_og_med AND coalesce(potensial.til_og_med, '9999-01-01')
                    AND {placeholder} between laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
            )
        SELECT nå.potensial AS c1, nå.potensial-coalesce(forrige.potensial, 0) AS c2, nå.klubb_id, CONCAT(CASE WHEN nå.lagnummer = 1 THEN klubbnavn ELSE CONCAT(klubbnavn, ' ', nå.lagnummer, '. lag') END, ' (', nå.kjønn, ')') as b, divisjon as c7, nå.lagpoeng as c4, nå.lagpoeng - coalesce(forrige.lagpoeng, 0) as c3
        FROM potensial_nå AS nå
            LEFT JOIN potensial_forrige_uke AS forrige ON (
                nå.klubb_id = forrige.klubb_id
                AND nå.lagnummer = forrige.lagnummer
                AND nå.serieår = forrige.serieår
                AND nå.kjønn = forrige.kjønn
            )
            JOIN "uttrekk.klubber" AS klubb ON (nå.klubb_id = klubb.klubb_id)
        WHERE nå.serieår = {placeholder}
            AND nå.lagpoeng >= 5000 
        ORDER BY nå.potensial
        LIMIT 100
    ''', (dato, dato, dato, dato, dato, dato, dato-timedelta(7), dato-timedelta(7), dato-timedelta(7), dato-timedelta(7), serieår,))


def db_hent_rangering_kommersterke(peker, serieår, dato):
    return execute(peker, '''
        WITH
            potensial_nå AS (
                SELECT 'menn' AS kjønn, potensial.poeng as potensial, potensial.klubb_id, potensial.lagnummer, laginfo.poeng as lagpoeng, potensial.serieår, divisjon
                FROM "serie.menn_lagpotensial" AS potensial
                    JOIN "serie.menn_laginfo" AS laginfo ON (
                        potensial.serieår = laginfo.serieår
                        AND potensial.klubb_id = laginfo.klubb_id
                        AND potensial.lagnummer = laginfo.lagnummer
                    )
                    JOIN "serie.menn_lagplasseringer" AS lagpl ON (
                        potensial.serieår = lagpl.serieår
                        AND potensial.klubb_id = lagpl.klubb_id
                        AND potensial.lagnummer = lagpl.lagnummer
                    )
                WHERE {placeholder} between potensial.fra_og_med AND coalesce(potensial.til_og_med, '9999-01-01')
                    AND {placeholder} between laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                    AND {placeholder} between lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
                UNION
                SELECT 'kvinner' AS kjønn, potensial.poeng as potensial, potensial.klubb_id, potensial.lagnummer, laginfo.poeng as lagpoeng, potensial.serieår, divisjon
                FROM "serie.kvinner_lagpotensial" AS potensial
                    JOIN "serie.kvinner_laginfo" AS laginfo ON (
                        potensial.serieår = laginfo.serieår
                        AND potensial.klubb_id = laginfo.klubb_id
                        AND potensial.lagnummer = laginfo.lagnummer
                    )
                    JOIN "serie.kvinner_lagplasseringer" AS lagpl ON (
                        potensial.serieår = lagpl.serieår
                        AND potensial.klubb_id = lagpl.klubb_id
                        AND potensial.lagnummer = lagpl.lagnummer
                    )
                WHERE {placeholder} between potensial.fra_og_med AND coalesce(potensial.til_og_med, '9999-01-01')
                    AND {placeholder} between laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                    AND {placeholder} between lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
            ),
            potensial_forrige_uke AS (
                SELECT 'menn' AS kjønn, potensial.poeng as potensial, potensial.klubb_id, potensial.lagnummer, laginfo.poeng as lagpoeng, potensial.serieår
                FROM "serie.menn_lagpotensial" AS potensial
                    JOIN "serie.menn_laginfo" AS laginfo ON (
                        potensial.serieår = laginfo.serieår
                        AND potensial.klubb_id = laginfo.klubb_id
                        AND potensial.lagnummer = laginfo.lagnummer
                    )
                WHERE {placeholder} between potensial.fra_og_med AND coalesce(potensial.til_og_med, '9999-01-01')
                AND {placeholder} between laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                UNION
                SELECT 'kvinner' AS kjønn, potensial.poeng as potensial, potensial.klubb_id, potensial.lagnummer, laginfo.poeng as lagpoeng, potensial.serieår
                FROM "serie.kvinner_lagpotensial" AS potensial
                    JOIN "serie.kvinner_laginfo" AS laginfo ON (
                        potensial.serieår = laginfo.serieår
                        AND potensial.klubb_id = laginfo.klubb_id
                        AND potensial.lagnummer = laginfo.lagnummer
                    )
                WHERE {placeholder} between potensial.fra_og_med AND coalesce(potensial.til_og_med, '9999-01-01')
                    AND {placeholder} between laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
            )
        SELECT nå.potensial AS c1, nå.potensial-coalesce(forrige.potensial, 0) AS c2, nå.klubb_id, CONCAT(CASE WHEN nå.lagnummer = 1 THEN klubbnavn ELSE CONCAT(klubbnavn, ' ', nå.lagnummer, '. lag') END, ' (', nå.kjønn, ')') as b, divisjon as c7, nå.lagpoeng as c4, nå.lagpoeng - coalesce(forrige.lagpoeng, 0) as c3
        FROM potensial_nå AS nå
            LEFT JOIN potensial_forrige_uke AS forrige ON (
                nå.klubb_id = forrige.klubb_id
                AND nå.lagnummer = forrige.lagnummer
                AND nå.serieår = forrige.serieår
                AND nå.kjønn = forrige.kjønn
            )
            JOIN "uttrekk.klubber" AS klubb ON (nå.klubb_id = klubb.klubb_id)
        WHERE nå.serieår = {placeholder}
            AND nå.lagpoeng >= 5000
        ORDER BY nå.potensial DESC
        LIMIT 100
    ''', (dato, dato, dato, dato, dato, dato, dato-timedelta(7), dato-timedelta(7), dato-timedelta(7), dato-timedelta(7), serieår,))

def db_hent_rangering_juniorlag(peker, serieår, dato):
    return execute(peker, '''
        WITH
            resultater_nå AS (
                (SELECT 'menn' as kjønn, lagresultat.resultat_id, lagresultat.klubb_id, lagnummer, poeng
                FROM "serie.menn_lagresultater" AS lagresultat
                    JOIN "tildeling.menn_serieresultater" AS serieresultat ON (lagresultat.resultat_id = serieresultat.resultat_id)
                WHERE {placeholder} BETWEEN lagresultat.fra_og_med AND coalesce(lagresultat.til_og_med, '9999-01-01')
                    AND {placeholder} BETWEEN serieresultat.fra_og_med AND coalesce(serieresultat.til_og_med, '9999-01-01')
                    AND serieår = {placeholder})
                UNION
                (SELECT'kvinner' as kjønn, lagresultat.resultat_id, lagresultat.klubb_id, lagnummer, poeng
                FROM "serie.kvinner_lagresultater" AS lagresultat
                    JOIN "tildeling.kvinner_serieresultater" AS serieresultat ON (lagresultat.resultat_id = serieresultat.resultat_id)
                WHERE {placeholder} BETWEEN lagresultat.fra_og_med AND coalesce(lagresultat.til_og_med, '9999-01-01')
                    AND {placeholder} BETWEEN serieresultat.fra_og_med AND coalesce(serieresultat.til_og_med, '9999-01-01')
                    AND serieår = {placeholder})
            ),
            resultater_forrige_uke AS (
                (SELECT 'menn' as kjønn, lagresultat.resultat_id, lagresultat.klubb_id, lagnummer, poeng
                FROM "serie.menn_lagresultater" AS lagresultat
                    JOIN "tildeling.menn_serieresultater" AS serieresultat ON (lagresultat.resultat_id = serieresultat.resultat_id)
                WHERE {placeholder} BETWEEN lagresultat.fra_og_med AND coalesce(lagresultat.til_og_med, '9999-01-01')
                    AND {placeholder} BETWEEN serieresultat.fra_og_med AND coalesce(serieresultat.til_og_med, '9999-01-01')
                    AND serieår = {placeholder})
                UNION
                (SELECT 'kvinner', lagresultat.resultat_id, lagresultat.klubb_id, lagnummer, poeng
                FROM "serie.kvinner_lagresultater" AS lagresultat
                    JOIN "tildeling.kvinner_serieresultater" AS serieresultat ON (lagresultat.resultat_id = serieresultat.resultat_id)
                WHERE {placeholder} BETWEEN lagresultat.fra_og_med AND coalesce(lagresultat.til_og_med, '9999-01-01')
                    AND {placeholder} BETWEEN serieresultat.fra_og_med AND coalesce(serieresultat.til_og_med, '9999-01-01')
                    AND serieår = {placeholder})
            )
            SELECT coalesce(sum(nå.poeng), 0),
                coalesce(sum(nå.poeng), 0)-coalesce(sum(forrige.poeng), 0),
                nå.klubb_id,
                CONCAT(CASE WHEN coalesce(nå.lagnummer, forrige.lagnummer) = 1 THEN klubbnavn ELSE CONCAT(klubbnavn, ' ', coalesce(nå.lagnummer, forrige.lagnummer), '. lag') END, ' (', coalesce(nå.kjønn, forrige.kjønn), ')'),
                coalesce(count(distinct nå_resultat.utøver_id), 0),
                coalesce(count(distinct nå_resultat.utøver_id), 0) - coalesce(count(distinct forrige_resultat.utøver_id), 0)
            from resultater_nå nå
                FULL JOIN resultater_forrige_uke forrige ON (nå.resultat_id = forrige.resultat_id)
                LEFT JOIN "uttrekk.resultater" AS nå_resultat ON (nå.resultat_id = nå_resultat.resultat_id)
                LEFT JOIN "uttrekk.resultater" AS forrige_resultat ON (forrige.resultat_id = forrige_resultat.resultat_id)
                JOIN "uttrekk.utøvere" AS utøver ON (coalesce(nå_resultat.utøver_id, forrige_resultat.utøver_id) = utøver.utøver_id)
                JOIN "uttrekk.klubber" AS klubb ON (coalesce(nå.klubb_id, forrige.klubb_id) = klubb.klubb_id)
            WHERE 2026 - coalesce(fødselsår, 2026) < 20
            GROUP BY coalesce(nå.kjønn, forrige.kjønn), nå.klubb_id, klubbnavn, coalesce(nå.lagnummer, forrige.lagnummer)
            ORDER BY coalesce(sum(nå.poeng),0) DESC
        ;
    ''', (dato, dato, serieår, dato, dato, serieår, dato-timedelta(7), dato-timedelta(7), serieår, dato-timedelta(7), dato-timedelta(7), serieår,))

def db_hent_rangering_vekstklubber(peker, serieår, dato):
    return execute(peker, '''
        WITH
            plassering_nå AS (
                (SELECT 'menn' AS kjønn, lagpl.klubb_id, divisjon, plassering, poeng
                FROM "serie.menn_lagplasseringer" lagpl
                    JOIN "serie.menn_laginfo" lag ON (lagpl.serieår = lag.serieår AND lagpl.klubb_id = lag.klubb_id AND lagpl.lagnummer = lag.lagnummer)
                WHERE lagpl.serieår = {placeholder}
                        AND lagpl.lagnummer = 1
                        AND (poeng >= 5000 OR divisjon < 3)
                        AND {placeholder} BETWEEN lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
                        AND {placeholder} BETWEEN lag.fra_og_med AND coalesce(lag.til_og_med, '9999-01-01'))
                UNION
                (SELECT 'kvinner' AS kjønn, lagpl.klubb_id, divisjon, plassering, poeng
                FROM "serie.kvinner_lagplasseringer" AS lagpl
                    JOIN "serie.menn_laginfo" lag ON (lagpl.serieår = lag.serieår AND lagpl.klubb_id = lag.klubb_id AND lagpl.lagnummer = lag.lagnummer)
                WHERE lagpl.serieår = {placeholder}
                        AND lagpl.lagnummer = 1
                        AND (poeng >= 5000 OR divisjon < 3)
                        AND {placeholder} BETWEEN lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
                        AND {placeholder} BETWEEN lag.fra_og_med AND coalesce(lag.til_og_med, '9999-01-01'))
            ),
            plassering_forrige_uke AS (
                (SELECT 'menn' AS kjønn, klubb_id, divisjon, plassering
                FROM "serie.menn_lagplasseringer"
                WHERE serieår = {placeholder}
                        AND lagnummer = 1
                        AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01'))
                UNION
                (SELECT 'kvinner' AS kjønn, klubb_id, divisjon, plassering
                FROM "serie.kvinner_lagplasseringer"
                WHERE serieår = {placeholder}
                        AND lagnummer = 1
                        AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01'))
            ),
            fjorårsplassering AS (
                (SELECT 'menn' AS kjønn, klubb_id, divisjon, plassering FROM "rapport.arkiv_menn_sluttplasseringer" WHERE lagnummer = 1 AND serieår = {placeholder})
                UNION
                (SELECT 'kvinner' AS kjønn, klubb_id, divisjon, plassering FROM "rapport.arkiv_kvinner_sluttplasseringer" WHERE lagnummer = 1 AND serieår = {placeholder})
            )
        SELECT ifjor.plassering-nå.plassering AS forbedring,
            forrige.plassering-nå.plassering AS dforbedring,
            nå.klubb_id,
            CONCAT(klubbnavn, ' (', nå.kjønn, ')') AS klubb,
            CASE WHEN ifjor.plassering <= 14 AND nå.plassering <= 14 THEN CONCAT(nå.plassering, '. d', nå.divisjon) ELSE CONCAT(nå.plassering, '.') END AS plassering,
            CASE WHEN ifjor.plassering <= 14 AND nå.plassering <= 14 THEN CONCAT(ifjor.plassering, '. d', ifjor.divisjon) ELSE CONCAT(ifjor.plassering, '.') END AS ifjor
        FROM plassering_nå AS nå
            JOIN plassering_forrige_uke AS forrige ON (nå.kjønn = forrige.kjønn AND nå.klubb_id = forrige.klubb_id)
            JOIN fjorårsplassering AS ifjor ON (nå.kjønn = ifjor.kjønn AND nå.klubb_id = ifjor.klubb_id)
            JOIN "uttrekk.klubber" AS klubb ON (nå.klubb_id = klubb.klubb_id)
        WHERE ifjor.plassering-nå.plassering > 0
        ORDER BY ifjor.plassering-nå.plassering DESC 
        LIMIT 100
        ;
    ''', (serieår, dato, dato, serieår, dato, dato, serieår, dato-timedelta(7), serieår, dato-timedelta(7), serieår-1, serieår-1,))

def db_hent_rangering_storklubber(peker, serieår, dato):
    return execute(peker, '''
        WITH
            menn_klubbpoeng_nå AS (
                SELECT SUM(poeng) AS poeng, laginfo.klubb_id, count(*) AS antall
                    FROM "serie.menn_laginfo" AS laginfo
                    JOIN "serie.menn_lagplasseringer" AS lagpl ON (laginfo.klubb_id = lagpl.klubb_id AND laginfo.lagnummer = lagpl.lagnummer)
                WHERE laginfo.serieår = {placeholder}
                    AND lagpl.serieår = {placeholder}
                    AND {placeholder} BETWEEN laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                    AND {placeholder} BETWEEN lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
                    AND (divisjon < 3 OR poeng >= 5000)
                GROUP BY laginfo.klubb_id
            ),
            kvinner_klubbpoeng_nå AS (
                SELECT SUM(poeng) AS poeng, laginfo.klubb_id, count(*) AS antall
                FROM "serie.kvinner_laginfo" AS laginfo
                    JOIN "serie.kvinner_lagplasseringer" AS lagpl ON (laginfo.klubb_id = lagpl.klubb_id AND laginfo.lagnummer = lagpl.lagnummer)
                WHERE laginfo.serieår = {placeholder}
                    AND lagpl.serieår = {placeholder}
                    AND {placeholder} BETWEEN laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                    AND {placeholder} BETWEEN lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
                    AND (divisjon < 3 OR poeng >= 5000)
                GROUP BY laginfo.klubb_id
            ),
                menn_klubbpoeng_forrige_uke AS (
                SELECT SUM(poeng) AS poeng, laginfo.klubb_id, count(*) AS antall
                    FROM "serie.menn_laginfo" AS laginfo
                    JOIN "serie.menn_lagplasseringer" AS lagpl ON (laginfo.klubb_id = lagpl.klubb_id AND laginfo.lagnummer = lagpl.lagnummer)
                WHERE laginfo.serieår = {placeholder}
                    AND lagpl.serieår = {placeholder}
                    AND {placeholder} BETWEEN laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                    AND {placeholder} BETWEEN lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
                    AND (divisjon < 3 OR poeng >= 5000)
                GROUP BY laginfo.klubb_id
            ),
            kvinner_klubbpoeng_forrige_uke AS (
                SELECT SUM(poeng) AS poeng, laginfo.klubb_id, count(*) AS antall
                FROM "serie.kvinner_laginfo" AS laginfo
                    JOIN "serie.kvinner_lagplasseringer" AS lagpl ON (laginfo.klubb_id = lagpl.klubb_id AND laginfo.lagnummer = lagpl.lagnummer)
                WHERE laginfo.serieår = {placeholder}
                    AND lagpl.serieår = {placeholder}
                    AND {placeholder} BETWEEN laginfo.fra_og_med AND coalesce(laginfo.til_og_med, '9999-01-01')
                    AND {placeholder} BETWEEN lagpl.fra_og_med AND coalesce(lagpl.til_og_med, '9999-01-01')
                    AND (divisjon < 3 OR poeng >= 5000)
                GROUP BY laginfo.klubb_id
            )
        SELECT coalesce(m_nå.poeng, 0) + coalesce(k_nå.poeng, 0) as c1, coalesce(m_nå.poeng, 0) + coalesce(k_nå.poeng, 0) - coalesce(m_forrige.poeng, 0) - coalesce(k_forrige.poeng, 0) as c2, klubb.klubb_id, klubbnavn, coalesce(m_nå.antall, 0) + coalesce(k_nå.antall, 0) as c3, coalesce(m_nå.antall, 0) + coalesce(k_nå.antall, 0) - coalesce(m_forrige.antall, 0) - coalesce(k_forrige.antall, 0) as c4
        FROM menn_klubbpoeng_nå AS m_nå
            FULL JOIN kvinner_klubbpoeng_nå AS k_nå ON (m_nå.klubb_id = k_nå.klubb_id)
            JOIN "uttrekk.klubber" AS klubb ON (m_nå.klubb_id = klubb.klubb_id)
            LEFT JOIN menn_klubbpoeng_forrige_uke AS m_forrige ON (m_forrige.klubb_id = klubb.klubb_id)
            LEFT JOIN kvinner_klubbpoeng_forrige_uke AS k_forrige ON (k_forrige.klubb_id = klubb.klubb_id)
        ORDER BY coalesce(m_nå.poeng, 0) + coalesce(k_nå.poeng, 0) DESC
        LIMIT 100
        ;
    ''', (serieår, serieår, dato, dato, serieår,serieår, dato, dato, serieår, serieår, dato-timedelta(7), dato-timedelta(7), serieår, serieår, dato-timedelta(7), dato-timedelta(7)))

def db_hent_rangering_største_krets(peker, serieår, dato):
    return execute(peker, '''
        WITH
            nå_lag AS (
                SELECT 'menn' AS kjønn,* FROM "serie.menn_laginfo" WHERE serieår = {placeholder} AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                UNION
                SELECT 'kvinner' AS kjønn, * FROM "serie.kvinner_laginfo" WHERE serieår = {placeholder} AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
            ),
            forrige_uke_lag AS (
                SELECT 'menn' AS kjønn,* FROM "serie.menn_laginfo" WHERE serieår = {placeholder} AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                UNION
                SELECT 'kvinner' AS kjønn, * FROM "serie.kvinner_laginfo" WHERE serieår = {placeholder} AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
            )
        SELECT sum(CASE WHEN nå_lag.poeng >= 5000 THEN 1 ELSE 0 END), sum(CASE WHEN coalesce(forrige_uke_lag.poeng, 0) < 5000 AND nå_lag.poeng >= 5000 THEN 1 ELSE 0 END), krets
        FROM nå_lag
            LEFT JOIN forrige_uke_lag ON (
            nå_lag.kjønn = forrige_uke_lag.kjønn
            AND nå_lag.serieår = forrige_uke_lag.serieår
            AND nå_lag.klubb_id = forrige_uke_lag.klubb_id
            AND nå_lag.lagnummer = forrige_uke_lag.lagnummer
        )
            JOIN "uttrekk.klubbkretser" AS klubbkrets ON (klubbkrets.klubb_id = nå_lag.klubb_id) 
        WHERE {placeholder} BETWEEN klubbkrets.fra_og_med AND coalesce(klubbkrets.til_og_med, '9999-01-01')
        GROUP BY krets
        HAVING sum(CASE WHEN nå_lag.poeng >= 5000 THEN 1 ELSE 0 END) > 0
        ORDER BY sum(CASE WHEN nå_lag.poeng >= 5000 THEN 1 ELSE 0 END) DESC
    ''', (serieår, dato, serieår, dato, serieår, dato-timedelta(7), serieår, dato-timedelta(7), dato))

def db_hent_maksimalt_antall_noteringer(peker, serieår, divisjon):

    return execute(peker, '''
        SELECT antall_valgfri+antall_obligatoriske
        FROM "serie.oppstillingskrav"
        WHERE serieår = {placeholder}
            AND divisjon = {placeholder};
    ''', (serieår, divisjon))[0][0]

def db_hent_oppstillingskrav(peker, serieår, divisjon):
    return execute(peker, '''
        SELECT antall_obligatoriske, antall_valgfri, maks_obligatoriske_løp, maks_valgfri_løp
        FROM "serie.oppstillingskrav"
        WHERE serieår = {placeholder}
            AND divisjon = {placeholder};
    ''', (serieår, divisjon))[0]

def db_hent_oppstillingskrav_til_lag(peker, kjønn, serieår, klubbnavn, lagnummer):
    return execute(peker, f'''
        SELECT krav.*
        FROM "uttrekk.klubber" AS klubb
            JOIN "serie.oppstillingskrav" AS krav ON (1 = 1)
            LEFT JOIN "serie.{kjønn}_topplag" AS topplag ON (
                krav.serieår = topplag.serieår
                AND topplag.klubb_id = klubb.klubb_id
                AND topplag.lagnummer = {{placeholder}}
            )
        WHERE krav.serieår = {{placeholder}}
            AND klubbnavn = {{placeholder}} 
            AND coalesce(topplag.divisjon, 3) = krav.divisjon
    ''', (lagnummer, serieår, klubbnavn))[0]

def db_hent_lagets_resultater(peker, kjønn, klubbnavn, lagnummer, serieår, dato):
    return execute(peker, f'''
        SELECT oppstillingstype,
            poeng,
            resultat.*
        FROM "serie.{kjønn}_lag" AS lag
            JOIN "uttrekk.klubber" AS klubb ON (klubb.klubb_id = lag.klubb_id)
            JOIN "serie.{kjønn}_lagresultater" AS lagresultat ON (lag.serieår = lagresultat.serieår AND lag.klubb_id = lagresultat.klubb_id AND lag.lagnummer = lagresultat.lagnummer)
            JOIN "tildeling.{kjønn}_serieresultater" AS serieresultat ON (serieresultat.resultat_id = lagresultat.resultat_id)
            JOIN "uttrekk.resultater" AS resultat ON (resultat.resultat_id = lagresultat.resultat_id)
        WHERE lag.serieår = {{placeholder}}
            AND klubbnavn = {{placeholder}}
            AND lag.lagnummer = {{placeholder}}
            AND lagresultat.fra_og_med <= {{placeholder}}
            AND coalesce(lagresultat.til_og_med, '9999-01-01') >= {{placeholder}}
            AND serieresultat.fra_og_med <= {{placeholder}}
            AND coalesce(serieresultat.til_og_med, '9999-01-01') >= {{placeholder}}
        ;
    ''', (serieår, klubbnavn, lagnummer, dato, dato, dato, dato))

def db_hent_lagresultater(peker, kjønn, klubbnavn, lagnummer, serieår, dato):
    resultat = execute(peker, f'''
        WITH lagresultater AS (
            SELECT lag.serieår,
                  oppstillingstype,
                  poeng,
                  øvelsesnavn,
                  øvelse.øvelseskode,
                  prestasjon,
                  navn,
                  fødselsår,
                  sted,
                  CAST(dato AS text) AS dato,
                  lagresultat.resultat_id
            FROM "serie.{kjønn}_lag" AS lag
                JOIN "uttrekk.klubber" AS klubb ON (klubb.klubb_id = lag.klubb_id)
                JOIN "serie.{kjønn}_lagresultater" AS lagresultat ON (lag.serieår = lagresultat.serieår AND lag.klubb_id = lagresultat.klubb_id AND lag.lagnummer = lagresultat.lagnummer)
                JOIN "tildeling.{kjønn}_serieresultater" AS serieresultat ON (serieresultat.resultat_id = lagresultat.resultat_id)
                JOIN "uttrekk.resultater" AS resultat ON (resultat.resultat_id = lagresultat.resultat_id)
                JOIN "uttrekk.stevner" AS stevne ON (stevne.stevne_id = resultat.stevne_id) 
                JOIN "uttrekk.utøvere" AS utøver ON (utøver.utøver_id = resultat.utøver_id) 
                JOIN "uttrekk.øvelser" AS øvelse ON (øvelse.øvelseskode = resultat.øvelseskode) 
            WHERE lag.serieår = {{placeholder}}
                AND klubbnavn = {{placeholder}}
                AND lag.lagnummer = {{placeholder}}
                AND lagresultat.fra_og_med <= {{placeholder}}
                AND coalesce(lagresultat.til_og_med, '9999-01-01') >= {{placeholder}}
                AND serieresultat.fra_og_med <= {{placeholder}}
                AND coalesce(serieresultat.til_og_med, '9999-01-01') >= {{placeholder}}
        ),
        obligatoriske_lagresultater AS (
            SELECT oppstillingstype, poeng, øvelsesnavn, prestasjon, navn, fødselsår, sted, dato, resultat_id
            FROM lagresultater AS lagresultat
                JOIN "serie.{kjønn}_serieøvelser" AS serieøvelse ON (
                    lagresultat.serieår = serieøvelse.serieår
                    AND lagresultat.øvelseskode = serieøvelse.øvelseskode
                )
            WHERE oppstillingstype = 'OBLIGATORISK'
            ORDER BY prioritet
        ),
        valgfrie_lagresultater AS (
            SELECT oppstillingstype, poeng, øvelsesnavn, prestasjon, navn, fødselsår, sted, dato, resultat_id
            FROM lagresultater AS lagresultat
            WHERE oppstillingstype = 'VALGFRI'
            ORDER BY poeng DESC, øvelseskode, navn
        )
        SELECT * FROM obligatoriske_lagresultater
        UNION ALL
        SELECT * FROM valgfrie_lagresultater;
    ''', (serieår, klubbnavn, lagnummer, dato, dato, dato, dato))

    lagresultater = {"OBLIGATORISK": [], "VALGFRI": []}
    for el in resultat:
        lagresultater[el[0]].append(el[1:])

    return lagresultater

def db_hent_resultatplasseringer_til_klubb(peker, kjønn, serieår, dato, klubbnavn):
    resultat = execute(peker, f'''
        WITH lagresultater AS (
                SELECT resultat.resultat_id AS resultat_id,
                    serieresultat.poeng AS poeng,
                    coalesce(topplag.divisjon, 3) AS divisjon,
                    resultat.øvelseskode AS øvelseskode,
                    lagresultat.klubb_id AS klubb_id
                FROM "serie.{kjønn}_lagresultater" AS lagresultat
                    JOIN "tildeling.{kjønn}_serieresultater" AS serieresultat ON (lagresultat.resultat_id = serieresultat.resultat_id)
                    JOIN "uttrekk.resultater" AS resultat ON (lagresultat.resultat_id = resultat.resultat_id)
                    LEFT JOIN "serie.{kjønn}_topplag" AS topplag ON (
                        topplag.klubb_id = lagresultat.klubb_id
                        AND topplag.lagnummer = lagresultat.lagnummer
                        AND topplag.serieår = {{placeholder}}
                    )
                WHERE lagresultat.serieår = {{placeholder}}
                    AND lagresultat.fra_og_med <= {{placeholder}}
                    AND coalesce(lagresultat.til_og_med, '9999-01-01') >= {{placeholder}}
                    AND serieresultat.fra_og_med <= {{placeholder}}
                    AND coalesce(serieresultat.til_og_med, '9999-01-01') >= {{placeholder}}
            ),
            rangerte_lagresultater AS (
                SELECT resultat_id,
                    ROW_NUMBER() OVER (PARTITION BY divisjon, øvelseskode ORDER BY poeng DESC) AS rangering,
                    klubb_id
                FROM lagresultater
            )
        SELECT rangert.resultat_id,
            rangert.rangering
        FROM rangerte_lagresultater AS rangert
            JOIN "uttrekk.klubber" AS klubb ON (klubb.klubb_id = rangert.klubb_id)
        WHERE klubb.klubbnavn = {{placeholder}}
        ;
    ''', (serieår, serieår, dato, dato, dato, dato, klubbnavn))
    return {k: v for k,v in resultat}

def db_hent_laginfo(peker, kjønn, klubbnavn, lagnummer, serieår, dato):
    return execute(peker, f'''
        SELECT {{placeholder}},
            coalesce(divisjon, 3),
            case
                when coalesce(poeng_obligatoriske + poeng_valgfri, 0) >= 5000 or coalesce(divisjon, 3) < 3 then CAST(plassering AS text)
                when plassering is null then '-'
                else '(' || plassering || ')'
            end,
            coalesce(poeng_obligatoriske + poeng_valgfri, 0),
            coalesce(antall_noteringer, 0),
            coalesce(antall_deltakere, 0)
        FROM "uttrekk.klubber" AS klubb
            LEFT JOIN "serie.{kjønn}_lag" AS lag ON (
                lag.serieår = {{placeholder}}
                AND lag.lagnummer ={{placeholder}}
                AND lag.klubb_id = klubb.klubb_id
            )
            LEFT JOIN "serie.{kjønn}_lagplasseringer" AS tabell ON (
                lag.serieår = tabell.serieår
                AND lag.klubb_id = tabell.klubb_id
                AND lag.lagnummer = tabell.lagnummer
                AND tabell.fra_og_med <= {{placeholder}}
                AND coalesce(tabell.til_og_med, '9999-01-01') >= {{placeholder}}
            )
            LEFT JOIN "serie.{kjønn}_laginfo" AS laginfo ON (
                tabell.serieår = laginfo.serieår
                AND tabell.klubb_id = laginfo.klubb_id
                AND tabell.lagnummer = laginfo.lagnummer
                AND laginfo.fra_og_med <= {{placeholder}}
                AND coalesce(laginfo.til_og_med, '9999-01-01') >= {{placeholder}}
            )
        WHERE klubbnavn = {{placeholder}}
        ;
    ''', (serieår, serieår, lagnummer, dato, dato, dato, dato, klubbnavn))[0]

def db_hent_klubblag(peker, kjønn, klubbnavn, serieår, dato):
    return execute(peker, f'''
        SELECT
            CASE
                WHEN laginfo.lagnummer = 1 THEN klubbnavn 
                ELSE CONCAT(klubbnavn, ' ', laginfo.lagnummer, '. lag')
            END AS lagnavn,
            divisjon,
            case when (divisjon < 3 OR poeng >= 5000) then CAST(plassering AS text) else '(' || plassering || ')' end,
            poeng_obligatoriske + poeng_valgfri,
            antall_noteringer,
            antall_deltakere
        FROM "uttrekk.klubber" AS klubb
            JOIN "serie.{kjønn}_lag" AS lag ON (1 = 1)
            JOIN "serie.{kjønn}_lagplasseringer" AS tabell ON (
                lag.serieår = tabell.serieår
                AND lag.klubb_id = tabell.klubb_id
                AND lag.lagnummer = tabell.lagnummer
            )
            JOIN "serie.{kjønn}_laginfo" AS laginfo ON (
                tabell.serieår = laginfo.serieår
                AND tabell.klubb_id = laginfo.klubb_id
                AND tabell.lagnummer = laginfo.lagnummer
            )
        WHERE lag.serieår = {{placeholder}}
            AND klubb.klubbnavn = {{placeholder}}
            AND lag.klubb_id = klubb.klubb_id
            AND tabell.fra_og_med <= {{placeholder}}
            AND coalesce(tabell.til_og_med, '9999-01-01') >= {{placeholder}}
            AND laginfo.fra_og_med <= {{placeholder}}
            AND coalesce(laginfo.til_og_med, '9999-01-01') >= {{placeholder}}
    ''', (serieår, klubbnavn, dato, dato, dato, dato))

def db_hent_rekordranking(peker, kjønn, klubbnavn, lagnummer):
    resultat = execute(peker, f'''
        WITH rangeringsverdier AS (
                SELECT klubb.klubbnavn,
                    coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) as lagnummer,
                    coalesce(plass1.serieår+1, plass2.serieår+2, plass3.serieår+3, plass4.serieår+4, plass5.serieår+5) as serieår,
                    case 
                        when plass1.serieår is null then 100000
                        else 1*(14*(plass1.divisjon-1)+plass1.plassering)
                    end
                    +
                    case 
                        when plass2.serieår is null then 200000
                        else 2*(14*(plass2.divisjon-1)+plass2.plassering)
                    end
                    +
                    case 
                        when plass3.serieår is null then 300000
                        else 3*(14*(plass3.divisjon-1)+plass3.plassering)
                    end
                    +
                    case 
                        when plass4.serieår is null then 400000
                        else 4*(14*(plass4.divisjon-1)+plass4.plassering)
                    end
                    +
                    case 
                        when plass5.serieår is null then 500000
                        else 5*(14*(plass5.divisjon-1)+plass5.plassering)
                    end
                    AS rangeringsverdi
                FROM "uttrekk.klubber" AS klubb
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass1 ON (plass1.klubb_id = klubb.klubb_id)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass2 ON (coalesce(plass1.serieår-1, plass2.serieår) = plass2.serieår AND plass2.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer) = plass2.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass3 ON (coalesce(plass1.serieår-2, plass2.serieår-1, plass3.serieår) = plass3.serieår AND plass3.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer) = plass3.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass4 ON (coalesce(plass1.serieår-3, plass2.serieår-2, plass3.serieår-1, plass4.serieår) = plass4.serieår AND plass4.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer) = plass4.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass5 ON (coalesce(plass1.serieår-4, plass2.serieår-3, plass3.serieår-2, plass4.serieår-1, plass5.serieår) = plass5.serieår AND plass5.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) = plass5.lagnummer)
                WHERE coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) is not null
            ),
            rangering AS (
                SELECT klubbnavn,
                    lagnummer,
                    ROW_NUMBER() OVER (PARTITION BY serieår ORDER BY rangeringsverdi) AS rank,
                    serieår
                FROM rangeringsverdier
            )
        SELECT rank, serieår-1
        FROM rangering
        WHERE klubbnavn = {{placeholder}}
            AND lagnummer = {{placeholder}}
        ORDER BY rank, serieår DESC
        LIMIT 1
        ;
    ''', (klubbnavn, lagnummer))
    return [None, None] if resultat == [] else resultat[0]

def db_hent_ranking(peker, kjønn, serieår, klubbnavn, lagnummer):
    resultat = execute(peker, f'''
        WITH rangeringsverdier AS (
                SELECT klubb.klubbnavn,
                    coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) as lagnummer,
                    case 
                        when plass1.serieår is null then 100000
                        else 1*(14*(plass1.divisjon-1)+plass1.plassering)
                    end
                    +
                    case 
                        when plass2.serieår is null then 200000
                        else 2*(14*(plass2.divisjon-1)+plass2.plassering)
                    end
                    +
                    case 
                        when plass3.serieår is null then 300000
                        else 3*(14*(plass3.divisjon-1)+plass3.plassering)
                    end
                    +
                    case 
                        when plass4.serieår is null then 400000
                        else 4*(14*(plass4.divisjon-1)+plass4.plassering)
                    end
                    +
                    case 
                        when plass5.serieår is null then 500000
                        else 5*(14*(plass5.divisjon-1)+plass5.plassering)
                    end
                    AS rangeringsverdi
                FROM "uttrekk.klubber" AS klubb
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass1 ON ({{placeholder}}-1 = plass1.serieår AND plass1.klubb_id = klubb.klubb_id)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass2 ON ({{placeholder}}-2 = plass2.serieår AND plass2.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer) = plass2.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass3 ON ({{placeholder}}-3 = plass3.serieår AND plass3.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer) = plass3.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass4 ON ({{placeholder}}-4 = plass4.serieår AND plass4.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer) = plass4.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass5 ON ({{placeholder}}-5 = plass5.serieår AND plass5.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) = plass5.lagnummer)
                WHERE coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) is not null
            ),
            rangering AS (
                SELECT klubbnavn,
                    lagnummer,
                    ROW_NUMBER() OVER (ORDER BY rangeringsverdi) AS rank
                FROM rangeringsverdier
            )
        SELECT rank
        FROM rangering
        WHERE klubbnavn = {{placeholder}}
            AND lagnummer = {{placeholder}}
        ;
    ''', (serieår, serieår, serieår, serieår, serieår, klubbnavn, lagnummer))

    return None if resultat == [] else resultat[0][0]

def db_hent_ranking_i_krets(peker, kjønn, serieår, dato, klubbnavn, lagnummer):
    resultat = execute(peker, f'''
        WITH rangeringsverdier AS (
                SELECT klubb.klubbnavn,
                    klubbkrets.krets,
                    coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) as lagnummer,
                    case 
                        when plass1.serieår is null then 100000
                        else 1*(14*(plass1.divisjon-1)+plass1.plassering)
                    end
                    +
                    case 
                        when plass2.serieår is null then 200000
                        else 2*(14*(plass2.divisjon-1)+plass2.plassering)
                    end
                    +
                    case 
                        when plass3.serieår is null then 300000
                        else 3*(14*(plass3.divisjon-1)+plass3.plassering)
                    end
                    +
                    case 
                        when plass4.serieår is null then 400000
                        else 4*(14*(plass4.divisjon-1)+plass4.plassering)
                    end
                    +
                    case 
                        when plass5.serieår is null then 500000
                        else 5*(14*(plass5.divisjon-1)+plass5.plassering)
                    end
                    AS rangeringsverdi
                FROM "uttrekk.klubber" AS klubb
                    JOIN "uttrekk.klubbkretser" AS klubbkrets ON (klubbkrets.klubb_id = klubb.klubb_id)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass1 ON ({{placeholder}}-1 = plass1.serieår AND plass1.klubb_id = klubb.klubb_id)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass2 ON ({{placeholder}}-2 = plass2.serieår AND plass2.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer) = plass2.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass3 ON ({{placeholder}}-3 = plass3.serieår AND plass3.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer) = plass3.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass4 ON ({{placeholder}}-4 = plass4.serieår AND plass4.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer) = plass4.lagnummer)
                    LEFT JOIN "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass5 ON ({{placeholder}}-5 = plass5.serieår AND plass5.klubb_id = klubb.klubb_id AND coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) = plass5.lagnummer)
                WHERE coalesce(plass1.lagnummer, plass2.lagnummer, plass3.lagnummer, plass4.lagnummer, plass5.lagnummer) is not null
                    AND {{placeholder}} BETWEEN klubbkrets.fra_og_med AND coalesce(klubbkrets.til_og_med, '9999-01-01')
            ),
            rangering AS (
                SELECT klubbnavn,
                    lagnummer,
                    krets,
                    ROW_NUMBER() OVER (PARTITION BY krets ORDER BY rangeringsverdi) AS rank
                FROM rangeringsverdier
            )
        SELECT rank, klubbnavn, krets
        FROM rangering
        WHERE klubbnavn = {{placeholder}}
            AND lagnummer = {{placeholder}}
        ;
    ''', (serieår, serieår, serieår, serieår, serieår, dato, klubbnavn, lagnummer))
    
    return None if resultat == [] else resultat[0][0]

def db_hent_sluttplassering(peker, kjønn, serieår, klubbnavn, lagnummer):
    resultat = execute(peker, f'''
        SELECT divisjon, plassering, poeng
        FROM "rapport.arkiv_{kjønn}_sluttplasseringer" AS plass
            JOIN "uttrekk.klubber" AS klubb ON (plass.klubb_id = klubb.klubb_id AND klubb.klubbnavn = {{placeholder}})
        WHERE serieår = {{placeholder}}
            AND lagnummer >= {{placeholder}};
    ''', (klubbnavn, serieår, lagnummer))
    return None if resultat == [] else resultat[0]

def db_hent_klubbkrets(peker, klubbnavn, dato):
    return execute(peker, '''
        SELECT krets
        FROM "uttrekk.klubber" AS klubb
            JOIN "uttrekk.klubbkretser" AS klubbkrets ON (klubb.klubb_id = klubbkrets.klubb_id)
        WHERE klubbnavn = {placeholder}
            AND {placeholder} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01');
    ''', (klubbnavn, dato))[0][0]

def db_hent_klubbresultater(peker, kjønn, klubbnavn, serieår, uttrekksdato):
    return execute(peker, f''' 
        SELECT resultat.resultat_id,
            serieresultat.poeng,
            øvelse.øvelseskode,
            øvelse.øvelsesnavn,
            utøver.utøver_id,
            utøver.navn
        FROM "uttrekk.serier" AS serie
            JOIN "uttrekk.resultater" AS resultat ON (resultat.dato BETWEEN serie.fra_og_med AND serie.til_og_med)
            JOIN "tildeling.{kjønn}_serieresultater" AS serieresultat ON (resultat.resultat_id = serieresultat.resultat_id)
            JOIN "uttrekk.klubber" AS klubb ON (serieresultat.klubb_id = klubb.klubb_id)
            JOIN "uttrekk.øvelser" AS øvelse ON (resultat.øvelseskode = øvelse.øvelseskode)
            JOIN "uttrekk.utøvere" AS utøver ON (resultat.utøver_id = utøver.utøver_id)
        WHERE serie.serieår = {{placeholder}}
            AND klubbnavn = {{placeholder}}
            AND {{placeholder}} BETWEEN serieresultat.fra_og_med AND COALESCE(serieresultat.til_og_med, '9999-01-01')
        ;
        ''', (serieår, klubbnavn, uttrekksdato))

def db_hent_utøverinfo(peker, utøver_id):
    resultat = execute(peker, '''
        SELECT navn, fødselsår
        FROM "uttrekk.utøvere"
        WHERE utøver_id = {placeholder}
    ''', (utøver_id,))
    
    return None if len(resultat) == 0 else resultat[0]

def db_hent_utøverresultater(peker, utøver_id):
    resultater = execute(peker, '''
        WITH
            serieøvelse AS (
                SELECT * FROM "serie.menn_serieøvelser"
                UNION
                SELECT * FROM "serie.kvinner_serieøvelser"
            ),
            uttrekksresultat AS (
                SELECT 'menn' AS kjønn,* FROM "uttrekk.menn_uttrekksresultater"
                UNION
                SELECT 'kvinner',* FROM "uttrekk.kvinner_uttrekksresultater"
            )
        SELECT øvelsesnavn, prestasjon, sted, dato, klubbnavn, prioritet, resultat.øvelseskode, kjønn
        FROM "uttrekk.resultater" AS resultat
            JOIN uttrekksresultat ON (resultat.resultat_id = uttrekksresultat.resultat_id)
            JOIN "uttrekk.klubber" AS klubb ON (uttrekksresultat.klubb_id = klubb.klubb_id)
            JOIN "uttrekk.øvelser" AS øvelse ON (resultat.øvelseskode = øvelse.øvelseskode)
            JOIN "uttrekk.stevner" AS stevne ON (resultat.stevne_id = stevne.stevne_id)
            JOIN serieøvelse ON (resultat.øvelseskode = serieøvelse.øvelseskode AND serieøvelse.serieår = EXTRACT(YEAR FROM resultat.dato))
        WHERE uttrekksresultat.til_og_med IS NULL
            AND resultat.utøver_id = {placeholder}
        ORDER BY EXTRACT(YEAR FROM resultat.dato)
    ''', (utøver_id,))

    per_år = {}
    for resultat in resultater:
        if (år := resultat[3].year) not in per_år:
            per_år[år] = []
        per_år[år].append(resultat)
    return per_år

def db_hent_utøverens_lagresultater(peker, utøver_id):
    resultater = execute(peker, '''
        WITH 
            uttrekksresultat AS (
                SELECT * FROM "uttrekk.menn_uttrekksresultater"
                UNION
                SELECT * FROM "uttrekk.kvinner_uttrekksresultater"
            ),
            serieresultat AS (
                SELECT * FROM "tildeling.menn_serieresultater"
                UNION
                SELECT * FROM "tildeling.kvinner_serieresultater"
            ),
            lagresultat AS (
                SELECT * FROM "serie.menn_lagresultater"
                UNION
                SELECT * FROM "serie.kvinner_lagresultater"
            ),
            serieøvelse AS (
                SELECT * FROM "serie.menn_serieøvelser"
                UNION
                SELECT * FROM "serie.kvinner_serieøvelser"
            )
        SELECT serieresultat.poeng,
            øvelsesnavn,
            prestasjon,
            sted,
            dato,
            CASE
                WHEN lagresultat.lagnummer = 1 THEN klubbnavn 
                ELSE CONCAT(klubbnavn, ' ', lagresultat.lagnummer, '. lag')
            END
        FROM "uttrekk.resultater" AS resultat
            JOIN lagresultat ON (resultat.resultat_id = lagresultat.resultat_id)
            JOIN serieresultat ON (resultat.resultat_id = serieresultat.resultat_id)
            JOIN serieøvelse ON (resultat.øvelseskode = serieøvelse.øvelseskode AND serieøvelse.serieår = EXTRACT(YEAR FROM resultat.dato))
            JOIN "uttrekk.klubber" AS klubb ON (lagresultat.klubb_id = klubb.klubb_id)
            JOIN "uttrekk.øvelser" AS øvelse ON (resultat.øvelseskode = øvelse.øvelseskode)
            JOIN "uttrekk.stevner" AS stevne ON (resultat.stevne_id = stevne.stevne_id)
        WHERE resultat.utøver_id = {placeholder}
            AND serieresultat.til_og_med IS NULL
            AND lagresultat.til_og_med IS NULL
        ORDER BY EXTRACT(YEAR FROM resultat.dato), prioritet    
    ''', (utøver_id,))
    
    per_år_klubb = {}
    for resultat in resultater:
        år = resultat[4].year
        klubb = resultat[5]
        if år not in per_år_klubb:
            per_år_klubb[år] = {}
        if klubb not in per_år_klubb[år]:
            per_år_klubb[år][klubb] = []
        per_år_klubb[år][klubb].append(resultat[:-1])
    return per_år_klubb

def db_hent_klubbresultater_med_overgangsinfo(peker, klubbnavn, serieår, uttrekksdato):
    return execute(peker, f'''
        WITH kvinner_resultater AS (
                SELECT uttres.resultat_id,
                        serieres.poeng as poeng,
                        klubb_til.klubbnavn as klubb_til,
                        klubb_fra.klubbnavn as klubb_fra,
                        serieres.forløp as forløp,
                        false AS menn,
                        true AS kvinner,
                        (coalesce(klubb_til.klubbnavn, '') <> {{placeholder}}) AS er_fjernet,
                        (klubb_til.klubb_id IS NOT NULL) AND (klubb_fra.klubbnavn <> {{placeholder}}) AND (coalesce(klubb_til.klubbnavn, '') = {{placeholder}}) AS er_klubbovergang_til,
                        (klubb_til.klubb_id IS NOT NULL) AND (coalesce(klubb_til.klubbnavn, '') <> {{placeholder}}) AS er_klubbovergang_fra
                FROM "uttrekk.kvinner_uttrekksresultater" AS uttres
                    JOIN "uttrekk.klubber" AS klubb_fra ON (uttres.klubb_id = klubb_fra.klubb_id)
                    JOIN "tildeling.kvinner_serieresultater" AS serieres ON (
                        uttres.resultat_id = serieres.resultat_id
                        AND serieres.fra_og_med <= {{placeholder}}
                        AND coalesce(serieres.til_og_med, '9999-01-01') >= {{placeholder}}
                    )
                    LEFT JOIN "uttrekk.klubber" AS klubb_til ON (serieres.klubb_id = klubb_til.klubb_id)
                WHERE uttres.fra_og_med <= {{placeholder}}
                    AND coalesce(uttres.til_og_med, '9999-01-01') >= {{placeholder}}
                    AND (klubb_fra.klubbnavn = {{placeholder}} OR coalesce(klubb_til.klubbnavn, '') = {{placeholder}})
                ),
            menn_resultater AS (
                SELECT uttres.resultat_id,
                        serieres.poeng as poeng,
                        klubb_til.klubbnavn as klubb_til,
                        klubb_fra.klubbnavn as klubb_fra,
                        serieres.forløp as forløp,
                        true AS menn,
                        false AS kvinner,
                        (coalesce(klubb_til.klubbnavn, '') <> {{placeholder}}) AS er_fjernet,
                        (klubb_til.klubb_id IS NOT NULL) AND (klubb_fra.klubbnavn <> {{placeholder}}) AND (coalesce(klubb_til.klubbnavn, '') = {{placeholder}}) AS er_klubbovergang_til,
                        (klubb_til.klubb_id IS NOT NULL) AND (coalesce(klubb_til.klubbnavn, '') <> {{placeholder}}) AS er_klubbovergang_fra
                FROM "uttrekk.menn_uttrekksresultater" AS uttres
                    JOIN "uttrekk.klubber" AS klubb_fra ON (uttres.klubb_id = klubb_fra.klubb_id)
                    JOIN "tildeling.menn_serieresultater" AS serieres ON (
                        uttres.resultat_id = serieres.resultat_id
                        AND serieres.fra_og_med <= {{placeholder}}
                        AND coalesce(serieres.til_og_med, '9999-01-01') >= {{placeholder}}
                    )
                    LEFT JOIN "uttrekk.klubber" AS klubb_til ON (serieres.klubb_id = klubb_til.klubb_id)
                WHERE uttres.fra_og_med <= {{placeholder}}
                    AND coalesce(uttres.til_og_med, '9999-01-01') >= {{placeholder}}
                    AND (klubb_fra.klubbnavn = {{placeholder}} OR coalesce(klubb_til.klubbnavn, '') = {{placeholder}})
            ),
            klubbresultater AS (
                SELECT *
                    FROM (
                        SELECT * FROM kvinner_resultater
                        UNION
                        SELECT * FROM menn_resultater
                    ) AS serieresultat
                        JOIN "uttrekk.serier" AS serie ON (serie.serieår = {{placeholder}})
                        JOIN "uttrekk.resultater" AS resultat ON (serieresultat.resultat_id = resultat.resultat_id)
                        JOIN "uttrekk.øvelser" AS øvelse ON (resultat.øvelseskode = øvelse.øvelseskode)
                        JOIN "uttrekk.stevner" AS stevne ON (resultat.stevne_id = stevne.stevne_id)
                        JOIN "uttrekk.utøvere" AS utøver ON (resultat.utøver_id = utøver.utøver_id)
                    WHERE resultat.dato >= serie.fra_og_med
                        AND resultat.dato <= serie.til_og_med
            )
        SELECT coalesce(CAST(poeng AS text), '?'), øvelsesnavn, prestasjon, navn, fødselsår, sted, dato, klubb_fra, klubb_til, forløp, menn, kvinner, er_fjernet, er_klubbovergang_til, er_klubbovergang_fra
        FROM klubbresultater
        ORDER BY coalesce(poeng, 0) DESC
    ''', (klubbnavn, klubbnavn, klubbnavn, klubbnavn, uttrekksdato, uttrekksdato, uttrekksdato, uttrekksdato, klubbnavn, klubbnavn, klubbnavn, klubbnavn, klubbnavn, klubbnavn, uttrekksdato, uttrekksdato, uttrekksdato, uttrekksdato, klubbnavn, klubbnavn, serieår))

def db_hent_resultater(peker, kjønn, klubbnavn, serieår, dato):
    return execute(peker, f'''
        WITH 
            klubbresultater as (
                SELECT poeng, øvelsesnavn, resultat.øvelseskode, prestasjon, navn, fødselsår, resultat.utøver_id, sted, dato
                FROM "tildeling.{kjønn}_serieresultater" AS serieresultat
                    JOIN "uttrekk.serier" AS serie ON (serie.serieår = {{placeholder}})
                    JOIN "uttrekk.resultater" AS resultat ON (serieresultat.resultat_id = resultat.resultat_id)
                    JOIN "serie.{kjønn}_serieøvelser" AS serieøvelse ON (serieøvelse.øvelseskode = resultat.øvelseskode)
                    JOIN "uttrekk.klubber" AS klubb ON (klubb.klubbnavn = {{placeholder}})
                    JOIN "uttrekk.øvelser" AS øvelse ON (resultat.øvelseskode = øvelse.øvelseskode)
                    JOIN "uttrekk.stevner" AS stevne ON (resultat.stevne_id = stevne.stevne_id)
                    JOIN "uttrekk.utøvere" AS utøver ON (resultat.utøver_id = utøver.utøver_id)
                WHERE serieøvelse.serieår = {{placeholder}}
                    AND resultat.dato >= serie.fra_og_med
                    AND resultat.dato <= serie.til_og_med
                    AND serieresultat.fra_og_med <= {{placeholder}}
                    AND coalesce(serieresultat.til_og_med, '9999-01-01') >= {{placeholder}}
                    AND serieresultat.klubb_id = klubb.klubb_id
            ),
            rangerte_klubbresultater AS (
                SELECT 
                    *, 
                    ROW_NUMBER() OVER (
                        PARTITION BY øvelseskode, utøver_id
                        ORDER BY poeng DESC
                    ) AS rn
                FROM klubbresultater
            )
        SELECT poeng, øvelsesnavn, prestasjon, navn, fødselsår, sted, CAST(dato AS text)
        FROM rangerte_klubbresultater
        WHERE rn = 1
        ORDER BY poeng DESC, utøver_id, øvelseskode;
    ''', (serieår, klubbnavn, serieår, dato, dato))

def db_hent_9_nyeste_artikler(peker):
    return execute(peker, '''
        SELECT *
        FROM "nettside.artikler"
        ORDER BY publisert DESC
        LIMIT 9
        ;
    ''', ())
    
def db_hent_artikkel(peker, tittel):
    return execute(peker, '''
        SELECT *
        FROM "nettside.artikler"
        WHERE tittel = {placeholder}
        ;
    ''', (tittel,))[0]

def db_hent_forsinkede_stevner(peker, dato):
    return execute(peker, '''
        SELECT stevnetittel,
            arena,
            CAST(stevnedato AS text)
        FROM "uttrekk.stevneinvitasjoner"
        WHERE stevnedato < {placeholder}
            AND stevne_id IS NULL
            AND skal_vises
        ORDER BY stevnedato;
    ''', (dato,))
     
def db_hent_andel_rapporterte_stevner(peker, serieår, dato):
    return execute(peker, '''
        WITH stevner AS (
            SELECT true AS er_nasjonalt,
                stevnetittel AS stevnetittel,
                0 AS er_rapportert,
                stevnedato  
            FROM "uttrekk.stevneinvitasjoner"
            WHERE stevne_id IS NULL AND skal_vises
            UNION ALL
            SELECT COALESCE(er_nasjonalt, true) AS er_nasjonalt,
                stevnetittel AS stevntittel,
                1 AS er_rapportert,
                stevnedato  
            FROM "uttrekk.stevner"
        )
        SELECT COALESCE(SUM(er_rapportert),0) AS antall_stevne,
            COALESCE(COUNT(*) - SUM(er_rapportert),0) AS antall_forsinkede,
            COALESCE(100*SUM(er_rapportert)/COUNT(*), 100) AS prosent_stevne
        FROM stevner AS stevne
            JOIN "uttrekk.serier" AS serie ON (
                serie.fra_og_med <= stevne.stevnedato
                AND stevne.stevnedato <= serie.til_og_med  
            )
        WHERE serie.serieår = {placeholder}
            AND stevne.er_nasjonalt
            AND stevne.stevnedato < {placeholder}
        ;
    ''', (serieår, dato,))[0]

def db_hent_andel_gjennomførte_stevner(peker, serieår, dato):
    return execute(peker, '''
        WITH stevner AS (
            SELECT true AS er_nasjonalt,
                stevnetittel AS stevnetittel,
                stevnedato < {placeholder} AS er_avsluttet,
                stevnedato  
            FROM "uttrekk.stevneinvitasjoner"
            WHERE stevne_id IS NULL AND skal_vises
            UNION ALL
            SELECT COALESCE(er_nasjonalt, true) AS er_nasjonalt,
                stevnetittel AS stevntittel,
                true AS er_avsluttet,
                stevnedato  
            FROM "uttrekk.stevner"
        )
        SELECT COALESCE(SUM(CAST(er_avsluttet AS int)),0) AS antall_stevne,
            COALESCE(COUNT(*) - SUM(CAST(er_avsluttet AS int)),0) AS antall_forsinkede,
            COALESCE(100*SUM(CAST(er_avsluttet AS int))/COUNT(*), 100) AS prosent_stevne
        FROM stevner AS stevne
            JOIN "uttrekk.serier" AS serie ON (
                serie.fra_og_med <= stevne.stevnedato
                AND stevne.stevnedato <= serie.til_og_med  
            )
        WHERE serie.serieår = {placeholder}
            AND stevne.er_nasjonalt
        ;
    ''', (dato, serieår,))[0]

def db_hent_nye_resultater_siste_uke(peker, kjønn, dato):
    resultat = execute(peker, f'''
        SELECT siste_ukes.resultat_id
        FROM "uttrekk.{kjønn}_uttrekksresultater" AS siste_ukes
            LEFT JOIN "uttrekk.{kjønn}_uttrekksresultater" AS tidligere ON (
                tidligere.resultat_id = siste_ukes.resultat_id
                AND tidligere.fra_og_med < siste_ukes.fra_og_med
            )
        WHERE tidligere.resultat_id IS NULL
            AND siste_ukes.fra_og_med > {{placeholder}}
    ''', (dato-timedelta(7),))

    return [el[0] for el in resultat]

def db_hent_fjernede_resultater_siste_uke(peker, kjønn, dato, klubbnavn, lagnummer):
    resultat = execute(peker, f'''
        (SELECT serieresultat.resultat_id
        FROM (
                    SELECT resultat.resultat_id, utøver_id, klubb_id, poeng, øvelseskode, fra_og_med, til_og_med
                    FROM "tildeling.{kjønn}_serieresultater" AS serieresultat
                        JOIN "uttrekk.resultater" AS resultat ON (resultat.resultat_id = serieresultat.resultat_id)
                    WHERE {{placeholder}} BETWEEN fra_og_med AND coalesce(til_og_med, '9999-01-01')
                        AND klubb_id IS NOT NULL
                        AND poeng IS NOT NULL
                        
        ) serieresultat
            LEFT JOIN (
                    SELECT resultat.resultat_id, utøver_id, klubb_id, poeng, øvelseskode, fra_og_med, til_og_med
                    FROM "tildeling.{kjønn}_serieresultater" AS serieresultat
                        JOIN "uttrekk.resultater" AS resultat ON (resultat.resultat_id = serieresultat.resultat_id)
                    WHERE klubb_id IS NOT NULL
                        AND poeng IS NOT NULL
        ) tilsvarende_serieresultat ON (
            tilsvarende_serieresultat.øvelseskode = serieresultat.øvelseskode
            AND tilsvarende_serieresultat.utøver_id = serieresultat.utøver_id
            AND tilsvarende_serieresultat.klubb_id = serieresultat.klubb_id
            AND tilsvarende_serieresultat.poeng >= serieresultat.poeng
            AND {{placeholder}} between tilsvarende_serieresultat.fra_og_med and coalesce(tilsvarende_serieresultat.til_og_med, '9999-01-01')
        )        
        WHERE tilsvarende_serieresultat.resultat_id IS NULL)
        UNION
        (SELECT utøverresultat.resultat_id
         FROM "uttrekk.klubber" AS klubb 
            JOIN "serie.{kjønn}_lagresultater" AS lagresultat ON (
                lagresultat.klubb_id = klubb.klubb_id
                AND lagresultat.lagnummer < {{placeholder}}
                AND {{placeholder}} BETWEEN lagresultat.fra_og_med AND coalesce(lagresultat.til_og_med, '9999-01-01')
            )
            JOIN "uttrekk.resultater" AS resultat ON (resultat.resultat_id = lagresultat.resultat_id)
            JOIN "uttrekk.resultater" AS utøverresultat ON (resultat.utøver_id = utøverresultat.utøver_id)
         WHERE klubb.klubbnavn = {{placeholder}}
        )
        ;
    ''', (dato-timedelta(7), dato, lagnummer, dato, klubbnavn))

    return [el[0] for el in resultat]

def db_hent_stevnekalender(peker, serieår, uttrekksdato):
    resultat = execute(peker, '''
        WITH stevneinfo AS (
            (SELECT stevne.stevnetittel,
                stevne.arena,
                stevne.stevnedato,
                SUM(
                    CASE
                        WHEN kvinne_resultat.resultat_id IS NULL THEN 0
                        WHEN {placeholder} BETWEEN kvinne_resultat.fra_og_med AND coalesce(kvinne_resultat.til_og_med, '9999-01-01') THEN 1
                        ELSE 0
                    END + 
                    CASE
                        WHEN menn_resultat.resultat_id IS NULL THEN 0
                        WHEN {placeholder} BETWEEN menn_resultat.fra_og_med AND coalesce(menn_resultat.til_og_med, '9999-01-01') THEN 1
                        ELSE 0
                    END
                ) AS antall_resultater,
                true AS er_rapportert,
                (CASE WHEN stevneinvitasjon.stevne_id IS NULL THEN false ELSE true END) AS er_invitasjon  
            FROM "uttrekk.stevner" AS stevne
                LEFT JOIN "uttrekk.resultater" AS resultat ON (stevne.stevne_id = resultat.stevne_id)
                LEFT JOIN "uttrekk.kvinner_uttrekksresultater" AS kvinne_resultat ON (kvinne_resultat.resultat_id = resultat.resultat_id)
                LEFT JOIN "uttrekk.menn_uttrekksresultater" AS menn_resultat ON (
                       menn_resultat.resultat_id = resultat.resultat_id
                       AND greatest(kvinne_resultat.fra_og_med, menn_resultat.fra_og_med) <= least(kvinne_resultat.til_og_med, menn_resultat.til_og_med, '9999-01-01')
                )
                LEFT JOIN "uttrekk.stevneinvitasjoner" AS stevneinvitasjon ON (stevne.stevne_id = stevneinvitasjon.stevne_id)
            WHERE er_nasjonalt
            GROUP BY stevne.stevne_id,
                stevne.stevnetittel,
                stevne.arena,
                stevne.stevnedato,
                (CASE WHEN stevneinvitasjon.stevne_id IS NULL THEN false ELSE true END))
            UNION ALL
            (SELECT stevnetittel,
                arena,
                stevnedato,
                null AS antall_resultater,
                false AS er_rapportert,
                true AS er_invitasjon  
            FROM "uttrekk.stevneinvitasjoner"
            WHERE stevne_id IS NULL)
        )
        SELECT CAST(stevnedato AS text),
            stevnetittel,
            arena,
            antall_resultater,
            er_rapportert,
            er_invitasjon
        FROM stevneinfo AS stevne
            JOIN "uttrekk.serier" AS serie ON (stevnedato BETWEEN fra_og_med AND til_og_med)
        WHERE serie.serieår = {placeholder}
        ORDER BY stevnedato
        ;
    ''', (uttrekksdato, uttrekksdato, serieår,))

    grupperte_stevner = {}
    for stevnedato, stevnetittel, arena, antall_resultater, er_rapportert, er_invitasjon in resultat:
        måned = int(stevnedato.split("-")[1])-1
        if måned not in grupperte_stevner:
            grupperte_stevner[måned] = []
        grupperte_stevner[måned].append([stevnedato, stevnetittel, arena, antall_resultater, er_rapportert, er_invitasjon])

    return grupperte_stevner