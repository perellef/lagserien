Feature: Periodisering lagplassering

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |
    
    Og følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2100    | 3        | 4                    | 4              | 2                      | 2                | 2                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |

    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med | Til og med | Poeng | Klubb |
    | -------- | ---------- | ---------- | ----- | ----- |
    | 1        | 2100.01.01 |            | 900   | Ås IL |
    | -------- | ---------- | ---------- | ----- | ----- |

Scenario: Regel 1. En lagplassering starter ny periode hvis lagplasseringen ikke finnes.

    Gitt ingen lagplasseringer
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagplasseringer bli:
    
    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb  | Lagnummer |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |
    | 2100    | 3        | 1          | 2100.12.31 |            | Ås IL  | 1         |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |

Scenario: Regel 2. En lagplassering beholder periode hvis lagplasseringen finnes.

    Gitt følgende lag:

    | Serieår | Klubb | Lagnummer |
    | ------- | ----- | --------- |
    | 2100    | Ås IL | 1         |
    | ------- | ----- | --------- |
    
    Og følgende lagplasseringer:

    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb  | Lagnummer |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |
    | 2100    | 3        | 1          | 2100.01.01 |            | Ås IL  | 1         |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagplasseringer bli:
    
    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb  | Lagnummer |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |
    | 2100    | 3        | 1          | 2100.01.01 |            | Ås IL  | 1         |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |

Scenario: Regel 3. En lagplassering avslutter gammel og starter ny periode hvis laget er endret.
    
    Gitt følgende lag:

    | Serieår | Klubb | Lagnummer |
    | ------- | ----- | --------- |
    | 2100    | Ås IL | 1         |
    | ------- | ----- | --------- |
    
    Og følgende lagplasseringer:

    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb   | Lagnummer   |
    | ------- | -------- | ---------- | ---------- | ---------- | ------- | ----------- |
    | 2100    | 3        | 1          | 2100.01.01 |            | <Klubb> | <Lagnummer> |
    | ------- | -------- | ---------- | ---------- | ---------- | ------- | ----------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagplasseringer bli:
    
    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb   | Lagnummer   |
    | ------- | -------- | ---------- | ---------- | ---------- | ------- | ----------- |
    | 2100    | 3        | 1          | 2100.01.01 | 2100.12.30 | <Klubb> | <Lagnummer> |
    | 2100    | 3        | 1          | 2100.12.31 |            | Ås IL   | 1           |
    | ------- | -------- | ---------- | ---------- | ---------- | ------- | ----------- |

    Eksempler:

    | <Klubb> | <Lagnummer> |
    | Ski IL  | 1           |
    | Ås IL   | 2           |
    | Ski IL  | 3           |