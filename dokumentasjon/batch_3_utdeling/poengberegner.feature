Feature: Poengberegner

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 100    |                 |                          | Nei                               |
    | 2100    | 3000   |                 |                          | Nei                               |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

Scenario: Poengberegner ser bort i fra suffiks for å indikere mellomtid og miksløp

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Prestasjon | Utøver | Stevne           | Dato       |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |
    | 1           | 3000   | 9.30.00+   | Per    | Ås åpningsstevne | 2100.05.01 |
    | 2           | 3000   | 9.40.00mx  | Ole    | Ås åpningsstevne | 2100.05.01 |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Poeng |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            | 582   |
    | 2        | 2100.12.31 |            | 550   |
    | -------- | ---------- | ---------- | ----- |

Scenario: Poengberegner legger til 0.14 eller 0.24 sekunder på manuelle sprint- og hekkeresultater

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Prestasjon | Utøver | Stevne           | Dato       |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |
    | 1           | 100    | 13.0       | Per    | Ås åpningsstevne | 2100.05.01 |
    | ----------- | ------ | ---------- | ------ | ---------------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Poeng |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            | 380   |
    | -------- | ---------- | ---------- | ----- |

Scenario: Poengberegner gir ukjent hvis resultatet ikke kunne tolkes

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Prestasjon   | Utøver | Stevne           | Dato       |
    | ----------- | ------ | ------------ | ------ | ---------------- | ---------- |
    | 1           | 100    | <Prestasjon> | Per    | Ås åpningsstevne | 2100.05.01 |
    | ----------- | ------ | ------------ | ------ | ---------------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Poeng |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            |       |
    | -------- | ---------- | ---------- | ----- |
    
    Eksempler:

    | <Prestasjon> |
    | ´11,40       |
    | 13,,2        |
    | 11, 21       |
    | 12,74A       |

Scenario: Poengberegner gir ukjent hvis resultat overstiger øverste poenggrense

    Gitt klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse   | Prestasjon   | Utøver | Stevne           | Dato       |
    | ----------- | -------- | ------------ | ------ | ---------------- | ---------- |
    | 1           | <Øvelse> | <Prestasjon> | Per    | Ås åpningsstevne | 2100.05.01 |
    | ----------- | -------- | ------------ | ------ | ---------------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Poeng |
    | -------- | ---------- | ---------- | ----- |
    | 1        | 2100.12.31 |            |       |
    | -------- | ---------- | ---------- | ----- |
    
    Eksempler:

    | <Øvelse> | <Prestasjon> |
    | 100      | 9.44         |
    | høyde    | 85           |
    | lengde   | 414          |
