Feature: Mellomtider

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

Scenario: Regel 1. Et resultat fjernes hvis det er mellomtid til et serieresultat med samme utøver og stevne

    Gitt følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 100m   | Løp             | 1                        | Nei                               |
    | 2100    | 200m   | Løp             | 2                        | Nei                               |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00+     | 2100.05.01 |
    | 2           | 200m   | Per    | Ås åpningsstevne | 27.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp                                            |
    | -------- | ---------- | ---------- | ----- | ------------------------------------------------- |
    | 1        | 2100.12.31 |            |       | Innlastet. Fjernet (mellomtid til serieresultat). |
    | 2        | 2100.12.31 |            | Ås IL | Innlastet.                                        |
    | -------- | ---------- | ---------- | ----- | ------------------------------------------------- |

Scenario: Regel 2.1. Et resultat fjernes ikke hvis det er mellomtid til et serieresultat i en annen mellomtidgruppe

    Gitt følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 100m   | Løp             | 1                        | Nei                               |
    | 2100    | 200mh  | Hekk            | 2                        | Nei                               |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00+     | 2100.05.01 |
    | 2           | 200mh  | Per    | Ås åpningsstevne | 27.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | 2        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |
    
Scenario: Regel 2.2. Et resultat fjernes ikke hvis det er mellomtid til et serieresultat med høyere prioritet i mellomtidgruppen

    Gitt følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 100m   | Løp             | 1                        | Nei                               |
    | 2100    | 200m   | Løp             | 2                        | Nei                               |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | 2           | 200m   | Per    | Ås åpningsstevne | 27.00+     | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | 2        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |

Scenario: Et resultat fjernes ikke hvis det ikke er et mellomtidresultat.

    Gitt følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 100m   | Løp             | 1                        | Nei                               |
    | 2100    | 200m   | Løp             | 2                        | Nei                               |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | 2           | 200m   | Per    | Ås åpningsstevne | 27.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | 2        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |

Scenario: Et resultat fjernes ikke hvis det er mellomtid, men ikke til et serieresultat med samme utøver og stevne.

    Gitt følgende øvelsesregler:

    | Serieår | Øvelse | Mellomtidgruppe | Mellomtidgruppe distanse | Forutsetter elektronisk tidtaking |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |
    | 2100    | 100m   | Løp             | 1                        | Nei                               |
    | 2100    | 200m   | Løp             | 2                        | Nei                               |
    | ------- | ------ | --------------- | ------------------------ | --------------------------------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per      | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | 2           | 200m   | <Utøver> | <Stevne>         | 27.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | 2        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |

    Eksempler:

    | <Utøver> | <Stevne>       |
    | Per      | Bislett Games  |
    | Odd      | Ås stadion     |