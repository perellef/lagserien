Feature: Lagplassering

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |
    
    Og følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2100    | 1        | 10                   | 10             | 4                      | 4                | 5                          |
    | 2100    | 2        | 10                   | 10             | 4                      | 4                | 5                          |
    | 2100    | 3        | 10                   | 10             | 4                      | 4                | 5                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |

    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | 2100    | 200m   | Ja              | Nei        | 2         |
    | 2100    | Kule   | Ja              | Ja         | 3         |
    | 2100    | Spyd   | Ja              | Ja         | 4         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og følgende klubber:

    | Klubbnavn |
    | --------- |
    | Ås IL     |
    | Ski IL    |
    | --------- |

Scenario: Regel 1. Topplag plasseres i sin respektive divisjon.

    Gitt følgende topplag:
    
    | Serieår | Klubb  | Lagnummer | Divisjon |
    | ------- | ------ | --------- | -------- |
    | 2100    | Ås IL  | 1         | 1        |
    | 2100    | Ski IL | 1         | 2        |
    | ------- | ------ | --------- | -------- |
    
    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 500   | 100m   | Per    | Ås kretsstevne | 11.00      | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Og klubben Ski IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 2           | 500   | Kule   | Ole    | Ski kaststevne | 11.00      | 2100.08.11 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagplasseringer bli:

    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb  | Lagnummer |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |
    | 2100    | 1        | 1          | 2100.12.31 |            | Ås IL  | 1         |
    | 2100    | 2        | 1          | 2100.12.31 |            | Ski IL | 1         |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |

Scenario: Regel 1.2. Øvrige lag plasseres i 3. divisjon.

    Gitt ingen topplag
    
    Og klubben Nordby IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 500   | 100m   | Bob    | Ås kretsstevne | 12.00      | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagplasseringer bli:

    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb      | Lagnummer |
    | ------- | -------- | ---------- | ---------- | ---------- | ---------- | --------- |
    | 2100    | 3        | 1          | 2100.12.31 |            | Nordby IL  | 1         |
    | ------- | -------- | ---------- | ---------- | ---------- | ---------- | --------- |

Scenario: Regel 2. Lag plasseres i divisjonens tabell etter seriepoeng

    Gitt klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 500   | 100m   | Bob    | Ås kretsstevne | 12.00      | 2100.06.20 |
    | 2           | 400   | 200m   | Tom    | Ås kretsstevne | 25.00      | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Og klubben Ski IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 3           | 200   | Kule   | Per    | Ski kaststevne | 5.00       | 2100.08.11 |
    | 4           | 100   | Spyd   | Ole    | Ski kaststevne | 20.00      | 2100.08.11 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagplasseringer bli:

    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb  | Lagnummer |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |
    | 2100    | 3        | 1          | 2100.12.31 |            | Ås IL  | 1         |
    | 2100    | 3        | 2          | 2100.12.31 |            | Ski IL | 1         |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |

Scenario: Regel 2.1. Ved lik seriepoeng plasseres lag etter beste enkeltpoenger.

    Gitt klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 500   | 100m   | Bob    | Ås kretsstevne | 12.00      | 2100.06.20 |
    | 2           | 300   | 200m   | Tom    | Ås kretsstevne | 26.00      | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Og klubben Ski IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 3           | 400   | Kule   | Per    | Ski kaststevne | 10.00      | 2100.08.11 |
    | 4           | 400   | Spyd   | Ole    | Ski kaststevne | 40.00      | 2100.08.11 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagplasseringer bli:

    | Serieår | Divisjon | Plassering | Fra og med | Til og med | Klubb  | Lagnummer |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |
    | 2100    | 3        | 1          | 2100.12.31 |            | Ås IL  | 1         |
    | 2100    | 3        | 2          | 2100.12.31 |            | Ski IL | 1         |
    | ------- | -------- | ---------- | ---------- | ---------- | ------ | --------- |