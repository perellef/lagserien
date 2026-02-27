Feature: Spesielle beregningstilfeller

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |
    
    Og følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2100    | 1        | 3                    | 3              | 2                      | 2                | 2                          |
    | 2100    | 2        | 3                    | 3              | 2                      | 2                | 2                          |
    | 2100    | 3        | 3                    | 3              | 2                      | 2                | 2                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |

Scenario: Tilfelle: Det er kun tekniske resultater.

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | stav   | Ja              | Ja         | 1         |
    | 2100    | kule   | Ja              | Ja         | 2         |
    | 2100    | spyd   | Ja              | Ja         | 3         |
    | ------- | ------ | --------------- | ---------- | --------- |
    
    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | spyd   | Per    | Kaststevne     | 50.00      | 2100.06.20 |
    | 2           | 700   | kule   | Per    | Kaststevne     | 12.00      | 2100.06.20 |
    | 3           | 600   | kule   | Tom    | Kaststevne     | 11.00      | 2100.06.20 |
    | 4           | 500   | spyd   | Tom    | Kaststevne     | 45.00      | 2100.06.20 |
    | 5           | 400   | stav   | Odd    | Kaststevne     | 3.00       | 2100.06.20 |
    | 6           | 300   | spyd   | Odd    | Kaststevne     | 40.00      | 2100.06.20 |
    | 7           | 200   | kule   | Are    | Kaststevne     | 8.00       | 2100.06.20 |
    | 8           | 100   | kule   | Are    | Kaststevne     | 7.00       | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 5          | OBLIGATORISK     |
    | 2          | OBLIGATORISK     |
    | 1          | OBLIGATORISK     |
    | 3          | VALGFRI          |
    | 4          | VALGFRI          |
    | 6          | VALGFRI          |
    | ---------- | ---------------- |

Scenario: Tilfelle: Utøver med sterke løpsresultater har viktigere teknisk resultat 

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100    | Ja              | Nei        | 1         |
    | 2100    | 200    | Ja              | Nei        | 2         |
    | 2100    | 400    | Ja              | Nei        | 3         |
    | 2100    | 800    | Ja              | Nei        | 4         |
    | 2100    | stav   | Ja              | Ja         | 5         |
    | 2100    | kule   | Ja              | Ja         | 6         |
    | 2100    | spyd   | Ja              | Ja         | 7         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 100    | Per    | Løpsstevne     | 11.00      | 2100.06.20 |
    | 2           | 750   | 400    | Tom    | Løpsstevne     | 50.00      | 2100.06.20 |
    | 3           | 700   | spyd   | Tom    | Kaststevne     | 50.00      | 2100.06.20 |
    | 4           | 650   | 200    | Per    | Løpsstevne     | 25.00      | 2100.06.20 |
    | 5           | 600   | 200    | Per    | Løpsstevne     | 26.00      | 2100.06.20 |
    | 6           | 550   | 800    | Are    | Løpsstevne     | 2.05.00    | 2100.06.20 |
    | 7           | 500   | 400    | Per    | Løpsstevne     | 55.000     | 2100.06.20 |
    | 8           | 450   | 800    | Odd    | Løpsstevne     | 2.10.00    | 2100.06.20 |
    | 9           | 400   | stav   | Per    | Hoppstevne     | 3.00       | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 1          | OBLIGATORISK     |
    | 2          | OBLIGATORISK     |
    | 3          | OBLIGATORISK     |
    | 6          | VALGFRI          |
    | 8          | VALGFRI          |
    | 9          | VALGFRI          |
    | ---------- | ---------------- |

Scenario: Tilfelle: Utøver har kun ikke-obligatoriske resultater.

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 3000   | Nei             | Nei        | 1         |
    | 2100    | 200h   | Nei             | Nei        | 2         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 3000   | Per    | Løpsstevne     | 10.00.00   | 2100.06.20 |
    | 2           | 700   | 200h   | Per    | Løpsstevne     | 30.00      | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 1          | VALGFRI          |
    | 2          | VALGFRI          |
    | ---------- | ---------------- |

Scenario: Tilfelle: Utøver har bedre ikke-obligatoriske resultater.

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100    | Ja              | Nei        | 1         |
    | 2100    | 200    | Ja              | Nei        | 2         |
    | 2100    | 3000   | Nei             | Nei        | 3         |
    | 2100    | 200h   | Nei             | Nei        | 4         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 3000   | Per    | Løpsstevne     | 10.00.00   | 2100.06.20 |
    | 2           | 700   | 200h   | Per    | Løpsstevne     | 30.00      | 2100.06.20 |
    | 3           | 600   | 100    | Per    | Løpsstevne     | 12.00      | 2100.06.20 |
    | 4           | 500   | 200    | Per    | Løpsstevne     | 25.00      | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 1          | VALGFRI          |
    | 2          | VALGFRI          |
    | ---------- | ---------------- |

Scenario: Tilfelle: Teknisk resultat må nedfalle.

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100    | Ja              | Nei        | 1         |
    | 2100    | 200    | Ja              | Nei        | 2         |
    | 2100    | 400    | Ja              | Nei        | 3         |
    | 2100    | 800    | Ja              | Nei        | 4         |
    | 2100    | stav   | Ja              | Ja         | 5         |
    | 2100    | kule   | Ja              | Ja         | 6         |
    | 2100    | spyd   | Ja              | Ja         | 7         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | spyd   | Per    | Løpsstevne     | 50.00      | 2100.06.20 |
    | 2           | 700   | stav   | Per    | Løpsstevne     | 4.00       | 2100.06.20 |
    | 3           | 600   | 100    | Odd    | Løpsstevne     | 12.00      | 2100.06.20 |
    | 4           | 500   | 100    | Are    | Løpsstevne     | 13.00      | 2100.06.20 |
    | 5           | 400   | 100    | Tom    | Løpsstevne     | 14.00      | 2100.06.20 |
    | 6           | 300   | 200    | Tom    | Løpsstevne     | 25.00      | 2100.06.20 |
    | 7           | 200   | kule   | Are    | Løpsstevne     | 10.00      | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 3          | OBLIGATORISK     |
    | 6          | OBLIGATORISK     |
    | 1          | OBLIGATORISK     |
    | 2          | VALGFRI          |
    | 4          | VALGFRI          |
    | 5          | VALGFRI          |
    | ---------- | ---------------- |

Scenario: Tilfelle: Teknisk resultat nedfaller selv om erstattende resultat er for svak for valgfri.
    
    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100    | Ja              | Nei        | 1         |
    | 2100    | 200    | Ja              | Nei        | 2         |
    | 2100    | 400    | Ja              | Nei        | 3         |
    | 2100    | 800    | Ja              | Nei        | 4         |
    | 2100    | stav   | Ja              | Ja         | 5         |
    | 2100    | kule   | Ja              | Ja         | 6         |
    | 2100    | spyd   | Ja              | Ja         | 7         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver   | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | -------- | -------------- | ---------- | ---------- |
    | 1           | 800   | spyd   | Per      | Løpsstevne     | 50.00      | 2100.06.20 |
    | 2           | 700   | stav   | Per      | Løpsstevne     | 4.00       | 2100.06.20 |
    | 3           | 600   | 100    | Odd      | Løpsstevne     | 12.00      | 2100.06.20 |
    | 4           | 500   | 100    | Ole      | Løpsstevne     | 13.00      | 2100.06.20 |
    | 5           | 400   | 100    | Pål      | Løpsstevne     | 14.00      | 2100.06.20 |
    | 6           | 300   | 100    | Are      | Løpsstevne     | 14.00      | 2100.06.20 |
    | 7           | 200   | 400    | Tom      | Løpsstevne     | 1.00.00    | 2100.06.20 |
    | 8           | 100   | kule   | Are      | Løpsstevne     | 5.00       | 2100.06.20 |
    | ----------- | ----- | ------ | -------- | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat         | Oppstillingstype |
    | ---------------- | ---------------- |
    | 3                | OBLIGATORISK     |
    | 7                | OBLIGATORISK     |
    | 1                | OBLIGATORISK     |
    | 2                | VALGFRI          |
    | 4                | VALGFRI          |
    | 5                | VALGFRI          |
    | ---------------- | ---------------- |

Scenario: Tilfelle: Ulike haleresultater blir vurdert.
    
    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100    | Ja              | Nei        | 1         |
    | 2100    | 200    | Ja              | Nei        | 2         |
    | 2100    | 400    | Ja              | Nei        | 3         |
    | 2100    | 800    | Ja              | Nei        | 4         |
    | 2100    | stav   | Ja              | Ja         | 5         |
    | 2100    | kule   | Ja              | Ja         | 6         |
    | 2100    | spyd   | Ja              | Ja         | 7         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver   | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | -------- | -------------- | ---------- | ---------- |
    | 1           | 800   | spyd   | Per      | Løpsstevne     | 50.00      | 2100.06.20 |
    | 2           | 700   | stav   | Per      | Løpsstevne     | 4.00       | 2100.06.20 |
    | 3           | 600   | 100    | Odd      | Løpsstevne     | 12.00      | 2100.06.20 |
    | 4           | 500   | 100    | Ole      | Løpsstevne     | 13.00      | 2100.06.20 |
    | 5           | 400   | 100    | Pål      | Løpsstevne     | 14.00      | 2100.06.20 |
    | 6           | 300   | 400    | Tom      | Løpsstevne     | 55.00      | 2100.06.20 |
    | 7           | 300   | kule   | Are      | Løpsstevne     | 10.00      | 2100.06.20 |
    | 8           | 100   | 800    | <Utøver> | Løpsstevne     | 2.30.00    | 2100.06.20 |
    | ----------- | ----- | ------ | -------- | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat         | Oppstillingstype |
    | ---------------- | ---------------- |
    | 3                | OBLIGATORISK     |
    | <Resultat 1>     | OBLIGATORISK     |
    | <Resultat 2>     | OBLIGATORISK     |
    | 2                | VALGFRI          |
    | 4                | VALGFRI          |
    | 5                | VALGFRI          |
    | ---------------- | ---------------- |

    Eksempler:

    | <Utøver> | <Resultat 1> | <Resultat 2> |
    | Tom      | 7            | 1            |
    | Are      | 6            | 1            |