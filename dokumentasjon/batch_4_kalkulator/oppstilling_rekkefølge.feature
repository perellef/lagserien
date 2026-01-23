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
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | 2100    | 200m   | Ja              | Nei        | 2         |
    | 2100    | Stav   | Ja              | Ja         | 3         |
    | 2100    | Kule   | Ja              | Ja         | 4         |
    | ------- | ------ | --------------- | ---------- | --------- |
    
    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 200m   | Per    | Kaststevne     | 23.00      | 2100.06.20 |
    | 2           | 700   | Kule   | Per    | Kaststevne     | 12.00      | 2100.06.20 |
    | 3           | 600   | 100m   | Tom    | Kaststevne     | 12.00      | 2100.06.20 |
    | 4           | 500   | Stav   | Tom    | Kaststevne     | 3.00       | 2100.06.20 |
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
    | 2100    | 3000m  | Nei             | Ja         | 1         |
    | 2100    | 200mh  | Nei             | Ja         | 2         |
    | 2100    | Hut    | Nei             | Ja         | 3         |
    | 2100    | Lut    | Nei             | Ja         | 4         |
    | ------- | ------ | --------------- | ---------- | --------- |
    
    Og klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne         | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | -------------- | ---------- | ---------- |
    | 1           | 800   | 200mh  | Per    | Løpsstevne     | 28.00      | 2100.06.20 |
    | 2           | 700   | Hut    | Per    | Hoppstevne     | 1.30       | 2100.06.20 |
    | 3           | 600   | 3000m  | Tom    | Løpsstevne     | 9.00.00    | 2100.06.20 |
    | 4           | 500   | Lut    | Tom    | Hoppstevne     | 3.00       | 2100.06.20 |
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
