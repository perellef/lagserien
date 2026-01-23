Feature: Periodisering lagresultat

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

    Og følgende resultater:
    
    | Resultat id | Øvelse | Utøver | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |
    | 1           | 100m   | Per    | Ås åpningsstevne | 11.00      | 2100.05.01 |
    | ----------- | ------ | ------ | ---------------- | ---------- | ---------- |

    Og følgende serieresultater:

    | Resultat | Fra og med | Til og med | Poeng | Klubb |
    | -------- | ---------- | ---------- | ----- | ----- |
    | 1        | 2100.01.01 |            | 900   | Ås IL |
    | -------- | ---------- | ---------- | ----- | ----- |

Scenario: Regel 1. Et lagresultat starter ny periode hvis lagresultatet ikke finnes.
    
    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- |
    
    Og ingen lagresultater
    
    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagresultater bli:
    
    | Serieår | Klubb   | Lagnummer | Resultat | Fra og med | Til og med | Oppstillingstype |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | ---------------- |
    | 2100    | Ås IL   | 1         | 1        | 2100.12.31 |            | OBLIGATORISK     |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | ---------------- |

Scenario: Regel 2. Et lagresultat beholder periode hvis lagresultatet finnes.

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------ | --------------- | ---------- | --------- |
    | 2100    | 100m   | Ja              | Nei        | 1         |
    | ------- | ------ | --------------- | ---------- | --------- |
    
    Og følgende lag:

    | Serieår | Klubb | Lagnummer |
    | ------- | ----- | --------- |
    | 2100    | Ås IL | 1         |
    | ------- | ----- | --------- |
    
    Og følgende lagresultater:
    
    | Serieår | Klubb   | Lagnummer | Resultat | Fra og med | Til og med | Oppstillingstype |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | ---------------- |
    | 2100    | Ås IL   | 1         | 1        | 2100.01.01 |            | OBLIGATORISK     |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | ---------------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagresultater bli:
    
    | Serieår | Klubb   | Lagnummer | Resultat | Fra og med | Til og med | Oppstillingstype |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | ---------------- |
    | 2100    | Ås IL   | 1         | 1        | 2100.01.01 |            | OBLIGATORISK     |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | ---------------- |

Scenario: Regel 3. Et lagresultat avslutter gammel og starter ny periode hvis oppstillingtypen endres.

    Gitt følgende serieøvelser:

    | Serieår | Øvelse | Er obligatorisk   | Er teknisk | Prioritet |
    | ------- | ------ | ----------------- | ---------- | --------- |
    | 2100    | 100m   | <Er obligatorisk> | Nei        | 1         |
    | ------- | ------ | ----------------- | ---------- | --------- |
    
    Og følgende lag:

    | Serieår | Klubb | Lagnummer |
    | ------- | ----- | --------- |
    | 2100    | Ås IL | 1         |
    | ------- | ----- | --------- |
    
    Og følgende lagresultater:
    
    | Serieår | Klubb   | Lagnummer | Resultat | Fra og med | Til og med | Oppstillingstype           |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | -------------------------- |
    | 2100    | Ås IL   | 1         | 1        | 2100.01.01 |            | <Forrige oppstillingstype> |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | -------------------------- |

    Når kalkulatorbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal lagresultater bli:
    
    | Serieår | Klubb   | Lagnummer | Resultat | Fra og med | Til og med | Oppstillingstype           |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | -------------------------- |
    | 2100    | Ås IL   | 1         | 1        | 2100.01.01 | 2100.12.30 | <Forrige oppstillingstype> |
    | 2100    | Ås IL   | 1         | 1        | 2100.12.31 |            | <Neste oppstillingstype>   |
    | ------- | ------- | --------- | -------- | ---------- | ---------- | -------------------------- |

    Eksempler:

    | <Er obligatorisk> | <Forrige oppstillingstype> | <Neste oppstillingstype> |
    | Ja                | VALGFRI                    | OBLIGATORISK             |
    | Nei               | OBLIGATORISK               | VALGFRI                  |