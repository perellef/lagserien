Feature: Resultatbytter

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

Scenario: Regel 1. Et resultat utdeles til klubb angitt i resultatbytte hvis den finnes.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende resultatbytter:
    
    | Statistikk resultat id | Klubb     | Registrert          |
    | ---------------------- | --------- | ------------------- |
    | 1                      | Nordby IL | 2100.12.31T00:00:00 | 
    | ---------------------- | --------- | ------------------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp                                          |
    | -------- | ---------- | ---------- | --------- | ----------------------------------------------- |
    | 1        | 2100.12.31 |            | Nordby IL | Innlastet. Manuelt satt til Nordby IL.                      |
    | -------- | ---------- | ---------- | --------- | ----------------------------------------------- |

Scenario: Regel 2. Et resultat utdeles til ingen hvis resultatbytte angir ingen klubb.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.12.31:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende resultatbytter:
    
    | Statistikk resultat id | Klubb     | Registrert          |
    | ---------------------- | --------- | ------------------- |
    | 1                      |           | 2100.12.31T00:00:00 |
    | ---------------------- | --------- | ------------------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.12.31

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp                      |
    | -------- | ---------- | ---------- | --------- | --------------------------- |
    | 1        | 2100.12.31 |            |           | Innlastet. Manuelt fjernet. |
    | -------- | ---------- | ---------- | --------- | --------------------------- |

Scenario: Regel 3. Kjøringer tilbake i tid ignorerer resultaterbytter som på da ikke fantes.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.11.01:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.05.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Og følgende resultatbytter:
    
    | Statistikk resultat id | Klubb     | Registrert          |
    | ---------------------- | --------- | ------------------- |
    | 1                      |           | 2100.12.01T00:00:00 |
    | ---------------------- | --------- | ------------------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato 2100.11.01

    Så skal serieresultater bli:

    | Resultat | Fra og med | Til og med | Klubb     | Forløp     |
    | -------- | ---------- | ---------- | --------- | ---------- |
    | 1        | 2100.11.01 |            | Ås IL     | Innlastet. |
    | -------- | ---------- | ---------- | --------- | ---------- |