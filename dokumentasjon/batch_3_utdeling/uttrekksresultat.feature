Feature: Klubber unntatt overbygning

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2100    | 2100.01.01 | 2100.12.31 |
    | ------- | ---------- | ---------- |

    Og følgende klubber:

    | Klubbnavn |
    | --------- |
    | Ås IL     |
    | Nordby IL |
    | --------- |

    Og følgende overklubber:
    
    | Serieår | Overklubb | Alder 11-14 | Alder 15-19 | Alder 20+ |
    | ------- | --------- | ----------- | ----------- | --------- |
    | 2100    | Ås IL     | Nei         | Ja          | Nei       |
    | ------- | --------- | ----------- | ----------- | --------- |

Scenario: Regel 1. Det produseres serieresultat hvis tilhørende uttrekksresultat overlapper uttrekksdato.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.02.01 til 2100.03.01:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.02.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato <uttrekksdato>

    Så skal serieresultater bli:

    | Resultat | Fra og med     | Til og med | Klubb |
    | -------- | -------------- | ---------- | ----- |
    | 1        | <uttrekksdato> |            | Ås IL |
    | -------- | -------------- | ---------- | ----- |

    Eksempler:

    | <uttrekksdato> |
    | 2100.02.01     |
    | 2100.02.15     |
    | 2100.03.01     |


Scenario: Det produseres ikke serieresultat hvis tilhørende uttrekksresultat ikke overlapper uttrekksdato.

    Gitt følgende utøvere:

    | Navn | Fødselsår |
    | ---- | --------- |
    | Per  | 2085      |
    | ---- | --------- |

    Og klubben Ås IL med følgende uttrekksresultater fra 2100.02.01 til 2100.03.01:
    
    | Resultat id | Øvelse | Utøver   | Stevne           | Prestasjon | Dato       |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |
    | 1           | 60m    | Per      | Ås åpningsstevne | 10.00      | 2100.02.01 |
    | ----------- | ------ | -------- | ---------------- | ---------- | ---------- |

    Når utdelingsbatch kjøres med serieår 2100 og uttrekksdato <uttrekksdato>

    Så skal ingen serieresultater finnes
    
    Eksempler:

    | <uttrekksdato> |
    | 2100.01.31     |
    | 2100.03.02     |