Feature: Klubb i seriekrets

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende klubber:

    | Klubbnavn |
    | --------- |
    | Ås IL     |
    | Klubb 2   |
    | Klubb 3   |
    | Klubb 4   |
    | Klubb 5   |
    | Klubb 6   |
    | Klubb 7   |
    | Klubb 8   |
    | Klubb 9   |
    | Klubb 10  |
    | Klubb 11  |
    | Klubb 12  |
    | Klubb 13  |
    | Klubb 14  |
    | Klubb 15  |
    | Klubb 16  |
    | Klubb 17  |
    | Klubb 18  |
    | Klubb 19  |
    | Klubb 20  |
    | --------- |

Scenario: Regel 1. Et resultat fjernes hvis kretsen innehas av færre enn 20 klubber

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende klubbkretser:
    
    | Klubb   | Fra og med | Til og med | Krets    |
    | ------- | ---------- | ---------- | -------- |
    | Ås IL   | 2021.01.01 |            | Akershus |
    | Klubb 2 | 2021.01.01 |            | Akershus |
    | Klubb 3 | 2021.01.01 |            | Akershus |
    | Klubb 4 | 2021.01.01 |            | Akershus |
    | Klubb 5 | 2021.01.01 |            | Akershus |
    | Klubb 6 | 2021.01.01 |            | Akershus |
    | ------- | ---------- | ---------- | -------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp                                                    |
    | -------- | ---------- | ---------- | ----- | --------------------------------------------------------- |
    | 1        | 2100.12.31 |            |       | Innlastet. Fjernet (resultatets klubb ikke i seriekrets). |
    | -------- | ---------- | ---------- | ----- | --------------------------------------------------------- |

Scenario: Et resultat fjernes ikke hvis kretsen innehas av minst 20 klubber

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende klubbkretser:
    
    | Klubb    | Fra og med | Til og med | Krets    |
    | -------- | ---------- | ---------- | -------- |
    | Ås IL    | 2021.01.01 |            | Akershus |
    | Klubb 2  | 2021.01.01 |            | Akershus |
    | Klubb 3  | 2021.01.01 |            | Akershus |
    | Klubb 4  | 2021.01.01 |            | Akershus |
    | Klubb 5  | 2021.01.01 |            | Akershus |
    | Klubb 6  | 2021.01.01 |            | Akershus |
    | Klubb 7  | 2021.01.01 |            | Akershus |
    | Klubb 8  | 2021.01.01 |            | Akershus |
    | Klubb 9  | 2021.01.01 |            | Akershus |
    | Klubb 10 | 2021.01.01 |            | Akershus |
    | Klubb 11 | 2021.01.01 |            | Akershus |
    | Klubb 12 | 2021.01.01 |            | Akershus |
    | Klubb 13 | 2021.01.01 |            | Akershus |
    | Klubb 14 | 2021.01.01 |            | Akershus |
    | Klubb 15 | 2021.01.01 |            | Akershus |
    | Klubb 16 | 2021.01.01 |            | Akershus |
    | Klubb 17 | 2021.01.01 |            | Akershus |
    | Klubb 18 | 2021.01.01 |            | Akershus |
    | Klubb 19 | 2021.01.01 |            | Akershus |
    | Klubb 20 | 2021.01.01 |            | Akershus |
    | -------- | ---------- | ---------- | -------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |
