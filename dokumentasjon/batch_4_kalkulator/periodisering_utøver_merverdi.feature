Feature: Periodisering utøver merverdi

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

Scenario: Regel 1. En utøver merverdi starter ny periode hvis utøver merverdien ikke finnes.
    
    Gitt ingen utøver merverdier
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal utøver merverdier bli:
    
    | Serieår | Klubb   | Utøver | Fra og med | Til og med | Poeng |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |
    | 2100    | Ås IL   | Per    | 2100.12.31 |            | 900   |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |

Scenario: Regel 2. En utøver merverdi beholder periode hvis utøver merverdien finnes.

    Gitt følgende utøver merverdier:
    
    | Serieår | Klubb   | Utøver | Fra og med | Til og med | Poeng |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |
    | 2100    | Ås IL   | Per    | 2100.01.01 |            | 900   |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal utøver merverdier bli:
    
    | Serieår | Klubb   | Utøver | Fra og med | Til og med | Poeng |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |
    | 2100    | Ås IL   | Per    | 2100.01.01 |            | 900   |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |

Scenario: Regel 3. En utøver merverdi avslutter gammel og starter ny periode hvis poengene endres.

    Gitt følgende utøver merverdier:
    
    | Serieår | Klubb   | Utøver | Fra og med | Til og med | Poeng |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |
    | 2100    | Ås IL   | Per    | 2100.01.01 |            | 1000  |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal utøver merverdier bli:
    
    | Serieår | Klubb   | Utøver | Fra og med | Til og med | Poeng |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |
    | 2100    | Ås IL   | Per    | 2100.01.01 | 2100.12.30 | 1000  |
    | 2100    | Ås IL   | Per    | 2100.12.31 |            | 900   |
    | ------- | ------- | ------ | ---------- | ---------- | ----- |