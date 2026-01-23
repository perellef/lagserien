Feature: Utdeling resultat

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |   
    
Scenario: Regel. Et resultat utdeles hvis resultatets dato overlapper serien.
    
    Gitt følgende stevner:
    
    | Sted             | Stevnedato |
    | ---------------- | ---------- |
    | Ås åpningsstevne | 2090.05.01 |
    | ---------------- | ---------- |

    Og følgende resultater:

    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende uttrekksresultater:
    
    | Resultat | Fra og med | Til og med | Klubb |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.05.01 |            | Ås IL |
    | -------- | ---------- | ---------- | ----- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            | Ås IL |
    | -------- | ---------- | ---------- | ----- |

Scenario: Et resultat utdeles ikke hvis resultatets dato ikke overlapper serien.
    
    Gitt følgende stevner:
    
    | Sted             | Stevnedato |
    | ---------------- | ---------- |
    | Ås åpningsstevne | 2100.05.01 |
    | ---------------- | ---------- |

    Og følgende resultater:

    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2090.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende uttrekksresultater:
    
    | Resultat | Fra og med | Til og med |
    | -------- | ---------- | ---------- |
    | 1        | 2100.01.01 |            |
    | -------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal ingen serieresultater finnes