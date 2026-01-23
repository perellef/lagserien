Feature: Utøver unntatt overbygning

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
    | Nordby IL |
    | Ski IL    |
    | --------- |

    Og følgende overklubber:
    
    | Serieår | Overklubb | Alder 11-14 | Alder 15-19 | Alder 20+ |
    | ------- | --------- | ----------- | ----------- | --------- |
    | 2100    | Ås IL     | Nei         | Ja          | Nei       |
    | ------- | --------- | ----------- | ----------- | --------- |

Scenario: Scenario: Regel 1. Et resultat flyttes ikke til overklubb hvis utøveren er unntatt overbygning. 

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og følgende utøvere unntatt overbygning:

    | Serieår | Utøver | Moderklubb |
    | ------- | ------ | ---------- |
    | 2100    | Per    | Nordby IL  |
    | ------- | ------ | ---------- |
    
    Og klubben Nordby IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende overbygninger:

    | Serieår | Moderklubb | Overklubb |
    | ------- | ---------- | --------- |
    | 2100    | Nordby IL  | Ås IL     |
    | ------- | ---------- | --------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp                                                |
    | -------- | ---------- | ---------- | --------- | ----------------------------------------------------- |
    | 1        | 2100.12.31 |            | Nordby IL | Innlastet. Ikke flyttet (utøver unntatt overbygning). |
    | -------- | ---------- | ---------- | --------- | ----------------------------------------------------- |

Scenario: Regel 2. Et resultat flyttes tilbake til moderklubb hvis utøver unntatt overbygning har resultat for overklubb. 

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og følgende utøvere unntatt overbygning:

    | Serieår | Utøver | Moderklubb |
    | ------- | ------ | ---------- |
    | 2100    | Per    | Nordby IL  |
    | ------- | ------ | ---------- |
    
    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende overbygninger:

    | Serieår | Moderklubb | Overklubb |
    | ------- | ---------- | --------- |
    | 2100    | Nordby IL  | Ås IL     |
    | ------- | ---------- | --------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp                                                  |
    | -------- | ---------- | ---------- | --------- | ------------------------------------------------------- |
    | 1        | 2100.12.31 |            | Nordby IL | Innlastet. Tilbakeflyttet (utøver unntatt overbygning). |
    | -------- | ---------- | ---------- | --------- | ------------------------------------------------------- |

Scenario: Regel 2.1. Et resultat flyttes ikke tilbake til moderklubb hvis utøver unntatt overbygning har resultat for klubb som ikke er moderklubbens overklubb. 

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og følgende utøvere unntatt overbygning:

    | Serieår | Utøver | Moderklubb |
    | ------- | ------ | ---------- |
    | 2100    | Per    | Nordby IL  |
    | ------- | ------ | ---------- |
    
    Og klubben Ski IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende overbygninger:

    | Serieår | Moderklubb | Overklubb |
    | ------- | ---------- | --------- |
    | 2100    | Nordby IL  | Ås IL     |
    | ------- | ---------- | --------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp     |
    | -------- | ---------- | ---------- | --------- | ---------- |
    | 1        | 2100.12.31 |            | Ski IL    | Innlastet. |
    | -------- | ---------- | ---------- | --------- | ---------- |
