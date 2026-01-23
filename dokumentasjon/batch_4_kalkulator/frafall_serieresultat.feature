Feature: Frafall av serieresultat

Bakgrunn:

    Gitt følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2100    | 3        | 10                   | 10             | 4                      | 4                | 5                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |

Scenario: Regel 1. Et serieresultat frafaller hvis det ikke overlapper uttrekksdato.

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- |   

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med   | Til og med   | Poeng | Klubb |
    | -------- | ------------ | ------------ | ----- | ----- |
    | 1        | <Fra og med> | <Til og med> | 900   | Ås IL |
    | -------- | ------------ | ------------ | ----- | ----- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.05.01

    Så skal ingen lag finnes
    
    Eksempler:

    | <Fra og med> | <Til og med> |
    | 2100.05.02   |              |
    | 2100.01.01   | 2100.04.30   |

Scenario: Regel 2. Et serieresultat frafaller hvis resultatets dato ikke overlapper serien.

    Gitt følgende serier:
    
    | Serieår | Fra og med   | Til og med   |
    | ------- | ------------ | ------------ |
    | 2100    | <Fra og med> | <Til og med> |
    | ------- | ------------ | ------------ |   

    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | <Dato>     |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med   | Til og med   | Poeng | Klubb |
    | -------- | ------------ | ------------ | ----- | ----- |
    | 1        | 2100.05.01   |              | 900   | Ås IL |
    | -------- | ------------ | ------------ | ----- | ----- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal ingen lag finnes

    Eksempler:

    | <Fra og med> | <Til og med> | <Dato>     |
    | 2100.01.01   | 2100.12.31   | 2222.05.01 |
    | 2100.01.01   | 2100.12.31   | 2099.12.31 |
    | 2100.01.01   | 2100.12.31   | 2101.01.01 |
    | 2100.02.10   | 2100.12.31   | 2100.01.01 |

Scenario: Regel 3. Et serieresultat frafaller hvis det ikke tilhører noen klubb.

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |   

    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med   | Til og med   | Poeng | Klubb |
    | -------- | ------------ | ------------ | ----- | ----- |
    | 1        | 2100.05.01   |              | 900   |       |
    | -------- | ------------ | ------------ | ----- | ----- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal ingen lag finnes

Scenario: Regel 4. Et serieresultat frafaller hvis øvelsen ikke benyttes i serien.  
    
    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |   

    Og ingen serieøvelser

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med   | Til og med   | Poeng | Klubb |
    | -------- | ------------ | ------------ | ----- | ----- |
    | 1        | 2100.05.01   |              | 900   | Ås IL |
    | -------- | ------------ | ------------ | ----- | ----- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal ingen lag finnes

Scenario: Regel 5. Et serieresultat frafaller hvis poengene er ukjent.  
    
    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |   
    
    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- | 

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med   | Til og med   | Poeng | Klubb |
    | -------- | ------------ | ------------ | ----- | ----- |
    | 1        | 2100.05.01   |              |       | Ås IL |
    | -------- | ------------ | ------------ | ----- | ----- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal ingen lag finnes

Scenario: Et serieresultat frafaller ikke hvis det unnviker regel 1-5.
 
    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- |  

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med   | Til og med   | Poeng | Klubb |
    | -------- | ------------ | ------------ | ----- | ----- |
    | 1        | 2100.05.01   |              | 900   | Ås IL |
    | -------- | ------------ | ------------ | ----- | ----- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat | Oppstillingstype |
    | -------- | ---------------- |
    | 1        | OBLIGATORISK     |
    | -------- | ---------------- |

