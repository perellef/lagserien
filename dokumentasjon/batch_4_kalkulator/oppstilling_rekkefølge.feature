Feature: Oppstilling, rekkefølge

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |
    
    Og følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2100    | 3        | 4                    | 4              | 3                      | 3                | 3                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |

Scenario: Regel 1. Lagresultater med obligatorisk oppstillingstype plasseres etter økende prioritet av øvelsen.

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100    | Ja              | Nei        | 1         |
    | 2100    | 200    | Ja              | Nei        | 2         |
    | 2100    | stav   | Ja              | Ja         | 3         |
    | 2100    | kule   | Ja              | Ja         | 4         |
    | ------- | ------ | --------------- | ---------- | --------- |
    
    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 200    | Per    | Kaststevne     | 23.00      | 2100.06.20 |
    | 2           | 700   | kule   | Per    | Kaststevne     | 12.00      | 2100.06.20 |
    | 3           | 600   | 100    | Tom    | Kaststevne     | 12.00      | 2100.06.20 |
    | 4           | 500   | stav   | Tom    | Kaststevne     | 3.00       | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 3          | OBLIGATORISK     |
    | 1          | OBLIGATORISK     |
    | 4          | OBLIGATORISK     |
    | 2          | OBLIGATORISK     |
    | ---------- | ---------------- |

Scenario: Regel 2. Lagresultater med valgfri oppstillingstype plasseres etter avtakende poeng.

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 3000   | Nei             | Ja         | 1         |
    | 2100    | 200h   | Nei             | Ja         | 2         |
    | 2100    | hut    | Nei             | Ja         | 3         |
    | 2100    | lut    | Nei             | Ja         | 4         |
    | ------- | ------ | --------------- | ---------- | --------- |
    
    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 200h   | Per    | Løpsstevne     | 28.00      | 2100.06.20 |
    | 2           | 700   | hut    | Per    | Hoppstevne     | 1.30       | 2100.06.20 |
    | 3           | 600   | 3000   | Tom    | Løpsstevne     | 9.00.00    | 2100.06.20 |
    | 4           | 500   | lut    | Tom    | Hoppstevne     | 3.00       | 2100.06.20 |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal Ås IL sitt 1. lag få følgende lagresultater serien 2100 på dato 2100.12.31:
    
    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 1          | VALGFRI          |
    | 2          | VALGFRI          |
    | 3          | VALGFRI          |
    | 4          | VALGFRI          |
    | ---------- | ---------------- |
