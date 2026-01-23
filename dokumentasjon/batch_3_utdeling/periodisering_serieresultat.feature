Feature: Periodisering serieresultat

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende uttrekksresultater:

    | Resultat | Fra og med | Til og med | Klubb |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.01.01 |            | Ås IL |
    | -------- | ---------- | ---------- | ----- |

Scenario: Regel 1. Et serieresultat starter ny periode hvis serieresultatet ikke finnes.

    Gitt ingen serieresultater
    
    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:
    
    | Resultat | Fra og med | Til og med | Klubb |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            | Ås IL |
    | -------- | ---------- | ---------- | ----- |

Scenario: Regel 2. Et serieresultat beholder periode hvis serieresultatet finnes.
    
    Gitt følgende serieresultater:
    
    | Resultat | Fra og med | Til og med | Klubb |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.01.01 |            | Ås IL |
    | -------- | ---------- | ---------- | ----- |
    
    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:
    
    | Resultat | Fra og med | Til og med | Klubb |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.01.01 |            | Ås IL |
    | -------- | ---------- | ---------- | ----- |

Scenario: Regel 3. Et serieresultat avslutter gammel og starter ny periode hvis serieresultatet har ny klubb.

    Gitt følgende serieresultater:
    
    | Resultat | Fra og med | Til og med | Klubb  |
    | -------- | ---------- | ---------- | ------ |
    | 1        | 2100.01.01 |            | Ski IL |
    | -------- | ---------- | ---------- | ------ |
    
    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:
    
    | Resultat | Fra og med | Til og med | Klubb  |
    | -------- | ---------- | ---------- | ------ |
    | 1        | 2100.01.01 | 2100.12.30 | Ski IL |
    | 1        | 2100.12.31 |            | Ås IL  |
    | -------- | ---------- | ---------- | ------ |

Scenario: Regel 4. Et serieresultat fra tidligere serieår blir ikke avsluttet selv om den ikke finnes.

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2099    | 2099.01.01 | 2099.12.31 |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 2           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2099.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:
    
    | Resultat | Fra og med | Til og med | Klubb  |
    | -------- | ---------- | ---------- | ------ |
    | 2        | 2099.05.01 |            | Ås IL  |
    | -------- | ---------- | ---------- | ------ |
    
    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:
    
    | Resultat | Fra og med | Til og med | Klubb |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            | Ås IL |
    | 2        | 2099.05.01 |            | Ås IL |
    | -------- | ---------- | ---------- | ----- |