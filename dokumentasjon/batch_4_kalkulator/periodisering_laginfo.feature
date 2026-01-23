Feature: Periodisering laginfo

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
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- |

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med | Poeng | Til og med | Klubb |
    | -------- | ---------- | ----- | ---------- | ----- |
    | 1        | 2100.01.01 | 900   |            | Ås IL |
    | -------- | ---------- | ----- | ---------- | ----- |

Scenario: Regel 1. En laginfo starter ny periode hvis laginfoen ikke finnes.

    Gitt ingen laginfo
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal laginfo bli:
    
    | Serieår | Klubb | Lagnummer | Fra og med | Til og med | Poeng | Poeng obligatoriske | Poeng valgfri | Antall noteringer | Antall deltakere |
    | ------- | ----- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |
    | 2100    | Ås IL | 1         | 2100.12.31 |            | 900   | 900                 | 0             | 1                 | 1                |
    | ------- | ----- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |

Scenario: Regel 2. En laginfo beholder periode hvis laginfoen finnes.

    Gitt følgende lag:

    | Serieår | Klubb | Lagnummer |
    | ------- | ----- | --------- |
    | 2100    | Ås IL | 1         |
    | ------- | ----- | --------- |
    
    Og følgende laginfo:

    | Serieår | Klubb | Lagnummer | Fra og med | Til og med | Poeng | Poeng obligatoriske | Poeng valgfri | Antall noteringer | Antall deltakere |
    | ------- | ----- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |
    | 2100    | Ås IL | 1         | 2100.01.01 |            | 900   | 900                 | 0             | 1                 | 1                |
    | ------- | ----- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal laginfo bli:
    
    | Serieår | Klubb | Lagnummer | Fra og med | Til og med | Poeng | Poeng obligatoriske | Poeng valgfri | Antall noteringer | Antall deltakere |
    | ------- | ----- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |
    | 2100    | Ås IL | 1         | 2100.01.01 |            | 900   | 900                 | 0             | 1                 | 1                |
    | ------- | ----- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |

Scenario: Regel 3. En laginfo avslutter gammel og starter ny periode hvis laginfo har ny info.

    Gitt følgende lag:

    | Serieår | Klubb | Lagnummer |
    | ------- | ----- | --------- |
    | 2100    | Ås IL | 1         |
    | ------- | ----- | --------- |
    
    Og følgende laginfo:

    | Serieår | Klubb | Lagnummer | Fra og med | Til og med | Poeng   | Poeng obligatoriske   | Poeng valgfri   | Antall noteringer   | Antall deltakere   |
    | ------- | ----- | --------- | ---------- | ---------- | ------- | --------------------- | --------------- | ------------------- | ------------------ |
    | 2100    | Ås IL | 1         | 2100.01.01 |            | <Poeng> | <Poeng obligatoriske> | <Poeng valgfri> | <Antall noteringer> | <Antall deltakere> |
    | ------- | ----- | --------- | ---------- | ---------- | ------- | --------------------- | --------------- | ------------------- | ------------------ |
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal laginfo bli:
    
    | Serieår | Klubb | Lagnummer | Fra og med | Til og med | Poeng   | Poeng obligatoriske   | Poeng valgfri   | Antall noteringer   | Antall deltakere   |
    | ------- | ----- | --------- | ---------- | ---------- | ------- | --------------------- | --------------- | ------------------- | ------------------ |
    | 2100    | Ås IL | 1         | 2100.01.01 | 2100.12.30 | <Poeng> | <Poeng obligatoriske> | <Poeng valgfri> | <Antall noteringer> | <Antall deltakere> |
    | 2100    | Ås IL | 1         | 2100.12.31 |            | 900     | 900                   | 0               | 1                   | 1                  |
    | ------- | ----- | --------- | ---------- | ---------- | ------- | --------------------- | --------------- | ------------------- | ------------------ |

    Eksempler:

    | <Poeng> | <Poeng obligatoriske> | <Poeng valgfri> | <Antall noteringer> | <Antall deltakere> |
    | 500     | 500                   | 0               | 1                   | 1                  |
    | 1400    | 900                   | 500             | 1                   | 1                  |
    | 900     | 900                   | 0               | 2                   | 1                  |
    | 900     | 900                   | 0               | 1                   | 2                  |
    | 1800    | 1200                  | 600             | 4                   | 3                  |