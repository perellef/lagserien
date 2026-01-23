Feature: Reduserte klubbresultater

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

Scenario: Regel 1. En klubb beholder kun resultatet med høyest poeng per utøver og øvelse.

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Prestasjon | Utøver | Stevne           | Dato       |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |
    | 1           | 100    | 11.00      | Per    | Ås åpningsstevne | 2100.05.01 |
    | 2           | 100    | 12.00      | Per    | Ås åpningsstevne | 2100.05.01 |
    | 3           | 100    | 13.00      | Ole    | Ås åpningsstevne | 2100.05.01 |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Poeng |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            | 841   |
    | 3        | 2100.12.31 |            | 420   |
    | -------- | ---------- | ---------- | ----- |

Scenario: Regel 2. Ulike klubber kan ha hvert sitt resultat i samme øvelse av en og samme utøver. 

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Prestasjon | Utøver | Stevne           | Dato       |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |
    | 1           | 100    | 11.00      | Per    | Ås åpningsstevne | 2100.05.01 |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |

    Og klubben Nordby IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Prestasjon | Utøver | Stevne            | Dato       |
    | ----------- | ------ | ---------- | ------ | ----------------- | ---------- |
    | 2           | 100    | 11.00      | Per    | Oslo sommerstevne | 2100.05.01 |
    | ----------- | ------ | ---------- | ------ | ----------------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Poeng | Klubb     |
    | -------- | ---------- | ---------- | ----- | --------- |
    | 1        | 2100.12.31 |            | 841   | Ås IL     |
    | 2        | 2100.12.31 |            | 841   | Nordby IL |
    | -------- | ---------- | ---------- | ----- | --------- |

Scenario: Regel 3. Resultater med 0 poeng fjernes.

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Prestasjon | Utøver | Stevne           | Dato       |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |
    | 1           | 100    | 20.00      | Per    | Ås åpningsstevne | 2100.05.01 |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal ingen serieresultater finnes

Scenario: Regel 4. Et resultat med ukjent poeng skal tas med uavhengig av Regel 1.

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Prestasjon | Utøver | Stevne           | Dato       |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |
    | 1           | 100    | 11.00      | Per    | Ås åpningsstevne | 2100.05.01 |
    | 2           | 100    | abcd       | Per    | Ås åpningsstevne | 2100.05.01 |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Poeng |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            | 841   |
    | 2        | 2100.12.31 |            |       |
    | -------- | ---------- | ---------- | ----- |