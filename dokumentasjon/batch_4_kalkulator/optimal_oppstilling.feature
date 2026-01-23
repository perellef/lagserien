Feature: Optimal oppstilling 

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |
    
    Og følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2100    | 3        | 3                    | 3              | 2                      | 2                | 2                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |

    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | 2100    | 200m   | Ja              | Nei        | 2         |
    | 2100    | 400m   | Ja              | Nei        | 3         |
    | 2100    | 800m   | Ja              | Nei        | 4         |
    | 2100    | 60mh   | Ja              | Nei        | 5         |
    | 2100    | Stav   | Ja              | Ja         | 6         |
    | 2100    | Kule   | Ja              | Ja         | 7         |
    | 2100    | Spyd   | Ja              | Ja         | 8         |
    | ------- | ------ | --------------- | ---------- | --------- |

Scenario: Regel 1. Kalkulator setter opp oppstillingen med høyest seriepoeng av de som etterfølger oppstillingskravene.

    Gitt klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 100m   | Per    | Ås kretsstevne | 11.00      | 2100.05.01 |
    | 2           | 700   | 200m   | Per    | Ås kretsstevne | 23.00      | 2100.05.01 |
    | 3           | 600   | 400m   | Tom    | Ås kretsstevne | 50.00      | 2100.05.01 |
    | 4           | 500   | 800m   | Tom    | Ås kretsstevne | 2.00.00    | 2100.05.01 |
    | 5           | 400   | 60mh   | Jan    | Ås kretsstevne | 8.00       | 2100.05.01 |
    | 6           | 300   | Kule   | Jan    | Ås kretsstevne | 11.00      | 2100.05.01 |
    | 7           | 200   | Spyd   | Ole    | Ås kretsstevne | 40.00      | 2100.05.01 |
    | 8           | 100   | Stav   | Ole    | Ås kretsstevne | 3.00       | 2100.05.01 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat | Oppstillingstype |
    | -------- | ---------------- |
    | 1        | OBLIGATORISK     |
    | 2        | OBLIGATORISK     |
    | 6        | OBLIGATORISK     |
    | 3        | VALGFRI          |
    | 4        | VALGFRI          |
    | 7        | VALGFRI          |
    | -------- | ---------------- |

Scenario: Regel 2. Kalkulator ser på oppstillingene til de neste lagene for å velge blant flere gyldige oppstillinger med samme høyeste seriepoeng.

    Gitt klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 100m   | Per    | Ås kretsstevne | 11.00      | 2100.05.01 |
    | 2           | 700   | 200m   | Per    | Ås kretsstevne | 23.00      | 2100.05.01 |
    | 3           | 600   | 400m   | Ole    | Ås kretsstevne | 50.00      | 2100.05.01 |
    | 4           | 500   | 800m   | Tom    | Ås kretsstevne | 2.00.00    | 2100.05.01 |
    | 5           | 500   | 800m   | Jan    | Ås kretsstevne | 2.00.00    | 2100.05.01 |
    | 6           | 400   | 60mh   | Tom    | Ås kretsstevne | 8.00       | 2100.05.01 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat | Oppstillingstype |
    | -------- | ---------------- |
    | 1        | OBLIGATORISK     |
    | 2        | OBLIGATORISK     |
    | 3        | VALGFRI          |
    | 5        | VALGFRI          |
    | -------- | ---------------- |

    Og Ås IL sitt 2. lag få følgende lagresultater serien 2100 på dato 2100.12.31:

    | Resultat | Oppstillingstype |
    | -------- | ---------------- |
    | 4        | OBLIGATORISK     |
    | 6        | OBLIGATORISK     |
    | -------- | ---------------- |