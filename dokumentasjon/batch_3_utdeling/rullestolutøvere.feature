Feature: Rullestolutøvere

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

Scenario: Regel 1. Et resultat fjernes hvis utøveren er en rullestolutøver

    Gitt følgende rullestolutøvere:

    | Serieår | Utøver |
    | ------- | ------ |
    | 2100    | Per    |
    | ------- | ------ |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp                                            |
    | -------- | ---------- | ---------- | ----- | ------------------------------------------------- |
    | 1        | 2100.12.31 |            |       | Innlastet. Fjernet (resultat av rullestolutøver). |
    | -------- | ---------- | ---------- | ----- | ------------------------------------------------- |

Scenario: Et resultat fjernes ikke dersom utøver ikke er rullestolutøver.

    Gitt ingen rullestolutøvere

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |