Feature: Laginfo

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |
    
    Og følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2100    | 3        | 4                    | 4              | 2                      | 2                | 2                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |

    Og følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100    | Ja              | Nei        | 1         |
    | 2100    | 200    | Ja              | Nei        | 2         |
    | 2100    | 400    | Ja              | Nei        | 3         |
    | 2100    | 800    | Ja              | Nei        | 4         |
    | 2100    | kule   | Ja              | Ja         | 5         |
    | 2100    | stav   | Ja              | Ja         | 6         |
    | 2100    | spyd   | Ja              | Ja         | 7         |
    | ------- | ------ | --------------- | ---------- | --------- |

Scenario: En oppstilling skal ha en tilhørende laginfo med totalpoeng, obligatoriske og valgfri poeng, antall noteringer og antall deltakere.
    
    Gitt klubben Ås IL med følgende serieresultater fra 2100.12.31:
    
    | Resultat id | Poeng | Øvelse | Utøver | Stevne          | Prestasjon | Dato       |
    | ----------- | ----- | ------ | ------ | --------------- | ---------- | ---------- |
    | 1           | 800   | 100    | Per    | Ås kretsstevne  | 11.00      | 2100.10.08 |
    | 2           | 700   | 400    | Ole    | Tjalvelekene    | 51.00      | 2100.06.03 |
    | 3           | 600   | kule   | Ole    | Nittedalslekene | 13.00      | 2100.06.20 |
    | 4           | 500   | stav   | Jan    | NM              | 3.00       | 2100.05.01 |
    | 5           | 400   | 800    | Tom    | Ås kretsstevne  | 2.10.00    | 2100.10.08 |
    | 6           | 300   | spyd   | Tom    | Ski kaststevne  | 35.00      | 2100.08.16 |
    | ----------- | ----- | ------ | ------ | --------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagresultater bli:

    | Serieår | Klubb   | Lagnummer | Resultat | Fra og med | Til og med | Oppstillingstype |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | ---------------- |
    | 2100    | Ås IL   | 1         | 1        | 2100.12.31 |            | OBLIGATORISK     |
    | 2100    | Ås IL   | 1         | 2        | 2100.12.31 |            | OBLIGATORISK     |
    | 2100    | Ås IL   | 1         | 3        | 2100.12.31 |            | OBLIGATORISK     |
    | 2100    | Ås IL   | 1         | 4        | 2100.12.31 |            | OBLIGATORISK     |
    | 2100    | Ås IL   | 1         | 5        | 2100.12.31 |            | VALGFRI          |
    | 2100    | Ås IL   | 1         | 6        | 2100.12.31 |            | VALGFRI          |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | ---------------- |

    Og laginfo bli:

    | Serieår | Klubb | Lagnummer | Fra og med | Til og med | Poeng | Poeng obligatoriske | Poeng valgfri | Antall noteringer | Antall deltakere |
    | ------- | ----- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |
    | 2100    | Ås IL | 1         | 2100.12.31 |            | 3300  | 2600                | 700           | 6                 | 4                |
    | ------- | ----- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |