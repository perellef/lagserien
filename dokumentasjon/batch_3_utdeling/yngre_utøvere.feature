Feature: Yngre utøvere

Scenario: Regel 1. Et resultat fjernes hvis utøveren var i en aldersgruppe yngre enn 11 år

    Gitt følgende serier:
    
    | Serieår   | Fra og med | Til og med |
    | --------- | ---------- | ---------- |
    | <Serieår> | 2100.01.01 | 2200.12.31 |
    | --------- | ---------- | ---------- |

    Og følgende utøvere:

    | Navn | Fødselsår   |
    | ---- | ----------- |
    | Per  | <Fødselsår> |
    | ---- | ----------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2200.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato              |
    | ----------- | ------ | ------ | ---------------- | ---------- | ----------------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | <Konkurransedato> |
    | ----------- | ------ | ------ | ---------------- | ---------- | ----------------- |

    Når utdelingsbatch kjøres med serieår <Serieår> og uttrekksdato 2200.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp                                                         |
    | -------- | ---------- | ---------- | ----- | -------------------------------------------------------------- |
    | 1        | 2200.12.31 |            |       | Innlastet. Fjernet (utøver under seriens 11-års aldersgrense). |
    | -------- | ---------- | ---------- | ----- | -------------------------------------------------------------- |

    Eksempler:

    | <Fødselsår> | <Konkurransedato> | <Serieår> |
    | 2095        | 2100.01.01        | 2100      |
    | 2090        | 2100.01.01        | 2200      |

Scenario: Et resultat fjernes ikke dersom utøverens fødselsår er ukjent.
    
    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  |           |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | 2100.01.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |

Scenario: Et resultat fjernes ikke dersom utøveren var i en aldersgruppe eldre enn 11 år

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende utøvere:

    | Navn | Fødselsår   |
    | ---- | ----------- |
    | Per  | <Fødselsår> |
    | ---- | ----------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato              |
    | ----------- | ------ | ------ | ---------------- | ---------- | ----------------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | <Konkurransedato> |
    | ----------- | ------ | ------ | ---------------- | ---------- | ----------------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |

    Eksempler:

    | <Fødselsår> | <Konkurransedato> |
    | 2089        | 2100.01.01        |
    | 2088        | 2100.01.01        |
    |             | 2100.01.01        |
