Feature: Klubber unntatt overbygning

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
    | --------- |

    Og følgende overklubber:
    
    | Serieår | Overklubb | Alder 11-14 | Alder 15-19 | Alder 20+ |
    | ------- | --------- | ----------- | ----------- | --------- |
    | 2100    | Ås IL     | Nei         | Ja          | Nei       |
    | ------- | --------- | ----------- | ----------- | --------- |

Scenario: Regel 1. Et resultat flyttes til moderklubb fra overklubb, hvis moderklubben er unntatt overbygning og utøver har resultater for moderklubb.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Nordby IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 2           | 100m   | Per      | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende klubber unntatt overbygning:

    | Serieår | Moderklubb | Overklubb |
    | ------- | ---------- | --------- |
    | 2100    | Nordby IL  | Ås IL     |
    | ------- | ---------- | --------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp                                                 |
    | -------- | ---------- | ---------- | --------- | ------------------------------------------------------ |
    | 1        | 2100.12.31 |            | Nordby IL | Innlastet.                                             |
    | 2        | 2100.12.31 |            | Nordby IL | Innlastet. Tilbakeflyttet (klubb unntatt overbygning). |
    | -------- | ---------- | ---------- | --------- | ------------------------------------------------------ |

Scenario: Regel 2.1. Et resultat flyttes ikke tilbake til moderklubb fra overklubb hvis utøver ikke har resultater for moderklubb.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per      | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende klubber unntatt overbygning:

    | Serieår | Moderklubb | Overklubb |
    | ------- | ---------- | --------- |
    | 2100    | Nordby IL  | Ås IL     |
    | ------- | ---------- | --------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |

Scenario: Regel 2.2. Et resultat flyttes ikke tilbake til moderklubb fra overklubb hvis utøveren er i en annen aldersgruppe enn overbygningen. 

    Gitt følgende utøvere:

    | Navn | Fødselsår   |
    | ---- | ----------- |
    | Per  | <Fødselsår> |
    | ---- | ----------- |

    Og klubben Nordby IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 2           | 100m   | Per      | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende klubber unntatt overbygning:

    | Serieår | Moderklubb | Overklubb |
    | ------- | ---------- | --------- |
    | 2100    | Nordby IL  | Ås IL     |
    | ------- | ---------- | --------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp     |
    | -------- | ---------- | ---------- | --------- | ---------- |
    | 1        | 2100.12.31 |            | Nordby IL | Innlastet. |
    | 2        | 2100.12.31 |            | Ås IL     | Innlastet. |
    | -------- | ---------- | ---------- | --------- | ---------- |

    Eksempler:

    | <Fødselsår> |
    | 2050        |
    |             |
    | 2080        |
    | 2086        |

Scenario: Regel 2.3. Et resultat flyttes ikke tilbake til moderklubb fra overklubb hvis utøver ikke har resultater for moderklubb.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per      | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og klubben Nordby IL med ingen uttrekksresultater fra 2100.12.31

    Og følgende klubber unntatt overbygning:

    | Serieår | Moderklubb | Overklubb |
    | ------- | ---------- | --------- |
    | 2100    | Nordby IL  | Ås IL     |
    | ------- | ---------- | --------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb | Forløp     |
    | -------- | ---------- | ---------- | ----- | ---------- |
    | 1        | 2100.12.31 |            | Ås IL | Innlastet. |
    | -------- | ---------- | ---------- | ----- | ---------- |

Scenario: Regel 2.3.1. Et resultat flyttes tilbake til moderklubb fra overklubb hvis utøver har resultat for moderklubb etter resultatbytte.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per      | Ås åpningsstevne | 13.00      | 2100.05.01 |
    | 2           | 200m   | Per      | Ås åpningsstevne | 26.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og klubben Nordby IL med ingen uttrekksresultater fra 2100.12.31

    Og følgende klubber unntatt overbygning:

    | Serieår | Moderklubb | Overklubb |
    | ------- | ---------- | --------- |
    | 2100    | Nordby IL  | Ås IL     |
    | ------- | ---------- | --------- |

    Og følgende resultatbytter:
    
    | Statistikk resultat id | Klubb     | Registrert          |
    | ---------------------- | --------- | ------------------- |
    | 1                      | Nordby IL | 2100.01.01T00:00:00 |
    | ---------------------- | --------- | ------------------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp                                                 |
    | -------- | ---------- | ---------- | --------- | ------------------------------------------------------ |
    | 1        | 2100.12.31 |            | Nordby IL | Innlastet. Manuelt satt til Nordby IL.                 |
    | 2        | 2100.12.31 |            | Nordby IL | Innlastet. Tilbakeflyttet (klubb unntatt overbygning). |
    | -------- | ---------- | ---------- | --------- | ------------------------------------------------------ |