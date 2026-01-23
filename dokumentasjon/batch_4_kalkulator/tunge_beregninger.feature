Feature: Tunge beregninger

Bakgrunn:

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2021    | 2020.10.01 | 2021.12.31 |
    | 2023    | 2023.01.01 | 2023.12.31 |
    | 2024    | 2024.01.01 | 2024.12.31 |
    | ------- | ---------- | ---------- |
    
    Og følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2021    | 1        | 15                   | 15             | 15                     | 10               | 5                          |
    | 2021    | 2        | 13                   | 12             | 13                     | 8                | 5                          |
    | 2021    | 3        | 12                   | 8              | 12                     | 6                | 5                          |
    | 2023    | 1        | 15                   | 15             | 10                     | 10               | 5                          |
    | 2023    | 2        | 13                   | 12             | 9                      | 8                | 5                          |
    | 2023    | 3        | 12                   | 8              | 9                      | 5                | 5                          |
    | 2024    | 1        | 15                   | 15             | 10                     | 10               | 5                          |
    | 2024    | 2        | 13                   | 12             | 9                      | 8                | 5                          |
    | 2024    | 3        | 12                   | 8              | 9                      | 5                | 5                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |

Scenario: Serien 2023 kvinner - IL Norodd

    Gitt følgende serieøvelser:

    | Serieår | Øvelse  | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------- | --------------- | ---------- | --------- |
    | 2023    | 60      | Ja              | Nei        | 1         |
    | 2023    | 100     | Ja              | Nei        | 2         |
    | 2023    | 200     | Ja              | Nei        | 3         |
    | 2023    | 400     | Ja              | Nei        | 4         |
    | 2023    | 800     | Ja              | Nei        | 5         |
    | 2023    | 1500    | Ja              | Nei        | 6         |
    | 2023    | 3000    | Ja              | Nei        | 7         |
    | 2023    | 3000H   | Ja              | Nei        | 8         |
    | 2023    | 5000    | Ja              | Nei        | 9         |
    | 2023    | 10000   | Ja              | Nei        | 10        |
    | 2023    | 60h     | Ja              | Nei        | 11        |
    | 2023    | 100h    | Ja              | Nei        | 12        |
    | 2023    | 400h    | Ja              | Nei        | 13        |
    | 2023    | 3000K   | Ja              | Nei        | 14        |
    | 2023    | 5000K   | Ja              | Nei        | 15        |
    | 2023    | Høyde   | Ja              | Ja         | 16        |
    | 2023    | Hut     | Ja              | Ja         | 17        |
    | 2023    | Stav    | Ja              | Ja         | 18        |
    | 2023    | Lengde  | Ja              | Ja         | 19        |
    | 2023    | Lut     | Ja              | Ja         | 20        |
    | 2023    | Tresteg | Ja              | Ja         | 21        |
    | 2023    | Kule    | Ja              | Ja         | 22        |
    | 2023    | Diskos  | Ja              | Ja         | 23        |
    | 2023    | Slegge  | Ja              | Ja         | 24        |
    | 2023    | Spyd    | Ja              | Ja         | 25        |
    | ------- | ------- | --------------- | ---------- | --------- |
    
    Og klubben IL Norodd med følgende serieresultater fra 2023.12.31:
    
    | Resultat id | Poeng | Øvelse  | Utøver   | Stevne       | Prestasjon | Dato       |
    | ----------- | ----- | ------- | -------- | ------------ | ---------- | ---------- |
    | 1           | 876   | 100h    | Elise    | 2023         | 13,96      | 2023.06.20 |
    | 2           | 862   | Lengde  | Elise    | 2023         | 6,09       | 2023.06.20 |
    | 3           | 832   | 60h     | Elise    | 2023         | 8,74       | 2023.06.20 |
    | 4           | 804   | Spyd    | Elise    | 2023         | 46,68      | 2023.06.20 |
    | 5           | 765   | Høyde   | Elise    | 2023         | 1,69       | 2023.06.20 |
    | 6           | 753   | 200     | Elise    | 2023         | 25,65      | 2023.06.20 |
    | 7           | 739   | Kule    | Elise    | 2023         | 12,52      | 2023.06.20 |
    | 8           | 739   | Tresteg | Elise    | 2023         | 11,74      | 2023.06.20 |
    | 9           | 731   | 60      | Elise    | 2023         | 8,01       | 2023.06.20 |
    | 10          | 690   | 400     | Elise    | 2023         | 59,66      | 2023.06.20 |
    | 11          | 670   | 800     | Elise    | 2023         | 2,19,81    | 2023.06.20 |
    | 12          | 617   | 200     | Sara     | 2023         | 27,45      | 2023.06.20 |
    | 13          | 593   | 60      | Sara     | 2023         | 8,50       | 2023.06.20 |
    | 14          | 490   | 100     | Sara     | 2023         | 13,9       | 2023.06.20 |
    | 15          | 446   | 400     | Ida      | 2023         | 1,09,02    | 2023.06.20 |
    | 16          | 437   | 800     | Ida      | 2023         | 2,43,22    | 2023.06.20 |
    | 17          | 418   | Høyde   | Stella   | 2023         | 1,30       | 2023.06.20 |
    | 18          | 401   | 60      | Ingrid   | 2023         | 9,33       | 2023.06.20 |
    | 19          | 396   | 200     | Ida      | 2023         | 30,96      | 2023.06.20 |
    | 20          | 379   | Lut     | Ingrid   | 2023         | 2,15       | 2023.06.20 |
    | 21          | 357   | Hut     | Stella   | 2023         | 1,05       | 2023.06.20 |
    | 22          | 357   | Hut     | Ingrid   | 2023         | 1,05       | 2023.06.20 |
    | 23          | 357   | Hut     | Sara     | 2023         | 1,05       | 2023.06.20 |
    | 24          | 354   | Lut     | Sara     | 2023         | 2,12       | 2023.06.20 |
    | 25          | 346   | 60      | Veronika | 2023         | 9,60       | 2023.06.20 |
    | 26          | 339   | Stav    | Sara     | 2023         | 1,72       | 2023.06.20 |
    | 27          | 339   | Høyde   | Ingrid   | 2023         | 1,23       | 2023.06.20 |
    | 28          | 326   | 200     | Stella   | 2023         | 32,30      | 2023.06.20 |
    | 29          | 307   | 1500    | Stella   | 2023         | 6,10,25    | 2023.06.20 |
    | 30          | 280   | Hut     | Veronika | 2023         | 1,00       | 2023.06.20 |
    | 31          | 277   | Lengde  | Ida      | 2023         | 3,59       | 2023.06.20 |
    | 32          | 272   | 800     | Stella   | 2023         | 3,04,7     | 2023.06.20 |
    | 33          | 269   | 60      | Stella   | 2023         | 10,01      | 2023.06.20 |
    | 34          | 268   | 100     | Stella   | 2023         | 15,6       | 2023.06.20 |
    | 35          | 268   | 1500    | Ingrid   | 2023         | 6,21,20    | 2023.06.20 |
    | 36          | 268   | 100     | Veronika | 2023         | 15,6       | 2023.06.20 |
    | 37          | 263   | 800     | Ingrid   | 2023         | 3,06,05    | 2023.06.20 |
    | 38          | 246   | Lut     | Stella   | 2023         | 2,00       | 2023.06.20 |
    | 39          | 239   | 60      | Ingrid   | 2023         | 10,17      | 2023.06.20 |
    | 40          | 229   | 200     | Veronika | 2023         | 34,39      | 2023.06.20 |
    | 41          | 227   | 200     | Ingrid   | 2023         | 34,43      | 2023.06.20 |
    | 42          | 224   | 800     | Anna     | 2023         | 3,11,8     | 2023.06.20 |
    | 43          | 223   | 200     | Anna     | 2023         | 34,53      | 2023.06.20 |
    | 44          | 201   | 60      | Anna     | 2023         | 10,39      | 2023.06.20 |
    | 45          | 190   | 200     | Katia    | 2023         | 35,33      | 2023.06.20 |
    | 46          | 186   | 60      | Katia    | 2023         | 10,48      | 2023.06.20 |
    | 47          | 181   | 100     | Ingrid   | 2023         | 16,4       | 2023.06.20 |
    | 48          | 173   | Høyde   | Katia    | 2023         | 1,10       | 2023.06.20 |
    | 49          | 141   | 60      | Alma     | 2023         | 10,75      | 2023.06.20 |
    | 50          | 140   | 100     | Alma     | 2023         | 16,8       | 2023.06.20 |
    | 51          | 133   | Lut     | Veronika | 2023         | 1,89       | 2023.06.20 |
    | 52          | 100   | Hut     | Isabel   | 2023         | 0,90       | 2023.06.20 |
    | 53          | 26    | Lut     | Isabel   | 2023         | 1,80       | 2023.06.20 |
    | ----------- | ----- | ------- | -------- | ------------ | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2023 og uttrekksdato 2023.12.31

    Så skal batchen bruke under 6 sekunder

    Og IL Norodd sitt 1. lag få følgende laginfo serien 2023 på dato 2023.12.31:

    | Poeng |
    | ----- |
    | 10426 |
    | ----- |
    
    Og IL Norodd sitt 1. lag få følgende lagresultater serien 2023 på dato 2023.12.31:
    
    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 13         | OBLIGATORISK     |
    | 14         | OBLIGATORISK     |
    | 12         | OBLIGATORISK     |
    | 15         | OBLIGATORISK     |
    | 16         | OBLIGATORISK     |
    | 3          | OBLIGATORISK     |
    | 1          | OBLIGATORISK     |
    | 5          | OBLIGATORISK     |
    | 21         | OBLIGATORISK     |
    | 2          | OBLIGATORISK     |
    | 20         | OBLIGATORISK     |
    | 4          | OBLIGATORISK     |
    | 17         | VALGFRI          |
    | 18         | VALGFRI          |
    | 19         | VALGFRI          |
    | 22         | VALGFRI          |
    | 23         | VALGFRI          |
    | 24         | VALGFRI          |
    | 25         | VALGFRI          |
    | 27         | VALGFRI          |
    | ---------- | ---------------- |

Scenario: Serien 2024 kvinner - Fredrikstad IF

    Gitt følgende serieøvelser:

    | Serieår | Øvelse  | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------- | --------------- | ---------- | --------- |
    | 2024    | 60      | Ja              | Nei        | 1         |
    | 2024    | 100     | Ja              | Nei        | 2         |
    | 2024    | 200     | Ja              | Nei        | 3         |
    | 2024    | 400     | Ja              | Nei        | 4         |
    | 2024    | 800     | Ja              | Nei        | 5         |
    | 2024    | 1500    | Ja              | Nei        | 6         |
    | 2024    | 3000    | Ja              | Nei        | 7         |
    | 2024    | 3000H   | Ja              | Nei        | 8         |
    | 2024    | 5000    | Ja              | Nei        | 9         |
    | 2024    | 10000   | Ja              | Nei        | 10        |
    | 2024    | 60h     | Ja              | Nei        | 11        |
    | 2024    | 100h    | Ja              | Nei        | 12        |
    | 2024    | 400h    | Ja              | Nei        | 13        |
    | 2024    | 3000K   | Ja              | Nei        | 14        |
    | 2024    | 5000K   | Ja              | Nei        | 15        |
    | 2024    | Høyde   | Ja              | Ja         | 16        |
    | 2024    | Hut     | Ja              | Ja         | 20        |
    | 2024    | Stav    | Ja              | Ja         | 17        |
    | 2024    | Lengde  | Ja              | Ja         | 18        |
    | 2024    | Lut     | Ja              | Ja         | 21        |
    | 2024    | Tresteg | Ja              | Ja         | 19        |
    | 2024    | Kule    | Ja              | Ja         | 22        |
    | 2024    | Diskos  | Ja              | Ja         | 23        |
    | 2024    | Slegge  | Ja              | Ja         | 24        |
    | 2024    | Spyd    | Ja              | Ja         | 25        |
    | ------- | ------- | --------------- | ---------- | --------- |

    Og følgende topplag:
    
    | Serieår | Klubb          | Lagnummer | Divisjon |
    | ------- | -------------- | --------- | -------- |
    | 2024    | Fredrikstad IF | 1         | 1        |
    | ------- | -------------- | --------- | -------- |
    
    Og klubben Fredrikstad IF med følgende serieresultater fra 2024.12.31:

    | Resultat id | Poeng | Øvelse  | Utøver               | Stevne      | Prestasjon | Dato       |
    | ----------- | ----- | ------- | -------------------- | ----------- | ---------- | ---------- |
    | 1           | 899   | 400h    | Marlen Aakre         | 2024        | 58,27      | 2024.06.20 |
    | 2           | 881   | 400h    | Nora Wold            | 2024        | 58,82      | 2024.06.20 |
    | 3           | 869   | 800     | Nora Wold            | 2024        | 2,05,88    | 2024.06.20 |
    | 4           | 864   | 60h     | Marlen Aakre         | 2024        | 8,59       | 2024.06.20 |
    | 5           | 847   | 100h    | Jamila Isman         | 2024        | 14,21      | 2024.06.20 |
    | 6           | 836   | 100h    | Marlen Aakre         | 2024        | 14,32      | 2024.06.20 |
    | 7           | 828   | 60      | Marlen Aakre         | 2024        | 7,71       | 2024.06.20 |
    | 8           | 821   | 100     | Marlen Aakre         | 2024        | 12,17      | 2024.06.20 |
    | 9           | 820   | 200     | Marlen Aakre         | 2024        | 24,85      | 2024.06.20 |
    | 10          | 819   | 60h     | Jamila Isman         | 2024        | 8,80       | 2024.06.20 |
    | 11          | 802   | 400     | Marlen Aakre         | 2024        | 56,42      | 2024.06.20 |
    | 12          | 798   | 400     | Jamila Isman         | 2024        | 56,55      | 2024.06.20 |
    | 13          | 790   | Høyde   | Jamila Isman         | 2024        | 1,72       | 2024.06.20 |
    | 14          | 788   | 200     | Freia Skaset         | 2024        | 25,22      | 2024.06.20 |
    | 15          | 786   | 200     | Jamila Isman         | 2024        | 25,25      | 2024.06.20 |
    | 16          | 785   | 60      | Freia Skaset         | 2024        | 7,84       | 2024.06.20 |
    | 17          | 759   | 100     | Freia Skaset         | 2024        | 12,50      | 2024.06.20 |
    | 18          | 742   | 400     | Nora Wold            | 2024        | 58,13      | 2024.06.20 |
    | 19          | 697   | 400     | Freia Skaset         | 2024        | 59,46      | 2024.06.20 |
    | 20          | 696   | Lengde  | Jamila Isman         | 2024        | 5,36       | 2024.06.20 |
    | 21          | 692   | Kule    | Jamila Isman         | 2024        | 11,60      | 2024.06.20 |
    | 22          | 690   | 100     | Luna Stang           | 2024        | 12,89      | 2024.06.20 |
    | 23          | 675   | 200     | Luna Stang           | 2024        | 26,66      | 2024.06.20 |
    | 24          | 671   | 100     | Linn Skjermo         | 2024        | 13,00      | 2024.06.20 |
    | 25          | 668   | Spyd    | Jamila Isman         | 2024        | 37,84      | 2024.06.20 |
    | 26          | 663   | 60      | Luna Stang           | 2024        | 8,24       | 2024.06.20 |
    | 27          | 645   | 800     | Jamila Isman         | 2024        | 2,21,84    | 2024.06.20 |
    | 28          | 645   | 200     | Linn Skjermo         | 2024        | 27,07      | 2024.06.20 |
    | 29          | 642   | 3000    | Julie Marie Brox     | 2024        | 10,38,33mx | 2024.06.20 |
    | 30          | 614   | 60      | Linn Skjermo         | 2024        | 8,42       | 2024.06.20 |
    | 31          | 613   | Stav    | Karine Magnussen     | 2024        | 2,73       | 2024.06.20 |
    | 32          | 610   | 200     | Amelie Andersen      | 2024        | 27,55      | 2024.06.20 |
    | 33          | 603   | 60      | Siri GLebesby-Garcia | 2024        | 8,46       | 2024.06.20 |
    | 34          | 600   | 400     | Luna Stang           | 2024        | 1,02,60    | 2024.06.20 |
    | 35          | 594   | Lengde  | Amelie Andersen      | 2024        | 4,89       | 2024.06.20 |
    | 36          | 593   | Lut     | Marlen Aakre         | 2024        | 2,44       | 2024.06.20 |
    | 37          | 589   | 100     | Amelie Andersen      | 2024        | 13,49      | 2024.06.20 |
    | 38          | 583   | Stav    | Valentina Pauna      | 2024        | 2,60       | 2024.06.20 |
    | 39          | 580   | 200     | Siri Lebesby-Garcia  | 2024        | 27,98      | 2024.06.20 |
    | 40          | 578   | 60      | Amelie Andersen      | 2024        | 8,56       | 2024.06.20 |
    | 41          | 575   | 100     | Siri Lebesby-Garcia  | 2024        | 13,58      | 2024.06.20 |
    | 42          | 565   | Høyde   | Luna Stang           | 2024        | 1,45       | 2024.06.20 |
    | 43          | 561   | 1500    | Siri Lebesby-Garcia  | 2024        | 5,09,92    | 2024.06.20 |
    | 44          | 556   | 800     | Hedvig Brimsholm     | 2024        | 2,30,20    | 2024.06.20 |
    | 45          | 553   | Lut     | Linn Skjermo         | 2024        | 2,38       | 2024.06.20 |
    | 46          | 530   | 1500    | Ella Fuglesteg       | 2024        | 5,16,52    | 2024.06.20 |
    | 47          | 530   | Lengde  | Freia Skaset         | 2024        | 4,60       | 2024.06.20 |
    | 48          | 513   | 3000    | Ella Fuglesteg       | 2024        | 11,35,49   | 2024.06.20 |
    | 49          | 513   | 1500    | Hedvig Brimsholm     | 2024        | 5,20,22    | 2024.06.20 |
    | 50          | 505   | 60      | Nora Heiberg-Aubert  | 2024        | 8,86       | 2024.06.20 |
    | 51          | 504   | 800     | Siri Lebesby-Garcia  | 2024        | 2,35,60    | 2024.06.20 |
    | 52          | 502   | 60      | Celine Azyrov        | 2024        | 8,87       | 2024.06.20 |
    | 53          | 500   | Høyde   | Karin Wåhlberg       | 2024        | 1,38       | 2024.06.20 |
    | 54          | 500   | 800     | Amelie Andersen      | 2024        | 2,35,99    | 2024.06.20 |
    | 55          | 490   | Tresteg | Ingrid Holen         | 2024        | 9,36       | 2024.06.20 |
    | 56          | 489   | Lut     | Freia Skaset         | 2024        | 2,29       | 2024.06.20 |
    | 57          | 470   | Høyde   | Siri Lebesby-Garcia  | 2024        | 1,35       | 2024.06.20 |
    | 58          | 470   | Høyde   | Sofia Johansen       | 2024        | 1,35       | 2024.06.20 |
    | 59          | 470   | Høyde   | Ingrid Holen         | 2024        | 1,35       | 2024.06.20 |
    | ----------- | ----- | ------- | -------------------- | ----------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2024 og uttrekksdato 2024.12.31

    Så skal batchen bruke under 60 sekunder

    Og Fredrikstad IF sitt 1. lag få følgende laginfo serien 2024 på dato 2024.12.31:

    | Poeng |
    | ----- |
    | 21453 |
    | ----- |

    Og Fredrikstad IF sitt 1. lag få følgende lagresultater serien 2024 på dato 2024.12.31:

    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 7          | OBLIGATORISK     |
    | 8          | OBLIGATORISK     |
    | 14         | OBLIGATORISK     |
    | 18         | OBLIGATORISK     |
    | 3          | OBLIGATORISK     |
    | 43         | OBLIGATORISK     |
    | 29         | OBLIGATORISK     |
    | 4          | OBLIGATORISK     |
    | 5          | OBLIGATORISK     |
    | 1          | OBLIGATORISK     |
    | 13         | OBLIGATORISK     |
    | 31         | OBLIGATORISK     |
    | 20         | OBLIGATORISK     |
    | 45         | OBLIGATORISK     |
    | 21         | OBLIGATORISK     |
    | 2          | VALGFRI          |
    | 6          | VALGFRI          |
    | 10         | VALGFRI          |
    | 16         | VALGFRI          |
    | 17         | VALGFRI          |
    | 19         | VALGFRI          |
    | 22         | VALGFRI          |
    | 23         | VALGFRI          |
    | 24         | VALGFRI          |
    | 26         | VALGFRI          |
    | 35         | VALGFRI          |
    | 38         | VALGFRI          |
    | 42         | VALGFRI          |
    | 47         | VALGFRI          |
    | 53         | VALGFRI          |
    | ---------- | ---------------- |

Scenario: Serien 2021 menn - IL Gneist

    Gitt følgende serieøvelser:

    | Serieår | Øvelse  | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------- | --------------- | ---------- | --------- |
    | 2021    | 100     | Ja              | Nei        | 1         |
    | 2021    | 200     | Ja              | Nei        | 2         |
    | 2021    | 400     | Ja              | Nei        | 3         |
    | 2021    | 800     | Ja              | Nei        | 4         |
    | 2021    | 1500    | Ja              | Nei        | 5         |
    | 2021    | 3000    | Nei             | Nei        | 6         |
    | 2021    | 3000H   | Ja              | Nei        | 7         |
    | 2021    | 5000    | Ja              | Nei        | 8         |
    | 2021    | 10000   | Ja              | Nei        | 9         |
    | 2021    | 110h    | Ja              | Nei        | 10        |
    | 2021    | 200h    | Nei             | Nei        | 11        |
    | 2021    | 400h    | Ja              | Nei        | 12        |
    | 2021    | 3000K   | Nei             | Nei        | 13        |
    | 2021    | 5000K   | Ja              | Nei        | 14        |
    | 2021    | 10000K  | Ja              | Nei        | 15        |
    | 2021    | 20000K  | Nei             | Nei        | 16        |
    | 2021    | Høyde   | Ja              | Ja         | 17        |
    | 2021    | Hut     | Nei             | Ja         | 18        |
    | 2021    | Stav    | Ja              | Ja         | 19        |
    | 2021    | Lengde  | Ja              | Ja         | 20        |
    | 2021    | Lut     | Nei             | Ja         | 21        |
    | 2021    | Tresteg | Ja              | Ja         | 22        |
    | 2021    | Kule    | Ja              | Ja         | 23        |
    | 2021    | Diskos  | Ja              | Ja         | 24        |
    | 2021    | Slegge  | Ja              | Ja         | 25        |
    | 2021    | Spyd    | Ja              | Ja         | 26        |
    | ------- | ------- | --------------- | ---------- | --------- |

    Og følgende topplag:
    
    | Serieår | Klubb     | Lagnummer | Divisjon |
    | ------- | --------- | --------- | -------- |
    | 2021    | Gneist IL | 1         | 1        |
    | ------- | --------- | --------- | -------- |
    
    Og klubben Gneist IL med følgende serieresultater fra 2021.12.31:

    | Resultat id | Poeng | Øvelse  | Utøver                   | Stevne       | Prestasjon | Dato       |
    | ----------- | ----- | ------- | ------------------------ | ------------ | ---------- | ---------- |
    | 1           | 959   | 200     | Herman Ellingsen         | 2021         | 21,20      | 2021.06.20 |
    | 2           | 924   | 100     | Herman Ellingsen         | 2021         | 10,69      | 2021.06.20 |
    | 3           | 912   | 400     | Thomas Strønstad-Løseth  | 2021         | 47,65      | 2021.06.20 |
    | 4           | 904   | 1500    | Anders Bjørndal          | 2021         | 3,46,51    | 2021.06.20 |
    | 5           | 903   | 3000    | Anders Bjørndal          | 2021         | 8,10,76    | 2021.06.20 |
    | 6           | 890   | 400h    | Herman Ellingsen         | 2021         | 52,23      | 2021.06.20 |
    | 7           | 885   | 3000    | Philip Massacand         | 2021         | 8,14,45    | 2021.06.20 |
    | 8           | 879   | 110h    | Herman Ellingsen         | 2021         | 14,56      | 2021.06.20 |
    | 9           | 878   | 10000   | Philip Massacand         | 2021         | 29,49,72   | 2021.06.20 |
    | 10          | 870   | 5000    | Jon Sætre                | 2021         | 14,19,00   | 2021.06.20 |
    | 11          | 867   | Lengde  | Gjert Sjursen            | 2021         | 7,19       | 2021.06.20 |
    | 12          | 866   | 200     | Thomas Strønstad-Løseth  | 2021         | 21,95      | 2021.06.20 |
    | 13          | 854   | 5000    | Philip Massacand         | 2021         | 14,25,35   | 2021.06.20 |
    | 14          | 841   | 100     | Gjert Sjursen            | 2021         | 11,00      | 2021.06.20 |
    | 15          | 840   | 400     | Herman Ellingsen         | 2021         | 48,93      | 2021.06.20 |
    | 16          | 834   | 200     | Kristoffer Blücher       | 2021         | 22,23      | 2021.06.20 |
    | 17          | 826   | 100     | Kristoffer Blücher       | 2021         | 11,06      | 2021.06.20 |
    | 18          | 825   | 110h    | Gjert Sjursen            | 2021         | 14,95      | 2021.06.20 |
    | 19          | 813   | 800     | Anders Bjørndal          | 2021         | 1,54,13    | 2021.06.20 |
    | 20          | 811   | 200     | Gjert Sjursen            | 2021         | 22,43      | 2021.06.20 |
    | 21          | 811   | 400     | Kristoffer Blücher       | 2021         | 49,48      | 2021.06.20 |
    | 22          | 801   | 100     | Ole Flatjord             | 2021         | 11,16      | 2021.06.20 |
    | 23          | 795   | 200     | Sindre Strønstad-Løseth  | 2021         | 22,57      | 2021.06.20 |
    | 24          | 793   | Tresteg | Gjert Sjursen            | 2021         | 14,17      | 2021.06.20 |
    | 25          | 792   | 400     | Sindre Strønstad-Løseth  | 2021         | 49,85      | 2021.06.20 |
    | 26          | 777   | 200     | Ole Flatjord             | 2021         | 22,74      | 2021.06.20 |
    | 27          | 768   | 1500    | Hans-Magnus Haukøy       | 2021         | 3,59,26    | 2021.06.20 |
    | 28          | 767   | 3000    | Tobias Allers-Hansen     | 2021         | 8,40,68    | 2021.06.20 |
    | 29          | 764   | 800     | Hans-Magnus Haukøy       | 2021         | 1,56,31    | 2021.06.20 |
    | 30          | 760   | Hut     | Gjert Sjursen            | 2021         | 1,58       | 2021.06.20 |
    | 31          | 756   | 1500    | Philip Massacand         | 2021         | 4,00,43    | 2021.06.20 |
    | 32          | 754   | 400     | Filip Holdhus            | 2021         | 50,59      | 2021.06.20 |
    | 33          | 754   | 1500    | Tobias Allers-Hansen     | 2021         | 4,00,66    | 2021.06.20 |
    | 34          | 753   | 800     | Tobias Allers-Hansen     | 2021         | 1,56,78    | 2021.06.20 |
    | 35          | 752   | 3000H   | Espen Karlsen            | 2021         | 9,30,87    | 2021.06.20 |
    | 36          | 746   | 100     | Sindre Strønstad-Løseth  | 2021         | 11,39      | 2021.06.20 |
    | 37          | 742   | 200     | Filip Holdhus            | 2021         | 23,06      | 2021.06.20 |
    | 38          | 735   | 1500    | André Seliussen          | 2021         | 4,02,74    | 2021.06.20 |
    | 39          | 731   | 5000    | Espen Karlsen            | 2021         | 15,18,45   | 2021.06.20 |
    | 40          | 723   | 5000    | Andreas Størkson         | 2021         | 15,22,22   | 2021.06.20 |
    | 41          | 720   | Stav    | Gjert Sjursen            | 2021         | 4,00       | 2021.06.20 |
    | 42          | 720   | Slegge  | Sondre Kolbjørnsen       | 2021         | 47,58      | 2021.06.20 |
    | 43          | 720   | 100     | Filip Holdhus            | 2021         | 11,50      | 2021.06.20 |
    | 44          | 719   | 3000    | Andreas Størkson         | 2021         | 8,52,26    | 2021.06.20 |
    | 45          | 718   | 3000    | Hans-Magnus Haukøy       | 2021         | 8,52,41    | 2021.06.20 |
    | 46          | 706   | 5000    | André Seliussen          | 2021         | 15,30,23   | 2021.06.20 |
    | 47          | 705   | 400     | Gjert Sjursen            | 2021         | 51,63      | 2021.06.20 |
    | 48          | 705   | Høyde   | Gjert Sjursen            | 2021         | 1,86       | 2021.06.20 |
    | 49          | 705   | Hut     | Herman Ellingsen         | 2021         | 1,53       | 2021.06.20 |
    | 50          | 704   | 3000    | Jon-Anders Haukøy        | 2021         | 8,55,90    | 2021.06.20 |
    | 51          | 700   | Lut     | Jakob Ånonli             | 2021         | 3,05       | 2021.06.20 |
    | 52          | 700   | 1500    | Andreas Størkson         | 2021         | 4,06,55    | 2021.06.20 |
    | 53          | 700   | 3000H   | Tobias Allers-Hansen     | 2021         | 9,46,50    | 2021.06.20 |
    | 54          | 688   | Diskos  | Gjert Sjursen            | 2021         | 40,19      | 2021.06.20 |
    | 55          | 687   | Høyde   | Oscar Ellingsen          | 2021         | 1,84       | 2021.06.20 |
    | 56          | 683   | 800     | Thomas Strønstad-Løseth  | 2021         | 2,00,19    | 2021.06.20 |
    | 57          | 676   | 10000   | Lucas Marechet           | 2021         | 33,05,55   | 2021.06.20 |
    | 58          | 668   | 3000H   | André Seliussen          | 2021         | 9,57,03    | 2021.06.20 |
    | 59          | 659   | 3000    | Lucas Marechet           | 2021         | 9,07,81    | 2021.06.20 |
    | 60          | 654   | 1500    | Jon-Anders Haukøy        | 2021         | 4,12,11    | 2021.06.20 |
    | 61          | 653   | Spyd    | Gjert Sjursen            | 2021         | 51,99      | 2021.06.20 |
    | 62          | 651   | 5000    | Jon-Anders Haukøy        | 2021         | 15,57,16   | 2021.06.20 |
    | 63          | 634   | 800     | Andreas Størkson         | 2021         | 2,02,85    | 2021.06.20 |
    | 64          | 633   | Lut     | Gjert Sjursen            | 2021         | 2,93       | 2021.06.20 |
    | 65          | 628   | 5000    | Tobias Allers-Hansen     | 2021         | 16,09,17   | 2021.06.20 |
    | 66          | 617   | Diskos  | Sondre Kolbjørnsen       | 2021         | 36,42      | 2021.06.20 |
    | 67          | 614   | 800     | Filip Holdhus            | 2021         | 2,04,05    | 2021.06.20 |
    | 68          | 608   | 800     | André Seliussen          | 2021         | 2,04,39    | 2021.06.20 |
    | 69          | 605   | 800     | Jon-Anders Haukøy        | 2021         | 2,04,57    | 2021.06.20 |
    | 70          | 600   | 100     | Torleiv Lygren           | 2021         | 12,05      | 2021.06.20 |
    | 71          | 599   | 200     | Torleiv Lygren           | 2021         | 24,51      | 2021.06.20 |
    | 72          | 589   | Spyd    | Thomas Brattaule         | 2021         | 47,26      | 2021.06.20 |
    | 73          | 587   | 200     | Nicolai Holdhus          | 2021         | 24,64      | 2021.06.20 |
    | 74          | 586   | Kule    | Gjert Sjursen            | 2021         | 11,86      | 2021.06.20 |
    | 75          | 584   | 3000    | Noah Martinsen           | 2021         | 9,29,44    | 2021.06.20 |
    | 76          | 581   | 5000    | Noah Martinsen           | 2021         | 16,33,99   | 2021.06.20 |
    | 77          | 572   | Hut     | Sondre Kolbjørnsen       | 2021         | 1,41       | 2021.06.20 |
    | 78          | 561   | Stav    | Kirill Eikanger          | 2021         | 3,26       | 2021.06.20 |
    | 79          | 561   | Lut     | Sondre Kolbjørnsen       | 2021         | 2,80       | 2021.06.20 |
    | 80          | 552   | 200     | Kristoffer Andreassen    | 2021         | 25,04      | 2021.06.20 |
    | 81          | 550   | 400     | Torleiv Lygren           | 2021         | 55,46      | 2021.06.20 |
    | 82          | 546   | 100     | Kristoffer Andreassen    | 2021         | 12,32      | 2021.06.20 |
    | 83          | 538   | Lut     | Herman Ellingsen         | 2021         | 2,76       | 2021.06.20 |
    | 84          | 526   | 800     | Philip Massacand         | 2021         | 2,09,88    | 2021.06.20 |
    | 85          | 513   | 3000    | Bjarte Eikanger          | 2021         | 9,52,21    | 2021.06.20 |
    | 86          | 512   | 1500    | Noah Martinsen           | 2021         | 4,32,01    | 2021.06.20 |
    | 87          | 487   | 800     | Noah Martinsen           | 2021         | 2,12,76    | 2021.06.20 |
    | 88          | 484   | 1500    | Tord Andresen            | 2021         | 4,36,57    | 2021.06.20 |
    | 89          | 483   | 1500    | Didrik Hatlelid          | 2021         | 4,36,63    | 2021.06.20 |
    | 90          | 474   | 800     | Nicolai Holdhus          | 2021         | 2,13,83    | 2021.06.20 |
    | 91          | 474   | Kule    | Sondre Kolbjørnsen       | 2021         | 10,33      | 2021.06.20 |
    | 92          | 467   | 200h    | Peter Bjørndal           | 2021         | 30,53      | 2021.06.20 |
    | 93          | 462   | 400     | Trygve Havro             | 2021         | 58,18      | 2021.06.20 |
    | 94          | 454   | 3000    | Tord Andresen            | 2021         | 10,12,51   | 2021.06.20 |
    | 95          | 452   | 1500    | Sondre Haukanes          | 2021         | 4,41,83    | 2021.06.20 |
    | 96          | 452   | 3000    | Sondre Haukanes          | 2021         | 10,13,2    | 2021.06.20 |
    | 97          | 425   | 800     | Didrik Hatlelid          | 2021         | 2,17,83    | 2021.06.20 |
    | 98          | 423   | 200     | Peter Bjørndal           | 2021         | 26,71      | 2021.06.20 |
    | 99          | 413   | 1500    | Trygve Havro             | 2021         | 4,48,58    | 2021.06.20 |
    | 100         | 413   | 100     | Trygve Havro             | 2021         | 13,04      | 2021.06.20 |
    | 101         | 402   | 400     | Thorben Bücker           | 2021         | 1,00,27    | 2021.06.20 |
    | 102         | 382   | 1500    | Gjert Sjursen            | 2021         | 4,54,31    | 2021.06.20 |
    | 103         | 373   | Spyd    | Hans-Magnus Haukøy       | 2021         | 32,61      | 2021.06.20 |
    | 104         | 354   | Spyd    | Thomas Ødegaard          | 2021         | 31,42      | 2021.06.20 |
    | 105         | 345   | 1500    | Daniel Wasbø             | 2021         | 5,01,21    | 2021.06.20 |
    | 106         | 341   | 200     | Sondre Haukanes          | 2021         | 27,93      | 2021.06.20 |
    | 107         | 326   | Spyd    | Herman Ellingsen         | 2021         | 29,76      | 2021.06.20 |
    | 108         | 295   | Spyd    | Sondre Kolbjørnsen       | 2021         | 27,96      | 2021.06.20 |
    | 109         | 295   | 200     | Heine Strønstad-Løseth   | 2021         | 28,68      | 2021.06.20 |
    | 110         | 295   | 200     | Kirill Eikanger          | 2021         | 28,68      | 2021.06.20 |
    | 111         | 275   | Kule    | Hans-Magnus Haukøy       | 2021         | 7,79       | 2021.06.20 |
    | 112         | 270   | Høyde   | Oskar Trumpy             | 2021         | 1,43       | 2021.06.20 |
    | 113         | 266   | Stav    | Sondre Haukanes          | 2021         | 2,20       | 2021.06.20 |
    | 114         | 256   | Kule    | Bjarne Kleivane          | 2021         | 7,56       | 2021.06.20 |
    | 115         | 255   | Kule    | Thomas Ødegaard          | 2021         | 7,54       | 2021.06.20 |
    | 116         | 242   | Kule    | Thomas Strønstad-Løseth  | 2021         | 7,39       | 2021.06.20 |
    | 117         | 240   | Lengde  | Trygve Havro             | 2021         | 4,47       | 2021.06.20 |
    | 118         | 234   | 200     | Oskar Trumpy             | 2021         | 29,72      | 2021.06.20 |
    | 119         | 233   | Kule    | Andreas Størkson         | 2021         | 7,29       | 2021.06.20 |
    | 120         | 220   | 200     | Jacob Heggland           | 2021         | 29,97      | 2021.06.20 |
    | 121         | 214   | 200     | Daniel Wasbø             | 2021         | 30,08      | 2021.06.20 |
    | 122         | 208   | Spyd    | Thomas Strønstad-Løseth  | 2021         | 23,24      | 2021.06.20 |
    | 123         | 200   | Lut     | Trygve Havro             | 2021         | 2,32       | 2021.06.20 |
    | 124         | 176   | Spyd    | Tobias Allers-Hansen     | 2021         | 21,66      | 2021.06.20 |
    | 125         | 167   | 1500    | Marius Endresen          | 2021         | 5,40,68    | 2021.06.20 |
    | 126         | 163   | Kule    | Sindre Strønstad-Løseth  | 2021         | 6,49       | 2021.06.20 |
    | 127         | 139   | 200     | Andreas Vold             | 2021         | 31,49      | 2021.06.20 |
    | 128         | 110   | Lut     | Oskar Trumpy             | 2021         | 2,23       | 2021.06.20 |
    | 129         | 90    | Lut     | Sondre Haukanes          | 2021         | 2,21       | 2021.06.20 |
    | 130         | 80    | Hut     | Trygve Havro             | 2021         | 1,10       | 2021.06.20 |
    | 131         | 78    | Kule    | Trygve Havro             | 2021         | 5,58       | 2021.06.20 |
    | 132         | 60    | Kule    | Tobias Allers-Hansen     | 2021         | 5,39       | 2021.06.20 |
    | 133         | 45    | 100     | Henrik Abrahamsen        | 2021         | 15,68      | 2021.06.20 |
    | 134         | 37    | Diskos  | Andreas Størkson         | 2021         | 14,08      | 2021.06.20 |
    | 135         | 26    | Lengde  | Henrik Abrahamsen        | 2021         | 3,65       | 2021.06.20 |
    | 136         | 19    | Høyde   | Kirill Eikanger          | 2021         | 1,25       | 2021.06.20 |
    | 137         | 18    | 200     | Aksel Larsen             | 2021         | 34,01      | 2021.06.20 |
    | ----------- | ----- | ------- | ------------------------ | ------------ | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2021 og uttrekksdato 2021.12.31

    Så skal batchen bruke under 20 sekunder
    
    Og Gneist IL sitt 1. lag få følgende laginfo serien 2021 på dato 2021.12.31:

    | Poeng |
    | ----- |
    | 24422 |
    | ----- |

    Og Gneist IL sitt 1. lag få følgende lagresultater serien 2021 på dato 2021.12.31:

    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 2          | OBLIGATORISK     |
    | 1          | OBLIGATORISK     |
    | 3          | OBLIGATORISK     |
    | 19         | OBLIGATORISK     |
    | 4          | OBLIGATORISK     |
    | 35         | OBLIGATORISK     |
    | 10         | OBLIGATORISK     |
    | 9          | OBLIGATORISK     |
    | 8          | OBLIGATORISK     |
    | 6          | OBLIGATORISK     |
    | 48         | OBLIGATORISK     |
    | 41         | OBLIGATORISK     |
    | 11         | OBLIGATORISK     |
    | 24         | OBLIGATORISK     |
    | 42         | OBLIGATORISK     |
    | 5          | VALGFRI          |
    | 7          | VALGFRI          |
    | 12         | VALGFRI          |
    | 13         | VALGFRI          |
    | 16         | VALGFRI          |
    | 17         | VALGFRI          |
    | 21         | VALGFRI          |
    | 22         | VALGFRI          |
    | 23         | VALGFRI          |
    | 25         | VALGFRI          |
    | 30         | VALGFRI          |
    | 49         | VALGFRI          |
    | 51         | VALGFRI          |
    | 55         | VALGFRI          |
    | 66         | VALGFRI          |
    | ---------- | ---------------- |

Scenario: Serien 2021 menn - Ås IL

    Gitt følgende serieøvelser:

    | Serieår | Øvelse  | Er obligatorisk | Er teknisk | Prioritet |
    | ------- | ------- | --------------- | ---------- | --------- |
    | 2021    | 100     | Ja              | Nei        | 1         |
    | 2021    | 200     | Ja              | Nei        | 2         |
    | 2021    | 400     | Ja              | Nei        | 3         |
    | 2021    | 800     | Ja              | Nei        | 4         |
    | 2021    | 1500    | Ja              | Nei        | 5         |
    | 2021    | 3000    | Nei             | Nei        | 6         |
    | 2021    | 3000H   | Ja              | Nei        | 7         |
    | 2021    | 5000    | Ja              | Nei        | 8         |
    | 2021    | 10000   | Ja              | Nei        | 9         |
    | 2021    | 110h    | Ja              | Nei        | 10        |
    | 2021    | 200h    | Nei             | Nei        | 11        |
    | 2021    | 400h    | Ja              | Nei        | 12        |
    | 2021    | 3000K   | Nei             | Nei        | 13        |
    | 2021    | 5000K   | Ja              | Nei        | 14        |
    | 2021    | 10000K  | Ja              | Nei        | 15        |
    | 2021    | 20000K  | Nei             | Nei        | 16        |
    | 2021    | Høyde   | Ja              | Ja         | 17        |
    | 2021    | Hut     | Nei             | Ja         | 18        |
    | 2021    | Stav    | Ja              | Ja         | 19        |
    | 2021    | Lengde  | Ja              | Ja         | 20        |
    | 2021    | Lut     | Nei             | Ja         | 21        |
    | 2021    | Tresteg | Ja              | Ja         | 22        |
    | 2021    | Kule    | Ja              | Ja         | 23        |
    | 2021    | Diskos  | Ja              | Ja         | 24        |
    | 2021    | Slegge  | Ja              | Ja         | 25        |
    | 2021    | Spyd    | Ja              | Ja         | 26        |
    | ------- | ------- | --------------- | ---------- | --------- |

    Og følgende topplag:
    
    | Serieår | Klubb     | Lagnummer | Divisjon |
    | ------- | --------- | --------- | -------- |
    | 2021    | Ås IL     | 1         | 2        |
    | ------- | --------- | --------- | -------- |
    
    Og klubben Ås IL med følgende serieresultater fra 2021.12.31:

    | Resultat id | Poeng | Øvelse  | Utøver               | Stevne       | Prestasjon | Dato       |
    | ----------- | ----- | ------- | -------------------- | ------------ | ---------- | ---------- |
    | 1           | 984   | 800     | Ole Solbu            | 2021         | 1,47,61    | 2021.06.20 |
    | 2           | 885   | 1500    | Ole Solbu            | 2021         | 3,48,12    | 2021.06.20 |
    | 3           | 828   | 400     | Ole Solbu            | 2021         | 49,15      | 2021.06.20 |
    | 4           | 717   | 400     | Simen Hansen         | 2021         | 51,37      | 2021.06.20 |
    | 5           | 716   | 200     | Simen Hansen         | 2021         | 23,31      | 2021.06.20 |
    | 6           | 711   | 200h    | Simen Hansen         | 2021         | 26,31      | 2021.06.20 |
    | 7           | 694   | Lengde  | Simen Hansen         | 2021         | 6,39       | 2021.06.20 |
    | 8           | 691   | 400h    | Simen Hansen         | 2021         | 57,53      | 2021.06.20 |
    | 9           | 689   | 1500    | Nils Tveite          | 2021         | 4,07,82    | 2021.06.20 |
    | 10          | 681   | 110h    | Simen Hansen         | 2021         | 16,20      | 2021.06.20 |
    | 11          | 645   | Diskos  | Simen Hansen         | 2021         | 37,87      | 2021.06.20 |
    | 12          | 636   | 100     | Simen Hansen         | 2021         | 11,88      | 2021.06.20 |
    | 13          | 604   | Tresteg | Simen Hansen         | 2021         | 12,40      | 2021.06.20 |
    | 14          | 597   | Stav    | Simen Hansen         | 2021         | 3,42       | 2021.06.20 |
    | 15          | 589   | Spyd    | Simen Hansen         | 2021         | 47,24      | 2021.06.20 |
    | 16          | 555   | Kule    | Simen Hansen         | 2021         | 11,43      | 2021.06.20 |
    | 17          | 541   | Høyde   | Simen Hansen         | 2021         | 1,68       | 2021.06.20 |
    | 18          | 535   | 400     | Andreas Benoni       | 2021         | 55,89      | 2021.06.20 |
    | 19          | 528   | 200h    | Mikkel Finnbråten    | 2021         | 29,33      | 2021.06.20 |
    | 20          | 527   | 200     | Mikkel Finnbråten    | 2021         | 25,35      | 2021.06.20 |
    | 21          | 514   | 400     | Mikkel Finnbråten    | 2021         | 56,54      | 2021.06.20 |
    | 22          | 513   | 200     | Andreas Benoni       | 2021         | 25,51      | 2021.06.20 |
    | 23          | 509   | 100     | Oskar Platzack       | 2021         | 12,51      | 2021.06.20 |
    | 24          | 484   | 400h    | Mikkel Finnbråten    | 2021         | 1,06,36    | 2021.06.20 |
    | 25          | 477   | 3000    | Anders Treekrem      | 2021         | 10,04,58   | 2021.06.20 |
    | 26          | 476   | 5000    | Karl Lilleheier      | 2021         | 17,35,39   | 2021.06.20 |
    | 27          | 470   | 3000    | Karl Lilleheier      | 2021         | 10,06,84   | 2021.06.20 |
    | 28          | 468   | 100     | Andreas Benoni       | 2021         | 12,73      | 2021.06.20 |
    | 29          | 458   | 1500    | Simen Hansen         | 2021         | 4,40,81    | 2021.06.20 |
    | 30          | 427   | Kule    | Lars Nygaard         | 2021         | 9,70       | 2021.06.20 |
    | 31          | 396   | Kule    | Kristian Seiersten   | 2021         | 9,29       | 2021.06.20 |
    | 32          | 325   | Kule    | Andreas Benoni       | 2021         | 8,39       | 2021.06.20 |
    | 33          | 318   | Tresteg | Mikkel Finnbråten    | 2021         | 9,90       | 2021.06.20 |
    | 34          | 313   | 3000    | Jon Strandrud        | 2021         | 11,09,09   | 2021.06.20 |
    | 35          | 310   | 3000    | Kristian Seiersten   | 2021         | 11,10,44   | 2021.06.20 |
    | 36          | 303   | 5000    | Jon-Vidar Gaustad    | 2021         | 19,37,80   | 2021.06.20 |
    | 37          | 299   | 200     | Sivert Haugli-Onstad | 2021         | 28,60      | 2021.06.20 |
    | 38          | 280   | 3000    | Leif Skagemo         | 2021         | 11,24,16   | 2021.06.20 |
    | 39          | 270   | 3000    | Jon-Vidar Gaustad    | 2021         | 11,28,86   | 2021.06.20 |
    | 40          | 234   | 200     | Fredrik Henriksen    | 2021         | 29,72      | 2021.06.20 |
    | 41          | 224   | 3000    | Hans Overvoll        | 2021         | 11,51,70   | 2021.06.20 |
    | 42          | 215   | Lengde  | Martin Gjuvsland     | 2021         | 4,37       | 2021.06.20 |
    | 43          | 211   | 3000    | Peter Øyen-Havekes   | 2021         | 11,58,45   | 2021.06.20 |
    | 44          | 207   | Høyde   | Fredrik Henriksen    | 2021         | 1,38       | 2021.06.20 |
    | 45          | 182   | 200     | Martin Gjuvsland     | 2021         | 30,67      | 2021.06.20 |
    | 46          | 170   | Lut     | Asle Benoni          | 2021         | 2,29       | 2021.06.20 |
    | 47          | 118   | 200h    | Anders Lileng        | 2021         | 38,38      | 2021.06.20 |
    | 48          | 96    | Høyde   | Sivert Haugli-Onstad | 2021         | 1,30       | 2021.06.20 |
    | 49          | 44    | 800     | Sivert Haugli-Onstad | 2021         | 2,59,06    | 2021.06.20 |
    | 50          | 18    | 800     | Gunnar Bjerva        | 2021         | 3,02,29    | 2021.06.20 |
    | ----------- | ----- | ------- | -------------------- | ------------ | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2021 og uttrekksdato 2021.12.31

    Så skal batchen bruke under 20 sekunder
    
    Og Ås IL sitt 1. lag få følgende laginfo serien 2021 på dato 2021.12.31:

    | Poeng |
    | ----- |
    | 13789 |
    | ----- |

    Og Ås IL sitt 1. lag få følgende lagresultater serien 2021 på dato 2021.12.31:

    | Resultat   | Oppstillingstype |
    | ---------- | ---------------- |
    | 23         | OBLIGATORISK     |
    | 20         | OBLIGATORISK     |
    | 3          | OBLIGATORISK     |
    | 1          | OBLIGATORISK     |
    | 2          | OBLIGATORISK     |
    | 26         | OBLIGATORISK     |
    | 10         | OBLIGATORISK     |
    | 24         | OBLIGATORISK     |
    | 11         | OBLIGATORISK     |
    | 30         | OBLIGATORISK     |
    | 13         | OBLIGATORISK     |
    | 7          | OBLIGATORISK     |
    | 14         | OBLIGATORISK     |
    | 9          | VALGFRI          |
    | 18         | VALGFRI          |
    | 19         | VALGFRI          |
    | 21         | VALGFRI          |
    | 22         | VALGFRI          |
    | 25         | VALGFRI          |
    | 27         | VALGFRI          |
    | 28         | VALGFRI          |
    | 31         | VALGFRI          |
    | 32         | VALGFRI          |
    | 33         | VALGFRI          |
    | 42         | VALGFRI          |
    | ---------- | ---------------- |