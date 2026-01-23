Feature: Manuelle tider

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

Scenario: Regel 1. Et resultat med manuell tid fjernes hvis øvelsen kun tillater elektronisk

    Gitt følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 60m    | Løp             | 1                        | Ja                                |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per    | Ås åpningsstevne | 10.0       | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp                                                                 |
    | -------- | ---------- | ---------- | ----- | ---------------------------------------------------------------------- |
    | 1        | 2100.12.31 |            |       | Innlastet. Fjernet (manuell tid i øvelse som forutsetter elektronisk). |
    | -------- | ---------- | ---------- | ----- | ---------------------------------------------------------------------- |

Scenario: Et resultat fjernes ikke hvis det er elektronisk.

    Gitt følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 60m    | Løp             | 1                        | Ja                                |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |

Scenario: Et resultat fjernes ikke hvis øvelsen tillater elektronisk.

    Gitt følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 100m   | Løp             | 1                        | Nei                               |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per      | Ås åpningsstevne | 13.0       | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |