Feature: Smoketest - Lagserien 2021 menn

Scenario: Tabellen for menn serieåret 2021 skal være som forventet

    Gitt følgende serier:
    
    | Serieår | Fra og med | Til og med |
    | ------- | ---------- | ---------- |
    | 2021    | 2020.10.01 | 2021.12.31 |
    | ------- | ---------- | ---------- |
    
    Og følgende oppstillingskrav:
    
    | Serieår | Divisjon | Antall obligatoriske | Antall valgfri | Maks obligatoriske løp | Maks valgfri løp | Maks resultater per utøver |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    | 2021    | 1        | 15                   | 15             | 15                     | 10               | 5                          |
    | 2021    | 2        | 13                   | 12             | 13                     | 8                | 5                          |
    | 2021    | 3        | 12                   | 8              | 12                     | 6                | 5                          |
    | ------- | -------- | -------------------- | -------------- | ---------------------- | ---------------- | -------------------------- |
    
    Og følgende topplag:
    
    | Serieår | Klubb                     | Lagnummer | Divisjon |
    | ------- | ------------------------- | --------- | -------- |
    | 2021    | IK Tjalve                 | 1         | 1        |
    | 2021    | Sandnes IL                | 1         | 1        |
    | 2021    | IL Gneist                 | 1         | 1        |
    | 2021    | IL Tyrving                | 1         | 1        |
    | 2021    | Tønsberg Friidrettsklubb  | 1         | 1        |
    | 2021    | Norna-Salhus IL           | 1         | 1        |
    | 2021    | IL i BUL                  | 1         | 1        |
    | 2021    | Stord Idrettslag          | 1         | 1        |
    | 2021    | Nittedal IL               | 1         | 1        |
    | 2021    | Ullensaker/Kisa IL        | 1         | 1        |
    | 2021    | IK Tjalve                 | 2         | 1        |
    | 2021    | Dimna IL                  | 1         | 1        |
    | 2021    | Fana IL                   | 1         | 1        |
    | 2021    | Sportsklubben Vidar       | 1         | 1        |
    | 2021    | IL Gular                  | 1         | 2        |
    | 2021    | Idrettslaget Skjalg       | 1         | 2        |
    | 2021    | Steinkjer Friidrettsklubb | 1         | 2        |
    | 2021    | Ask Friidrett             | 1         | 2        |
    | 2021    | Osterøy IL                | 1         | 2        |
    | 2021    | Ranheim IL                | 1         | 2        |
    | 2021    | IL Fri                    | 1         | 2        |
    | 2021    | Bækkelagets SK            | 1         | 2        |
    | 2021    | IF Sturla                 | 1         | 2        |
    | 2021    | Haugesund IL              | 1         | 2        |
    | 2021    | Gloppen Friidrettslag     | 1         | 2        |
    | 2021    | Ås IL                     | 1         | 2        |
    | 2021    | Sandnes IL                | 2         | 2        |
    | 2021    | Sarpsborg IL              | 1         | 2        |
    | ------- | ------------------------- | --------- | -------- |

    Og følgende serieøvelser:

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
    
    Og følgende serieresultater fra 2021.12.31:
    
    | Klubb                         | Resultat id | Poeng | Øvelse  | Utøver                           | Stevne                 | Prestasjon | Dato       |
    | ----------------------------- | ----------- | ----- | ------- | -------------------------------- | ---------------------- | ---------- | ---------- |
    | Adamstuen Løpeklubb           | 1           | 307   | 5000    | Bjørn Hanssen                    | Oslo/Bi                | 19,34,42   | 2021.09.25 |
    | Adamstuen Løpeklubb           | 2           | 259   | 10000   | Bjørn Hanssen                    | Oslo/Bi                | 43,12,19   | 2021.09.25 |
    | Almenning IL                  | 3           | 273   | 200     | Joachim Solibakke                | Ørsta                  | 29,04      | 2021.10.07 |
    | Almenning IL                  | 4           | 224   | 100     | Joachim Solibakke                | Ørsta                  | 14,26      | 2021.10.07 |
    | Alsvåg Idrettslag             | 5           | 501   | 5000    | Petter Wangberg                  | Bodø                   | 17,19,54   | 2021.09.21 |
    | Alta IF                       | 6           | 640   | 3000    | Mats Håpnes                      | Trondheim              | 9,13,19    | 2021.09.28 |
    | Alta IF                       | 7           | 398   | Lengde  | Markus Posti                     | Alta                   | 5,11       | 2021.08.22 |
    | Alta IF                       | 8           | 347   | 200     | Eivind Berg                      | Alta                   | 27,83      | 2021.08.22 |
    | Alta IF                       | 9           | 326   | 100     | Eivind Berg                      | Alta                   | 13,57      | 2021.08.22 |
    | Alta IF                       | 10          | 200   | 200     | Ante Fiksen                      | Alta                   | 30,33      | 2021.08.22 |
    | Andebu IL                     | 11          | 634   | 3000    | Lars Vike                        | Jessheim               | 9,14,69    | 2021.09.09 |
    | Andebu IL                     | 12          | 551   | 1500    | Lars Vike                        | Larvik                 | 4,26,11    | 2021.09.15 |
    | Aremark IF                    | 13          | 799   | Lengde  | Christian Thomassen              | Trondheim              | 6,87       | 2021.09.28 |
    | Aremark IF                    | 14          | 794   | Tresteg | Christian Thomassen              | Ravnanger              | 14,18      | 2021.09.15 |
    | Aremark IF                    | 15          | 762   | Slegge  | Håkon Hansesæter                 | Greveskogen            | 50,80      | 2021.10.30 |
    | Aremark IF                    | 16          | 753   | Diskos  | Håkon Hansesæter                 | Aremark                | 43,82      | 2021.09.08 |
    | Aremark IF                    | 17          | 661   | Høyde   | Christian Thomassen              | Moss                   | 1,81       | 2021.10.09 |
    | Aremark IF                    | 18          | 652   | Høyde   | Håkon Hansesæter                 | Greveskogen            | 1,80       | 2021.10.30 |
    | Aremark IF                    | 19          | 615   | 100     | Håkon Hansesæter                 | Greveskogen            | 11,98      | 2021.10.30 |
    | Aremark IF                    | 20          | 594   | Lut     | Håkon Hansesæter                 | Aremark                | 2,86       | 2021.09.08 |
    | Aremark IF                    | 21          | 553   | Slegge  | Bjørn Sande                      | Aremark                | 35,84      | 2021.09.08 |
    | Aremark IF                    | 22          | 500   | Stav    | Håkon Hansesæter                 | Moss                   | 3,00       | 2021.10.09 |
    | Aremark IF                    | 23          | 487   | Spyd    | Håkon Hansesæter                 | Greveskogen            | 40,04      | 2021.10.30 |
    | Aremark IF                    | 24          | 463   | Diskos  | Bjørn Sande                      | Aremark                | 29,38      | 2021.09.08 |
    | Aremark IF                    | 25          | 382   | Kule    | Bjørn Sande                      | Aremark                | 9,12       | 2021.09.08 |
    | Aremark IF                    | 26          | 119   | 1500    | Håkon Hansesæter                 | Greveskogen            | 5,53,10    | 2021.10.30 |
    | Ask Friidrett                 | 27          | 881   | 100     | Daniel Johnsen                   | Lillehammer            | 10,85      | 2021.09.26 |
    | Ask Friidrett                 | 28          | 871   | 200     | Daniel Johnsen                   | Lillehammer            | 21,91      | 2021.09.26 |
    | Ask Friidrett                 | 29          | 868   | 3000    | Marius Sørli                     | Fana                   | 8,18,08    | 2021.09.28 |
    | Ask Friidrett                 | 30          | 859   | 10000   | Marius Sørli                     | Kristiansand           | 30,06,03   | 2021.10.06 |
    | Ask Friidrett                 | 31          | 854   | 5000    | Marius Sørli                     | Greveskogen            | 14,25,28   | 2021.10.30 |
    | Ask Friidrett                 | 32          | 786   | Diskos  | Erlend Næss                      | Bergen                 | 45,73      | 2021.10.30 |
    | Ask Friidrett                 | 33          | 755   | 1500    | Marius Sørli                     | Ravnanger              | 4,00,58    | 2021.09.15 |
    | Ask Friidrett                 | 34          | 727   | Slegge  | Erlend Næss                      | Ravnanger              | 48,13      | 2021.09.15 |
    | Ask Friidrett                 | 35          | 722   | Lut     | Elias Bergheim                   | Askøy                  | 3,09       | 2021.03.18 |
    | Ask Friidrett                 | 36          | 721   | 400     | Jon-Henning Hilleren             | Fana                   | 51,28      | 2021.09.28 |
    | Ask Friidrett                 | 37          | 716   | 200     | Elias Bergheim                   | Leikvang               | 23,31      | 2021.08.29 |
    | Ask Friidrett                 | 38          | 701   | 200     | Jon-Henning Hilleren             | Leirvik                | 23,46      | 2021.09.13 |
    | Ask Friidrett                 | 39          | 693   | 400     | Elias Bergheim                   | Trondheim              | 51,88      | 2021.09.28 |
    | Ask Friidrett                 | 40          | 689   | 800     | Jon-Henning Hilleren             | Fana                   | 1,59,92    | 2021.09.28 |
    | Ask Friidrett                 | 41          | 684   | 100     | Elias Bergheim                   | Leikvang               | 11,66      | 2021.08.29 |
    | Ask Friidrett                 | 42          | 683   | Lut     | Daniel Johnsen                   | Askøy                  | 3,02       | 2021.03.18 |
    | Ask Friidrett                 | 43          | 682   | Kule    | Erlend Næss                      | Ravnanger              | 13,22      | 2021.09.15 |
    | Ask Friidrett                 | 44          | 675   | 3000    | Markus Heggøy                    | Trondheim              | 9,03,52    | 2021.09.28 |
    | Ask Friidrett                 | 45          | 673   | 100     | Jon-Henning Hilleren             | Leirvik                | 11,71      | 2021.09.13 |
    | Ask Friidrett                 | 46          | 648   | 1500    | Johannes Sture                   | Fana                   | 4,12,85    | 2021.09.28 |
    | Ask Friidrett                 | 47          | 645   | 200     | Magnus Farestveit                | Leikvang               | 24,02      | 2021.08.29 |
    | Ask Friidrett                 | 48          | 643   | 3000    | Kristoffer Johnson               | Osterøy                | 9,12,15    | 2021.10.24 |
    | Ask Friidrett                 | 49          | 636   | 800     | Kristoffer Johnson               | Ravnanger              | 2,02,75    | 2021.09.15 |
    | Ask Friidrett                 | 50          | 630   | 1500    | Kristoffer Johnson               | Arna                   | 4,15,16    | 2021.10.13 |
    | Ask Friidrett                 | 51          | 629   | 800     | Johannes Sture                   | Fana                   | 2,03,17    | 2021.09.28 |
    | Ask Friidrett                 | 52          | 605   | Hut     | Jesper Jensen                    | Askøy                  | 1,44       | 2021.03.18 |
    | Ask Friidrett                 | 53          | 605   | Hut     | Elias Bergheim                   | Askøy                  | 1,44       | 2021.03.18 |
    | Ask Friidrett                 | 54          | 603   | 800     | Sigve Lillebø                    | Os                     | 2,04,69    | 2021.09.26 |
    | Ask Friidrett                 | 55          | 599   | 1500    | Mats Johnsen                     | Arna                   | 4,19,24    | 2021.10.13 |
    | Ask Friidrett                 | 56          | 599   | 1500    | Markus Heggøy                    | Fana                   | 4,19,35    | 2021.09.28 |
    | Ask Friidrett                 | 57          | 598   | 200     | Sander Armond                    | Fana                   | 24,52      | 2021.09.28 |
    | Ask Friidrett                 | 58          | 597   | 3000    | Johannes Sture                   | Trondheim              | 9,25,31    | 2021.09.28 |
    | Ask Friidrett                 | 59          | 590   | 100     | Magnus Farestveit                | Os                     | 12,10      | 2021.09.26 |
    | Ask Friidrett                 | 60          | 588   | 800     | Markus Heggøy                    | Trondheim              | 2,05,62    | 2021.09.28 |
    | Ask Friidrett                 | 61          | 586   | 100     | Sander Armond                    | Os                     | 12,12      | 2021.09.26 |
    | Ask Friidrett                 | 62          | 585   | 400     | Magnus Farestveit                | Arna                   | 54,49      | 2021.10.13 |
    | Ask Friidrett                 | 63          | 579   | 200     | Sigve Lillebø                    | Leikvang               | 24,74      | 2021.08.29 |
    | Ask Friidrett                 | 64          | 573   | 200     | Jesper Jensen                    | Ravnanger              | 24,80      | 2021.09.15 |
    | Ask Friidrett                 | 65          | 572   | 100     | Jesper Jensen                    | Ravnanger              | 12,19      | 2021.09.15 |
    | Ask Friidrett                 | 66          | 565   | 800     | Mats Johnsen                     | Fana                   | 2,07,17    | 2021.09.28 |
    | Ask Friidrett                 | 67          | 564   | 3000    | Brynjel Berland                  | Ravnanger              | 9,35,45    | 2021.09.15 |
    | Ask Friidrett                 | 68          | 553   | 1500    | Imre Opdahl                      | Os                     | 4,25,89    | 2021.09.26 |
    | Ask Friidrett                 | 69          | 552   | 3000    | Mats Johnsen                     | Osterøy                | 9,39,3     | 2021.10.24 |
    | Ask Friidrett                 | 70          | 548   | 100     | Sigve Lillebø                    | Trondheim              | 12,31      | 2021.09.28 |
    | Ask Friidrett                 | 71          | 534   | 400     | Sander Armond                    | Arna                   | 55,94      | 2021.10.13 |
    | Ask Friidrett                 | 72          | 522   | 200h    | Jesper Jensen                    | Ravnanger              | 29,45      | 2021.09.15 |
    | Ask Friidrett                 | 73          | 513   | 400     | Sigve Lillebø                    | Arna                   | 56,57      | 2021.10.13 |
    | Ask Friidrett                 | 74          | 511   | Høyde   | Henrik Aanderud                  | Ravnanger              | 1,65       | 2021.09.15 |
    | Ask Friidrett                 | 75          | 499   | 3000    | Remy Furevik                     | Osterøy                | 9,56,71    | 2021.10.24 |
    | Ask Friidrett                 | 76          | 497   | 200     | Johannes Sture                   | Leikvang               | 25,71      | 2021.08.29 |
    | Ask Friidrett                 | 77          | 491   | 400     | Johannes Sture                   | Arna                   | 57,24      | 2021.10.13 |
    | Ask Friidrett                 | 78          | 486   | 800     | Imre Opdahl                      | Os                     | 2,12,86    | 2021.09.26 |
    | Ask Friidrett                 | 79          | 462   | 200h    | Magnus Farestveit                | Ravnanger              | 30,63      | 2021.09.15 |
    | Ask Friidrett                 | 80          | 461   | Høyde   | Jesper Jensen                    | Ravnanger              | 1,60       | 2021.09.15 |
    | Ask Friidrett                 | 81          | 453   | Lut     | Jesper Jensen                    | Askøy                  | 2,62       | 2021.03.18 |
    | Ask Friidrett                 | 82          | 428   | 3000    | Oddvar Moldestad                 | Osterøy                | 10,22,38   | 2021.10.24 |
    | Ask Friidrett                 | 83          | 426   | Tresteg | Jesper Jensen                    | Ravnanger              | 10,82      | 2021.09.15 |
    | Ask Friidrett                 | 84          | 416   | Spyd    | Erlend Næss                      | Bergen                 | 35,31      | 2021.10.30 |
    | Ask Friidrett                 | 85          | 412   | Lut     | Sander Armond                    | Askøy                  | 2,56       | 2021.03.18 |
    | Ask Friidrett                 | 86          | 408   | 200h    | Fredrik Johnsen                  | Ravnanger              | 31,73      | 2021.09.15 |
    | Ask Friidrett                 | 87          | 405   | Lut     | Magnus Farestveit                | Askøy                  | 2,55       | 2021.03.18 |
    | Ask Friidrett                 | 88          | 396   | Lengde  | Daniel Johnsen                   | Ravnanger              | 5,10       | 2021.09.15 |
    | Ask Friidrett                 | 89          | 377   | 200h    | Johannes Sture                   | Ravnanger              | 32,37      | 2021.09.15 |
    | Ask Friidrett                 | 90          | 376   | 200h    | Henrik Aanderud                  | Ravnanger              | 32,39      | 2021.09.15 |
    | Ask Friidrett                 | 91          | 367   | Hut     | Daniel Johnsen                   | Askøy                  | 1,25       | 2021.03.18 |
    | Ask Friidrett                 | 92          | 359   | Lut     | Jon-Henning Hilleren             | Askøy                  | 2,49       | 2021.03.18 |
    | Ask Friidrett                 | 93          | 333   | Lut     | Henrik Aanderud                  | Askøy                  | 2,46       | 2021.03.18 |
    | Ask Friidrett                 | 94          | 322   | 1500    | Christer Vonheim                 | Ravnanger              | 5,05,87    | 2021.09.15 |
    | Ask Friidrett                 | 95          | 321   | 3000    | Åsmund Skålevik                  | Osterøy                | 11,05,54   | 2021.10.24 |
    | Ask Friidrett                 | 96          | 301   | 1500    | Åsmund Skålevik                  | Ravnanger              | 5,09,94    | 2021.09.15 |
    | Ask Friidrett                 | 97          | 289   | 200     | Tobias Natland                   | Ravnanger              | 28,77      | 2021.09.15 |
    | Ask Friidrett                 | 98          | 286   | Tresteg | Henrik Aanderud                  | Ravnanger              | 9,63       | 2021.09.15 |
    | Ask Friidrett                 | 99          | 278   | Hut     | Magnus Farestveit                | Askøy                  | 1,20       | 2021.03.18 |
    | Ask Friidrett                 | 100         | 252   | 200     | Oskar Natland                    | Ravnanger              | 29,40      | 2021.09.15 |
    | Ask Friidrett                 | 101         | 240   | Hut     | Jon-Henning Hilleren             | Askøy                  | 1,18       | 2021.03.18 |
    | Ask Friidrett                 | 102         | 233   | Høyde   | Fredrik Johnsen                  | Ravnanger              | 1,40       | 2021.09.15 |
    | Ask Friidrett                 | 103         | 221   | 200     | Hector Breivik                   | Os                     | 29,96      | 2021.09.26 |
    | Ask Friidrett                 | 104         | 205   | 3000    | Jan-Olav Hilleren                | Ravnanger              | 12,01,94   | 2021.09.15 |
    | Ask Friidrett                 | 105         | 203   | 100     | Bjørn Fluge                      | Ravnanger              | 14,41      | 2021.09.15 |
    | Ask Friidrett                 | 106         | 195   | Kule    | Jesper Jensen                    | Ravnanger              | 6,85       | 2021.09.15 |
    | Ask Friidrett                 | 107         | 188   | 200     | Brede Bergheim                   | Leikvang               | 30,55      | 2021.08.29 |
    | Ask Friidrett                 | 108         | 155   | 100     | Brede Bergheim                   | Leikvang               | 14,78      | 2021.08.29 |
    | Ask Friidrett                 | 109         | 135   | 200     | Jan-Olav Hilleren                | Leirvik                | 31,58      | 2021.09.13 |
    | Ask Friidrett                 | 110         | 80    | Hut     | Henrik Aanderud                  | Askøy                  | 1,10       | 2021.03.18 |
    | Ask Friidrett                 | 111         | 66    | Høyde   | Jan-Olav Hilleren                | Ravnanger              | 1,28       | 2021.09.15 |
    | Asker Sk. Friidrett           | 112         | 781   | Tresteg | Sondre Jahren                    | Oslo/Bi                | 14,05      | 2021.09.25 |
    | Asker Sk. Friidrett           | 113         | 775   | Diskos  | Vebjørn Skre                     | Kristiansand           | 45,07      | 2021.10.06 |
    | Asker Sk. Friidrett           | 114         | 769   | Lengde  | Sondre Jahren                    | Oslo/Bi                | 6,73       | 2021.09.25 |
    | Asker Sk. Friidrett           | 115         | 750   | Lut     | Vebjørn Skre                     | Bærum                  | 3,14       | 2021.10.25 |
    | Asker Sk. Friidrett           | 116         | 705   | Høyde   | Sondre Jahren                    | Hamar                  | 1,86       | 2021.08.22 |
    | Asker Sk. Friidrett           | 117         | 681   | Diskos  | Sondre Jahren                    | Kristiansand           | 39,81      | 2021.10.06 |
    | Asker Sk. Friidrett           | 118         | 668   | 100     | Sondre Jahren                    | Asker                  | 11,73      | 2021.09.26 |
    | Asker Sk. Friidrett           | 119         | 665   | Lengde  | William Kollberg                 | Trondheim              | 6,26       | 2021.09.28 |
    | Asker Sk. Friidrett           | 120         | 663   | 200     | Sondre Jahren                    | Asker                  | 23,84      | 2021.09.26 |
    | Asker Sk. Friidrett           | 121         | 652   | Høyde   | William Kollberg                 | Hamar                  | 1,80       | 2021.08.22 |
    | Asker Sk. Friidrett           | 122         | 651   | 100     | William Kollberg                 | Nadderud               | 11,81      | 2021.10.16 |
    | Asker Sk. Friidrett           | 123         | 647   | 200     | August Johansen                  | Asker                  | 24,00      | 2021.09.26 |
    | Asker Sk. Friidrett           | 124         | 646   | 200     | William Kollberg                 | Nittedal               | 24,01      | 2021.10.30 |
    | Asker Sk. Friidrett           | 125         | 644   | 400     | August Johansen                  | Oslo/Bi                | 53,00      | 2021.09.25 |
    | Asker Sk. Friidrett           | 126         | 644   | 200     | Lukas Øiseth                     | Asker                  | 24,03      | 2021.09.26 |
    | Asker Sk. Friidrett           | 127         | 634   | 100     | Lukas Øiseth                     | Asker                  | 11,89      | 2021.09.26 |
    | Asker Sk. Friidrett           | 128         | 627   | 100     | August Johansen                  | Oslo/Bi                | 11,92      | 2021.09.25 |
    | Asker Sk. Friidrett           | 129         | 615   | Stav    | Sondre Jahren                    | Hamar                  | 3,50       | 2021.08.22 |
    | Asker Sk. Friidrett           | 130         | 606   | 100     | Vilmer Beyer                     | Nadderud               | 12,02      | 2021.10.16 |
    | Asker Sk. Friidrett           | 131         | 590   | 400     | William Kollberg                 | Nadderud               | 54,36      | 2021.10.16 |
    | Asker Sk. Friidrett           | 132         | 590   | 200     | Vilmer Beyer                     | Trondheim              | 24,61      | 2021.09.28 |
    | Asker Sk. Friidrett           | 133         | 584   | 400     | Sondre Jahren                    | Hamar                  | 54,53      | 2021.08.22 |
    | Asker Sk. Friidrett           | 134         | 583   | Lut     | Sondre Jahren                    | Bærum                  | 2,84       | 2021.10.25 |
    | Asker Sk. Friidrett           | 135         | 575   | 400     | Lukas Øiseth                     | Asker                  | 54,78      | 2021.09.26 |
    | Asker Sk. Friidrett           | 136         | 554   | 800     | William Kollberg                 | Ravnanger              | 2,07,86    | 2021.09.15 |
    | Asker Sk. Friidrett           | 137         | 529   | 200     | Simon Nielsen                    | Asker                  | 25,32      | 2021.09.26 |
    | Asker Sk. Friidrett           | 138         | 528   | 200     | William Johansen                 | Asker                  | 25,33      | 2021.09.26 |
    | Asker Sk. Friidrett           | 139         | 509   | Lut     | August Johansen                  | Bærum                  | 2,71       | 2021.10.25 |
    | Asker Sk. Friidrett           | 140         | 507   | 100     | William Johansen                 | Asker                  | 12,52      | 2021.09.26 |
    | Asker Sk. Friidrett           | 141         | 500   | Diskos  | Espen Jahren                     | Asker                  | 30,90      | 2021.09.26 |
    | Asker Sk. Friidrett           | 142         | 497   | Lut     | Simon Nielsen                    | Bærum                  | 2,69       | 2021.10.25 |
    | Asker Sk. Friidrett           | 143         | 496   | 100     | Simon Nielsen                    | Asker                  | 12,58      | 2021.09.26 |
    | Asker Sk. Friidrett           | 144         | 472   | 400     | Vilmer Beyer                     | Asker                  | 57,85      | 2021.09.26 |
    | Asker Sk. Friidrett           | 145         | 447   | Lut     | Vilmer Beyer                     | Bærum                  | 2,61       | 2021.10.25 |
    | Asker Sk. Friidrett           | 146         | 433   | 400     | Simon Nielsen                    | Asker                  | 59,19      | 2021.09.26 |
    | Asker Sk. Friidrett           | 147         | 433   | Lut     | Jonas Bakken                     | Bærum                  | 2,59       | 2021.10.25 |
    | Asker Sk. Friidrett           | 148         | 433   | Lut     | Lukas Øiseth                     | Bærum                  | 2,59       | 2021.10.25 |
    | Asker Sk. Friidrett           | 149         | 432   | 400     | William Johansen                 | Asker                  | 59,22      | 2021.09.26 |
    | Asker Sk. Friidrett           | 150         | 394   | Spyd    | Espen Jahren                     | Asker                  | 33,92      | 2021.09.26 |
    | Asker Sk. Friidrett           | 151         | 380   | Kule    | Espen Jahren                     | Asker                  | 9,09       | 2021.09.26 |
    | Asker Sk. Friidrett           | 152         | 369   | Slegge  | Espen Jahren                     | Heggedal               | 24,84      | 2021.09.26 |
    | Asker Sk. Friidrett           | 153         | 349   | 200     | Emil Sætre                       | Nadderud               | 27,81      | 2021.10.16 |
    | Asker Sk. Friidrett           | 154         | 347   | 1500    | Sondre Jahren                    | Hamar                  | 5,00,84    | 2021.08.22 |
    | Asker Sk. Friidrett           | 155         | 334   | 1500    | William Kollberg                 | Hamar                  | 5,03,46    | 2021.08.22 |
    | Asker Sk. Friidrett           | 156         | 326   | 400     | Eivind Jørner                    | Asker                  | 1,03,25    | 2021.09.26 |
    | Asker Sk. Friidrett           | 157         | 291   | 100     | Eivind Jørner                    | Asker                  | 13,80      | 2021.09.26 |
    | Asker Sk. Friidrett           | 158         | 287   | 200     | Iver Igland                      | Nadderud               | 28,81      | 2021.10.16 |
    | Asker Sk. Friidrett           | 159         | 285   | 100     | Emil Sætre                       | Asker                  | 13,84      | 2021.09.26 |
    | Asker Sk. Friidrett           | 160         | 244   | 100     | Frederick Rens                   | Asker                  | 14,12      | 2021.09.26 |
    | Asker Sk. Friidrett           | 161         | 233   | Høyde   | Sigurd Østensen                  | Asker                  | 1,40       | 2021.09.26 |
    | Asker Sk. Friidrett           | 162         | 233   | Høyde   | Iver Igland                      | Nadderud               | 1,40       | 2021.10.16 |
    | Asker Sk. Friidrett           | 163         | 233   | 400     | Emil Sætre                       | Asker                  | 1,07,22    | 2021.09.26 |
    | Asker Sk. Friidrett           | 164         | 226   | 3000    | William Kollberg                 | Asker                  | 11,51,10   | 2021.09.26 |
    | Asker Sk. Friidrett           | 165         | 209   | 100     | Sigurd Østensen                  | Asker                  | 14,37      | 2021.09.26 |
    | Asker Sk. Friidrett           | 166         | 193   | 3000    | Eivind Sivertsen                 | Asker                  | 12,08,33   | 2021.09.26 |
    | Asker Sk. Friidrett           | 167         | 173   | 200     | Herman Unneland                  | Drøbak                 | 30,85      | 2021.06.19 |
    | Asker Sk. Friidrett           | 168         | 167   | 1500    | Anders Svensson                  | Asker                  | 5,40,57    | 2021.09.26 |
    | Asker Sk. Friidrett           | 169         | 151   | Lengde  | Mads Nørgaard                    | Asker                  | 4,12       | 2021.09.26 |
    | Asker Sk. Friidrett           | 170         | 131   | 100     | Iver Igland                      | Asker                  | 14,97      | 2021.09.26 |
    | Asker Sk. Friidrett           | 171         | 128   | 400     | Herman Unneland                  | Asker                  | 1,12,06    | 2021.09.26 |
    | Asker Sk. Friidrett           | 172         | 109   | 100     | Herman Unneland                  | Asker                  | 15,14      | 2021.09.26 |
    | Asker Sk. Friidrett           | 173         | 99    | 100     | Mads Nørgaard                    | Asker                  | 15,22      | 2021.09.26 |
    | Asker Sk. Friidrett           | 174         | 84    | 200     | Maximilian Häusler               | Asker                  | 32,61      | 2021.09.26 |
    | Asker Sk. Friidrett           | 175         | 63    | 400     | Sverre Sætre                     | Asker                  | 1,15,21    | 2021.09.26 |
    | Asker Sk. Friidrett           | 176         | 63    | 200     | Kristian Pfeuti                  | Nadderud               | 33,03      | 2021.10.16 |
    | Asker Sk. Friidrett           | 177         | 59    | 100     | Maximilian Häusler               | Asker                  | 15,56      | 2021.09.26 |
    | Asker Sk. Friidrett           | 178         | 50    | 200     | Sverre Sætre                     | Nadderud               | 33,32      | 2021.10.16 |
    | Asker Sk. Friidrett           | 179         | 19    | Høyde   | Eilif Kjemperud                  | Asker                  | 1,25       | 2021.09.26 |
    | Asker Sk. Friidrett           | 180         | 19    | Høyde   | Emil Sætre                       | Asker                  | 1,25       | 2021.09.26 |
    | Askim IF                      | 181         | 935   | 3000H   | Fredrik Sandvik                  | Cluj-Napoca/ROU        | 8,42,38    | 2021.06.20 |
    | Askim IF                      | 182         | 903   | 1500    | Fredrik Sandvik                  | Oslo/Bi                | 3,46,56    | 2021.09.25 |
    | Askim IF                      | 183         | 822   | 5000    | Fredrik Sandvik                  | Oslo/Bi                | 14,38,48   | 2021.09.25 |
    | Askim IF                      | 184         | 690   | Kule    | Alexander Nilsson                | Askim                  | 13,34      | 2021.07.09 |
    | Askim IF                      | 185         | 652   | Høyde   | Alexander Nyberget               | Askim                  | 1,80       | 2021.07.09 |
    | Aure IL                       | 186         | 867   | 1500    | Kristoffer Sagli                 | Oslo/Bi                | 3,49,72    | 2021.09.25 |
    | Aure IL                       | 187         | 857   | 3000    | Kristoffer Sagli                 | Trondheim              | 8,20,53    | 2021.09.28 |
    | Aure IL                       | 188         | 839   | 800     | Kristoffer Sagli                 | Trondheim              | 1,53,06    | 2021.09.28 |
    | Aure IL                       | 189         | 697   | 3000    | Mathias Lillehagen               | Trondheim              | 8,57,60    | 2021.09.28 |
    | Aure IL                       | 190         | 696   | 5000    | Mathias Lillehagen               | Ravnanger              | 15,35,10   | 2021.09.15 |
    | Aure IL                       | 191         | 687   | 1500    | Mathias Lillehagen               | Oslo/Bi                | 4,08,11    | 2021.09.25 |
    | Aure IL                       | 192         | 668   | 800     | Mathias Lillehagen               | Kristiansand           | 2,01,02    | 2021.10.06 |
    | Aure IL                       | 193         | 278   | Lengde  | Johannes Finset                  | Aure                   | 4,62       | 2021.06.12 |
    | Aure IL                       | 194         | 16    | 800     | Ole Torset                       | Førde                  | 3,02,56    | 2021.08.22 |
    | Aurskog/Høland Friidrettslag  | 195         | 723   | 10000   | Magnus Salberg                   | Oslo/Bi                | 32,16,18   | 2021.09.25 |
    | Aurskog/Høland Friidrettslag  | 196         | 686   | 10000   | Mattis Haug                      | Oslo/Bi                | 32,54,23   | 2021.09.25 |
    | Aurskog/Høland Friidrettslag  | 197         | 679   | 10000   | Håkon Hjemly                     | Oslo/Bi                | 33,02,68   | 2021.09.25 |
    | Aurskog/Høland Friidrettslag  | 198         | 663   | 5000    | Håkon Hjemly                     | Oslo/Bi                | 15,50,99   | 2021.09.25 |
    | Aurskog/Høland Friidrettslag  | 199         | 607   | 3000    | Håkon Hjemly                     | Brandbu                | 9,22,56    | 2021.09.25 |
    | Aurskog/Høland Friidrettslag  | 200         | 567   | 1500    | Håkon Hjemly                     | Førde                  | 4,23,89    | 2021.08.22 |
    | Aurskog/Høland Friidrettslag  | 201         | 455   | 800     | Håkon Hjemly                     | Førde                  | 2,15,31    | 2021.08.22 |
    | BFG Bergen                    | 202         | 332   | 800     | Jan Fagerheim                    | Førde                  | 2,26,41    | 2021.08.22 |
    | BFG Bergen                    | 203         | 301   | 400     | Jan Fagerheim                    | Førde                  | 1,04,24    | 2021.08.22 |
    | BFG Bergen Løpeklubb          | 204         | 589   | 3000    | André Aasen                      | Arna                   | 9,27,83    | 2021.10.13 |
    | Bagn IL                       | 205         | 636   | 3000    | Stian Johannessen                | Os                     | 9,14,15    | 2021.09.26 |
    | Bagn IL                       | 206         | 543   | 800     | Stian Johannessen                | Os                     | 2,08,61    | 2021.09.26 |
    | Bardu IL                      | 207         | 482   | 400     | Lars Movinkel                    | Tromsø                 | 57,55      | 2021.09.15 |
    | Bardu IL                      | 208         | 437   | 800     | Lars Movinkel                    | Finnsnes               | 2,16,79    | 2021.07.11 |
    | Bardu IL                      | 209         | 391   | 3000    | Lars Movinkel                    | Harstad                | 10,36,19   | 2021.09.25 |
    | Bardu IL                      | 210         | 387   | 1500    | Lars Movinkel                    | Tromsø                 | 4,53,29    | 2021.09.15 |
    | Bardu IL                      | 211         | 325   | Lut     | Lars Movinkel                    | Setermoen              | 2,45       | 2021.02.18 |
    | Bardu IL                      | 212         | 235   | 200     | Joakim Bergholt                  | Harstad                | 29,70      | 2021.09.25 |
    | Bardu IL                      | 213         | 233   | Høyde   | Julius Evensen                   | Sortland               | 1,40       | 2021.08.22 |
    | Bardu IL                      | 214         | 225   | Lengde  | Joakim Bergholt                  | Finnsnes               | 4,41       | 2021.07.11 |
    | Bardu IL                      | 215         | 202   | 100     | Joakim Bergholt                  | Finnsnes               | 14,42      | 2021.07.11 |
    | Bardu IL                      | 216         | 196   | Stav    | Julius Evensen                   | Finnsnes               | 2,00       | 2021.07.11 |
    | Bardu IL                      | 217         | 180   | Hut     | Joakim Bergholt                  | Setermoen              | 1,15       | 2021.02.18 |
    | Bardu IL                      | 218         | 129   | 5000    | Torgeir Evensen                  | Vik                    | 22,25,00   | 2021.10.02 |
    | Bardu IL                      | 219         | 107   | 200     | Jørgen Fuglem                    | Finnsnes               | 32,14      | 2021.07.11 |
    | Bardu IL                      | 220         | 94    | 200     | Julius Evensen                   | Tromsø                 | 32,40      | 2021.09.15 |
    | Bardu IL                      | 221         | 80    | Hut     | Julius Evensen                   | Setermoen              | 1,10       | 2021.02.18 |
    | Bardu IL                      | 222         | 80    | Hut     | Lars Movinkel                    | Setermoen              | 1,10       | 2021.02.18 |
    | Bardu IL                      | 223         | 62    | 1500    | Jørgen Fuglem                    | Narvik                 | 6,09,03    | 2021.06.13 |
    | Bardu IL                      | 224         | 20    | Lut     | Felina Abdulle                   | Setermoen              | 2,14       | 2021.02.18 |
    | Begnadalen IL                 | 225         | 829   | Kule    | Marcin Gasiorowski               | Ski                    | 15,53      | 2021.09.25 |
    | Bergen Løpeklubb              | 226         | 680   | 5000    | Erlend Jensen                    | Husnes                 | 15,42,7    | 2021.09.08 |
    | Bergens Turnforening          | 227         | 851   | Stav    | Philip Kubon                     | Fana                   | 4,70       | 2021.09.28 |
    | Bergens Turnforening          | 228         | 833   | Stav    | Christian Pettersen              | Kristiansand           | 4,60       | 2021.10.06 |
    | Bergens Turnforening          | 229         | 814   | Stav    | Eskil Njerve                     | Fana                   | 4,50       | 2021.09.28 |
    | Bergens Turnforening          | 230         | 567   | Lengde  | Kjell Kubon                      | Fana                   | 5,83       | 2021.09.28 |
    | Bergens Turnforening          | 231         | 543   | 200     | Eirik Høvding                    | Leikvang               | 25,15      | 2021.08.29 |
    | Bergens Turnforening          | 232         | 530   | 200     | Kjell Kubon                      | Fana                   | 25,31      | 2021.09.28 |
    | Bergens Turnforening          | 233         | 468   | 100     | Kjell Kubon                      | Fana                   | 12,73      | 2021.09.28 |
    | Bergens Turnforening          | 234         | 468   | 100     | Eirik Høvding                    | Fana                   | 12,73      | 2021.09.28 |
    | Bergens Turnforening          | 235         | 451   | 200     | Johannes Reimers                 | Leikvang               | 26,32      | 2021.08.29 |
    | Bergens Turnforening          | 236         | 434   | 400     | Eirik Høvding                    | Bergen                 | 59,0       | 2021.10.30 |
    | Bergens Turnforening          | 237         | 420   | Lengde  | Eirik Høvding                    | Bergen                 | 5,20       | 2021.10.30 |
    | Bergens Turnforening          | 238         | 420   | 200h    | Johannes Reimers                 | Leikvang               | 31,48      | 2021.08.29 |
    | Bergens Turnforening          | 239         | 396   | Lengde  | Johannes Reimers                 | Fana                   | 5,10       | 2021.09.28 |
    | Bergens Turnforening          | 240         | 393   | 100     | Johannes Reimers                 | Leikvang               | 13,16      | 2021.08.29 |
    | Bergens Turnforening          | 241         | 353   | 400     | Johannes Reimers                 | Bergen                 | 1,02,0     | 2021.10.30 |
    | Bergens Turnforening          | 242         | 345   | Kule    | Bjørge Pedersen                  | Bergen/La              | 8,64       | 2021.09.29 |
    | Bergens Turnforening          | 243         | 302   | Diskos  | Bjørge Pedersen                  | Bergen/La              | 23,11      | 2021.09.29 |
    | Bergens Turnforening          | 244         | 208   | Slegge  | Bjørge Pedersen                  | Bergen/La              | 17,14      | 2021.09.29 |
    | Bergens Turnforening          | 245         | 32    | 200     | Aksel Johannessen                | Leirvik                | 33,70      | 2021.09.13 |
    | Birkenes IL                   | 246         | 956   | Lut     | Kenneth Bjorvatn                 | Grimstad               | 3,52       | 2021.10.25 |
    | Birkenes IL                   | 247         | 913   | Hut     | Kenneth Bjorvatn                 | Grimstad               | 1,72       | 2021.10.25 |
    | Bodø Bauta Løpeklubb          | 248         | 580   | 3000    | Martin Hoset                     | Bodø                   | 9,30,72    | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 249         | 569   | 3000    | Kristoffer Unstad                | Bodø                   | 9,34,03    | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 250         | 553   | 5000    | Kristoffer Unstad                | Bodø                   | 16,49,48   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 251         | 539   | 5000    | Simon Haldorsen                  | Bodø                   | 16,57,42   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 252         | 534   | 10000   | Kristoffer Unstad                | Bodø                   | 35,53,59   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 253         | 503   | 5000    | August Steffensen                | Bodø                   | 17,18,52   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 254         | 501   | 3000    | Steffen Kristiansen              | Bodø                   | 9,56,13    | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 255         | 460   | 10000   | Bjørnar Liaskar                  | Bodø                   | 37,32,74   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 256         | 454   | 3000    | Petter Unstad                    | Bodø                   | 10,12,38   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 257         | 448   | 3000    | Jonas Hagen                      | Bodø                   | 10,14,78   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 258         | 447   | 5000    | Steffen Kristiansen              | Bodø                   | 17,53,57   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 259         | 446   | 3000    | Rodrigo Belda                    | Bodø                   | 10,15,42   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 260         | 436   | 5000    | Jonas Hagen                      | Bodø                   | 18,00,76   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 261         | 428   | 10000   | Mikal Tjærandsen                 | Bodø                   | 38,19,31   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 262         | 416   | 10000   | Jonas Hagen                      | Bodø                   | 38,37,88   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 263         | 412   | 800     | Steffen Kristiansen              | Bodø                   | 2,18,92    | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 264         | 412   | 5000    | Daniel Mathisen                  | Bodø                   | 18,17,00   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 265         | 400   | 800     | Jonas Hagen                      | Bodø                   | 2,19,98    | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 266         | 397   | 10000   | Olav Wendel                      | Bodø                   | 39,06,78   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 267         | 374   | 10000   | Audun Selnes                     | Bodø                   | 39,43,19   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 268         | 363   | 5000    | Audun Selnes                     | Bodø                   | 18,51,56   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 269         | 360   | 3000    | Audun Selnes                     | Bodø                   | 10,48,86   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 270         | 359   | 5000    | Håvard Nes                       | Bodø                   | 18,54,71   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 271         | 352   | 3000    | Olav Wendel                      | Bodø                   | 10,52,05   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 272         | 345   | 3000    | Christoffer Larsen               | Bodø                   | 10,55,16   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 273         | 344   | 5000    | Simen Elvestrand                 | Bodø                   | 19,05,65   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 274         | 329   | 5000    | Erling Bang                      | Bodø                   | 19,17,46   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 275         | 329   | 800     | Runar Gregussen                  | Bodø                   | 2,26,70    | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 276         | 328   | 5000    | Markus Fosseli                   | Bodø                   | 19,18,00   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 277         | 328   | 3000    | Patrick Flygt                    | Bodø                   | 11,02,65   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 278         | 327   | 10000   | Amandus Albrigtsen               | Bodø                   | 41,03,15   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 279         | 327   | 5000    | Dani Birkeland                   | Bodø                   | 19,18,77   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 280         | 315   | 5000    | Aleksander Holand                | Bodø                   | 19,28,59   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 281         | 311   | 3000    | Simen Elvestrand                 | Bodø                   | 11,09,90   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 282         | 309   | 5000    | Thomas Bentsen                   | Bodø                   | 19,32,88   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 283         | 290   | 5000    | Runar Gregussen                  | Bodø                   | 19,48,00   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 284         | 285   | 10000   | Runar Gregussen                  | Bodø                   | 42,19,43   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 285         | 281   | 5000    | Børge Hjertaker                  | Bodø                   | 19,56,33   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 286         | 281   | 3000    | Aleksander Holand                | Bodø                   | 11,23,88   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 287         | 272   | 3000    | Runar Gregussen                  | Bodø                   | 11,27,79   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 288         | 265   | 3000    | Ketil Johansen                   | Bodø                   | 11,31,23   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 289         | 260   | 10000   | Svenn Slettvoll                  | Bodø                   | 43,09,04   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 290         | 259   | 10000   | Erling Bang                      | Bodø                   | 43,11,65   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 291         | 252   | 5000    | Svenn Slettvoll                  | Bodø                   | 20,20,50   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 292         | 220   | 3000    | Ørjan Eilertsen                  | Bodø                   | 11,54,22   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 293         | 219   | 10000   | Martin Østrem                    | Bodø                   | 44,37,41   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 294         | 198   | 5000    | Felix Snow                       | Bodø                   | 21,10,95   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 295         | 175   | 5000    | Martin Østrem                    | Bodø                   | 21,34,59   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 296         | 171   | 3000    | Felix Snow                       | Bodø                   | 12,20,88   | 2021.09.21 |
    | Bodø Bauta Løpeklubb          | 297         | 142   | 5000    | Steinar Pettersen                | Bodø                   | 22,10,09   | 2021.09.21 |
    | Bodø Friidrettsklubb          | 298         | 740   | Diskos  | Torkel Bjørbæk                   | Bodø                   | 43,08      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 299         | 711   | 5000    | Vebjørn Røed                     | Mosjøen                | 15,28,07   | 2021.08.28 |
    | Bodø Friidrettsklubb          | 300         | 652   | Høyde   | August Svare                     | Bodø                   | 1,80       | 2021.09.21 |
    | Bodø Friidrettsklubb          | 301         | 630   | 5000    | Glenn Trane                      | Bodø                   | 16,07,82   | 2021.09.21 |
    | Bodø Friidrettsklubb          | 302         | 611   | 3000    | Glenn Trane                      | Bodø                   | 9,21,45    | 2021.09.21 |
    | Bodø Friidrettsklubb          | 303         | 608   | 100     | August Svare                     | Bodø                   | 12,01      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 304         | 590   | Spyd    | Vetle Berg                       | Bodø                   | 47,29      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 305         | 589   | 200     | Henrik Alstadhaug                | Bodø                   | 24,62      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 306         | 567   | Lengde  | August Svare                     | Bodø                   | 5,83       | 2021.09.21 |
    | Bodø Friidrettsklubb          | 307         | 562   | 200     | August Svare                     | Bodø                   | 24,93      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 308         | 505   | 100     | Jonas Hanssen                    | Bodø                   | 12,53      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 309         | 484   | 400     | Jonas Hanssen                    | Bodø                   | 57,47      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 310         | 477   | 200     | Jonas Hanssen                    | Bodø                   | 25,97      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 311         | 430   | 3000    | Tesfamichael Rezene              | Bodø                   | 10,21,40   | 2021.09.21 |
    | Bodø Friidrettsklubb          | 312         | 412   | Kule    | Erlend Hunstad                   | Bodø                   | 9,51       | 2021.09.21 |
    | Bodø Friidrettsklubb          | 313         | 375   | Spyd    | August Svare                     | Bodø                   | 32,76      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 314         | 275   | Kule    | Eivind Hunstad                   | Bodø                   | 7,78       | 2021.09.21 |
    | Bodø Friidrettsklubb          | 315         | 185   | 3000    | Birger Eidshaug                  | Bodø                   | 12,12,93   | 2021.09.21 |
    | Bodø Friidrettsklubb          | 316         | 96    | Høyde   | Ulrik Rambjør                    | Bodø                   | 1,30       | 2021.09.21 |
    | Bodø Friidrettsklubb          | 317         | 82    | 1500    | Ulrik Rambjør                    | Bodø                   | 6,03,35    | 2021.09.21 |
    | Bodø Friidrettsklubb          | 318         | 55    | 200     | Ulrik Rambjør                    | Bodø                   | 33,21      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 319         | 43    | 200     | Odin Strandås                    | Bodø                   | 33,47      | 2021.09.21 |
    | Bodø Friidrettsklubb          | 320         | 42    | 200     | Marcus Rambjør                   | Bodø                   | 33,48      | 2021.09.21 |
    | Botne SK                      | 321         | 459   | 1500    | Aron Askim                       | Nadderud               | 4,40,58    | 2021.10.16 |
    | Botne SK                      | 322         | 452   | 100     | Kristoffer Kjelling              | Greveskogen            | 12,82      | 2021.10.30 |
    | Botne SK                      | 323         | 432   | 200     | Kristoffer Kjelling              | Greveskogen            | 26,59      | 2021.10.30 |
    | Botne SK                      | 324         | 387   | 200h    | Aron Askim                       | Rjukan                 | 32,16      | 2021.09.12 |
    | Botne SK                      | 325         | 216   | 1500    | Iver Askim                       | Nadderud               | 5,28,79    | 2021.10.16 |
    | Botne SK                      | 326         | 205   | Lengde  | Aron Askim                       | Nadderud               | 4,33       | 2021.10.16 |
    | Brandbu IF                    | 327         | 982   | 5000    | Magnus Myhre                     | Greveskogen            | 13,38,69   | 2021.10.30 |
    | Brandbu IF                    | 328         | 966   | 3000    | Magnus Myhre                     | Jessheim               | 7,57,78    | 2021.09.09 |
    | Brandbu IF                    | 329         | 937   | 1500    | Magnus Myhre                     | Oslo/Bi                | 3,43,78    | 2021.09.25 |
    | Brandbu IF                    | 330         | 908   | Slegge  | Kjetil Ringen                    | Løten                  | 62,35      | 2021.08.14 |
    | Brandbu IF                    | 331         | 845   | 800     | Magnus Myhre                     | Oslo/Bi                | 1,52,78    | 2021.09.25 |
    | Brandbu IF                    | 332         | 600   | 1500    | Ulrik Hagen                      | Lillehammer            | 4,19,10    | 2021.09.26 |
    | Brandbu IF                    | 333         | 581   | 3000    | Syver Holt                       | Brandbu                | 9,30,45    | 2021.09.25 |
    | Brandbu IF                    | 334         | 555   | 800     | Elias Steinset                   | Brandbu                | 2,07,78    | 2021.09.25 |
    | Brandbu IF                    | 335         | 474   | 800     | Ulrik Hagen                      | Brandbu                | 2,13,83    | 2021.09.25 |
    | Brandbu IF                    | 336         | 464   | 1500    | Peder Robøle-Sørensen            | Nittedal               | 4,39,85    | 2021.10.30 |
    | Brandbu IF                    | 337         | 390   | 100     | Oscar Kristoffersen              | Brandbu                | 13,18      | 2021.09.25 |
    | Brandbu IF                    | 338         | 353   | Høyde   | Jacob Gulbrandsen-Rognstad       | Brandbu                | 1,50       | 2021.09.25 |
    | Brandbu IF                    | 339         | 342   | 1500    | Ola Johnsrud                     | Brandbu                | 5,01,75    | 2021.09.25 |
    | Brandbu IF                    | 340         | 287   | 1500    | Jonas Gulbrandsen-Rognstad       | Brandbu                | 5,12,91    | 2021.09.25 |
    | Brandbu IF                    | 341         | 267   | 1500    | Oscar Kristoffersen              | Brandbu                | 5,17,31    | 2021.09.25 |
    | Brandbu IF                    | 342         | 258   | 800     | Oscar Kristoffersen              | Brandbu                | 2,33,94    | 2021.09.25 |
    | Brandbu IF                    | 343         | 234   | 800     | Jonas Gulbrandsen-Rognstad       | Brandbu                | 2,36,55    | 2021.09.25 |
    | Brandbu IF                    | 344         | 160   | 100     | Jonas Gulbrandsen-Rognstad       | Brandbu                | 14,74      | 2021.09.25 |
    | Brandbu IF                    | 345         | 103   | 100     | Jacob Gulbrandsen-Rognstad       | Brandbu                | 15,19      | 2021.09.25 |
    | Brandbu IF                    | 346         | 67    | Tresteg | Jonas Gulbrandsen-Rognstad       | Brandbu                | 7,87       | 2021.09.25 |
    | Bratsberg IL                  | 347         | 797   | 3000    | Øyvind Utengen                   | Trondheim              | 8,33,61    | 2021.09.28 |
    | Bratsberg IL                  | 348         | 781   | 10000   | Øyvind Utengen                   | Trondheim              | 31,18,16   | 2021.09.28 |
    | Bratsberg IL                  | 349         | 637   | 3000    | Knut Ødegaard                    | Trondheim              | 9,13,98    | 2021.09.28 |
    | Bratsberg IL                  | 350         | 634   | 3000    | Vegard Ressem                    | Trondheim              | 9,14,89    | 2021.09.28 |
    | Bratsberg IL                  | 351         | 577   | 3000    | Jonas Ressem                     | Trondheim              | 9,31,47    | 2021.09.28 |
    | Bratsberg IL                  | 352         | 422   | 3000    | Arne Hangerhagen                 | Trondheim              | 10,24,30   | 2021.09.28 |
    | Bratsberg IL                  | 353         | 394   | 3000    | Audun Havnen                     | Trondheim              | 10,35,10   | 2021.09.28 |
    | Bratsberg IL                  | 354         | 379   | 3000    | Magnus Meyer                     | Trondheim              | 10,41,11   | 2021.09.28 |
    | Bratsberg IL                  | 355         | 358   | 3000    | Kristian Liaklev                 | Trondheim              | 10,49,58   | 2021.09.28 |
    | Bremnes Idrettslag            | 356         | 499   | 200     | Oscar Ånderå                     | Bømlo                  | 25,69      | 2021.09.30 |
    | Bremnes Idrettslag            | 357         | 495   | Lengde  | Martin Vedøy                     | Bømlo                  | 5,52       | 2021.09.30 |
    | Bremnes Idrettslag            | 358         | 491   | Høyde   | Martin Vedøy                     | Bømlo                  | 1,63       | 2021.09.30 |
    | Bremnes Idrettslag            | 359         | 477   | Lengde  | Oscar Ånderå                     | Leirvik                | 5,44       | 2021.09.13 |
    | Bremnes Idrettslag            | 360         | 476   | 100     | Martin Vedøy                     | Bømlo                  | 12,69      | 2021.09.30 |
    | Bremnes Idrettslag            | 361         | 467   | 200     | Martin Vedøy                     | Bømlo                  | 26,11      | 2021.09.30 |
    | Bremnes Idrettslag            | 362         | 467   | Spyd    | Arne Kvarven                     | Bømlo                  | 38,72      | 2021.09.30 |
    | Bremnes Idrettslag            | 363         | 466   | Hut     | Vidar Sæverud                    | Bømlo                  | 1,32       | 2021.09.30 |
    | Bremnes Idrettslag            | 364         | 461   | Høyde   | Oscar Ånderå                     | Haugesund              | 1,60       | 2021.09.12 |
    | Bremnes Idrettslag            | 365         | 440   | Hut     | Oscar Ånderå                     | Bømlo                  | 1,30       | 2021.09.30 |
    | Bremnes Idrettslag            | 366         | 438   | Diskos  | Vidar Sæverud                    | Bømlo                  | 28,32      | 2021.09.30 |
    | Bremnes Idrettslag            | 367         | 428   | 5000    | Bjørn Sørvik                     | Bømlo                  | 18,06,00   | 2021.09.30 |
    | Bremnes Idrettslag            | 368         | 425   | Kule    | Vidar Sæverud                    | Bømlo                  | 9,68       | 2021.09.30 |
    | Bremnes Idrettslag            | 369         | 342   | Lut     | Oscar Ånderå                     | Bømlo                  | 2,47       | 2021.09.30 |
    | Bremnes Idrettslag            | 370         | 295   | Høyde   | Viljar Aarskog                   | Haugesund              | 1,45       | 2021.09.12 |
    | Bremnes Idrettslag            | 371         | 218   | 5000    | Roger Krogsæter                  | Bømlo                  | 20,52,76   | 2021.09.30 |
    | Bremnes Idrettslag            | 372         | 206   | 200     | Viljar Aarskog                   | Bømlo                  | 30,22      | 2021.09.30 |
    | Bremnes Idrettslag            | 373         | 178   | 100     | Kasper Fylkesnes                 | Bømlo                  | 14,60      | 2021.09.30 |
    | Bremnes Idrettslag            | 374         | 175   | 200     | Alf Hollund                      | Bømlo                  | 30,81      | 2021.09.30 |
    | Bremnes Idrettslag            | 375         | 158   | 100     | Viljar Aarskog                   | Bømlo                  | 14,75      | 2021.09.30 |
    | Bremnes Idrettslag            | 376         | 156   | 3000    | Nicolai Ådnanes                  | Bømlo                  | 12,29,54   | 2021.09.30 |
    | Bremnes Idrettslag            | 377         | 153   | 200     | Jarl Paulsen                     | Bømlo                  | 31,22      | 2021.09.30 |
    | Bremnes Idrettslag            | 378         | 151   | 100     | Nicolai Ådnanes                  | Bømlo                  | 14,81      | 2021.09.30 |
    | Bremnes Idrettslag            | 379         | 148   | 3000    | Sivert Innvær                    | Bømlo                  | 12,34,41   | 2021.09.30 |
    | Bremnes Idrettslag            | 380         | 130   | Lut     | Viljar Aarskog                   | Bømlo                  | 2,25       | 2021.09.30 |
    | Bremnes Idrettslag            | 381         | 106   | 100     | Vidar Sæverud                    | Bømlo                  | 15,17      | 2021.09.30 |
    | Bremnes Idrettslag            | 382         | 99    | 800     | Kim Mæland                       | Bømlo                  | 2,52,18    | 2021.09.30 |
    | Bremnes Idrettslag            | 383         | 95    | 5000    | Vidar Sæverud                    | Bømlo                  | 23,04,66   | 2021.09.30 |
    | Bremnes Idrettslag            | 384         | 86    | 800     | Jarl Paulsen                     | Bømlo                  | 2,53,74    | 2021.09.30 |
    | Bremnes Idrettslag            | 385         | 73    | 200     | Kim Mæland                       | Bømlo                  | 32,84      | 2021.09.30 |
    | Bremnes Idrettslag            | 386         | 50    | Lut     | Kasper Fylkesnes                 | Bømlo                  | 2,17       | 2021.09.30 |
    | Bremnes Idrettslag            | 387         | 42    | 400     | Vidar Sæverud                    | Bømlo                  | 1,16,23    | 2021.09.30 |
    | Bremnes Idrettslag            | 388         | 25    | Diskos  | Tore Thorsland                   | Bømlo                  | 13,66      | 2021.09.30 |
    | Bremnes Idrettslag            | 389         | 1     | 200     | Alfred Mæland                    | Leirvik                | 34,38      | 2021.09.13 |
    | Bryne FIK                     | 390         | 816   | Spyd    | Vebjørn Bottenvik                | Kristiansand           | 64,13      | 2021.10.06 |
    | Bryne FIK                     | 391         | 456   | 10000   | Knut Slettebø                    | Byrkjelo               | 37,38,78   | 2021.10.31 |
    | Bryne FIK                     | 392         | 283   | 100     | Christopher Breiland             | Sandnes                | 13,85      | 2021.10.28 |
    | Bryne FIK                     | 393         | 278   | 200     | Christopher Breiland             | Sandnes                | 28,96      | 2021.10.28 |
    | Bryne FIK                     | 394         | 276   | 800     | Alexander Erland                 | Frakkagjerd            | 2,32,03    | 2021.08.22 |
    | Bryne FIK                     | 395         | 270   | 1500    | Alexander Erland                 | Sandnes                | 5,16,70    | 2021.10.28 |
    | Bryne FIK                     | 396         | 258   | 200     | Alexander Erland                 | Stavanger              | 29,30      | 2021.10.27 |
    | Bryne FIK                     | 397         | 240   | Lengde  | Torbjørn Farbrot                 | Lye                    | 4,47       | 2021.05.27 |
    | Bryne FIK                     | 398         | 227   | Lengde  | Oskar Risa                       | Sandnes                | 4,42       | 2021.10.28 |
    | Bryne FIK                     | 399         | 184   | Lengde  | Alexander Erland                 | Sandnes                | 4,25       | 2021.10.28 |
    | Bryne FIK                     | 400         | 121   | 200     | Sacarias Sørland                 | Ålgård                 | 31,86      | 2021.09.20 |
    | Bryne FIK                     | 401         | 105   | 1500    | Sacarias Sørland                 | Haugesund              | 5,56,78    | 2021.09.12 |
    | Bryne FIK                     | 402         | 78    | 100     | Sacarias Sørland                 | Frøyland               | 15,40      | 2021.09.07 |
    | Brønnøysund IL                | 403         | 452   | 3000    | Einar Jenssen                    | Vik                    | 10,13,27   | 2021.10.02 |
    | Brønnøysund IL                | 404         | 438   | 5000    | Einar Jenssen                    | Vik                    | 17,59,53   | 2021.10.02 |
    | Brønnøysund IL                | 405         | 324   | 10000   | Rune Knoph                       | Vik                    | 41.07,70   | 2021.10.02 |
    | Byåsen IL                     | 406         | 612   | Spyd    | Tore Gerhardsen                  | Trondheim              | 48,92      | 2021.09.28 |
    | Byåsen IL                     | 407         | 470   | 100     | Magnus Johnsen                   | Trondheim              | 12,72      | 2021.09.28 |
    | Byåsen IL                     | 408         | 467   | 5000    | Antonius Amundsen                | Vik                    | 17,40,96   | 2021.10.02 |
    | Byåsen IL                     | 409         | 438   | 3000    | Theodor Eikemo-Nilsen            | Trondheim              | 10,18,54   | 2021.09.28 |
    | Byåsen IL                     | 410         | 390   | 5000    | Vebjørn Bergh-Hansen             | Trondheim              | 18,31,98   | 2021.09.28 |
    | Byåsen IL                     | 411         | 282   | 800     | Alvin Le                         | Stadsbygd              | 2,31,4     | 2021.05.09 |
    | Byåsen IL                     | 412         | 266   | Stav    | Ola Brenna                       | Stjørdal               | 2,20       | 2021.10.23 |
    | Byåsen IL                     | 413         | 263   | 200     | Ola Brenna                       | Trondheim              | 29,22      | 2021.09.28 |
    | Byåsen IL                     | 414         | 217   | Lengde  | Theodor Wold                     | Trondheim              | 4,38       | 2021.09.28 |
    | Byåsen IL                     | 415         | 193   | 800     | Ola Brenna                       | Stadsbygd              | 2,41,1     | 2021.05.09 |
    | Byåsen IL                     | 416         | 181   | Høyde   | Ola Brenna                       | Måndalen               | 1,36       | 2021.09.12 |
    | Byåsen IL                     | 417         | 162   | 200     | Alvin Le                         | Trondheim              | 31,05      | 2021.09.28 |
    | Byåsen IL                     | 418         | 140   | Lengde  | Jonas Ramstad                    | Trondheim              | 4,08       | 2021.09.28 |
    | Byåsen IL                     | 419         | 131   | 200     | Håkon Denstadli                  | Trondheim              | 31,65      | 2021.09.28 |
    | Byåsen IL                     | 420         | 112   | 200     | Henrik Denstadli                 | Trondheim              | 32,04      | 2021.09.28 |
    | Byåsen IL                     | 421         | 103   | Lengde  | Vemund Hopsø                     | Trondheim              | 3,94       | 2021.09.28 |
    | Byåsen IL                     | 422         | 95    | 3000    | Alvin Le                         | Trondheim              | 13,08,16   | 2021.09.28 |
    | Byåsen IL                     | 423         | 59    | 100     | Alvin Le                         | Trondheim              | 15,56      | 2021.09.28 |
    | Byåsen IL                     | 424         | 30    | 5000    | Harry Sollie                     | Stjørdal               | 24,31,20   | 2021.10.23 |
    | Bækkelagets SK                | 425         | 829   | 100     | Khoa Luong                       | Jessheim               | 11,05      | 2021.09.09 |
    | Bækkelagets SK                | 426         | 764   | 3000    | Henrik Husdal                    | Jessheim               | 8,41,33    | 2021.09.09 |
    | Bækkelagets SK                | 427         | 759   | 5000    | Henrik Husdal                    | Oslo/Bi                | 15,05,94   | 2021.09.25 |
    | Bækkelagets SK                | 428         | 750   | 10000   | Henrik Husdal                    | Oslo/Bi                | 31,47,75   | 2021.09.25 |
    | Bækkelagets SK                | 429         | 710   | 3000    | Sigurd Røer                      | Jessheim               | 8,54,51    | 2021.09.09 |
    | Bækkelagets SK                | 430         | 683   | 10000   | Sigurd Røer                      | Oslo/Bi                | 32,57,50   | 2021.09.25 |
    | Bækkelagets SK                | 431         | 682   | 3000    | Vegard Røer                      | Jessheim               | 9,01,60    | 2021.09.09 |
    | Bækkelagets SK                | 432         | 679   | Stav    | Sebastian Marrot                 | Bækkelaget             | 3,80       | 2021.10.04 |
    | Bækkelagets SK                | 433         | 676   | 200     | Khoa Luong                       | Kristiansand           | 23,71      | 2021.10.06 |
    | Bækkelagets SK                | 434         | 676   | 200     | Erlend Halmøy                    | Trondheim              | 23,71      | 2021.09.28 |
    | Bækkelagets SK                | 435         | 668   | 100     | Erlend Halmøy                    | Trondheim              | 11,73      | 2021.09.28 |
    | Bækkelagets SK                | 436         | 667   | 5000    | Harald Ihlebæk                   | Oslo/Bi                | 15,49,16   | 2021.09.25 |
    | Bækkelagets SK                | 437         | 615   | 400     | Erlend Halmøy                    | Oslo/St                | 53,73      | 2021.10.16 |
    | Bækkelagets SK                | 438         | 613   | 800     | Wilhelm Deinboll                 | Bækkelaget             | 2,04,13    | 2021.10.04 |
    | Bækkelagets SK                | 439         | 599   | 10000   | Vegard Røer                      | Oslo/Bi                | 34,32,32   | 2021.09.25 |
    | Bækkelagets SK                | 440         | 577   | Lut     | Atle McAdam                      | Bækkelaget             | 2,83       | 2021.10.04 |
    | Bækkelagets SK                | 441         | 538   | Lut     | Ronny Gydar                      | Bækkelaget             | 2,76       | 2021.10.04 |
    | Bækkelagets SK                | 442         | 528   | Spyd    | Atle McAdam                      | Oslo/St                | 42,86      | 2021.10.16 |
    | Bækkelagets SK                | 443         | 526   | Lengde  | Erlend Halmøy                    | Oslo/St                | 5,65       | 2021.10.16 |
    | Bækkelagets SK                | 444         | 520   | Diskos  | Atle McAdam                      | Oslo/St                | 31,84      | 2021.10.16 |
    | Bækkelagets SK                | 445         | 491   | Lut     | Thomas Schibbye                  | Bækkelaget             | 2,68       | 2021.10.04 |
    | Bækkelagets SK                | 446         | 474   | Kule    | Atle McAdam                      | Oslo/St                | 10,33      | 2021.10.16 |
    | Bækkelagets SK                | 447         | 473   | 3000    | Arne Sunde                       | Bækkelaget             | 10,06,0    | 2021.10.04 |
    | Bækkelagets SK                | 448         | 440   | Hut     | Torben Lindstad                  | Hvam                   | 1,30       | 2021.10.23 |
    | Bækkelagets SK                | 449         | 440   | Hut     | Ronny Gydar                      | Bækkelaget             | 1,30       | 2021.10.04 |
    | Bækkelagets SK                | 450         | 415   | Slegge  | Atle McAdam                      | Oslo/St                | 27,39      | 2021.10.16 |
    | Bækkelagets SK                | 451         | 392   | 3000    | Ole Sørland                      | Bækkelaget             | 10,36,1    | 2021.10.04 |
    | Bækkelagets SK                | 452         | 335   | 200     | Jørgen Halmøy                    | Oslo/St                | 28,03      | 2021.10.16 |
    | Bækkelagets SK                | 453         | 323   | 400     | Jørgen Halmøy                    | Nittedal               | 1,03,37    | 2021.10.30 |
    | Bækkelagets SK                | 454         | 308   | 5000    | Dag Sjøberg                      | Ås                     | 19,33,44   | 2021.10.13 |
    | Bækkelagets SK                | 455         | 307   | 400     | Alexander Deinboll               | Bækkelaget             | 1,04,01    | 2021.10.04 |
    | Bækkelagets SK                | 456         | 296   | 400     | Jonas Kobberdal                  | Bækkelaget             | 1,04,49    | 2021.10.04 |
    | Bækkelagets SK                | 457         | 276   | 400     | Petter Egeland                   | Bækkelaget             | 1,05,32    | 2021.10.04 |
    | Bækkelagets SK                | 458         | 264   | 1500    | Dag Sjøberg                      | Bækkelaget             | 5,17,90    | 2021.10.04 |
    | Bækkelagets SK                | 459         | 227   | 200     | Oskar Amundsen                   | Oslo/St                | 29,84      | 2021.10.16 |
    | Bækkelagets SK                | 460         | 220   | 800     | Ole Sørland                      | Bækkelaget             | 2,38,1     | 2021.10.04 |
    | Bækkelagets SK                | 461         | 210   | 200     | Morten Halmøy                    | Oslo/St                | 30,16      | 2021.10.16 |
    | Bækkelagets SK                | 462         | 190   | Spyd    | Johnny Gundersen                 | Nittedal               | 22,32      | 2021.10.30 |
    | Bækkelagets SK                | 463         | 182   | 400     | Aksel Nagelhus                   | Bækkelaget             | 1,09,55    | 2021.10.04 |
    | Bækkelagets SK                | 464         | 175   | Diskos  | Johnny Gundersen                 | Nittedal               | 18,65      | 2021.10.30 |
    | Bækkelagets SK                | 465         | 171   | Slegge  | Johnny Gundersen                 | Lambertseter           | 15,65      | 2021.10.17 |
    | Bækkelagets SK                | 466         | 169   | Kule    | Johnny Gundersen                 | Nittedal               | 6,56       | 2021.10.30 |
    | Bækkelagets SK                | 467         | 150   | Lut     | Johnny Gundersen                 | Fet                    | 2,27       | 2021.09.21 |
    | Bækkelagets SK                | 468         | 107   | 200     | Karl Skaslien                    | Oslo/St                | 32,13      | 2021.10.16 |
    | Bækkelagets SK                | 469         | 88    | 800     | Oskar Amundsen                   | Nittedal               | 2,53,57    | 2021.10.30 |
    | Bækkelagets SK                | 470         | 80    | Hut     | Johnny Gundersen                 | Fet                    | 1,10       | 2021.09.21 |
    | Bækkelagets SK                | 471         | 73    | 400     | Didrik Hestenes                  | Bækkelaget             | 1,14,74    | 2021.10.04 |
    | Bækkelagets SK                | 472         | 72    | 400     | Lars Borander                    | Bækkelaget             | 1,14,79    | 2021.10.04 |
    | Bækkelagets SK                | 473         | 65    | 1500    | Jørgen Gether                    | Oslo/St                | 6,08,23    | 2021.10.16 |
    | Bækkelagets SK                | 474         | 58    | Lengde  | Johnny Gundersen                 | Oslo/St                | 3,77       | 2021.10.16 |
    | Bækkelagets SK                | 475         | 52    | 100     | Halvor Johnsen                   | Nittedal               | 15,62      | 2021.10.30 |
    | Bækkelagets SK                | 476         | 51    | Høyde   | Jørgen Gether                    | Bækkelaget             | 1,27       | 2021.10.04 |
    | Bækkelagets SK                | 477         | 30    | 200     | Johnny Gundersen                 | Oslo/St                | 33,5       | 2021.10.16 |
    | Bækkelagets SK                | 478         | 19    | 400     | Arvin Engstad                    | Bækkelaget             | 1,17,36    | 2021.10.04 |
    | Bækkelagets SK                | 479         | 4     | 100     | Johnny Gundersen                 | Oslo/St                | 15,8       | 2021.10.16 |
    | Bærums Verk IF                | 480         | 651   | 100     | Franz Holmen                     | Nadderud               | 11,81      | 2021.10.16 |
    | Bærums Verk IF                | 481         | 199   | 100     | Ole Paulsen                      | Vik                    | 14,44      | 2021.10.02 |
    | Bæverfjord IL                 | 482         | 579   | 800     | Abel Raaen                       | Molde                  | 2,06,24    | 2021.06.20 |
    | Bæverfjord IL                 | 483         | 137   | 100     | Arnstein Sannes                  | Tingvoll               | 14,92      | 2021.09.18 |
    | Bøler IF                      | 484         | 733   | 5000    | Eldar Fagerbakke                 | Oslo/Bi                | 15,17,87   | 2021.09.25 |
    | Bøler IF                      | 485         | 464   | Diskos  | Richard Smitt-Ingebretsen        | Nesodden               | 29,42      | 2021.09.14 |
    | Bøler IF                      | 486         | 461   | Høyde   | Adrian Sandholtbråten            | Oslo/St                | 1,60       | 2021.10.16 |
    | Bøler IF                      | 487         | 442   | Slegge  | Richard Smitt-Ingebretsen        | Greveskogen            | 28,94      | 2021.10.30 |
    | Bøler IF                      | 488         | 406   | 200h    | Adrian Sandholtbråten            | Rjukan                 | 31,78      | 2021.09.12 |
    | Bøler IF                      | 489         | 381   | 400     | Adrian Sandholtbråten            | Nittedal               | 1,01,07    | 2021.10.30 |
    | Bøler IF                      | 490         | 378   | 1500    | Jonas Nordviken                  | Rjukan                 | 4,54,99    | 2021.09.12 |
    | Bøler IF                      | 491         | 371   | 1500    | Theodor Rennan                   | Rjukan                 | 4,56,26    | 2021.09.12 |
    | Bøler IF                      | 492         | 337   | Kule    | Richard Smitt-Ingebretsen        | Greveskogen            | 8,54       | 2021.10.30 |
    | Bøler IF                      | 493         | 335   | 1500    | Torje Steine                     | Rjukan                 | 5,03,20    | 2021.09.12 |
    | Bøler IF                      | 494         | 327   | 800     | Trym Gjedebo-Skarpeteig          | Nittedal               | 2,26,89    | 2021.10.30 |
    | Bøler IF                      | 495         | 296   | 200     | Viktor Rokne                     | Rjukan                 | 28,65      | 2021.09.12 |
    | Bøler IF                      | 496         | 285   | Lengde  | Theodor Rennan                   | Oslo/St                | 4,65       | 2021.10.16 |
    | Bøler IF                      | 497         | 270   | Tresteg | Theodor Rennan                   | Oslo/St                | 9,50       | 2021.10.16 |
    | Bøler IF                      | 498         | 197   | 200     | Torje Steine                     | Rjukan                 | 30,39      | 2021.09.12 |
    | Bøler IF                      | 499         | 191   | 200     | Jonas Nordviken                  | Rjukan                 | 30,51      | 2021.09.12 |
    | Bøler IF                      | 500         | 172   | 200     | Emil Castellacci                 | Oslo/St                | 30,87      | 2021.10.16 |
    | Bøler IF                      | 501         | 163   | Lengde  | Markus Nordviken                 | Rjukan                 | 4,17       | 2021.09.12 |
    | Bøler IF                      | 502         | 75    | 200     | Anders Henningsen                | Oslo/St                | 32,80      | 2021.10.16 |
    | Bøler IF                      | 503         | 35    | Høyde   | Markus Nordviken                 | Rjukan                 | 1,26       | 2021.09.12 |
    | Bøler IF                      | 504         | 5     | 100     | Viktor Rokne                     | Nittedal               | 16,03      | 2021.10.30 |
    | Børsa IL                      | 505         | 925   | 800     | Kjetil Gagnås                    | Trondheim              | 1,49,71    | 2021.09.28 |
    | Børsa IL                      | 506         | 836   | 1500    | Kjetil Gagnås                    | Trondheim              | 3,52,60    | 2021.09.28 |
    | Børsa IL                      | 507         | 794   | 400     | Kjetil Gagnås                    | Trondheim              | 49,81      | 2021.09.28 |
    | Børsa IL                      | 508         | 692   | 200     | Kjetil Gagnås                    | Trondheim              | 23,55      | 2021.09.28 |
    | Dimna IL                      | 509         | 1256  | 400h    | Karsten Warholm                  | Tokyo/JPN              | 45,94      | 2021.08.29 |
    | Dimna IL                      | 510         | 1043  | 400     | Karsten Warholm                  | Lausanne/SUI           | 45,51      | 2021.08.26 |
    | Dimna IL                      | 511         | 910   | 100     | Jonas Ose                        | Molde                  | 10,74      | 2021.06.20 |
    | Dimna IL                      | 512         | 876   | 200     | Jonas Ose                        | Molde                  | 21,87      | 2021.06.20 |
    | Dimna IL                      | 513         | 787   | Spyd    | Iver Moldskred                   | Kristiansand           | 62,05      | 2021.10.06 |
    | Dimna IL                      | 514         | 786   | Lengde  | Toralv Opsal                     | Oslo/Bi                | 6,81       | 2021.09.25 |
    | Dimna IL                      | 515         | 770   | 100     | Simon Grimstad                   | Leikvang               | 11,29      | 2021.08.29 |
    | Dimna IL                      | 516         | 751   | 200     | Sture Måseide                    | Ravnanger              | 22,98      | 2021.09.15 |
    | Dimna IL                      | 517         | 744   | 200     | Simon Grimstad                   | Leikvang               | 23,04      | 2021.08.29 |
    | Dimna IL                      | 518         | 732   | 100     | Sture Måseide                    | Ravnanger              | 11,45      | 2021.09.15 |
    | Dimna IL                      | 519         | 725   | 200     | Sondre Espelid                   | Jessheim               | 23,23      | 2021.09.09 |
    | Dimna IL                      | 520         | 723   | 400     | Simon Grimstad                   | Molde                  | 51,25      | 2021.06.20 |
    | Dimna IL                      | 521         | 721   | 400h    | Simon Grimstad                   | Molde                  | 56,57      | 2021.06.20 |
    | Dimna IL                      | 522         | 709   | 100     | Sondre Espelid                   | Ulsteinvik             | 11,55      | 2021.10.28 |
    | Dimna IL                      | 523         | 686   | 100     | Fredrik Pedersen                 | Nadderud               | 11,65      | 2021.10.16 |
    | Dimna IL                      | 524         | 668   | 200     | Fredrik Pedersen                 | Trondheim              | 23,79      | 2021.09.28 |
    | Dimna IL                      | 525         | 661   | Lut     | Jonas Ose                        | Ulsteinvik             | 2,98       | 2021.10.28 |
    | Dimna IL                      | 526         | 659   | Diskos  | Toralv Opsal                     | Oslo/NIH               | 38,59      | 2021.09.22 |
    | Dimna IL                      | 527         | 648   | Kule    | Iver Moldskred                   | Ravnanger              | 12,73      | 2021.09.15 |
    | Dimna IL                      | 528         | 648   | 100     | Gabriel Overvåg                  | Oslo/Bi                | 11,82      | 2021.09.25 |
    | Dimna IL                      | 529         | 638   | 400     | Sture Måseide                    | Oslo/Bi                | 53,16      | 2021.09.25 |
    | Dimna IL                      | 530         | 626   | Diskos  | Iver Moldskred                   | Ravnanger              | 36,90      | 2021.09.15 |
    | Dimna IL                      | 531         | 601   | 400     | Fredrik Pedersen                 | Nadderud               | 54,07      | 2021.10.16 |
    | Dimna IL                      | 532         | 588   | Høyde   | Jonas Ose                        | Ulsteinvik             | 1,73       | 2021.10.28 |
    | Dimna IL                      | 533         | 558   | Tresteg | Keerthan Sivapalan               | Ulsteinvik             | 11,98      | 2021.10.28 |
    | Dimna IL                      | 534         | 496   | 100     | Keerthan Sivapalan               | Molde                  | 12,58      | 2021.06.20 |
    | Dimna IL                      | 535         | 496   | 200     | Keerthan Sivapalan               | Molde                  | 25,73      | 2021.06.20 |
    | Dimna IL                      | 536         | 481   | Lengde  | Keerthan Sivapalan               | Ulsteinvik             | 5,46       | 2021.10.28 |
    | Dimna IL                      | 537         | 433   | Lut     | Keerthan Sivapalan               | Ulsteinvik             | 2,59       | 2021.10.28 |
    | Dimna IL                      | 538         | 433   | Slegge  | Iver Moldskred                   | Molde                  | 28,43      | 2021.06.20 |
    | Dimna IL                      | 539         | 422   | 200     | Kristoffer Skoge                 | Molde                  | 26,73      | 2021.06.20 |
    | Dimna IL                      | 540         | 419   | Stav    | Keerthan Sivapalan               | Molde                  | 2,70       | 2021.06.20 |
    | Dimna IL                      | 541         | 395   | 200h    | Håvard Dimmen                    | Ålesund                | 31,99      | 2021.09.30 |
    | Dimna IL                      | 542         | 367   | 800     | Kent Breivik                     | Ulsteinvik             | 2,23,06    | 2021.10.28 |
    | Dimna IL                      | 543         | 353   | Høyde   | Håvard Dimmen                    | Molde                  | 1,50       | 2021.06.20 |
    | Dimna IL                      | 544         | 329   | 200     | Håvard Dimmen                    | Ulsteinvik             | 28,13      | 2021.10.28 |
    | Dimna IL                      | 545         | 320   | 200     | Markus Steinnes                  | Ørsta                  | 28,27      | 2021.10.07 |
    | Dimna IL                      | 546         | 158   | 200     | Martinus Dalsøren                | Ulsteinvik             | 31,12      | 2021.10.28 |
    | Dimna IL                      | 547         | 96    | Høyde   | Marius Anderson                  | Molde                  | 1,30       | 2021.06.20 |
    | Dimna IL                      | 548         | 29    | Lengde  | Marius Anderson                  | Molde                  | 3,66       | 2021.06.20 |
    | Dimna IL                      | 549         | 19    | Høyde   | Sebastian Gyllensten             | Molde                  | 1,25       | 2021.06.20 |
    | Dombås IL                     | 550         | 626   | 3000    | Syver Nørstegård                 | Lillehammer            | 9,16,91    | 2021.09.26 |
    | Drøbak-Frogn IL Friidrett     | 551         | 594   | 800     | Anders Haugene                   | Oslo/St                | 2,05,28    | 2021.10.16 |
    | Drøbak-Frogn IL Friidrett     | 552         | 580   | 800     | August Ellingsen                 | Nittedal               | 2,06,17    | 2021.10.30 |
    | Drøbak-Frogn IL Friidrett     | 553         | 538   | 800     | Vinter Andersson                 | Oslo/St                | 2,09,01    | 2021.10.16 |
    | Drøbak-Frogn IL Friidrett     | 554         | 526   | 1500    | Anders Haugene                   | Oslo/Bi                | 4,29,94    | 2021.09.25 |
    | Drøbak-Frogn IL Friidrett     | 555         | 461   | 100     | Scott Randall                    | Leirvik                | 12,77      | 2021.09.13 |
    | Drøbak-Frogn IL Friidrett     | 556         | 456   | 1500    | Vinter Andersson                 | Oslo/Bi                | 4,41,12    | 2021.09.25 |
    | Drøbak-Frogn IL Friidrett     | 557         | 435   | 200     | Scott Randall                    | Knarvik                | 26,54      | 2021.09.23 |
    | Drøbak-Frogn IL Friidrett     | 558         | 367   | Lut     | Scott Randall                    | Hvam                   | 2,50       | 2021.10.23 |
    | Drøbak-Frogn IL Friidrett     | 559         | 288   | Lengde  | Scott Randall                    | Oslo/St                | 4,66       | 2021.10.16 |
    | Drøbak-Frogn IL Friidrett     | 560         | 288   | Spyd    | Scott Randall                    | Ski                    | 27,54      | 2021.09.25 |
    | Drøbak-Frogn IL Friidrett     | 561         | 263   | 100     | Jo Alnæs                         | Ås                     | 13,99      | 2021.10.13 |
    | Drøbak-Frogn IL Friidrett     | 562         | 226   | 200     | Marcus Dahl                      | Drøbak                 | 29,86      | 2021.06.19 |
    | Drøbak-Frogn IL Friidrett     | 563         | 220   | 200     | Leon Tryti                       | Oslo/St                | 29,97      | 2021.10.16 |
    | Drøbak-Frogn IL Friidrett     | 564         | 157   | Kule    | Scott Randall                    | Greveskogen            | 6,42       | 2021.10.30 |
    | Drøbak-Frogn IL Friidrett     | 565         | 105   | Diskos  | Scott Randall                    | Greveskogen            | 16,32      | 2021.10.30 |
    | Drøbak-Frogn IL Friidrett     | 566         | 94    | 200     | Ole Hovda                        | Drøbak                 | 32,39      | 2021.06.19 |
    | Drøbak-Frogn IL Friidrett     | 567         | 58    | 1500    | Scott Randall                    | Knarvik                | 6,10,44    | 2021.09.23 |
    | Drøbak-Frogn IL Friidrett     | 568         | 35    | Stav    | Kristoffer Randall               | Rjukan                 | 1,62       | 2021.09.12 |
    | Drøbak-Frogn IL Friidrett     | 569         | 32    | 200     | Anton Lalinder-Fosse             | Drøbak                 | 33,70      | 2021.06.19 |
    | Drøbak-Frogn IL Friidrett     | 570         | 19    | Høyde   | Leon Tryti                       | Oslo/St                | 1,25       | 2021.10.16 |
    | Drøbak-Frogn IL Friidrett     | 571         | 19    | Høyde   | Scott Randall                    | Greveskogen            | 1,25       | 2021.10.30 |
    | Egersunds IK                  | 572         | 454   | 5000    | Thomas Hetland                   | Egersund               | 17,48,88   | 2021.09.25 |
    | Egersunds IK                  | 573         | 454   | 3000    | Samuel Stokkeland                | Egersund               | 10,12,58   | 2021.09.25 |
    | Egersunds IK                  | 574         | 443   | 3000    | Bård Kvinen                      | Egersund               | 10,16,46   | 2021.09.25 |
    | Egersunds IK                  | 575         | 425   | 5000    | Bård Kvinen                      | Egersund               | 18,08,42   | 2021.09.25 |
    | Egersunds IK                  | 576         | 411   | 5000    | Marthon Hetland                  | Egersund               | 18,17,86   | 2021.09.25 |
    | Egersunds IK                  | 577         | 396   | 1500    | Bård Kvinen                      | Egersund               | 4,51,58    | 2021.09.25 |
    | Egersunds IK                  | 578         | 396   | 5000    | Ingve Aalbu                      | Egersund               | 18,27,95   | 2021.09.25 |
    | Egersunds IK                  | 579         | 395   | 3000    | Harald Lædre                     | Egersund               | 10,34,55   | 2021.09.25 |
    | Egersunds IK                  | 580         | 394   | 200     | Olliver Noreng                   | Lillehammer            | 27,12      | 2021.09.26 |
    | Egersunds IK                  | 581         | 390   | 100     | Olliver Noreng                   | Lillehammer            | 13,18      | 2021.09.26 |
    | Egersunds IK                  | 582         | 389   | 3000    | Ingve Aalbu                      | Egersund               | 10,37,11   | 2021.09.25 |
    | Egersunds IK                  | 583         | 388   | 5000    | Harald Lædre                     | Egersund               | 18,33,84   | 2021.09.25 |
    | Egersunds IK                  | 584         | 371   | 1500    | Samuel Stokkeland                | Egersund               | 4,56,22    | 2021.09.25 |
    | Egersunds IK                  | 585         | 371   | 5000    | Jon Aasen                        | Egersund               | 18,45,87   | 2021.09.25 |
    | Egersunds IK                  | 586         | 366   | 5000    | Trond Svanøe                     | Egersund               | 18,49,55   | 2021.09.25 |
    | Egersunds IK                  | 587         | 363   | 5000    | Owe Mikkelsen                    | Egersund               | 18,51,32   | 2021.09.25 |
    | Egersunds IK                  | 588         | 357   | 5000    | Leif Nesvåg                      | Egersund               | 18,55,63   | 2021.09.25 |
    | Egersunds IK                  | 589         | 356   | 3000    | Kjetil Torgersen                 | Egersund               | 10,50,35   | 2021.09.25 |
    | Egersunds IK                  | 590         | 353   | Høyde   | Odin Tingbø                      | Haugesund              | 1,50       | 2021.09.12 |
    | Egersunds IK                  | 591         | 333   | 3000    | Fredrik Andersen                 | Egersund               | 11,00,16   | 2021.09.25 |
    | Egersunds IK                  | 592         | 332   | Lengde  | Ståle Feyling                    | Egersund               | 4,84       | 2021.09.25 |
    | Egersunds IK                  | 593         | 295   | Høyde   | Olliver Noreng                   | Jessheim               | 1,45       | 2021.09.09 |
    | Egersunds IK                  | 594         | 290   | 3000    | Ole Garpestad                    | Egersund               | 11,19,36   | 2021.09.25 |
    | Egersunds IK                  | 595         | 273   | 3000    | Helge Åse                        | Egersund               | 11,27,68   | 2021.09.25 |
    | Egersunds IK                  | 596         | 249   | 5000    | Ole Nodland                      | Egersund               | 20,23,61   | 2021.09.25 |
    | Egersunds IK                  | 597         | 240   | Lengde  | Nikolai Noreng                   | Lyngdal                | 4,47       | 2021.09.26 |
    | Egersunds IK                  | 598         | 233   | Høyde   | Martin Larsen                    | Haugesund              | 1,40       | 2021.09.12 |
    | Egersunds IK                  | 599         | 219   | 100     | Odin Tingbø                      | Sandnes                | 14,30      | 2021.10.28 |
    | Egersunds IK                  | 600         | 214   | 5000    | Øystein Jørgensborg              | Egersund               | 20,56,40   | 2021.09.25 |
    | Egersunds IK                  | 601         | 206   | 3000    | Steinar Nordvoll                 | Egersund               | 12,01,50   | 2021.09.25 |
    | Egersunds IK                  | 602         | 202   | 3000    | Øystein Jørgensborg              | Egersund               | 12,03,18   | 2021.09.25 |
    | Egersunds IK                  | 603         | 200   | Hut     | Odin Tingbø                      | Egersund               | 1,16       | 2021.09.25 |
    | Egersunds IK                  | 604         | 197   | 5000    | Steinar Nordvoll                 | Egersund               | 21,12,13   | 2021.09.25 |
    | Egersunds IK                  | 605         | 188   | 5000    | Olav Egebakken                   | Egersund               | 21,22,08   | 2021.09.25 |
    | Egersunds IK                  | 606         | 182   | 1500    | Steinar Nordvoll                 | Egersund               | 5,36,83    | 2021.09.25 |
    | Egersunds IK                  | 607         | 156   | 100     | Martin Larsen                    | Sandnes                | 14,77      | 2021.10.28 |
    | Egersunds IK                  | 608         | 140   | Lut     | Odin Tingbø                      | Egersund               | 2,26       | 2021.09.25 |
    | Egersunds IK                  | 609         | 80    | Hut     | Olliver Noreng                   | Egersund               | 1,10       | 2021.09.25 |
    | Egersunds IK                  | 610         | 70    | 100     | Anders Sørli                     | Sandnes                | 15,47      | 2021.10.28 |
    | Eikanger IL                   | 611         | 562   | 5000    | Magnus-Johan Færø                | Osterøy                | 16,44,53   | 2021.10.24 |
    | Eikanger IL                   | 612         | 533   | 5000    | Jo-Harald Færø                   | Ostereidet             | 17,01,0    | 2021.09.26 |
    | Eikanger IL                   | 613         | 514   | 1500    | Jo-Harald Færø                   | Ostereidet             | 4,31,8     | 2021.09.26 |
    | Eikanger IL                   | 614         | 453   | 3000    | Jo-Harald Færø                   | Ostereidet             | 10,13,0    | 2021.09.26 |
    | Eikanger IL                   | 615         | 391   | 5000    | Einar Færø                       | Osterøy                | 18,31,08   | 2021.10.24 |
    | Eikanger IL                   | 616         | 352   | 1500    | Einar Færø                       | Arna                   | 4,59,88    | 2021.10.13 |
    | Eikanger IL                   | 617         | 333   | 5000    | Bjørnar Eidsheim                 | Ostereidet             | 19,13,8    | 2021.09.26 |
    | Eikanger IL                   | 618         | 306   | Diskos  | Geir Bjørsvik                    | Ostereidet             | 23,27      | 2021.09.26 |
    | Eikanger IL                   | 619         | 287   | Slegge  | Arvid Hauge                      | Ostereidet             | 20,70      | 2021.09.26 |
    | Eikanger IL                   | 620         | 267   | 10000   | Arvid Hauge                      | Ostereidet             | 42,56,4    | 2021.09.26 |
    | Eikanger IL                   | 621         | 180   | 5000    | Nikolai Færø                     | Ostereidet             | 21,29,6    | 2021.09.26 |
    | Eikanger IL                   | 622         | 178   | Kule    | Arvid Hauge                      | Ostereidet             | 6,66       | 2021.09.26 |
    | Eikanger IL                   | 623         | 177   | 5000    | Arvid Hauge                      | Ostereidet             | 21,32,9    | 2021.09.26 |
    | Eikanger IL                   | 624         | 129   | 3000    | Bjarne Gausvik                   | Førde                  | 12,46,17   | 2021.08.22 |
    | Eikanger IL                   | 625         | 129   | 5000    | Bjarne Gausvik                   | Førde                  | 22,24,32   | 2021.08.22 |
    | Eikanger IL                   | 626         | 126   | 1500    | Arvid Hauge                      | Arna                   | 5,51,34    | 2021.10.13 |
    | Eikanger IL                   | 627         | 124   | Diskos  | Arvid Hauge                      | Ostereidet             | 16,94      | 2021.09.26 |
    | Eikanger IL                   | 628         | 116   | 3000    | Arvid Hauge                      | Arna                   | 12,54,16   | 2021.10.13 |
    | Eikanger IL                   | 629         | 115   | 1500    | Bjarne Gausvik                   | Førde                  | 5,54,29    | 2021.08.22 |
    | Eikanger IL                   | 630         | 86    | 5000    | Jan Kårbø                        | Ostereidet             | 23,15,3    | 2021.09.26 |
    | Eikanger IL                   | 631         | 70    | 5000    | Brynjar Nordanger                | Ostereidet             | 23,37,0    | 2021.09.26 |
    | Eikanger IL                   | 632         | 62    | 800     | Arvid Hauge                      | Arna                   | 2,56,80    | 2021.10.13 |
    | Eikanger IL                   | 633         | 26    | 800     | Sjur Heggernes                   | Ostereidet             | 3,01,3     | 2021.09.26 |
    | Eikanger IL                   | 634         | 16    | 200     | Arvid Hauge                      | Ostereidet             | 33,8       | 2021.09.26 |
    | Eikanger IL                   | 635         | 13    | 400     | Arvid Hauge                      | Arna                   | 1,17,67    | 2021.10.13 |
    | Eikanger IL                   | 636         | 11    | 5000    | Inge Nævdal                      | Ostereidet             | 24,59,4    | 2021.09.26 |
    | Eikefjord IL                  | 637         | 504   | 10000   | Mats Høyset                      | Førde                  | 36,32,62   | 2021.08.22 |
    | Eikefjord IL                  | 638         | 217   | 400     | Håvard Austreim                  | Florø                  | 1,07,94    | 2021.06.05 |
    | Eikefjord IL                  | 639         | 58    | 200     | William Kjellevold               | Florø                  | 32,9       | 2021.06.05 |
    | FIK Orion                     | 640         | 1021  | 100     | Jonathan Quarcoo                 | Lillehammer            | 10,35      | 2021.09.26 |
    | FIK Orion                     | 641         | 1002  | 200     | Jonathan Quarcoo                 | Lillehammer            | 20,87      | 2021.09.26 |
    | FIK Orion                     | 642         | 873   | 1500    | Even Dahl                        | Kristiansand           | 3,49,21    | 2021.10.06 |
    | FIK Orion                     | 643         | 855   | Spyd    | Marcus Henriksen                 | Ravnanger              | 66,86      | 2021.09.15 |
    | FIK Orion                     | 644         | 767   | 100     | Amiin Arten                      | Jessheim               | 11,30      | 2021.09.09 |
    | FIK Orion                     | 645         | 754   | 200     | Anders Kvesetberget              | Lillehammer            | 22,95      | 2021.09.26 |
    | FIK Orion                     | 646         | 744   | 200     | Amiin Arten                      | Jessheim               | 23,04      | 2021.09.09 |
    | FIK Orion                     | 647         | 726   | 200     | Aleksander Haug                  | Lillehammer            | 23,22      | 2021.09.26 |
    | FIK Orion                     | 648         | 719   | 200     | Marcus Henriksen                 | Lillehammer            | 23,28      | 2021.09.26 |
    | FIK Orion                     | 649         | 711   | 100     | Martin Pettersen                 | Lillehammer            | 11,54      | 2021.09.26 |
    | FIK Orion                     | 650         | 709   | 100     | Marcus Henriksen                 | Trondheim              | 11,55      | 2021.09.28 |
    | FIK Orion                     | 651         | 703   | 200     | Martin Pettersen                 | Lillehammer            | 23,44      | 2021.09.26 |
    | FIK Orion                     | 652         | 686   | 100     | Anders Kvesetberget              | Lillehammer            | 11,65      | 2021.09.26 |
    | FIK Orion                     | 653         | 684   | 100     | Aleksander Haug                  | Lillehammer            | 11,66      | 2021.09.26 |
    | FIK Orion                     | 654         | 577   | 400     | Amiin Arten                      | Lillehammer            | 54,71      | 2021.09.26 |
    | FIK Orion                     | 655         | 519   | Slegge  | Birger Søyland                   | Løten                  | 33,62      | 2021.08.14 |
    | FIK Orion                     | 656         | 498   | Diskos  | Birger Søyland                   | Løten                  | 30,85      | 2021.08.14 |
    | FIK Orion                     | 657         | 461   | 800     | Henrik Stensby                   | Lillehammer            | 2,14,81    | 2021.09.26 |
    | FIK Orion                     | 658         | 424   | 3000    | Henrik Stensby                   | Lillehammer            | 10,23,79   | 2021.09.26 |
    | FIK Orion                     | 659         | 420   | Lengde  | Matz Hendriks                    | Elverum                | 5,20       | 2021.06.17 |
    | FIK Orion                     | 660         | 418   | 1500    | Henrik Stensby                   | Lillehammer            | 4,47,66    | 2021.09.26 |
    | FIK Orion                     | 661         | 302   | Tresteg | Henrik Stensby                   | Gausdal                | 9,76       | 2021.05.09 |
    | FIK Orion                     | 662         | 289   | 1500    | Emil Klingen                     | Rjukan                 | 5,12,66    | 2021.09.12 |
    | FIK Orion                     | 663         | 286   | 200     | Henrik Lindbakken                | Rjukan                 | 28,83      | 2021.09.12 |
    | FIK Ren-Eng                   | 664         | 878   | 3000    | Esten Hauen                      | Trondheim              | 8,15,98    | 2021.09.28 |
    | FIK Ren-Eng                   | 665         | 863   | 1500    | Esten Hauen                      | Oslo/Bi                | 3,50,09    | 2021.09.25 |
    | FIK Ren-Eng                   | 666         | 842   | 800     | Esten Hauen                      | Trondheim              | 1,52,93    | 2021.09.28 |
    | FIK Ren-Eng                   | 667         | 798   | 3000H   | Esten Hauen                      | Brandbu                | 9,17,79    | 2021.09.25 |
    | FIK Ren-Eng                   | 668         | 773   | 800     | Sverre Grønvold                  | Jessheim               | 1,55,90    | 2021.09.09 |
    | FIK Ren-Eng                   | 669         | 740   | 1500    | Sverre Grønvold                  | Oslo/Bi                | 4,02,18    | 2021.09.25 |
    | FIK Ren-Eng                   | 670         | 731   | 400     | Esten Hauen                      | Oslo/Bi                | 51,08      | 2021.09.25 |
    | FIK Ren-Eng                   | 671         | 677   | 3000    | Lars Jordet                      | Trondheim              | 9,02,97    | 2021.09.28 |
    | FIK Ren-Eng                   | 672         | 650   | 800     | Halvor Mikkelsen                 | Jessheim               | 2,01,94    | 2021.09.09 |
    | FIK Ren-Eng                   | 673         | 647   | 3000    | David Rieger                     | Nadderud               | 9,11,14    | 2021.10.16 |
    | FIK Ren-Eng                   | 674         | 628   | 5000    | Per Often                        | Oslo/Bi                | 16,09,07   | 2021.09.25 |
    | FIK Ren-Eng                   | 675         | 616   | 3000    | Martin Grønvold                  | Lillehammer            | 9,20,05    | 2021.09.26 |
    | FIK Ren-Eng                   | 676         | 615   | 3000    | Sverre Grønvold                  | Lillehammer            | 9,20,23    | 2021.09.26 |
    | FIK Ren-Eng                   | 677         | 602   | 1500    | Martin Grønvold                  | Oslo/Bi                | 4,18,88    | 2021.09.25 |
    | FIK Ren-Eng                   | 678         | 595   | 1500    | David Rieger                     | Oslo/Bi                | 4,19,86    | 2021.09.25 |
    | FIK Ren-Eng                   | 679         | 592   | 10000   | Jon Nygaard                      | Førde                  | 34,40,60   | 2021.08.22 |
    | FIK Ren-Eng                   | 680         | 578   | 5000    | David Rieger                     | Lillehammer            | 16,35,77   | 2021.09.26 |
    | FIK Ren-Eng                   | 681         | 575   | 5000    | Jon Nygaard                      | Førde                  | 16,37,38   | 2021.08.22 |
    | FIK Ren-Eng                   | 682         | 564   | 1500    | Halvor Mikkelsen                 | Oslo/Bi                | 4,24,27    | 2021.09.25 |
    | FIK Ren-Eng                   | 683         | 563   | 1500    | Jørgen Moen                      | Oslo/Bi                | 4,24,37    | 2021.09.25 |
    | FIK Ren-Eng                   | 684         | 555   | 3000    | Jon Nygaard                      | Brandbu                | 9,38,28    | 2021.09.25 |
    | FIK Ren-Eng                   | 685         | 538   | 800     | Lars Jordet                      | Trondheim              | 2,08,96    | 2021.09.28 |
    | FIK Ren-Eng                   | 686         | 523   | 1500    | Jon Nygaard                      | Oslo/Bi                | 4,30,38    | 2021.09.25 |
    | FIK Ren-Eng                   | 687         | 422   | 800     | Jon Nygaard                      | Førde                  | 2,18,12    | 2021.08.22 |
    | FIL Aks-77                    | 688         | 488   | 5000    | Øystein Aamli                    | Ostereidet             | 17,28,0    | 2021.09.26 |
    | FIL Aks-77                    | 689         | 457   | 1500    | Jonas Lilleskare                 | Arna                   | 4,40,86    | 2021.10.13 |
    | FIL Aks-77                    | 690         | 456   | 3000    | Jonas Lilleskare                 | Knarvik                | 10,11,75   | 2021.09.23 |
    | FIL Aks-77                    | 691         | 426   | 1500    | Andreas Lilleskare               | Haugesund              | 4,46,35    | 2021.09.12 |
    | FIL Aks-77                    | 692         | 390   | 1500    | Stig Eide                        | Knarvik                | 4,52,68    | 2021.09.23 |
    | FIL Aks-77                    | 693         | 301   | 1500    | Sondre Hodnekvam                 | Fana                   | 5,09,94    | 2021.09.28 |
    | FIL Aks-77                    | 694         | 298   | Lut     | Ørjan Moss                       | Hvam                   | 2,42       | 2021.10.23 |
    | FIL Aks-77                    | 695         | 296   | Spyd    | Arne Reigstad                    | Bergen                 | 28,00      | 2021.10.30 |
    | FIL Aks-77                    | 696         | 271   | 5000    | Helge Færø                       | Ostereidet             | 20,04,5    | 2021.09.26 |
    | FIL Aks-77                    | 697         | 268   | 200     | Stig Eide                        | Knarvik                | 29,13      | 2021.09.23 |
    | FIL Aks-77                    | 698         | 250   | Stav    | Ørjan Moss                       | Os                     | 2,15       | 2021.09.26 |
    | FIL Aks-77                    | 699         | 240   | Hut     | Ørjan Moss                       | Arna                   | 1,18       | 2021.10.13 |
    | FIL Aks-77                    | 700         | 208   | 100     | Ørjan Moss                       | Hamar                  | 14,38      | 2021.08.22 |
    | FIL Aks-77                    | 701         | 181   | Høyde   | Ørjan Moss                       | Førde                  | 1,36       | 2021.08.22 |
    | FIL Aks-77                    | 702         | 166   | Lengde  | Stig Eide                        | Knarvik                | 4,18       | 2021.09.23 |
    | FIL Aks-77                    | 703         | 153   | Lengde  | Ørjan Moss                       | Arna                   | 4,13       | 2021.10.13 |
    | FIL Aks-77                    | 704         | 145   | 200     | Ørjan Moss                       | Knarvik                | 31,38      | 2021.09.23 |
    | FIL Aks-77                    | 705         | 123   | Slegge  | Kjell Lilleskare                 | Bergen                 | 13,82      | 2021.10.30 |
    | FIL Aks-77                    | 706         | 102   | 800     | Nikolai Torvund                  | Knarvik                | 2,51,77    | 2021.09.23 |
    | FIL Aks-77                    | 707         | 69    | Tresteg | Ørjan Moss                       | Os                     | 7,88       | 2021.09.26 |
    | FIL Aks-77                    | 708         | 62    | Kule    | Kjell Lilleskare                 | Bergen                 | 5,41       | 2021.10.30 |
    | FIL Aks-77                    | 709         | 58    | 3000    | Alf Fjeldstad                    | Os                     | 13,34,43   | 2021.09.26 |
    | FIL Aks-77                    | 710         | 47    | 1500    | Alf Fjeldstad                    | Os                     | 6,13,51    | 2021.09.26 |
    | FIL Aks-77                    | 711         | 22    | 200     | Sjur Heggernes                   | Fana                   | 33,92      | 2021.09.28 |
    | FIL Aks-77                    | 712         | 2     | Spyd    | Kjell Lilleskare                 | Bergen                 | 14,48      | 2021.10.30 |
    | FIL Borg                      | 713         | 850   | 400     | Herman Baranyi-Berge             | Alhama de Murcia/ESP   | 48,74      | 2021.02.20 |
    | FIL Borg                      | 714         | 791   | 200     | Herman Baranyi-Berge             | La Nucia/ESP           | 22,61      | 2021.06.05 |
    | Fagernes IL                   | 715         | 652   | Høyde   | Kenneth Hoffmann                 | Oslo/Bi                | 1,80       | 2021.09.25 |
    | Fagernes IL                   | 716         | 572   | Lengde  | Åsmund Frøyen                    | Fagernes               | 5,85       | 2021.08.21 |
    | Fagernes IL                   | 717         | 540   | 200     | Kristofer Veri                   | Gjøvik                 | 25,18      | 2021.05.29 |
    | Fagernes IL                   | 718         | 532   | 100     | Gudmund Garvik                   | Fagernes               | 12,39      | 2021.08.21 |
    | Fagernes IL                   | 719         | 507   | 100     | Kristofer Veri                   | Fagernes               | 12,52      | 2021.08.21 |
    | Fagernes IL                   | 720         | 448   | 400     | Kristofer Veri                   | Fagernes               | 58,66      | 2021.08.21 |
    | Fagernes IL                   | 721         | 405   | Lut     | Kåre Strande                     | Hvam                   | 2,55       | 2021.10.23 |
    | Fagernes IL                   | 722         | 354   | Lengde  | Kristofer Veri                   | Fagernes               | 4,93       | 2021.08.21 |
    | Fagernes IL                   | 723         | 354   | Lengde  | Kåre Strande                     | Fagernes               | 4,93       | 2021.08.21 |
    | Fagernes IL                   | 724         | 273   | 100     | Kåre Strande                     | Fagernes               | 13,92      | 2021.08.21 |
    | Fagernes IL                   | 725         | 19    | Høyde   | Kåre Strande                     | Fagernes               | 1,25       | 2021.08.21 |
    | Fana IL                       | 726         | 1038  | Stav    | Pål Lillefosse                   | Tallinn/EST            | 5,60       | 2021.07.18 |
    | Fana IL                       | 727         | 886   | Høyde   | Vetle Ellingsen                  | Kristiansand           | 2,08       | 2021.10.06 |
    | Fana IL                       | 728         | 875   | Tresteg | Sondre Ytrearne                  | Fana                   | 14,96      | 2021.09.28 |
    | Fana IL                       | 729         | 870   | Høyde   | Erlend Raa                       | Kristiansand           | 2,06       | 2021.10.06 |
    | Fana IL                       | 730         | 820   | Stav    | Sebastian Hovland                | Fana                   | 4,53       | 2021.09.28 |
    | Fana IL                       | 731         | 782   | Lengde  | Carl Landsvik                    | Fana                   | 6,79       | 2021.09.28 |
    | Fana IL                       | 732         | 780   | Høyde   | Teodor Heldal                    | Fana                   | 1,95       | 2021.09.28 |
    | Fana IL                       | 733         | 778   | Tresteg | Oscar Stuhr                      | Ravnanger              | 14,02      | 2021.09.15 |
    | Fana IL                       | 734         | 755   | Tresteg | Erlend Raa                       | Leikvang               | 13,80      | 2021.08.29 |
    | Fana IL                       | 735         | 738   | Høyde   | Oscar Stuhr                      | Knarvik                | 1,90       | 2021.09.23 |
    | Fana IL                       | 736         | 734   | Lengde  | Teodor Heldal                    | Fana                   | 6,57       | 2021.09.28 |
    | Fana IL                       | 737         | 717   | Tresteg | Herman Rosenkilde                | Trondheim              | 13,45      | 2021.09.28 |
    | Fana IL                       | 738         | 711   | 5000    | Ådne Hernes                      | Arna                   | 15,28,10   | 2021.10.13 |
    | Fana IL                       | 739         | 701   | 3000    | Ådne Hernes                      | Arna                   | 8,56,63    | 2021.10.13 |
    | Fana IL                       | 740         | 696   | Høyde   | Mathias Herdlevær                | Fana                   | 1,85       | 2021.09.28 |
    | Fana IL                       | 741         | 694   | Lengde  | Sondre Ytrearne                  | Fana                   | 6,39       | 2021.09.28 |
    | Fana IL                       | 742         | 689   | Tresteg | Magnus Andersland                | Fana                   | 13,18      | 2021.09.28 |
    | Fana IL                       | 743         | 678   | Høyde   | Tobias Heldal                    | Fana                   | 1,83       | 2021.09.28 |
    | Fana IL                       | 744         | 678   | 1500    | Ådne Hernes                      | Fana                   | 4,09,22    | 2021.09.28 |
    | Fana IL                       | 745         | 673   | 3000H   | Ådne Hernes                      | Fana                   | 9,55,20    | 2021.09.28 |
    | Fana IL                       | 746         | 666   | Tresteg | Teodor Heldal                    | Leikvang               | 12,97      | 2021.08.29 |
    | Fana IL                       | 747         | 656   | Tresteg | Odin Øina                        | Fana                   | 12,88      | 2021.09.28 |
    | Fana IL                       | 748         | 645   | Lengde  | Oscar Stuhr                      | Fana                   | 6,17       | 2021.09.28 |
    | Fana IL                       | 749         | 631   | 200     | Sebastian Hovland                | Leikvang               | 24,17      | 2021.08.29 |
    | Fana IL                       | 750         | 623   | 100     | Julian Bastesen                  | La Nucia/ESP           | 11,94      | 2021.06.05 |
    | Fana IL                       | 751         | 611   | 800     | Aleksander Øyen                  | Os                     | 2,04,23    | 2021.09.26 |
    | Fana IL                       | 752         | 610   | 100     | Teodor Heldal                    | Fana                   | 12,00      | 2021.09.28 |
    | Fana IL                       | 753         | 607   | 200     | Julian Bastesen                  | La Nucia/ESP           | 24,42      | 2021.06.05 |
    | Fana IL                       | 754         | 606   | 100     | Nikolai Nitter                   | Os                     | 12,02      | 2021.09.26 |
    | Fana IL                       | 755         | 604   | Stav    | Gustav Holmefjord                | Fana                   | 3,45       | 2021.09.28 |
    | Fana IL                       | 756         | 598   | 100     | Sebastian Hovland                | Leikvang               | 12,06      | 2021.08.29 |
    | Fana IL                       | 757         | 597   | Lengde  | Magnus Andersland                | Fana                   | 5,96       | 2021.09.28 |
    | Fana IL                       | 758         | 594   | Tresteg | Markus Kongsrud                  | Fana                   | 12,31      | 2021.09.28 |
    | Fana IL                       | 759         | 586   | 800     | Marios Ktorides-Valen            | Fana                   | 2,05,79    | 2021.09.28 |
    | Fana IL                       | 760         | 580   | 200     | Oscar Stuhr                      | Os                     | 24,72      | 2021.09.26 |
    | Fana IL                       | 761         | 579   | Lengde  | Markus Kongsrud                  | Fana                   | 5,88       | 2021.09.28 |
    | Fana IL                       | 762         | 577   | 800     | Ådne Hernes                      | Fana                   | 2,06,38    | 2021.09.28 |
    | Fana IL                       | 763         | 575   | 200     | Vegard Rinde                     | Fana                   | 24,78      | 2021.09.28 |
    | Fana IL                       | 764         | 574   | 100     | Oscar Stuhr                      | Leirvik                | 12,18      | 2021.09.13 |
    | Fana IL                       | 765         | 570   | 100     | Andre Alford                     | Førde                  | 12,20      | 2021.08.22 |
    | Fana IL                       | 766         | 568   | 1500    | Aleksander Øyen                  | Fana                   | 4,23,73    | 2021.09.28 |
    | Fana IL                       | 767         | 566   | 3000    | Aleksander Øyen                  | Fana                   | 9,34,99    | 2021.09.28 |
    | Fana IL                       | 768         | 553   | 1500    | Marios Ktorides-Valen            | Fana                   | 4,25,81    | 2021.09.28 |
    | Fana IL                       | 769         | 548   | 400     | Vegard Rinde                     | Fana                   | 55,51      | 2021.09.28 |
    | Fana IL                       | 770         | 545   | 1500    | Lars Evensen                     | Oslo/Bi                | 4,27,01    | 2021.09.25 |
    | Fana IL                       | 771         | 542   | Lengde  | Benjamin Moen                    | Arna                   | 5,72       | 2021.10.13 |
    | Fana IL                       | 772         | 540   | 100     | Vegard Rinde                     | Fana                   | 12,35      | 2021.09.28 |
    | Fana IL                       | 773         | 537   | Lengde  | Sebastian Hovland                | Leikvang               | 5,70       | 2021.08.29 |
    | Fana IL                       | 774         | 537   | Lengde  | Odin Øina                        | Leirvik                | 5,70       | 2021.09.13 |
    | Fana IL                       | 775         | 521   | Lengde  | Mathias Herdlevær                | Leikvang               | 5,63       | 2021.08.29 |
    | Fana IL                       | 776         | 507   | Lengde  | Julian Bastesen                  | La Nucia/ESP           | 5,57       | 2021.06.05 |
    | Fana IL                       | 777         | 500   | 100     | Herman Rosenkilde                | Kristiansand           | 12,56      | 2021.10.06 |
    | Fana IL                       | 778         | 498   | Tresteg | Tobias Heldal                    | Leikvang               | 11,45      | 2021.08.29 |
    | Fana IL                       | 779         | 498   | 200h    | Benjamin Moen                    | Haugesund              | 29,92      | 2021.09.12 |
    | Fana IL                       | 780         | 490   | Tresteg | Vegard Rinde                     | Fana                   | 11,38      | 2021.09.28 |
    | Fana IL                       | 781         | 489   | Tresteg | Benjamin Moen                    | Haugesund              | 11,37      | 2021.09.12 |
    | Fana IL                       | 782         | 486   | Lengde  | Vegard Rinde                     | Fana                   | 5,48       | 2021.09.28 |
    | Fana IL                       | 783         | 481   | 100     | Odin Øina                        | Fana                   | 12,66      | 2021.09.28 |
    | Fana IL                       | 784         | 461   | Høyde   | Benjamin Moen                    | Fana                   | 1,60       | 2021.09.28 |
    | Fana IL                       | 785         | 455   | Lengde  | Nikolai Nitter                   | Fana                   | 5,35       | 2021.09.28 |
    | Fana IL                       | 786         | 451   | Høyde   | Johannes Handeland               | Fana                   | 1,59       | 2021.09.28 |
    | Fana IL                       | 787         | 449   | 1500    | Nils Rustad                      | Fana                   | 4,42,21    | 2021.09.28 |
    | Fana IL                       | 788         | 446   | 200     | Ola Tungesvik                    | Fana                   | 26,38      | 2021.09.28 |
    | Fana IL                       | 789         | 436   | 200     | Benjamin Moen                    | Fana                   | 26,53      | 2021.09.28 |
    | Fana IL                       | 790         | 424   | Lengde  | Tobias Heldal                    | Fana                   | 5,22       | 2021.09.28 |
    | Fana IL                       | 791         | 417   | 100     | Niklas Liland                    | Fana                   | 13,02      | 2021.09.28 |
    | Fana IL                       | 792         | 417   | 400     | Benjamin Moen                    | Arna                   | 59,75      | 2021.10.13 |
    | Fana IL                       | 793         | 362   | 800     | Nils Rustad                      | Fana                   | 2,23,47    | 2021.09.28 |
    | Fana IL                       | 794         | 355   | 3000    | Nils Rustad                      | Fana                   | 10,50,72   | 2021.09.28 |
    | Fana IL                       | 795         | 342   | 100     | Gustav Holmefjord                | Fana                   | 13,47      | 2021.09.28 |
    | Fana IL                       | 796         | 320   | Lengde  | Gustav Holmefjord                | Fana                   | 4,79       | 2021.09.28 |
    | Fana IL                       | 797         | 306   | Høyde   | Jakob Nitter                     | Haugesund              | 1,46       | 2021.09.12 |
    | Fana IL                       | 798         | 291   | 1500    | Håvard Nøttestad                 | Os                     | 5,12,14    | 2021.09.26 |
    | Fana IL                       | 799         | 290   | 3000    | Filip Hatlebrekke-Kvam           | Fana                   | 11,19,25   | 2021.09.28 |
    | Fana IL                       | 800         | 245   | Lengde  | Jonas Nilsen                     | Fana                   | 4,49       | 2021.09.28 |
    | Fana IL                       | 801         | 240   | 200     | Håvard Nøttestad                 | Fana                   | 29,61      | 2021.09.28 |
    | Fana IL                       | 802         | 237   | 1500    | Magnus Øyen                      | Fana                   | 5,23,83    | 2021.09.28 |
    | Fana IL                       | 803         | 234   | 1500    | Olav Ferning                     | Fana                   | 5,24,58    | 2021.09.28 |
    | Fana IL                       | 804         | 228   | 200     | Alexander Eikås                  | Leirvik                | 29,83      | 2021.09.13 |
    | Fana IL                       | 805         | 213   | 1500    | Finn Saint                       | Fana                   | 5,29,43    | 2021.09.28 |
    | Fana IL                       | 806         | 182   | 200     | Philip Moen                      | Arna                   | 30,68      | 2021.10.13 |
    | Fana IL                       | 807         | 179   | 400     | Nikolai Berge                    | Bergen                 | 1,09,69    | 2021.10.30 |
    | Fana IL                       | 808         | 178   | 100     | Håvard Nøttestad                 | Fana                   | 14,60      | 2021.09.28 |
    | Fana IL                       | 809         | 175   | 200     | Jakob Nitter                     | Os                     | 30,80      | 2021.09.26 |
    | Fana IL                       | 810         | 155   | 800     | Alexander Eikås                  | Fana                   | 2,45,49    | 2021.09.28 |
    | Fana IL                       | 811         | 149   | 200     | Matias Radoi                     | Fana                   | 31,29      | 2021.09.28 |
    | Fana IL                       | 812         | 145   | 800     | Magnus Øyen                      | Fana                   | 2,46,61    | 2021.09.28 |
    | Fana IL                       | 813         | 130   | 200     | Magnus Øyen                      | Fana                   | 31,67      | 2021.09.28 |
    | Fana IL                       | 814         | 121   | 100     | Neo Ottemöller                   | Fana                   | 15,05      | 2021.09.28 |
    | Fana IL                       | 815         | 106   | 200     | Felix Wiger-Nordås               | Fana                   | 32,16      | 2021.09.28 |
    | Fana IL                       | 816         | 103   | 200     | Johannes Holvik                  | Fana                   | 32,22      | 2021.09.28 |
    | Fana IL                       | 817         | 99    | 200     | Daniel Krossøy                   | Os                     | 32,29      | 2021.09.26 |
    | Fana IL                       | 818         | 99    | 800     | Finn Saint                       | Fana                   | 2,52,18    | 2021.09.28 |
    | Fana IL                       | 819         | 92    | 100     | Matias Radoi                     | Fana                   | 15,28      | 2021.09.28 |
    | Fana IL                       | 820         | 77    | 200     | Gard Ytrearne                    | Fana                   | 32,74      | 2021.09.28 |
    | Fana IL                       | 821         | 59    | 3000    | Daniel Krossøy                   | Fana                   | 13,33,84   | 2021.09.28 |
    | Fana IL                       | 822         | 51    | Høyde   | Felix Wiger-Nordås               | Fana                   | 1,27       | 2021.09.28 |
    | Fana IL                       | 823         | 16    | 200     | Viktor Wiik                      | Fana                   | 34,04      | 2021.09.28 |
    | Fana IL                       | 824         | 11    | 200     | Henrik Andersland                | Os                     | 34,15      | 2021.09.26 |
    | Fana IL                       | 825         | 7     | Lengde  | Jaden Holvik                     | Fana                   | 3,58       | 2021.09.28 |
    | Farsund og Lista IK           | 826         | 598   | 100     | Tarjei Håberg                    | Nadderud               | 12,06      | 2021.10.16 |
    | Farsund og Lista IK           | 827         | 551   | 200     | Tarjei Håberg                    | Lyngdal                | 25,05      | 2021.09.26 |
    | Farsund og Lista IK           | 828         | 456   | 100     | André Ytterdahl                  | Grimstad               | 12,80      | 2021.10.25 |
    | Farsund og Lista IK           | 829         | 424   | Lengde  | André Ytterdahl                  | Arendal                | 5,22       | 2021.08.21 |
    | Farsund og Lista IK           | 830         | 406   | 400     | André Ytterdahl                  | Grimstad               | 1,00,16    | 2021.10.25 |
    | Farsund og Lista IK           | 831         | 273   | Lengde  | Tarjei Håberg                    | Vanse                  | 4,60       | 2021.06.07 |
    | Farsund og Lista IK           | 832         | 180   | 100     | Torstein Pedersen                | Vanse                  | 14,59      | 2021.06.07 |
    | Farsund og Lista IK           | 833         | 171   | Lengde  | Torstein Pedersen                | Vanse                  | 4,20       | 2021.06.07 |
    | Finnøy IL                     | 834         | 92    | Tresteg | Erling Bleie                     | Førde                  | 8,06       | 2021.08.22 |
    | Finnøy IL                     | 835         | 74    | Lengde  | Erling Bleie                     | Førde                  | 3,83       | 2021.08.22 |
    | Finnøy IL                     | 836         | 51    | Høyde   | Erling Bleie                     | Førde                  | 1,27       | 2021.08.22 |
    | Finnøy IL                     | 837         | 25    | 100     | Erling Bleie                     | Førde                  | 15,85      | 2021.08.22 |
    | Fitjar Idrettslag             | 838         | 526   | 800     | Marius Pedersen                  | Leikvang               | 2,09,84    | 2021.08.29 |
    | Fitjar Idrettslag             | 839         | 512   | 1500    | Marius Pedersen                  | Fana                   | 4,32,12    | 2021.09.28 |
    | Fitjar Idrettslag             | 840         | 306   | Høyde   | Bjart Bø                         | Leirvik                | 1,46       | 2021.09.13 |
    | Fitjar Idrettslag             | 841         | 246   | Høyde   | Marius Pedersen                  | Leirvik                | 1,41       | 2021.09.13 |
    | Fitjar Idrettslag             | 842         | 224   | 100     | Marius Pedersen                  | Leirvik                | 14,26      | 2021.09.13 |
    | Fitjar Idrettslag             | 843         | 169   | 800     | Jonas Dalen                      | Bømlo                  | 2,43,92    | 2021.09.30 |
    | Fitjar Idrettslag             | 844         | 128   | 200     | Jonas Dalen                      | Leirvik                | 31,71      | 2021.09.13 |
    | Fitjar Idrettslag             | 845         | 101   | 200     | Ole-Jakob Wiik                   | Leirvik                | 32,25      | 2021.09.13 |
    | Fitjar Idrettslag             | 846         | 78    | 1500    | Harald Sæbø                      | Leirvik                | 6,04,42    | 2021.09.13 |
    | Fjellørnen IL                 | 847         | 874   | 5000    | Thomas Fremo                     | Trondheim              | 14,17,44   | 2021.09.28 |
    | Fjellørnen IL                 | 848         | 664   | 3000    | Thomas Fremo                     | Stadsbygd              | 9,06,4     | 2021.05.09 |
    | Fjærland IL                   | 849         | 352   | 200     | Vebjørn Mundal                   | Måndalen               | 27,76      | 2021.09.12 |
    | Fjærland IL                   | 850         | 245   | 1500    | Vebjørn Mundal                   | Sogndal                | 5,22,15    | 2021.05.12 |
    | Flatås Idrettslag             | 851         | 553   | 800     | Alf Stensø                       | Trondheim              | 2,07,92    | 2021.09.28 |
    | Flatås Idrettslag             | 852         | 379   | 5000    | Alf Stensø                       | Trondheim              | 18,40,28   | 2021.09.28 |
    | Florø Turn og IF              | 853         | 946   | 400     | Øyvind Kjerpeset                 | Lillestrøm             | 47,06      | 2021.08.29 |
    | Florø Turn og IF              | 854         | 942   | 400h    | Øyvind Kjerpeset                 | Kristiansand           | 51,13      | 2021.10.06 |
    | Florø Turn og IF              | 855         | 937   | 200     | Øyvind Kjerpeset                 | Oslo/Bi                | 21,37      | 2021.09.25 |
    | Florø Turn og IF              | 856         | 924   | 100     | Øyvind Kjerpeset                 | Oslo/Bi                | 10,69      | 2021.09.25 |
    | Florø Turn og IF              | 857         | 873   | 100     | Hallgeir Martinsen               | Lillehammer            | 10,88      | 2021.09.26 |
    | Florø Turn og IF              | 858         | 812   | 200     | Hallgeir Martinsen               | Lillehammer            | 22,42      | 2021.09.26 |
    | Florø Turn og IF              | 859         | 764   | 200     | Ben Benert                       | Lillehammer            | 22,86      | 2021.09.26 |
    | Florø Turn og IF              | 860         | 739   | 100     | Ben Benert                       | Lillehammer            | 11,42      | 2021.09.26 |
    | Florø Turn og IF              | 861         | 657   | 100     | Magnus Angelshaug                | Lillehammer            | 11,78      | 2021.09.26 |
    | Florø Turn og IF              | 862         | 627   | 100     | Lasse Angelshaug                 | Byrkjelo               | 11,92      | 2021.10.31 |
    | Florø Turn og IF              | 863         | 521   | 100     | Erlend Sunnarvik                 | Leikvang               | 12,45      | 2021.08.29 |
    | Florø Turn og IF              | 864         | 479   | 200     | Erlend Sunnarvik                 | Måndalen               | 25,95      | 2021.09.12 |
    | Florø Turn og IF              | 865         | 364   | Høyde   | Erlend Sunnarvik                 | Måndalen               | 1,51       | 2021.09.12 |
    | Florø Turn og IF              | 866         | 128   | 100     | Rune Holme                       | Førde                  | 14,99      | 2021.08.22 |
    | Flå IL                        | 867         | 561   | 5000    | Mikkel Trøstheim                 | Sigdal                 | 16,45,0    | 2021.09.29 |
    | Flå IL                        | 868         | 10    | Lengde  | August Grimeli                   | Sigdal                 | 3,59       | 2021.09.29 |
    | Flåværingen IL                | 869         | 611   | 3000    | Mikkel Trøstheim                 | Flå Stadion            | 9,21,2     | 2021.10.23 |
    | Flåværingen IL                | 870         | 375   | Høyde   | August Grimeli                   | Drammen                | 1,52       | 2021.10.16 |
    | Flåværingen IL                | 871         | 273   | Stav    | August Grimeli                   | Rjukan                 | 2,22       | 2021.09.12 |
    | Flåværingen IL                | 872         | 261   | Tresteg | August Grimeli                   | Rjukan                 | 9,42       | 2021.09.12 |
    | Flåværingen IL                | 873         | 227   | Lengde  | August Grimeli                   | Rjukan                 | 4,42       | 2021.09.12 |
    | Fossum IF                     | 874         | 594   | 1500    | Albert Tveitnes                  | Nadderud               | 4,19,93    | 2021.10.16 |
    | Fossum IF                     | 875         | 500   | 400     | Albert Tveitnes                  | Asker                  | 56,95      | 2021.09.26 |
    | Fossum IF                     | 876         | 480   | 1500    | Henrik Jørgensen                 | Rjukan                 | 4,37,20    | 2021.09.12 |
    | Fredrikstad IF                | 877         | 849   | 100     | Didrik Grøm                      | Ravnanger              | 10,97      | 2021.09.15 |
    | Fredrikstad IF                | 878         | 844   | 100     | Kristoffer Persen                | Rock Hill/SC/USA       | 10,99      | 2021.02.27 |
    | Fredrikstad IF                | 879         | 838   | 200     | Kristoffer Persen                | Rock Hill/SC/USA       | 22,19      | 2021.02.27 |
    | Fredrikstad IF                | 880         | 791   | 200     | Didrik Grøm                      | Ravnanger              | 22,61      | 2021.09.15 |
    | Fredrikstad IF                | 881         | 734   | 100     | Fredrik Persen                   | Trondheim              | 11,44      | 2021.09.28 |
    | Fredrikstad IF                | 882         | 679   | 100     | Ludvig Engen                     | Oslo/Bi                | 11,68      | 2021.09.25 |
    | Fredrikstad IF                | 883         | 678   | Spyd    | Jan Grønberg                     | Fredrikstad            | 53,88      | 2021.09.29 |
    | Fredrikstad IF                | 884         | 664   | 100     | Sigvart Avdal                    | Fredrikstad            | 11,75      | 2021.09.29 |
    | Fredrikstad IF                | 885         | 645   | 1500    | Herman Aarebrot                  | Nittedal               | 4,13,21    | 2021.10.30 |
    | Fredrikstad IF                | 886         | 618   | 3000    | Herman Aarebrot                  | Fredrikstad            | 9,19,46    | 2021.09.29 |
    | Fredrikstad IF                | 887         | 617   | 400     | Tobias Lien                      | Fredrikstad            | 53,66      | 2021.09.29 |
    | Fredrikstad IF                | 888         | 569   | Høyde   | Sean Bjønnes                     | Sarpsborg              | 1,71       | 2021.08.21 |
    | Fredrikstad IF                | 889         | 519   | 1500    | Syver Gulbrandsen                | Rjukan                 | 4,31,06    | 2021.09.12 |
    | Fredrikstad IF                | 890         | 515   | 100     | Jan Grønberg                     | Moss                   | 12,48      | 2021.10.09 |
    | Fredrikstad IF                | 891         | 490   | 200     | Emal Shinwari                    | Fredrikstad            | 25,80      | 2021.09.29 |
    | Fredrikstad IF                | 892         | 479   | 100     | Lawrence Pupo                    | Fredrikstad            | 12,67      | 2021.09.29 |
    | Fredrikstad IF                | 893         | 472   | Lut     | Jan Grønberg                     | Greveskogen            | 2,65       | 2021.10.30 |
    | Fredrikstad IF                | 894         | 467   | 200     | Leander Ulvøy                    | Nadderud               | 26,11      | 2021.10.16 |
    | Fredrikstad IF                | 895         | 461   | Høyde   | Viktor Andresen                  | Fredrikstad            | 1,60       | 2021.09.29 |
    | Fredrikstad IF                | 896         | 461   | Høyde   | Tobias Lien                      | Fredrikstad            | 1,60       | 2021.09.29 |
    | Fredrikstad IF                | 897         | 454   | 100     | Sean Bjønnes                     | Nadderud               | 12,81      | 2021.10.16 |
    | Fredrikstad IF                | 898         | 452   | 100     | Leander Ulvøy                    | Fredrikstad            | 12,82      | 2021.09.29 |
    | Fredrikstad IF                | 899         | 442   | 200     | Anders Holmskau-Karlsen          | Fredrikstad            | 26,44      | 2021.09.29 |
    | Fredrikstad IF                | 900         | 441   | Kule    | Jan Grønberg                     | Fredrikstad            | 9,89       | 2021.09.29 |
    | Fredrikstad IF                | 901         | 419   | Kule    | Tor Ødegård                      | Fredrikstad            | 9,60       | 2021.09.29 |
    | Fredrikstad IF                | 902         | 417   | 200     | Sean Bjønnes                     | Fredrikstad            | 26,79      | 2021.09.29 |
    | Fredrikstad IF                | 903         | 413   | 400     | Viktor Andresen                  | Fredrikstad            | 59,89      | 2021.09.29 |
    | Fredrikstad IF                | 904         | 408   | Høyde   | Leander Ulvøy                    | Jessheim               | 1,55       | 2021.09.09 |
    | Fredrikstad IF                | 905         | 406   | 200     | Vetle Gulaker                    | Fredrikstad            | 26,95      | 2021.09.29 |
    | Fredrikstad IF                | 906         | 388   | Lengde  | Sean Bjønnes                     | Sarpsborg              | 5,07       | 2021.08.21 |
    | Fredrikstad IF                | 907         | 380   | 3000    | Syver Gulbrandsen                | Fredrikstad            | 10,40,90   | 2021.09.29 |
    | Fredrikstad IF                | 908         | 369   | Tresteg | Tobias Lien                      | Fredrikstad            | 10,33      | 2021.09.29 |
    | Fredrikstad IF                | 909         | 356   | 800     | Jonas Heidenberg                 | Sarpsborg              | 2,24,06    | 2021.08.21 |
    | Fredrikstad IF                | 910         | 353   | Høyde   | Jan Grønberg                     | Moss                   | 1,50       | 2021.10.09 |
    | Fredrikstad IF                | 911         | 351   | 800     | Vetle Gulaker                    | Sarpsborg              | 2,24,48    | 2021.08.21 |
    | Fredrikstad IF                | 912         | 335   | 800     | Anders Holmskau-Karlsen          | Sarpsborg              | 2,26,11    | 2021.08.21 |
    | Fredrikstad IF                | 913         | 333   | 5000    | Viktor Andresen                  | Fredrikstad            | 19,14,16   | 2021.09.29 |
    | Fredrikstad IF                | 914         | 321   | 1500    | Adrian Monkvik                   | Rjukan                 | 5,06,10    | 2021.09.12 |
    | Fredrikstad IF                | 915         | 312   | 200     | August Sandnes                   | Nadderud               | 28,39      | 2021.10.16 |
    | Fredrikstad IF                | 916         | 310   | 200     | Carl Breigan                     | Rjukan                 | 28,43      | 2021.09.12 |
    | Fredrikstad IF                | 917         | 300   | 5000    | Lasse Lieberknecht               | Fredrikstad            | 19,40,24   | 2021.09.29 |
    | Fredrikstad IF                | 918         | 300   | 5000    | Lasse Tveit                      | Fredrikstad            | 19,39,87   | 2021.09.29 |
    | Fredrikstad IF                | 919         | 290   | 800     | Amadeus Bellmann                 | Moss                   | 2.30.55    | 2021.10.09 |
    | Fredrikstad IF                | 920         | 285   | Kule    | Tobias Lien                      | Fredrikstad            | 7,91       | 2021.09.29 |
    | Fredrikstad IF                | 921         | 274   | 800     | Petter Nordhagen                 | Sarpsborg              | 2,32,28    | 2021.08.21 |
    | Fredrikstad IF                | 922         | 273   | 800     | Jakob Jarild                     | Fredrikstad            | 2,32,35    | 2021.09.29 |
    | Fredrikstad IF                | 923         | 272   | Diskos  | Pål Jensen                       | Fredrikstad            | 22,03      | 2021.09.29 |
    | Fredrikstad IF                | 924         | 268   | 5000    | Fredrik Andersen                 | Fredrikstad            | 20,07,41   | 2021.09.29 |
    | Fredrikstad IF                | 925         | 263   | Lengde  | Vetle Gulaker                    | Fredrikstad            | 4,56       | 2021.09.29 |
    | Fredrikstad IF                | 926         | 262   | 800     | Jan Grønberg                     | Fredrikstad            | 2,33,51    | 2021.09.29 |
    | Fredrikstad IF                | 927         | 253   | 400     | Leander Ulvøy                    | Fredrikstad            | 1,06,32    | 2021.09.29 |
    | Fredrikstad IF                | 928         | 247   | Diskos  | Jan Grønberg                     | Fredrikstad            | 21,16      | 2021.09.29 |
    | Fredrikstad IF                | 929         | 244   | 100     | Jonas Heidenberg                 | Fredrikstad            | 14,12      | 2021.09.29 |
    | Fredrikstad IF                | 930         | 234   | 5000    | Kai Berg                         | Fredrikstad            | 20,37,31   | 2021.09.29 |
    | Fredrikstad IF                | 931         | 233   | Høyde   | Jacob Andreassen                 | Fredrikstad            | 1,40       | 2021.09.29 |
    | Fredrikstad IF                | 932         | 229   | 400     | Jan Grønberg                     | Moss                   | 1,07,41    | 2021.10.09 |
    | Fredrikstad IF                | 933         | 229   | Kule    | Fredrik Persen                   | Fredrikstad            | 7,24       | 2021.09.29 |
    | Fredrikstad IF                | 934         | 228   | Kule    | Pål Jensen                       | Fredrikstad            | 7,23       | 2021.09.29 |
    | Fredrikstad IF                | 935         | 227   | Lengde  | Leander Ulvøy                    | Fredrikstad            | 4,42       | 2021.09.29 |
    | Fredrikstad IF                | 936         | 214   | 200     | Henrik Karlsen                   | Nadderud               | 30,08      | 2021.10.16 |
    | Fredrikstad IF                | 937         | 212   | 5000    | Knut Furuheim                    | Fredrikstad            | 20,58,44   | 2021.09.29 |
    | Fredrikstad IF                | 938         | 205   | Lengde  | Jonas Heidenberg                 | Fredrikstad            | 4,33       | 2021.09.29 |
    | Fredrikstad IF                | 939         | 199   | 5000    | Per Monkvik                      | Jessheim               | 21,10,12   | 2021.09.09 |
    | Fredrikstad IF                | 940         | 179   | Lengde  | Jan Grønberg                     | Moss                   | 4,23       | 2021.10.09 |
    | Fredrikstad IF                | 941         | 176   | Slegge  | Fredrik Persen                   | Fredrikstad            | 15,84      | 2021.09.29 |
    | Fredrikstad IF                | 942         | 173   | 3000    | Amadeus Bellmann                 | Fredrikstad            | 12,19,96   | 2021.09.29 |
    | Fredrikstad IF                | 943         | 147   | Tresteg | Leander Ulvøy                    | Rjukan                 | 8,50       | 2021.09.12 |
    | Fredrikstad IF                | 944         | 140   | 5000    | Sven Simonsen                    | Fredrikstad            | 22,12,52   | 2021.09.29 |
    | Fredrikstad IF                | 945         | 123   | 100     | Henrik Karlsen                   | Fredrikstad            | 15,03      | 2021.09.29 |
    | Fredrikstad IF                | 946         | 95    | Diskos  | Bård Pedersen                    | Fredrikstad            | 15,97      | 2021.09.29 |
    | Fredrikstad IF                | 947         | 91    | Diskos  | Morten Pettersen                 | Fredrikstad            | 15,86      | 2021.09.29 |
    | Fredrikstad IF                | 948         | 81    | Slegge  | Tobias Lien                      | Fredrikstad            | 12,40      | 2021.09.29 |
    | Fredrikstad IF                | 949         | 33    | 200     | Linus Lervik-Johansen            | Nadderud               | 33,67      | 2021.10.16 |
    | Frol IL                       | 950         | 744   | 5000    | Tobias Alstad                    | Trondheim              | 15,12,49   | 2021.09.28 |
    | Frol IL                       | 951         | 541   | Høyde   | Fredrik Ukkelberg                | Levanger               | 1,68       | 2021.06.13 |
    | Frol IL                       | 952         | 458   | 200     | Fredrik Ukkelberg                | Lillehammer            | 26,23      | 2021.09.26 |
    | Frol IL                       | 953         | 295   | Høyde   | Henrik Furunes                   | Steinkjer              | 1,45       | 2021.09.30 |
    | Frol IL                       | 954         | 238   | 800     | Remi Andresen                    | Levanger               | 2,36,10    | 2021.06.13 |
    | Frol IL                       | 955         | 96    | Høyde   | Jens Lien                        | Inderøy                | 1,30       | 2021.08.09 |
    | Froland IL                    | 956         | 705   | Lut     | Vegard Skaarstad                 | Grimstad               | 3,06       | 2021.10.25 |
    | Frøyland IL                   | 957         | 408   | 100     | Benjamin Leivestad               | Frøyland               | 13,07      | 2021.09.07 |
    | Fyllingen IL                  | 958         | 801   | 100     | Mats Hjørnevik                   | Lillehammer            | 11,16      | 2021.09.26 |
    | Fyllingen IL                  | 959         | 800   | 200     | Mats Hjørnevik                   | Lillehammer            | 22,53      | 2021.09.26 |
    | Fyllingen IL                  | 960         | 786   | 100     | Emil Gundersen                   | Trondheim              | 11,22      | 2021.09.28 |
    | Fyllingen IL                  | 961         | 750   | 200     | Emil Gundersen                   | Ravnanger              | 22,99      | 2021.09.15 |
    | Fyllingen IL                  | 962         | 689   | Lengde  | Emil Gundersen                   | Fana                   | 6,37       | 2021.09.28 |
    | Fyllingen IL                  | 963         | 680   | 400     | Mats Hjørnevik                   | Fana                   | 52,17      | 2021.09.28 |
    | Fyllingen IL                  | 964         | 655   | Lut     | Emil Gundersen                   | Leikvang               | 2,97       | 2021.08.29 |
    | Fyllingen IL                  | 965         | 638   | 200     | Tomas Chernov                    | Leikvang               | 24,09      | 2021.08.29 |
    | Fyllingen IL                  | 966         | 598   | 100     | Tomas Chernov                    | Leikvang               | 12,06      | 2021.08.29 |
    | Fyllingen IL                  | 967         | 566   | 100     | Benjamin Lindgren                | Leikvang               | 12,22      | 2021.08.29 |
    | Fyllingen IL                  | 968         | 554   | Lengde  | Mats Hjørnevik                   | Fana                   | 5,77       | 2021.09.28 |
    | Fyllingen IL                  | 969         | 533   | 800     | Øyvind Morstøl                   | Leikvang               | 2,09,34    | 2021.08.29 |
    | Fyllingen IL                  | 970         | 532   | Lut     | Mats Hjørnevik                   | Leikvang               | 2,75       | 2021.08.29 |
    | Fyllingen IL                  | 971         | 520   | 1500    | Øyvind Morstøl                   | Fana                   | 4,30,83    | 2021.09.28 |
    | Fyllingen IL                  | 972         | 519   | Lengde  | Benjamin Lindgren                | Fana                   | 5,62       | 2021.09.28 |
    | Fyllingen IL                  | 973         | 519   | 800     | Fredrik Thomassen                | Fana                   | 2,10,40    | 2021.09.28 |
    | Fyllingen IL                  | 974         | 509   | 200     | Benjamin Lindgren                | Fana                   | 25,56      | 2021.09.28 |
    | Fyllingen IL                  | 975         | 506   | 1500    | Endre Haugen                     | Leikvang               | 4,32,98    | 2021.08.29 |
    | Fyllingen IL                  | 976         | 367   | Lut     | Benjamin Lindgren                | Leikvang               | 2,50       | 2021.08.29 |
    | Fyllingen IL                  | 977         | 352   | 200     | Endre Haugen                     | Fana                   | 27,75      | 2021.09.28 |
    | Fyllingen IL                  | 978         | 351   | 1500    | Sebastian Skoge-Nilsen           | Fana                   | 4,59,95    | 2021.09.28 |
    | Fyllingen IL                  | 979         | 339   | 200     | Kristoffer Stenerud              | Fana                   | 27,97      | 2021.09.28 |
    | Fyllingen IL                  | 980         | 327   | 1500    | Eirik Markussen                  | Nadderud               | 5,04,72    | 2021.10.16 |
    | Fyllingen IL                  | 981         | 327   | 200     | Eirik Markussen                  | Nadderud               | 28,16      | 2021.10.16 |
    | Fyllingen IL                  | 982         | 309   | 100     | Kristoffer Stenerud              | Leikvang               | 13,68      | 2021.08.29 |
    | Fyllingen IL                  | 983         | 286   | 100     | Oliver Lindgren                  | Leikvang               | 13,83      | 2021.08.29 |
    | Fyllingen IL                  | 984         | 280   | 200     | Oliver Lindgren                  | Fana                   | 28,93      | 2021.09.28 |
    | Fyllingen IL                  | 985         | 238   | 100     | Eirik Markussen                  | Leikvang               | 14,16      | 2021.08.29 |
    | Fyllingen IL                  | 986         | 233   | Høyde   | Oliver Lindgren                  | Leikvang               | 1,40       | 2021.08.29 |
    | Fyllingen IL                  | 987         | 148   | 100     | Jonas Andersen                   | Fana                   | 14,83      | 2021.09.28 |
    | Fyllingen IL                  | 988         | 110   | Lut     | Jonas Andersen                   | Leikvang               | 2,23       | 2021.08.29 |
    | Fyllingen IL                  | 989         | 48    | 200     | Jonas Andersen                   | Fana                   | 33,35      | 2021.09.28 |
    | Fyresdal Idrettslag           | 990         | 427   | 1500    | Sondre Momrak                    | Porsgrunn              | 4,46,04    | 2021.09.25 |
    | Fyresdal Idrettslag           | 991         | 310   | 1500    | Kristian Haakenstad              | Porsgrunn              | 5,08,28    | 2021.09.25 |
    | Fyresdal Idrettslag           | 992         | 143   | 200     | Brage Aamlid                     | Porsgrunn              | 31,41      | 2021.09.25 |
    | Fyresdal Idrettslag           | 993         | 118   | 200     | Aksel Aamlid                     | Porsgrunn              | 31,91      | 2021.09.25 |
    | Fyresdal Idrettslag           | 994         | 102   | 1500    | Tarjei Momrak                    | Porsgrunn              | 5,57,60    | 2021.09.25 |
    | Førde IL Friidrett            | 995         | 832   | 3000    | Roger Pollen                     | Jessheim               | 8,25,92    | 2021.09.09 |
    | Førde IL Friidrett            | 996         | 799   | 10000   | Roger Pollen                     | Kristiansand           | 31,00,73   | 2021.10.06 |
    | Førde IL Friidrett            | 997         | 775   | 5000    | Roger Pollen                     | Oslo/Bi                | 14,58,58   | 2021.09.25 |
    | Førde IL Friidrett            | 998         | 677   | 100     | Jøran Laukeland                  | Førde                  | 11,69      | 2021.08.22 |
    | Førde IL Friidrett            | 999         | 635   | 200     | Jøran Laukeland                  | Førde                  | 24,13      | 2021.08.22 |
    | Førde IL Friidrett            | 1000        | 605   | 3000    | Aksel Bjørkhaug                  | Trondheim              | 9,23,12    | 2021.09.28 |
    | Førde IL Friidrett            | 1001        | 554   | 5000    | Aksel Bjørkhaug                  | Jølster                | 16,48,88   | 2021.09.25 |
    | Førde IL Friidrett            | 1002        | 513   | 400     | Alexander Rygg                   | Førde                  | 56,57      | 2021.08.22 |
    | Førde IL Friidrett            | 1003        | 509   | 3000    | Elias Husa                       | Førde                  | 9,53,24    | 2021.08.22 |
    | Førde IL Friidrett            | 1004        | 501   | 800     | Aksel Bjørkhaug                  | Trondheim              | 2,11,67    | 2021.09.28 |
    | Førde IL Friidrett            | 1005        | 488   | 10000   | Per Gurvin                       | Førde                  | 36,53,64   | 2021.08.22 |
    | Førde IL Friidrett            | 1006        | 456   | 1500    | David Engesæter                  | Måndalen               | 4,41,10    | 2021.09.12 |
    | Førde IL Friidrett            | 1007        | 451   | Høyde   | Are Korsvoll                     | Førde                  | 1,59       | 2021.08.22 |
    | Førde IL Friidrett            | 1008        | 434   | Tresteg | Arne Tefre                       | Førde                  | 10,89      | 2021.08.22 |
    | Førde IL Friidrett            | 1009        | 434   | 3000    | Magnus Degnepoll                 | Førde                  | 10,19,78   | 2021.08.22 |
    | Førde IL Friidrett            | 1010        | 433   | 3000    | Stian Helle                      | Førde                  | 10,20,29   | 2021.08.22 |
    | Førde IL Friidrett            | 1011        | 391   | 1500    | Ola Aasen                        | Måndalen               | 4,52,48    | 2021.09.12 |
    | Førde IL Friidrett            | 1012        | 381   | 800     | Ludvig Rørvik                    | Førde                  | 2,21,74    | 2021.08.22 |
    | Førde IL Friidrett            | 1013        | 373   | 3000    | Andrzej Mielnik                  | Førde                  | 10,43,58   | 2021.08.22 |
    | Førde IL Friidrett            | 1014        | 367   | 800     | David Engesæter                  | Byrkjelo               | 2,23,04    | 2021.10.31 |
    | Førde IL Friidrett            | 1015        | 357   | 1500    | Jørund Hammersvik                | Førde                  | 4,58,94    | 2021.08.22 |
    | Førde IL Friidrett            | 1016        | 354   | 200     | David Engesæter                  | Måndalen               | 27,73      | 2021.09.12 |
    | Førde IL Friidrett            | 1017        | 354   | 10000   | Øystein Sellevold                | Førde                  | 40,15,96   | 2021.08.22 |
    | Førde IL Friidrett            | 1018        | 347   | Lengde  | Øyvind Oppedal                   | Førde                  | 4,90       | 2021.08.22 |
    | Førde IL Friidrett            | 1019        | 337   | 800     | Atle Skrede                      | Førde                  | 2,25,85    | 2021.08.22 |
    | Førde IL Friidrett            | 1020        | 336   | 1500    | Andrzej Mielnik                  | Førde                  | 5,02,92    | 2021.08.22 |
    | Førde IL Friidrett            | 1021        | 324   | 200     | Ola Aasen                        | Måndalen               | 28,20      | 2021.09.12 |
    | Førde IL Friidrett            | 1022        | 294   | 1500    | Ulrik Klakegg                    | Måndalen               | 5,11,54    | 2021.09.12 |
    | Førde IL Friidrett            | 1023        | 291   | 1500    | Steffen Igelkjøn                 | Førde                  | 5,12,13    | 2021.08.22 |
    | Førde IL Friidrett            | 1024        | 273   | 800     | Magne Verlo                      | Førde                  | 2,32,41    | 2021.08.22 |
    | Førde IL Friidrett            | 1025        | 268   | 400     | Atle Skrede                      | Førde                  | 1,05,68    | 2021.08.22 |
    | Førde IL Friidrett            | 1026        | 265   | 400     | Magne Verlo                      | Førde                  | 1,05,82    | 2021.08.22 |
    | Førde IL Friidrett            | 1027        | 246   | Høyde   | Øyvind Oppedal                   | Førde                  | 1,41       | 2021.08.22 |
    | Førde IL Friidrett            | 1028        | 221   | Spyd    | Arne Sæterbakken                 | Førde                  | 23,94      | 2021.08.22 |
    | Førde IL Friidrett            | 1029        | 213   | 1500    | Even Bjørkhaug                   | Førde                  | 5,29,57    | 2021.08.22 |
    | Førde IL Friidrett            | 1030        | 208   | Diskos  | Arne Sæterbakken                 | Førde                  | 19,79      | 2021.08.22 |
    | Førde IL Friidrett            | 1031        | 197   | Kule    | Arne Sæterbakken                 | Førde                  | 6,87       | 2021.08.22 |
    | Førde IL Friidrett            | 1032        | 194   | 400     | Harald Holmefjord                | Førde                  | 1,08,96    | 2021.08.22 |
    | Førde IL Friidrett            | 1033        | 192   | 200     | Harald Holmefjord                | Førde                  | 30,48      | 2021.08.22 |
    | Førde IL Friidrett            | 1034        | 164   | 100     | Arne Tefre                       | Førde                  | 14,71      | 2021.08.22 |
    | Førde IL Friidrett            | 1035        | 157   | Stav    | Arne Sæterbakken                 | Førde                  | 1,90       | 2021.08.22 |
    | Førde IL Friidrett            | 1036        | 139   | 100     | Harald Holmefjord                | Førde                  | 14,90      | 2021.08.22 |
    | Førde IL Friidrett            | 1037        | 117   | Slegge  | Arne Sæterbakken                 | Førde                  | 13,63      | 2021.08.22 |
    | Førde IL Friidrett            | 1038        | 34    | 400     | Øyvind Oppedal                   | Førde                  | 1,16,62    | 2021.08.22 |
    | Førde IL Friidrett            | 1039        | 23    | 5000K   | Arne Sæterbakken                 | Førde                  | 36,05,27   | 2021.08.22 |
    | Førde IL Friidrett            | 1040        | 19    | Høyde   | Ulrik Klakegg                    | Førde                  | 1,25       | 2021.08.22 |
    | Førde IL Friidrett            | 1041        | 4     | 200     | Ognjen Bosanac                   | Førde                  | 34,32      | 2021.08.22 |
    | Føyk Idrettslag               | 1042        | 672   | 10000   | Jonny Kibsgaard                  | Fana                   | 33,10,12   | 2021.09.28 |
    | Føyk Idrettslag               | 1043        | 617   | 3000    | Jonny Kibsgaard                  | Husnes                 | 9,19,5     | 2021.09.08 |
    | GTI                           | 1044        | 830   | 10000   | Andreas Nygård                   | Kristiansand           | 30,31,49   | 2021.10.06 |
    | GTI                           | 1045        | 766   | 5000    | Andreas Nygård                   | Stavanger              | 15,02,91   | 2021.10.27 |
    | GTI                           | 1046        | 758   | 3000    | Andreas Nygård                   | Jessheim               | 8,42,70    | 2021.09.09 |
    | GTI                           | 1047        | 732   | 10000   | Alexander Skurve                 | Tau                    | 32,06,1    | 2021.06.10 |
    | GTI                           | 1048        | 722   | 10000   | Tom Halvorsen                    | Tau                    | 32,16,9    | 2021.06.10 |
    | GTI                           | 1049        | 640   | Spyd    | Marius Gannsen                   | Stavanger              | 51,01      | 2021.10.27 |
    | GTI                           | 1050        | 608   | 100     | Nii Narh                         | Jessheim               | 12,01      | 2021.09.09 |
    | GTI                           | 1051        | 580   | 200     | Nii Narh                         | Stavanger              | 24,72      | 2021.10.27 |
    | GTI                           | 1052        | 579   | 400     | Nii Narh                         | Molde                  | 54,67      | 2021.06.20 |
    | GTI                           | 1053        | 557   | Slegge  | Marius Gannsen                   | Stavanger              | 36,11      | 2021.10.27 |
    | GTI                           | 1054        | 543   | 200     | Rasmus Pedersen                  | Førde                  | 25,15      | 2021.08.22 |
    | GTI                           | 1055        | 517   | 400     | Rasmus Pedersen                  | Førde                  | 56,43      | 2021.08.22 |
    | GTI                           | 1056        | 517   | 100     | Rasmus Pedersen                  | Førde                  | 12,47      | 2021.08.22 |
    | GTI                           | 1057        | 512   | Lengde  | Rasmus Pedersen                  | Førde                  | 5,59       | 2021.08.22 |
    | GTI                           | 1058        | 491   | Kule    | Marius Gannsen                   | Stavanger              | 10,55      | 2021.10.27 |
    | GTI                           | 1059        | 490   | 800     | Rasmus Pedersen                  | Førde                  | 2,12,55    | 2021.08.22 |
    | GTI                           | 1060        | 487   | 5000    | Bjørn Kydland                    | Stavanger              | 17,28,43   | 2021.10.27 |
    | GTI                           | 1061        | 484   | 5000    | Nils-Einar Glesnes               | Stavanger              | 17,30,24   | 2021.10.27 |
    | GTI                           | 1062        | 483   | 5000    | John Nicolaysen                  | Stavanger              | 17,30,88   | 2021.10.27 |
    | GTI                           | 1063        | 471   | Diskos  | Marius Gannsen                   | Stavanger              | 29,71      | 2021.10.27 |
    | GTI                           | 1064        | 457   | 5000    | Per Bethuelsen                   | Stavanger              | 17,47,28   | 2021.10.27 |
    | GTI                           | 1065        | 448   | 5000    | Odd Hesjedal                     | Stavanger              | 17,52,65   | 2021.10.27 |
    | GTI                           | 1066        | 420   | 5000    | Pål Refvem                       | Stavanger              | 18,11,30   | 2021.10.27 |
    | GTI                           | 1067        | 412   | 5000    | Rune Boge                        | Stavanger              | 18,17,24   | 2021.10.27 |
    | GTI                           | 1068        | 393   | Lengde  | Nii Narh                         | Nadderud               | 5,09       | 2021.10.16 |
    | GTI                           | 1069        | 393   | 5000    | Marius Hop                       | Stavanger              | 18,30,12   | 2021.10.27 |
    | GTI                           | 1070        | 389   | Kule    | Tore Drange                      | Stavanger              | 9,21       | 2021.10.27 |
    | GTI                           | 1071        | 378   | Kule    | Knut Dahlgren                    | Stavanger              | 9,06       | 2021.10.27 |
    | GTI                           | 1072        | 348   | 3000H   | John Nicolaysen                  | Stavanger              | 12,12,76   | 2021.10.27 |
    | GTI                           | 1073        | 339   | 5000    | Lars Gudevang                    | Stavanger              | 19,09,31   | 2021.10.27 |
    | GTI                           | 1074        | 332   | Spyd    | Tore Drange                      | Stavanger              | 30,12      | 2021.10.27 |
    | GTI                           | 1075        | 316   | Lut     | Knut Dahlgren                    | Stavanger              | 2,44       | 2021.10.27 |
    | GTI                           | 1076        | 315   | 200     | Johan Løland                     | Førde                  | 28,35      | 2021.08.22 |
    | GTI                           | 1077        | 312   | Diskos  | Tore Drange                      | Stavanger              | 23,48      | 2021.10.27 |
    | GTI                           | 1078        | 311   | Diskos  | Knut Dahlgren                    | Stavanger              | 23,44      | 2021.10.27 |
    | GTI                           | 1079        | 306   | 100     | Johan Løland                     | Førde                  | 13,70      | 2021.08.22 |
    | GTI                           | 1080        | 300   | Spyd    | Knut Dahlgren                    | Stavanger              | 28,24      | 2021.10.27 |
    | GTI                           | 1081        | 278   | 5000    | Stig Loftheim                    | Stavanger              | 19,58,62   | 2021.10.27 |
    | GTI                           | 1082        | 259   | Spyd    | Jarl Bøe                         | Stavanger              | 25,92      | 2021.10.27 |
    | GTI                           | 1083        | 258   | Lengde  | Johan Løland                     | Førde                  | 4,54       | 2021.08.22 |
    | GTI                           | 1084        | 245   | 400     | Graham Armstrong                 | Sandnes                | 1,06,67    | 2021.10.28 |
    | GTI                           | 1085        | 226   | 3000H   | Stig Loftheim                    | Stavanger              | 13,30,45   | 2021.10.27 |
    | GTI                           | 1086        | 209   | 100     | Graham Armstrong                 | Sandnes                | 14,37      | 2021.10.28 |
    | GTI                           | 1087        | 205   | 800     | Kim Thunheim                     | Stavanger              | 2,39,70    | 2021.10.27 |
    | GTI                           | 1088        | 187   | 200     | Graham Armstrong                 | Stavanger              | 30,57      | 2021.10.27 |
    | GTI                           | 1089        | 143   | 5000    | Kim Thunheim                     | Stavanger              | 22,08,99   | 2021.10.27 |
    | GTI                           | 1090        | 114   | 5000    | Olav Hagland                     | Førde                  | 22,41,38   | 2021.08.22 |
    | GTI                           | 1091        | 106   | 3000    | Olav Hagland                     | Førde                  | 13,00,91   | 2021.08.22 |
    | GTI                           | 1092        | 104   | 5000    | Eldar Bjørge                     | Førde                  | 22,53,64   | 2021.08.22 |
    | GTI                           | 1093        | 64    | 3000    | Eldar Bjørge                     | Førde                  | 13,29,81   | 2021.08.22 |
    | GTI                           | 1094        | 61    | Kule    | Nii Narh                         | Lambertseter           | 5,40       | 2021.10.17 |
    | GTI                           | 1095        | 60    | 1500    | Olav Hagland                     | Stavanger              | 6,09,61    | 2021.10.27 |
    | GTI                           | 1096        | 19    | Høyde   | Johan Løland                     | Førde                  | 1,25       | 2021.08.22 |
    | Gaular IL                     | 1097        | 637   | 10000   | André Haugsbø                    | Førde                  | 33,49,02   | 2021.08.22 |
    | Gaular IL                     | 1098        | 636   | 5000    | André Haugsbø                    | Førde                  | 16,04,57   | 2021.08.22 |
    | Gaular IL                     | 1099        | 463   | 400     | Kim Tangedal                     | Førde                  | 58,15      | 2021.08.22 |
    | Gaular IL                     | 1100        | 314   | 10000   | Karsten Sunde                    | Førde                  | 41,26,03   | 2021.08.22 |
    | Gaular IL                     | 1101        | 42    | 100     | Gudmund Furnes                   | Førde                  | 15,70      | 2021.08.22 |
    | Gausdal FIK                   | 1102        | 702   | 200     | Sjur Thallaug                    | Trondheim              | 23,45      | 2021.09.28 |
    | Gausdal FIK                   | 1103        | 675   | 400     | Emil Ottesen                     | Lillehammer            | 52,29      | 2021.09.26 |
    | Gausdal FIK                   | 1104        | 655   | 100     | Sjur Thallaug                    | Trondheim              | 11,79      | 2021.09.28 |
    | Gausdal FIK                   | 1105        | 603   | 400     | Sjur Thallaug                    | Lillehammer            | 54,01      | 2021.09.26 |
    | Gausdal FIK                   | 1106        | 540   | 3000    | Syver Dalen                      | Trondheim              | 9,43,06    | 2021.09.28 |
    | Gausdal FIK                   | 1107        | 538   | 1500    | Syver Dalen                      | Gjøvik                 | 4,28,11    | 2021.05.29 |
    | Gausdal FIK                   | 1108        | 530   | 3000    | Edvard Olstad                    | Lillehammer            | 9,46,63    | 2021.09.26 |
    | Gausdal FIK                   | 1109        | 496   | 1500    | Edvard Olstad                    | Lillehammer            | 4,34,59    | 2021.09.26 |
    | Gausdal FIK                   | 1110        | 439   | 1500    | Heine Sandvold                   | Lillehammer            | 4,44,00    | 2021.09.26 |
    | Gausdal FIK                   | 1111        | 417   | 800     | Erland Aamot                     | Lillehammer            | 2,18,50    | 2021.09.26 |
    | Gausdal FIK                   | 1112        | 415   | 200     | Abou Sillah                      | Lillehammer            | 26,82      | 2021.09.26 |
    | Gausdal FIK                   | 1113        | 410   | Tresteg | Simen Homlegard                  | Rjukan                 | 10,68      | 2021.09.12 |
    | Gausdal FIK                   | 1114        | 405   | 200     | Erland Aamot                     | Rjukan                 | 26,96      | 2021.09.12 |
    | Gausdal FIK                   | 1115        | 405   | Lengde  | Simen Homlegard                  | Rjukan                 | 5,14       | 2021.09.12 |
    | Gausdal FIK                   | 1116        | 403   | 100     | Vegard Kyseth                    | Lillehammer            | 13,10      | 2021.09.26 |
    | Gausdal FIK                   | 1117        | 398   | 1500    | Anders Haug                      | Lillehammer            | 4,51,19    | 2021.09.26 |
    | Gausdal FIK                   | 1118        | 395   | 200     | Vegard Kyseth                    | Lillehammer            | 27,11      | 2021.09.26 |
    | Gausdal FIK                   | 1119        | 394   | 3000    | Heine Sandvold                   | Gausdal                | 10,35,2    | 2021.05.09 |
    | Gausdal FIK                   | 1120        | 388   | 800     | Anders Haug                      | Lillehammer            | 2,21,05    | 2021.09.26 |
    | Gausdal FIK                   | 1121        | 385   | 200     | Anders Haug                      | Lillehammer            | 27,26      | 2021.09.26 |
    | Gausdal FIK                   | 1122        | 351   | 100     | Erland Aamot                     | Lillehammer            | 13,41      | 2021.09.26 |
    | Gausdal FIK                   | 1123        | 350   | 1500    | Erland Aamot                     | Rjukan                 | 5,00,28    | 2021.09.12 |
    | Gausdal FIK                   | 1124        | 349   | 200h    | Erland Aamot                     | Rjukan                 | 32,96      | 2021.09.12 |
    | Gausdal FIK                   | 1125        | 336   | 100     | Anders Haug                      | Lillehammer            | 13,51      | 2021.09.26 |
    | Gausdal FIK                   | 1126        | 285   | 100     | Abou Sillah                      | Gausdal                | 13,84      | 2021.05.09 |
    | Gausdal FIK                   | 1127        | 190   | 200     | Nikolai Sletten                  | Lillehammer            | 30,52      | 2021.09.26 |
    | Gausdal FIK                   | 1128        | 187   | Tresteg | Vegard Kyseth                    | Gausdal                | 8,82       | 2021.05.09 |
    | Gausdal FIK                   | 1129        | 181   | Høyde   | Simen Homlegard                  | Rjukan                 | 1,36       | 2021.09.12 |
    | Gausdal FIK                   | 1130        | 162   | 200     | Marcus Hekneby                   | Nadderud               | 31,06      | 2021.10.16 |
    | Gausdal FIK                   | 1131        | 109   | 100     | Alexander Melgard                | Gausdal                | 15,14      | 2021.05.09 |
    | Gausdal FIK                   | 1132        | 107   | 1500    | Eskil Thallaug                   | Lillehammer            | 5,56,34    | 2021.09.26 |
    | Gausdal FIK                   | 1133        | 86    | 100     | Tor Gundersen                    | Lillehammer            | 15,33      | 2021.09.26 |
    | Gausdal FIK                   | 1134        | 8     | 100     | Eskil Thallaug                   | Lillehammer            | 16,00      | 2021.09.26 |
    | Gjerpen Idrettsforening       | 1135        | 217   | 800     | Arvid Supphellen                 | Førde                  | 2,38,38    | 2021.08.22 |
    | Gjesdal IL                    | 1136        | 711   | 3000    | Kim Haugstad                     | Ålgård                 | 8,54,10    | 2021.09.20 |
    | Gjesdal IL                    | 1137        | 643   | 3000    | Kristian Bjørsvik                | Ålgård                 | 9,12,31    | 2021.09.20 |
    | Gjesdal IL                    | 1138        | 620   | 3000    | Jonas Fjeldsbø                   | Ålgård                 | 9,18,67    | 2021.09.20 |
    | Gjesdal IL                    | 1139        | 525   | 3000    | Leiv Mjølhus                     | Ålgård                 | 9,48,27    | 2021.09.20 |
    | Gjesdal IL                    | 1140        | 515   | Slegge  | Erik Liberg                      | Sandnes                | 33,40      | 2021.10.28 |
    | Gjesdal IL                    | 1141        | 504   | 3000    | Samuel Kleppa                    | Ålgård                 | 9,55,09    | 2021.09.20 |
    | Gjesdal IL                    | 1142        | 401   | Kule    | Erik Liberg                      | Sandnes                | 9,36       | 2021.10.28 |
    | Gjesdal IL                    | 1143        | 372   | 3000    | André Ravndal                    | Ålgård                 | 10,44,24   | 2021.09.20 |
    | Gjesdal IL                    | 1144        | 358   | 3000    | Sondre Lunåsmo                   | Ålgård                 | 10,49,59   | 2021.09.20 |
    | Gjesdal IL                    | 1145        | 358   | 3000    | Frode Øen                        | Ålgård                 | 10,49,58   | 2021.09.20 |
    | Gjesdal IL                    | 1146        | 351   | 3000    | Torstein Håland                  | Ålgård                 | 10,52,67   | 2021.09.20 |
    | Gjesdal IL                    | 1147        | 346   | 3000    | André Vareberg                   | Ålgård                 | 10,54,87   | 2021.09.20 |
    | Gjesdal IL                    | 1148        | 343   | 3000    | Kurt Kleppa                      | Ålgård                 | 10,55,90   | 2021.09.20 |
    | Gjesdal IL                    | 1149        | 307   | Lut     | Knut Amdal                       | Ålgård                 | 2,43       | 2021.09.20 |
    | Gjesdal IL                    | 1150        | 295   | 3000    | Kjell Fjeldheim                  | Ålgård                 | 11,16,96   | 2021.09.20 |
    | Gjesdal IL                    | 1151        | 266   | Stav    | Arne Warem                       | Førde                  | 2,20       | 2021.08.22 |
    | Gjesdal IL                    | 1152        | 210   | 3000    | Jarle Ravndal                    | Ålgård                 | 11,58,98   | 2021.09.20 |
    | Gjesdal IL                    | 1153        | 162   | 200     | Bror Heegaard                    | Fana                   | 31,05      | 2021.09.28 |
    | Gjesdal IL                    | 1154        | 147   | 200     | Thomas Strandberg                | Ålgård                 | 31,33      | 2021.09.20 |
    | Gjesdal IL                    | 1155        | 137   | Lengde  | Arne Warem                       | Knarvik                | 4,07       | 2021.09.23 |
    | Gjesdal IL                    | 1156        | 110   | Lut     | Arne Warem                       | Hvam                   | 2,23       | 2021.10.23 |
    | Gjesdal IL                    | 1157        | 107   | 200     | Arne Warem                       | Knarvik                | 32,13      | 2021.09.23 |
    | Gjesdal IL                    | 1158        | 86    | 100     | Arne Warem                       | Hamar                  | 15,33      | 2021.08.22 |
    | Gjesdal IL                    | 1159        | 84    | 200     | Jonathan Øen                     | Fana                   | 32,60      | 2021.09.28 |
    | Gjesdal IL                    | 1160        | 64    | 400     | Arne Warem                       | Hamar                  | 1,15,17    | 2021.08.22 |
    | Gjøvik FIK                    | 1161        | 504   | 200     | Henrik Strøm                     | Rjukan                 | 25,63      | 2021.09.12 |
    | Gjøvik FIK                    | 1162        | 477   | 200h    | Henrik Strøm                     | Rjukan                 | 30,34      | 2021.09.12 |
    | Gjøvik FIK                    | 1163        | 437   | 3000    | Svein Linnerud                   | Førde                  | 10,18,94   | 2021.08.22 |
    | Gjøvik FIK                    | 1164        | 384   | 800     | Henrik Strøm                     | Lillehammer            | 2,21,47    | 2021.09.26 |
    | Gjøvik FIK                    | 1165        | 375   | 100     | Henrik Strøm                     | Lillehammer            | 13,27      | 2021.09.26 |
    | Gjøvik FIK                    | 1166        | 368   | 1500    | Svein Linnerud                   | Førde                  | 4,56,78    | 2021.08.22 |
    | Gjøvik FIK                    | 1167        | 357   | 5000    | Svein Linnerud                   | Førde                  | 18,55,63   | 2021.08.22 |
    | Gjøvik FIK                    | 1168        | 335   | 800     | Svein Linnerud                   | Førde                  | 2,26,08    | 2021.08.22 |
    | Gjøvik FIK                    | 1169        | 295   | Lengde  | Henrik Strøm                     | Hov i Land             | 4,69       | 2021.10.02 |
    | Gjøvik FIK                    | 1170        | 206   | 1500    | Henrik Strøm                     | Stjørdal               | 5,31,07    | 2021.10.23 |
    | Gjøvik FIK                    | 1171        | 157   | Stav    | William Barthel                  | Jessheim               | 1,90       | 2021.09.09 |
    | Gjøvik FIK                    | 1172        | 42    | 100     | William Barthel                  | Lillehammer            | 15,70      | 2021.09.26 |
    | Gjøvik FIK                    | 1173        | 13    | 200     | William Barthel                  | Lillehammer            | 34,11      | 2021.09.26 |
    | Gloppen Friidrettslag         | 1174        | 1079  | Slegge  | Thomas Mardal                    | Eugene/OR/USA          | 76,74      | 2021.06.09 |
    | Gloppen Friidrettslag         | 1175        | 893   | Slegge  | Evald Devik                      | Gloppen                | 61,09      | 2021.09.26 |
    | Gloppen Friidrettslag         | 1176        | 860   | Slegge  | Arne Devik                       | Kristiansand           | 58,45      | 2021.10.06 |
    | Gloppen Friidrettslag         | 1177        | 815   | Slegge  | Håkon Roset                      | Bottnaryd/SWE          | 54,90      | 2021.07.11 |
    | Gloppen Friidrettslag         | 1178        | 806   | Kule    | Mathias Dale                     | Kristiansand           | 15,15      | 2021.10.06 |
    | Gloppen Friidrettslag         | 1179        | 779   | Slegge  | Kristen Brosvik                  | Ravnanger              | 52,10      | 2021.09.15 |
    | Gloppen Friidrettslag         | 1180        | 721   | 5000    | Jon Hope                         | Byrkjelo               | 15,23,40   | 2021.10.31 |
    | Gloppen Friidrettslag         | 1181        | 701   | Spyd    | Simon Lidal                      | Byrkjelo               | 55,58      | 2021.10.31 |
    | Gloppen Friidrettslag         | 1182        | 672   | 5000    | Alexander Moritsgård             | Byrkjelo               | 15,46,61   | 2021.10.31 |
    | Gloppen Friidrettslag         | 1183        | 656   | 800     | Tobias Fuglestrand               | Jølster                | 2,01,64    | 2021.09.25 |
    | Gloppen Friidrettslag         | 1184        | 636   | 3000    | Tobias Fuglestrand               | Førde                  | 9,14,07    | 2021.08.22 |
    | Gloppen Friidrettslag         | 1185        | 617   | 5000    | Tobias Fuglestrand               | Ravnanger              | 16,14,55   | 2021.09.15 |
    | Gloppen Friidrettslag         | 1186        | 592   | Diskos  | Trond Hatlenes                   | Førde                  | 35,17      | 2021.08.22 |
    | Gloppen Friidrettslag         | 1187        | 582   | Diskos  | Mathias Dale                     | Gloppen                | 34,69      | 2021.09.26 |
    | Gloppen Friidrettslag         | 1188        | 527   | Kule    | Trond Hatlenes                   | Førde                  | 11,05      | 2021.08.22 |
    | Gloppen Friidrettslag         | 1189        | 511   | Høyde   | Christopher Solheim              | Byrkjelo               | 1,65       | 2021.10.31 |
    | Gloppen Friidrettslag         | 1190        | 436   | 5000    | Alexander Ganc-Petersen          | Byrkjelo               | 18,00,53   | 2021.10.31 |
    | Gloppen Friidrettslag         | 1191        | 432   | 800     | Jon Hauge                        | Førde                  | 2,17,20    | 2021.08.22 |
    | Gloppen Friidrettslag         | 1192        | 421   | 5000    | Andre Granheim                   | Byrkjelo               | 18,11,22   | 2021.10.31 |
    | Gloppen Friidrettslag         | 1193        | 399   | 5000    | Mathias Sandal                   | Byrkjelo               | 18,25,58   | 2021.10.31 |
    | Gloppen Friidrettslag         | 1194        | 392   | 400     | Jon Hauge                        | Førde                  | 1,00,65    | 2021.08.22 |
    | Gloppen Friidrettslag         | 1195        | 373   | 200     | Jon Hauge                        | Byrkjelo               | 27,2       | 2021.10.31 |
    | Gloppen Friidrettslag         | 1196        | 331   | 100     | Jon Hauge                        | Byrkjelo               | 13,3       | 2021.10.31 |
    | Gloppen Friidrettslag         | 1197        | 327   | 1500    | Jon Hauge                        | Byrkjelo               | 5,04,9     | 2021.10.31 |
    | Gloppen Friidrettslag         | 1198        | 310   | Spyd    | Jon Hauge                        | Byrkjelo               | 28,80      | 2021.10.31 |
    | Gloppen Friidrettslag         | 1199        | 66    | 800     | Leif Reknes                      | Førde                  | 2,56,30    | 2021.08.22 |
    | Gossen IL                     | 1200        | 593   | 3000    | Sturle Starheim                  | Molde                  | 9,26,59    | 2021.06.20 |
    | Grimstad TIF                  | 1201        | 109   | 100     | Håvard Pedersen                  | Tvedestrand            | 15,14      | 2021.09.15 |
    | Grong IL                      | 1202        | 481   | Høyde   | Mathias Kaldahl                  | Overhalla              | 1,62       | 2021.06.30 |
    | Grong IL                      | 1203        | 323   | 100     | Mathias Kaldahl                  | Overhalla              | 13,59      | 2021.06.30 |
    | Grong IL                      | 1204        | 227   | 100     | Jørgen Domås                     | Fosnes                 | 14,0       | 2021.05.08 |
    | Grong IL                      | 1205        | 196   | 200     | Jørgen Domås                     | Måndalen               | 30,41      | 2021.09.12 |
    | Grong IL                      | 1206        | 190   | Tresteg | Jørgen Domås                     | Måndalen               | 8,84       | 2021.09.12 |
    | Grong IL                      | 1207        | 172   | 200     | Marius Østerås                   | Steinkjer              | 30,86      | 2021.09.30 |
    | Grong IL                      | 1208        | 79    | 100     | Marius Østerås                   | Namsos                 | 15,39      | 2021.08.22 |
    | Grong IL                      | 1209        | 56    | Lengde  | Jørgen Domås                     | Overhalla              | 3,76       | 2021.06.30 |
    | Groruddalen Friidrettsklubb   | 1210        | 816   | 400     | Aiden Vincent                    | Kristiansand           | 49,39      | 2021.10.06 |
    | Groruddalen Friidrettsklubb   | 1211        | 799   | 100     | Aiden Vincent                    | Trondheim              | 11,17      | 2021.09.28 |
    | Groruddalen Friidrettsklubb   | 1212        | 796   | 200     | Aiden Vincent                    | Trondheim              | 22,56      | 2021.09.28 |
    | Groruddalen Friidrettsklubb   | 1213        | 741   | Tresteg | Aiden Vincent                    | Ravnanger              | 13,67      | 2021.09.15 |
    | Groruddalen Friidrettsklubb   | 1214        | 734   | Lengde  | Aiden Vincent                    | Trondheim              | 6,57       | 2021.09.28 |
    | Groruddalen Friidrettsklubb   | 1215        | 734   | 200     | Sigurd Fergestad                 | Trondheim              | 23,14      | 2021.09.28 |
    | Groruddalen Friidrettsklubb   | 1216        | 706   | 100     | Sigurd Fergestad                 | Trondheim              | 11,56      | 2021.09.28 |
    | Groruddalen Friidrettsklubb   | 1217        | 633   | 200h    | Aiden Vincent                    | Lambertseter           | 27,43      | 2021.10.17 |
    | Groruddalen Friidrettsklubb   | 1218        | 624   | 400     | Sigurd Fergestad                 | Oslo/St                | 53,49      | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1219        | 558   | 200     | Thulaxshan Siva                  | Oslo/St                | 24,97      | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1220        | 533   | Lengde  | Sigurd Fergestad                 | Oslo/St                | 5,68       | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1221        | 408   | Høyde   | Aiden Vincent                    | Oslo/St                | 1,55       | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1222        | 189   | 200     | Vetle Lier                       | Oslo/St                | 30,54      | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1223        | 114   | 200     | Karl Glaser                      | Oslo/St                | 31,99      | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1224        | 112   | 200     | Andreas Kragholm                 | Oslo/St                | 32,03      | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1225        | 55    | 1500    | Andreas Kragholm                 | Oslo/St                | 6,11,33    | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1226        | 45    | 200     | Sigurd Husby                     | Oslo/St                | 33,42      | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1227        | 40    | 200     | Nordbach Sigurd                  | Oslo/St                | 33,52      | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1228        | 21    | 200     | Brage Husby                      | Oslo/St                | 33,94      | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1229        | 19    | Høyde   | Brage Husby                      | Oslo/St                | 1,25       | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1230        | 19    | Høyde   | Sigurd Husby                     | Oslo/St                | 1,25       | 2021.10.16 |
    | Groruddalen Friidrettsklubb   | 1231        | 15    | 100     | Andreas Kragholm                 | Nittedal               | 15,94      | 2021.10.30 |
    | Grue IL                       | 1232        | 242   | 1500    | Magnus Almåsbak                  | Kongsvinger            | 5,22,86    | 2021.09.08 |
    | Gui Sportsklubb               | 1233        | 826   | 3000    | Kristian Børve                   | Nadderud               | 8,27,21    | 2021.10.16 |
    | Gui Sportsklubb               | 1234        | 726   | 1500    | Kristian Børve                   | Oslo/Bi                | 4,03,73    | 2021.09.25 |
    | Gui Sportsklubb               | 1235        | 660   | 800     | Kristian Børve                   | Trondheim              | 2,01,42    | 2021.09.28 |
    | Gui Sportsklubb               | 1236        | 558   | 100     | Tage Horn                        | Asker                  | 12,26      | 2021.09.26 |
    | Gui Sportsklubb               | 1237        | 501   | Høyde   | Henrik Vineshaugen               | Hamar                  | 1,64       | 2021.08.22 |
    | Gui Sportsklubb               | 1238        | 501   | 200     | Kristian Koppang                 | Asker                  | 25,66      | 2021.09.26 |
    | Gui Sportsklubb               | 1239        | 485   | 100     | Henrik Vineshaugen               | Hamar                  | 12,64      | 2021.08.22 |
    | Gui Sportsklubb               | 1240        | 485   | 200     | Johan Rosenberg                  | Asker                  | 25,87      | 2021.09.26 |
    | Gui Sportsklubb               | 1241        | 473   | Stav    | Rolf Kristiansen                 | Hamar                  | 2,90       | 2021.08.22 |
    | Gui Sportsklubb               | 1242        | 463   | 100     | Johan Rosenberg                  | Asker                  | 12,76      | 2021.09.26 |
    | Gui Sportsklubb               | 1243        | 463   | 100     | Kristian Koppang                 | Asker                  | 12,76      | 2021.09.26 |
    | Gui Sportsklubb               | 1244        | 459   | 200     | Tage Horn                        | Asker                  | 26,21      | 2021.09.26 |
    | Gui Sportsklubb               | 1245        | 447   | Stav    | Henrik Vineshaugen               | Hamar                  | 2,80       | 2021.08.22 |
    | Gui Sportsklubb               | 1246        | 436   | Lengde  | Henrik Vineshaugen               | Hamar                  | 5,27       | 2021.08.22 |
    | Gui Sportsklubb               | 1247        | 408   | Høyde   | Eskil Marstein                   | Asker                  | 1,55       | 2021.09.26 |
    | Gui Sportsklubb               | 1248        | 408   | Høyde   | Rolf Kristiansen                 | Heggedal               | 1,55       | 2021.09.26 |
    | Gui Sportsklubb               | 1249        | 391   | Stav    | Tobias Knudsen                   | Hamar                  | 2,60       | 2021.08.22 |
    | Gui Sportsklubb               | 1250        | 331   | Stav    | Eskil Marstein                   | Hamar                  | 2,40       | 2021.08.22 |
    | Gui Sportsklubb               | 1251        | 314   | 100     | Rolf Kristiansen                 | Hamar                  | 13,65      | 2021.08.22 |
    | Gui Sportsklubb               | 1252        | 295   | 3000    | Geir Knudsen                     | Asker                  | 11,17,22   | 2021.09.26 |
    | Gui Sportsklubb               | 1253        | 267   | 100     | Tobias Knudsen                   | Hamar                  | 13,96      | 2021.08.22 |
    | Gui Sportsklubb               | 1254        | 243   | 3000    | Tage Horn                        | Asker                  | 11,42,01   | 2021.09.26 |
    | Gui Sportsklubb               | 1255        | 236   | 3000    | Henrik Vineshaugen               | Asker                  | 11,45,41   | 2021.09.26 |
    | Gui Sportsklubb               | 1256        | 210   | 3000    | Johan Rosenberg                  | Asker                  | 11,59,26   | 2021.09.26 |
    | Gui Sportsklubb               | 1257        | 207   | Lengde  | Rolf Kristiansen                 | Hamar                  | 4,34       | 2021.08.22 |
    | Gui Sportsklubb               | 1258        | 194   | Høyde   | Tobias Knudsen                   | Hamar                  | 1,37       | 2021.08.22 |
    | Gui Sportsklubb               | 1259        | 191   | 3000    | Ovar Rosenberg                   | Asker                  | 12,09,43   | 2021.09.26 |
    | Gui Sportsklubb               | 1260        | 179   | Lengde  | Tobias Knudsen                   | Hamar                  | 4,23       | 2021.08.22 |
    | Gui Sportsklubb               | 1261        | 173   | 3000    | Benjamin Johnsen                 | Asker                  | 12,20,01   | 2021.09.26 |
    | Gui Sportsklubb               | 1262        | 173   | 3000    | Fredrik Aaserud                  | Asker                  | 12,19,71   | 2021.09.26 |
    | Gui Sportsklubb               | 1263        | 146   | 1500    | Benjamin Johnsen                 | Oslo/St                | 5,45,76    | 2021.10.16 |
    | Gui Sportsklubb               | 1264        | 137   | 100     | Eskil Marstein                   | Hamar                  | 14,92      | 2021.08.22 |
    | Gui Sportsklubb               | 1265        | 136   | 1500    | Marius Ørbeck-Nilssen            | Oslo/St                | 5,48,69    | 2021.10.16 |
    | Gui Sportsklubb               | 1266        | 82    | Lengde  | Eskil Marstein                   | Hamar                  | 3,86       | 2021.08.22 |
    | Gui Sportsklubb               | 1267        | 42    | 3000    | Øyvind Johnsen                   | Asker                  | 13,46,14   | 2021.09.26 |
    | Gulset IF Friidrett           | 1268        | 659   | 5000    | Christoffer Rüger                | Oslo/Bi                | 15,53,10   | 2021.09.25 |
    | Gulset IF Friidrett           | 1269        | 639   | 3000    | Christoffer Rüger                | Jessheim               | 9,13,34    | 2021.09.09 |
    | Hafslo IL                     | 1270        | 418   | 3000    | Kjartan Ovrid                    | Sogndal                | 10,26,12   | 2021.05.12 |
    | Halden IL                     | 1271        | 898   | 5000    | Trym Tønnesen                    | Greveskogen            | 14,08,13   | 2021.10.30 |
    | Halden IL                     | 1272        | 890   | 3000    | Trym Tønnesen                    | Fana                   | 8,13,38    | 2021.09.28 |
    | Halden IL                     | 1273        | 880   | 10000   | Trym Tønnesen                    | Kristiansand           | 29,48,12   | 2021.10.06 |
    | Halden IL                     | 1274        | 835   | Spyd    | Alexander Skorpen                | Kristiansand           | 65,49      | 2021.10.06 |
    | Halden IL                     | 1275        | 755   | Spyd    | Tommi Pasanen                    | Halden                 | 59,72      | 2021.09.25 |
    | Halden IL                     | 1276        | 750   | Spyd    | Christer Stenersrød              | Fredrikstad            | 59,36      | 2021.09.29 |
    | Halden IL                     | 1277        | 673   | 10000   | Even Løvås                       | Oslo/Bi                | 33,08,58   | 2021.09.25 |
    | Halden IL                     | 1278        | 640   | 800     | Milan Frenay                     | Sarpsborg              | 2,02,54    | 2021.08.21 |
    | Halden IL                     | 1279        | 639   | 5000    | Even Løvås                       | Sarpsborg              | 16,03,36   | 2021.08.21 |
    | Halden IL                     | 1280        | 626   | 800     | Lion Frenay                      | Trondheim              | 2,03,37    | 2021.09.28 |
    | Halden IL                     | 1281        | 611   | 800     | Amaru Wijman                     | Halden                 | 2,04,19    | 2021.09.25 |
    | Halden IL                     | 1282        | 578   | 3000    | Lion Frenay                      | Trondheim              | 9,31,37    | 2021.09.28 |
    | Halden IL                     | 1283        | 484   | 200h    | Eskil Ekenes                     | Rjukan                 | 30,20      | 2021.09.12 |
    | Halden IL                     | 1284        | 392   | 200     | Eskil Ekenes                     | Halden                 | 27,16      | 2021.09.25 |
    | Halden IL                     | 1285        | 353   | Høyde   | Eskil Ekenes                     | Sarpsborg              | 1,50       | 2021.08.21 |
    | Halden IL                     | 1286        | 340   | Lengde  | Eskil Ekenes                     | Sarpsborg              | 4,87       | 2021.08.21 |
    | Halden IL                     | 1287        | 325   | 400     | Eskil Ekenes                     | Halden                 | 1,03,29    | 2021.09.25 |
    | Halden IL                     | 1288        | 249   | 800     | Eskil Ekenes                     | Halden                 | 2,34,93    | 2021.09.25 |
    | Hamar IL                      | 1289        | 668   | 100     | Bård Venholen                    | Lillehammer            | 11,73      | 2021.09.26 |
    | Hamar IL                      | 1290        | 637   | 200     | Klass Jansons                    | Lillehammer            | 24,11      | 2021.09.26 |
    | Hamar IL                      | 1291        | 608   | 100     | Klass Jansons                    | Lillehammer            | 12,01      | 2021.09.26 |
    | Hamar IL                      | 1292        | 593   | Tresteg | Johannes Mjelde                  | Trondheim              | 12,30      | 2021.09.28 |
    | Hamar IL                      | 1293        | 556   | 800     | Jonas Lillejordet                | Nittedal               | 2,07,75    | 2021.10.30 |
    | Hamar IL                      | 1294        | 555   | 800     | Ivar Plukkerud                   | Trondheim              | 2,07,77    | 2021.09.28 |
    | Hamar IL                      | 1295        | 546   | Tresteg | Magnus Antonsen                  | Nadderud               | 11,88      | 2021.10.16 |
    | Hamar IL                      | 1296        | 540   | 200     | Johannes Mjelde                  | Nittedal               | 25,18      | 2021.10.30 |
    | Hamar IL                      | 1297        | 519   | Lengde  | Johannes Mjelde                  | Nittedal               | 5,62       | 2021.10.30 |
    | Hamar IL                      | 1298        | 516   | 1500    | Jonas Lillejordet                | Lillehammer            | 4,31,47    | 2021.09.26 |
    | Hamar IL                      | 1299        | 515   | 100     | Johannes Mjelde                  | Nittedal               | 12,48      | 2021.10.30 |
    | Hamar IL                      | 1300        | 476   | 200     | Magnus Antonsen                  | Nadderud               | 25,99      | 2021.10.16 |
    | Hamar IL                      | 1301        | 462   | Lengde  | Magnus Antonsen                  | Hamar                  | 5,38       | 2021.08.22 |
    | Hamar IL                      | 1302        | 450   | 100     | Roar Fjellet                     | Oslo/Bi                | 12,83      | 2021.09.25 |
    | Hamar IL                      | 1303        | 446   | 200     | Roar Fjellet                     | Førde                  | 26,39      | 2021.08.22 |
    | Hamar IL                      | 1304        | 443   | 100     | Magnus Antonsen                  | Hamar                  | 12,87      | 2021.08.22 |
    | Hamar IL                      | 1305        | 419   | Stav    | Magnus Antonsen                  | Hamar                  | 2,70       | 2021.08.22 |
    | Hamar IL                      | 1306        | 408   | Høyde   | Magnus Antonsen                  | Nadderud               | 1,55       | 2021.10.16 |
    | Hamar IL                      | 1307        | 403   | 100     | Sten Kvanvik                     | Oslo/Bi                | 13,10      | 2021.09.25 |
    | Hamar IL                      | 1308        | 370   | 100     | Elias Furuseth                   | Lillehammer            | 13,30      | 2021.09.26 |
    | Hamar IL                      | 1309        | 333   | Lut     | Roar Fjellet                     | Hvam                   | 2,46       | 2021.10.23 |
    | Hamar IL                      | 1310        | 267   | 800     | Magnus Antonsen                  | Lillehammer            | 2,33,04    | 2021.09.26 |
    | Hamar IL                      | 1311        | 96    | Høyde   | Adrian Venholen                  | Jessheim               | 1,30       | 2021.09.09 |
    | Hareid IL                     | 1312        | 704   | 200     | Peter Bitocchi                   | Trondheim              | 23,43      | 2021.09.28 |
    | Hareid IL                     | 1313        | 578   | 100     | Peter Bitocchi                   | Ørsta                  | 12,16      | 2021.10.07 |
    | Hareid IL                     | 1314        | 417   | 200     | Eskil Naustenget                 | Ulsteinvik             | 26,79      | 2021.10.28 |
    | Hareid IL                     | 1315        | 380   | 800     | Eskil Naustenget                 | Molde                  | 2,21,80    | 2021.06.20 |
    | Hareid IL                     | 1316        | 378   | 200     | Even Korsnes                     | Molde                  | 27,37      | 2021.06.20 |
    | Hareid IL                     | 1317        | 373   | 100     | Even Korsnes                     | Molde                  | 13,28      | 2021.06.20 |
    | Hareid IL                     | 1318        | 368   | 200     | Eskil Kirkebø                    | Molde                  | 27,51      | 2021.06.20 |
    | Hareid IL                     | 1319        | 358   | 800     | Even Korsnes                     | Molde                  | 2,23,85    | 2021.06.20 |
    | Hattfjelldal IL               | 1320        | 784   | 100     | Erik Mikkeljord                  | Lillehammer            | 11,23      | 2021.09.26 |
    | Hattfjelldal IL               | 1321        | 673   | 100     | Håkon Sandvik                    | Trondheim              | 11,71      | 2021.09.28 |
    | Hattfjelldal IL               | 1322        | 650   | 200     | Håkon Sandvik                    | Trondheim              | 23,97      | 2021.09.28 |
    | Hattfjelldal IL               | 1323        | 560   | Høyde   | Gabriel Lande-Norheim            | Hattfjelldal           | 1,70       | 2021.05.22 |
    | Hattfjelldal IL               | 1324        | 523   | Lengde  | Gabriel Lande-Norheim            | Hattfjelldal           | 5,64       | 2021.05.22 |
    | Hattfjelldal IL               | 1325        | 509   | 100     | Syver Grøvnes                    | Bodø                   | 12,51      | 2021.09.21 |
    | Hattfjelldal IL               | 1326        | 501   | Høyde   | Syver Grøvnes                    | Hattfjelldal           | 1,64       | 2021.05.22 |
    | Hattfjelldal IL               | 1327        | 481   | 100     | Gabriel Lande-Norheim            | Mosjøen                | 12,66      | 2021.08.28 |
    | Hattfjelldal IL               | 1328        | 474   | Lengde  | Syver Grøvnes                    | Hattfjelldal           | 5,43       | 2021.05.22 |
    | Hattfjelldal IL               | 1329        | 461   | Høyde   | Amund Sjåvik                     | Hattfjelldal           | 1,60       | 2021.05.22 |
    | Hattfjelldal IL               | 1330        | 436   | Lengde  | Sigurd Mjølkarlid                | Mosjøen                | 5,27       | 2021.08.28 |
    | Hattfjelldal IL               | 1331        | 350   | Lengde  | Kjell Norheim                    | Stjørdal               | 4,91       | 2021.10.23 |
    | Hattfjelldal IL               | 1332        | 239   | Stav    | Amund Sjåvik                     | Måndalen               | 2,12       | 2021.09.12 |
    | Haugesund IL                  | 1333        | 874   | 3000    | Simon Veland                     | Jessheim               | 8,16,77    | 2021.09.09 |
    | Haugesund IL                  | 1334        | 854   | 1500    | Simon Veland                     | Oslo/Bi                | 3,50,88    | 2021.09.25 |
    | Haugesund IL                  | 1335        | 816   | 1500    | Tedros Haile                     | Oslo/Bi                | 3,54,50    | 2021.09.25 |
    | Haugesund IL                  | 1336        | 800   | 5000    | Ole Tørsdal                      | Kristiansand           | 14,47,55   | 2021.10.06 |
    | Haugesund IL                  | 1337        | 788   | 5000    | Tedros Haile                     | Oslo/Bi                | 14,53,08   | 2021.09.25 |
    | Haugesund IL                  | 1338        | 783   | 10000   | Ole Tørsdal                      | Kristiansand           | 31,15,72   | 2021.10.06 |
    | Haugesund IL                  | 1339        | 777   | 800     | Simon Veland                     | Haugesund              | 1,55,70    | 2021.09.12 |
    | Haugesund IL                  | 1340        | 767   | 200     | Neo Dobson                       | Leirvik                | 22,83      | 2021.09.13 |
    | Haugesund IL                  | 1341        | 760   | 100     | Neo Dobson                       | Nadderud               | 11,33      | 2021.10.16 |
    | Haugesund IL                  | 1342        | 758   | 3000K   | Andreas Døske                    | Haugesund              | 12,24,63   | 2021.09.12 |
    | Haugesund IL                  | 1343        | 720   | 100     | Alexander Laksfoss               | Haugesund              | 11,50      | 2021.09.12 |
    | Haugesund IL                  | 1344        | 718   | 1500    | Trond Halvorsen                  | Oslo/Bi                | 4,04,58    | 2021.09.25 |
    | Haugesund IL                  | 1345        | 702   | 1500    | Kristoffer Nordhus               | Fana                   | 4,06,35    | 2021.09.28 |
    | Haugesund IL                  | 1346        | 693   | 3000    | Trond Halvorsen                  | Jessheim               | 8,58,65    | 2021.09.09 |
    | Haugesund IL                  | 1347        | 692   | 200     | Alexander Laksfoss               | Karmøy                 | 23,55      | 2021.05.26 |
    | Haugesund IL                  | 1348        | 682   | 800     | Kristoffer Nordhus               | Haugesund              | 2,00,26    | 2021.09.12 |
    | Haugesund IL                  | 1349        | 654   | 200     | Kristian Magnussen               | Haugesund              | 23,93      | 2021.09.12 |
    | Haugesund IL                  | 1350        | 654   | 10000K  | Andreas Døske                    | Haugesund              | 46,42,86   | 2021.09.12 |
    | Haugesund IL                  | 1351        | 641   | 200     | Stefan Skrede                    | Nadderud               | 24,06      | 2021.10.16 |
    | Haugesund IL                  | 1352        | 616   | Høyde   | Stian Austrheim                  | Haugesund              | 1,76       | 2021.09.12 |
    | Haugesund IL                  | 1353        | 608   | 100     | Stefan Skrede                    | Nadderud               | 12,01      | 2021.10.16 |
    | Haugesund IL                  | 1354        | 578   | 100     | Alexander Røksund                | Haugesund              | 12,16      | 2021.09.12 |
    | Haugesund IL                  | 1355        | 540   | Lengde  | Stian Austrheim                  | Frakkagjerd            | 5,71       | 2021.08.22 |
    | Haugesund IL                  | 1356        | 522   | 200     | Sondre Eilertsen                 | Haugesund              | 25,41      | 2021.09.12 |
    | Haugesund IL                  | 1357        | 517   | 5000K   | Andreas Døske                    | Bergen                 | 24,01,2    | 2021.10.30 |
    | Haugesund IL                  | 1358        | 500   | 200     | Thomas Fagerland                 | Karmøy                 | 25,67      | 2021.05.26 |
    | Haugesund IL                  | 1359        | 487   | 100     | Thomas Fagerland                 | Haugesund              | 12,63      | 2021.09.12 |
    | Haugesund IL                  | 1360        | 472   | 100     | Bjørnar Støylen                  | Leirvik                | 12,71      | 2021.09.13 |
    | Haugesund IL                  | 1361        | 463   | 100     | Stian Austrheim                  | Haugesund              | 12,76      | 2021.09.12 |
    | Haugesund IL                  | 1362        | 461   | Høyde   | Theodor Aase                     | Haugesund              | 1,60       | 2021.09.12 |
    | Haugesund IL                  | 1363        | 440   | 100     | Sondre Eilertsen                 | Haugesund              | 12,89      | 2021.09.12 |
    | Haugesund IL                  | 1364        | 410   | Lengde  | Sondre Eilertsen                 | Haugesund              | 5,16       | 2021.09.12 |
    | Haugesund IL                  | 1365        | 403   | 1500    | Elias Rasmussen                  | Leirvik                | 4,50,27    | 2021.09.13 |
    | Haugesund IL                  | 1366        | 352   | 800     | Isak Erland                      | Haugesund              | 2,24,46    | 2021.09.12 |
    | Haugesund IL                  | 1367        | 328   | 200     | Bjørnar Støylen                  | Haugesund              | 28,14      | 2021.09.12 |
    | Haugesund IL                  | 1368        | 257   | Tresteg | Sondre Eilertsen                 | Haugesund              | 9,39       | 2021.09.12 |
    | Haugesund IL                  | 1369        | 199   | 200     | Henrik Langesæter                | Haugesund              | 30,36      | 2021.09.12 |
    | Haugesund IL                  | 1370        | 179   | 200     | Elias Rasmussen                  | Haugesund              | 30,73      | 2021.09.12 |
    | Haugesund IL                  | 1371        | 165   | 100     | Isak Erland                      | Haugesund              | 14,70      | 2021.09.12 |
    | Haugesund IL                  | 1372        | 163   | Lengde  | Isak Erland                      | Haugesund              | 4,17       | 2021.09.12 |
    | Haugesund IL                  | 1373        | 162   | 400     | Bjørnar Støylen                  | Nadderud               | 1,10,47    | 2021.10.16 |
    | Haugesund IL                  | 1374        | 34    | 200     | Oliver Stokvik                   | Haugesund              | 33,65      | 2021.09.12 |
    | Haugesund IL                  | 1375        | 31    | 100     | Oliver Stokvik                   | Frakkagjerd            | 15,80      | 2021.08.22 |
    | Havørn IL                     | 1376        | 590   | 5000    | Richard Kverneland               | Stavanger              | 16,29,05   | 2021.10.27 |
    | Heggedal FIK                  | 1377        | 622   | Spyd    | Bjørn Kristiansen                | Oslo/Bi                | 49,65      | 2021.09.25 |
    | Heggedal FIK                  | 1378        | 375   | Kule    | Bjørn Kristiansen                | Nittedal               | 9,03       | 2021.10.30 |
    | Heggedal FIK                  | 1379        | 325   | Lut     | Bjørn Kristiansen                | Oslo/St                | 2,45       | 2021.10.16 |
    | Heggedal FIK                  | 1380        | 109   | 100     | Bjørn Kristiansen                | Oslo/St                | 14,9       | 2021.10.16 |
    | Hegra IL                      | 1381        | 448   | 100     | Mads Solem                       | Stjørdal               | 12,6       | 2021.10.23 |
    | Hegra IL                      | 1382        | 444   | Lengde  | Mads Solem                       | Stjørdal               | 5,30       | 2021.10.23 |
    | Hegra IL                      | 1383        | 375   | 1500    | Mads Solem                       | Stjørdal               | 4,55,6     | 2021.10.23 |
    | Hegra IL                      | 1384        | 321   | Kule    | Mads Solem                       | Stjørdal               | 8,35       | 2021.10.23 |
    | Hegra IL                      | 1385        | 96    | Lengde  | Jon Hembre                       | Stjørdal               | 3,91       | 2021.10.23 |
    | Herkules Friidrett            | 1386        | 873   | 3000H   | Abdalla Yousif                   | Kristiansand           | 8,57,88    | 2021.10.06 |
    | Herkules Friidrett            | 1387        | 842   | 3000    | Halvor Winberg                   | Trondheim              | 8,23,77    | 2021.09.28 |
    | Herkules Friidrett            | 1388        | 837   | 1500    | Halvor Winberg                   | Oslo/Bi                | 3,52,45    | 2021.09.25 |
    | Herkules Friidrett            | 1389        | 835   | 5000    | Marius Wang                      | Greveskogen            | 14,33,07   | 2021.10.30 |
    | Herkules Friidrett            | 1390        | 803   | 800     | Halvor Winberg                   | Trondheim              | 1,54,58    | 2021.09.28 |
    | Herkules Friidrett            | 1391        | 785   | 5000    | Halvor Winberg                   | Ravnanger              | 14,54,33   | 2021.09.15 |
    | Herkules Friidrett            | 1392        | 765   | 3000    | Marius Wang                      | Jessheim               | 8,41,12    | 2021.09.09 |
    | Herkules Friidrett            | 1393        | 764   | 10000   | Abdalla Yousif                   | Kristiansand           | 31,34,33   | 2021.10.06 |
    | Herkules Friidrett            | 1394        | 733   | 1500    | Marius Wang                      | Greveskogen            | 4,02,93    | 2021.10.30 |
    | Herkules Friidrett            | 1395        | 722   | 100     | Tobias Larsson                   | Ravnanger              | 11,49      | 2021.09.15 |
    | Herkules Friidrett            | 1396        | 690   | 100     | Aleksander Amlie                 | Lillehammer            | 11,63      | 2021.09.26 |
    | Herkules Friidrett            | 1397        | 688   | 200     | Aleksander Amlie                 | Lillehammer            | 23,59      | 2021.09.26 |
    | Herkules Friidrett            | 1398        | 666   | 200     | Tobias Larsson                   | Nadderud               | 23,81      | 2021.10.16 |
    | Herkules Friidrett            | 1399        | 461   | Høyde   | Matteo Vestbøstad                | Rjukan                 | 1,60       | 2021.09.12 |
    | Herkules Friidrett            | 1400        | 410   | 800     | Ulrik Rønning                    | Rjukan                 | 2,19,16    | 2021.09.12 |
    | Herkules Friidrett            | 1401        | 243   | Lengde  | Matteo Vestbøstad                | Rjukan                 | 4,48       | 2021.09.12 |
    | Herkules Friidrett            | 1402        | 182   | 1500    | Jørgen Stamland                  | Rjukan                 | 5,36,87    | 2021.09.12 |
    | Herkules Friidrett            | 1403        | 111   | Høyde   | Eirik Olsen                      | Rjukan                 | 1,31       | 2021.09.12 |
    | Hinna IL                      | 1404        | 540   | 200     | Sebastian Ottosen                | Ålgård                 | 25,19      | 2021.09.20 |
    | Hinna IL                      | 1405        | 521   | Høyde   | Andrew Hendicott                 | Sandnes                | 1,66       | 2021.10.28 |
    | Hinna IL                      | 1406        | 513   | 400     | Andrew Hendicott                 | Sandnes                | 56,57      | 2021.10.28 |
    | Hinna IL                      | 1407        | 508   | 200     | Andrew Hendicott                 | Sandnes                | 25,58      | 2021.10.28 |
    | Hinna IL                      | 1408        | 472   | 100     | Andrew Hendicott                 | Frøyland               | 12,71      | 2021.09.07 |
    | Hinna IL                      | 1409        | 417   | 200     | Teodor Holme                     | Ålgård                 | 26,79      | 2021.09.20 |
    | Hinna IL                      | 1410        | 375   | 1500    | Isak Raustein                    | Haugesund              | 4,55,57    | 2021.09.12 |
    | Hinna IL                      | 1411        | 367   | Hut     | Samuel Raustein                  | Sandnes                | 1,25       | 2021.10.28 |
    | Hinna IL                      | 1412        | 356   | 100     | Teodor Holme                     | Sandnes                | 13,38      | 2021.10.28 |
    | Hinna IL                      | 1413        | 278   | Lut     | Samuel Raustein                  | Sandnes                | 2,40       | 2021.10.28 |
    | Hitra FIK                     | 1414        | 490   | 200     | Jesper Kvaale                    | Lillehammer            | 25,80      | 2021.09.26 |
    | Hitra FIK                     | 1415        | 468   | 800     | Jesper Kvaale                    | Lillehammer            | 2,14,31    | 2021.09.26 |
    | Hitra FIK                     | 1416        | 447   | 100     | Jesper Kvaale                    | Lillehammer            | 12,85      | 2021.09.26 |
    | Hitra FIK                     | 1417        | 412   | Lengde  | Jesper Kvaale                    | Jessheim               | 5,17       | 2021.09.09 |
    | Hitra FIK                     | 1418        | 406   | 200     | Andreas Hammer                   | Måndalen               | 26,95      | 2021.09.12 |
    | Hitra FIK                     | 1419        | 386   | Høyde   | Andreas Hammer                   | Steinkjer              | 1,53       | 2021.09.30 |
    | Hitra FIK                     | 1420        | 353   | Høyde   | Tomack Sand                      | Trondheim              | 1,50       | 2021.09.28 |
    | Hitra FIK                     | 1421        | 353   | Høyde   | Jesper Kvaale                    | Trondheim              | 1,50       | 2021.09.28 |
    | Hitra FIK                     | 1422        | 279   | 200     | Tomack Sand                      | Trondheim              | 28,95      | 2021.09.28 |
    | Hitra FIK                     | 1423        | 158   | Lengde  | Tomack Sand                      | Aure                   | 4,15       | 2021.06.12 |
    | Hitra FIK                     | 1424        | 96    | 200     | Oliver Hjertås                   | Trondheim              | 32,35      | 2021.09.28 |
    | Hitra FIK                     | 1425        | 87    | 400     | Oliver Hjertås                   | Trondheim              | 1,14,05    | 2021.09.28 |
    | Hitra FIK                     | 1426        | 66    | 200     | Erik Hammer                      | Steinkjer              | 32,98      | 2021.09.30 |
    | Hitra FIK                     | 1427        | 35    | Stav    | Andreas Hammer                   | Måndalen               | 1,62       | 2021.09.12 |
    | Hitra FIK                     | 1428        | 25    | Stav    | Tomack Sand                      | Trondheim              | 1,60       | 2021.09.28 |
    | Hitra FIK                     | 1429        | 24    | 100     | Oliver Hjertås                   | Trondheim              | 15,86      | 2021.09.28 |
    | Hommelvik IL                  | 1430        | 838   | 800     | Magnar Lundberg                  | Kristiansand           | 1,53,08    | 2021.10.06 |
    | Hommelvik IL                  | 1431        | 717   | 400     | Magnar Lundberg                  | Trondheim              | 51,37      | 2021.09.28 |
    | Hommelvik IL                  | 1432        | 638   | 200     | Magnar Lundberg                  | Trondheim              | 24,10      | 2021.09.28 |
    | Hommelvik IL                  | 1433        | 547   | 10000   | Richard Williamson               | Trondheim              | 35,36,54   | 2021.09.28 |
    | Hommelvik IL                  | 1434        | 542   | 5000    | Marius Renå                      | Tromsø                 | 16,55,40   | 2021.09.15 |
    | Hommelvik IL                  | 1435        | 500   | 3000    | Richard Williamson               | Trondheim              | 9,56,50    | 2021.09.28 |
    | Horten Friidrettsklubb        | 1436        | 445   | Kule    | Jon Ustad                        | Asker                  | 9,94       | 2021.09.26 |
    | Horten Friidrettsklubb        | 1437        | 372   | Slegge  | Jon Ustad                        | Heggedal               | 24,99      | 2021.09.26 |
    | Horten Friidrettsklubb        | 1438        | 296   | Diskos  | Jon Ustad                        | Asker                  | 22,89      | 2021.09.26 |
    | Horten Friidrettsklubb        | 1439        | 200   | Lengde  | Mathias Røstad-Larsen            | Rjukan                 | 4,31       | 2021.09.12 |
    | Horten Friidrettsklubb        | 1440        | 186   | Spyd    | Jon Ustad                        | Asker                  | 22,17      | 2021.09.26 |
    | Horten Friidrettsklubb        | 1441        | 84    | 200     | Erlend Skogum                    | Greveskogen            | 32,60      | 2021.10.30 |
    | Hurdal IL                     | 1442        | 144   | 200     | Andreas Nordgård                 | Nadderud               | 31,40      | 2021.10.16 |
    | Hurdal IL                     | 1443        | 24    | 800     | Olaf Knai                        | Jessheim               | 3,01,50    | 2021.09.09 |
    | Hvam IL                       | 1444        | 537   | 200h    | Julian Førsund                   | Rjukan                 | 29,15      | 2021.09.12 |
    | Hvam IL                       | 1445        | 521   | Lengde  | Julian Førsund                   | Oslo/St                | 5,63       | 2021.10.16 |
    | Hvam IL                       | 1446        | 513   | 200     | Julian Førsund                   | Oslo/St                | 25,51      | 2021.10.16 |
    | Hvam IL                       | 1447        | 456   | 100     | Julian Førsund                   | Nittedal               | 12,80      | 2021.10.30 |
    | Hvam IL                       | 1448        | 363   | 100     | Jörundur Stefansson              | Jessheim               | 13,34      | 2021.09.09 |
    | Hvam IL                       | 1449        | 359   | 200     | Jörundur Stefansson              | Nittedal               | 27,65      | 2021.10.30 |
    | Hvam IL                       | 1450        | 284   | 200     | Birkir Stefansson                | Nittedal               | 28,86      | 2021.10.30 |
    | Hvam IL                       | 1451        | 189   | 100     | Birkir Stefansson                | Nittedal               | 14,52      | 2021.10.30 |
    | Hyen IL                       | 1452        | 297   | 400     | Sander Hope                      | Florø                  | 1,04,41    | 2021.06.05 |
    | Hyen IL                       | 1453        | 200   | 200     | Sander Hope                      | Florø                  | 30,1       | 2021.06.05 |
    | Hyen IL                       | 1454        | 107   | 200     | Odin Oppheim                     | Florø                  | 31,9       | 2021.06.05 |
    | Hyen IL                       | 1455        | 63    | 200     | Alfred Hope                      | Florø                  | 32,8       | 2021.06.05 |
    | IF Eiker-Kvikk                | 1456        | 667   | 1500    | Håkon Fleischer                  | Oslo/Bi                | 4,10,47    | 2021.09.25 |
    | IF Eiker-Kvikk                | 1457        | 625   | 800     | Håkon Fleischer                  | Trondheim              | 2,03,43    | 2021.09.28 |
    | IF Eiker-Kvikk                | 1458        | 610   | 5000    | Håkon Fleischer                  | Ravnanger              | 16,18,12   | 2021.09.15 |
    | IF Eiker-Kvikk                | 1459        | 525   | Tresteg | Filip Bråthen                    | Drammen                | 11,69      | 2021.10.16 |
    | IF Eiker-Kvikk                | 1460        | 469   | 400     | Håkon Fleischer                  | Drammen                | 57,97      | 2021.10.16 |
    | IF Eiker-Kvikk                | 1461        | 183   | 200     | Noah Steiro                      | Nadderud               | 30,65      | 2021.10.16 |
    | IF Hellas                     | 1462        | 956   | Lengde  | Mathias Kollberg                 | Mankato/MN/USA         | 7,62       | 2021.05.07 |
    | IF Hellas                     | 1463        | 786   | 100     | Mathias Kollberg                 | Duluth/MN/USA          | 11,22      | 2021.05.14 |
    | IF Hellas                     | 1464        | 738   | Høyde   | Mathias Kollberg                 | Duluth/MN/USA          | 1,90       | 2021.05.14 |
    | IF Hellas                     | 1465        | 701   | 400     | Mathias Kollberg                 | Duluth/MN/USA          | 51,70      | 2021.05.14 |
    | IF Hellas                     | 1466        | 656   | 110h    | Mathias Kollberg                 | Mankato/MN/USA         | 16,45      | 2021.05.07 |
    | IF Hellas                     | 1467        | 581   | Stav    | Mathias Kollberg                 | Orange City/IA/USA     | 3,35       | 2021.04.10 |
    | IF Hellas                     | 1468        | 495   | Diskos  | Mathias Kollberg                 | Mankato/MN/USA         | 30,71      | 2021.05.07 |
    | IF Hellas                     | 1469        | 478   | 200     | David Nyhus                      | Rjukan                 | 25,96      | 2021.09.12 |
    | IF Hellas                     | 1470        | 470   | 100     | David Nyhus                      | Hokksund               | 12,72      | 2021.09.26 |
    | IF Hellas                     | 1471        | 465   | Spyd    | Mathias Kollberg                 | Mankato/MN/USA         | 38,53      | 2021.05.07 |
    | IF Hellas                     | 1472        | 415   | 200     | Herman Raaum                     | Larvik                 | 26,83      | 2021.09.15 |
    | IF Hellas                     | 1473        | 398   | Kule    | Mathias Kollberg                 | Orange City/IA/USA     | 9,32       | 2021.04.10 |
    | IF Hellas                     | 1474        | 397   | 1500    | Sondre Løvendal                  | Nairobi/KEN            | 4,51,48    | 2021.10.29 |
    | IF Hellas                     | 1475        | 390   | 1500    | Mathias Kollberg                 | Duluth/MN/USA          | 4,52,74    | 2021.05.14 |
    | IF Hellas                     | 1476        | 348   | 200     | Vemund Kornrud                   | Rjukan                 | 27,82      | 2021.09.12 |
    | IF Hellas                     | 1477        | 248   | Lengde  | Herman Raaum                     | Larvik                 | 4,50       | 2021.09.15 |
    | IF Hellas                     | 1478        | 206   | 200     | Aleksander Lunn                  | Sande                  | 30,22      | 2021.10.07 |
    | IF Hellas                     | 1479        | 164   | 400     | Albert Gjevre-Karlsen            | Asker                  | 1,10,38    | 2021.09.26 |
    | IF Hellas                     | 1480        | 148   | 200     | Albert Gjevre-Karlsen            | Nadderud               | 31,32      | 2021.10.16 |
    | IF Hellas                     | 1481        | 130   | Lut     | Poul Dahl                        | Hvam                   | 2,25       | 2021.10.23 |
    | IF Hellas                     | 1482        | 130   | Lengde  | David Nyhus                      | Drammen                | 4,04       | 2021.10.16 |
    | IF Hellas                     | 1483        | 93    | Lengde  | Vemund Kornrud                   | Drammen                | 3,90       | 2021.10.16 |
    | IF Hellas                     | 1484        | 29    | 200     | Casper Cummings                  | Drammen                | 33,77      | 2021.10.16 |
    | IF Kamp-Vestheim              | 1485        | 806   | 10000   | Magnus Erstad                    | Oslo/Bi                | 30,53,58   | 2021.09.25 |
    | IF Kamp-Vestheim              | 1486        | 745   | 10000   | Fredrik Schwencke                | Oslo/Bi                | 31,53,52   | 2021.09.25 |
    | IF Kamp-Vestheim              | 1487        | 745   | 10000   | Andreas Schwencke                | Oslo/Bi                | 31,53,21   | 2021.09.25 |
    | IF Kamp-Vestheim              | 1488        | 727   | 5000    | Andreas Schwencke                | Oslo/Bi                | 15,20,37   | 2021.09.25 |
    | IF Sturla                     | 1489        | 1083  | Diskos  | Ola Isene                        | Oslo/NIH               | 65,27      | 2021.09.22 |
    | IF Sturla                     | 1490        | 824   | Stav    | Sander Oppen                     | Oslo/NIH               | 4,55       | 2021.09.22 |
    | IF Sturla                     | 1491        | 725   | 3000    | Nahom Tewelde                    | Jessheim               | 8,50,74    | 2021.09.09 |
    | IF Sturla                     | 1492        | 703   | 3000    | Knut Borkholm                    | Trondheim              | 8,56,18    | 2021.09.28 |
    | IF Sturla                     | 1493        | 685   | 800     | Benjamin Bjørnstad               | Nittedal               | 2,00,09    | 2021.10.30 |
    | IF Sturla                     | 1494        | 677   | Tresteg | Magnus Løkra                     | Drammen                | 13,07      | 2021.10.16 |
    | IF Sturla                     | 1495        | 662   | 10000   | Knut Borkholm                    | Oslo/Bi                | 33,20,92   | 2021.09.25 |
    | IF Sturla                     | 1496        | 661   | 800     | Nahom Tewelde                    | Trondheim              | 2,01,38    | 2021.09.28 |
    | IF Sturla                     | 1497        | 655   | 1500    | Nahom Tewelde                    | Sande                  | 4,11,94    | 2021.10.07 |
    | IF Sturla                     | 1498        | 619   | 5000    | Knut Borkholm                    | Jessheim               | 16,13,73   | 2021.09.09 |
    | IF Sturla                     | 1499        | 606   | 1500    | Benjamin Bjørnstad               | Jessheim               | 4,18,31    | 2021.09.09 |
    | IF Sturla                     | 1500        | 589   | 400     | Benjamin Bjørnstad               | Drammen                | 54,38      | 2021.10.16 |
    | IF Sturla                     | 1501        | 583   | Lengde  | Magnus Løkra                     | Trondheim              | 5,90       | 2021.09.28 |
    | IF Sturla                     | 1502        | 565   | 200     | Benjamin Bjørnstad               | Oslo/St                | 24,90      | 2021.10.16 |
    | IF Sturla                     | 1503        | 509   | Lut     | Frode Holt                       | Hvam                   | 2,71       | 2021.10.23 |
    | IF Sturla                     | 1504        | 503   | Hut     | Frode Holt                       | Hvam                   | 1,35       | 2021.10.23 |
    | IF Sturla                     | 1505        | 502   | Spyd    | Benjamin Bjørnstad               | Nittedal               | 41,06      | 2021.10.30 |
    | IF Sturla                     | 1506        | 502   | 800     | Daniel Oppen                     | Nadderud               | 2,11,58    | 2021.10.16 |
    | IF Sturla                     | 1507        | 501   | 10000   | Gjermund Sørstad                 | Jessheim               | 36,36,21   | 2021.09.09 |
    | IF Sturla                     | 1508        | 473   | Tresteg | Frode Holt                       | Nadderud               | 11,23      | 2021.10.16 |
    | IF Sturla                     | 1509        | 472   | 3000    | Gjermund Sørstad                 | Asker                  | 10,06,12   | 2021.09.26 |
    | IF Sturla                     | 1510        | 468   | 200     | Vemund Sørstad                   | Hokksund               | 26,09      | 2021.09.26 |
    | IF Sturla                     | 1511        | 465   | 400     | Daniel Oppen                     | Drammen                | 58,09      | 2021.10.16 |
    | IF Sturla                     | 1512        | 462   | 400     | Benjamin Shabani                 | Drammen                | 58,19      | 2021.10.16 |
    | IF Sturla                     | 1513        | 461   | Tresteg | Vemund Sørstad                   | Sande                  | 11,12      | 2021.10.07 |
    | IF Sturla                     | 1514        | 461   | Høyde   | Vemund Sørstad                   | Nadderud               | 1,60       | 2021.10.16 |
    | IF Sturla                     | 1515        | 457   | 100     | Magnus Løkra                     | Drammen                | 12,79      | 2021.10.16 |
    | IF Sturla                     | 1516        | 452   | 200     | Benjamin Shabani                 | Jessheim               | 26,31      | 2021.09.09 |
    | IF Sturla                     | 1517        | 451   | Lengde  | Daniel Oppen                     | Sande                  | 5,33       | 2021.10.07 |
    | IF Sturla                     | 1518        | 445   | 100     | Frode Holt                       | Førde                  | 12,86      | 2021.08.22 |
    | IF Sturla                     | 1519        | 441   | 100     | Vemund Sørstad                   | Hokksund               | 12,88      | 2021.09.26 |
    | IF Sturla                     | 1520        | 430   | 200     | Frode Holt                       | Førde                  | 26,61      | 2021.08.22 |
    | IF Sturla                     | 1521        | 429   | Høyde   | Frode Holt                       | Hamar                  | 1,57       | 2021.08.22 |
    | IF Sturla                     | 1522        | 420   | 200     | Nicolai Risø                     | Lillestrøm             | 26,75      | 2021.08.29 |
    | IF Sturla                     | 1523        | 418   | 1500    | Fredrik Skretteberg              | Sande                  | 4,47,73    | 2021.10.07 |
    | IF Sturla                     | 1524        | 412   | Lengde  | Vemund Sørstad                   | Moss                   | 5,17       | 2021.10.09 |
    | IF Sturla                     | 1525        | 384   | 1500    | Haakon Sørstad                   | Rjukan                 | 4,53,77    | 2021.09.12 |
    | IF Sturla                     | 1526        | 382   | 800     | Benjamin Shabani                 | Jessheim               | 2,21,62    | 2021.09.09 |
    | IF Sturla                     | 1527        | 379   | Lengde  | Frode Holt                       | Førde                  | 5,03       | 2021.08.22 |
    | IF Sturla                     | 1528        | 378   | 1500    | Sivert Rusten                    | Nadderud               | 4,54,92    | 2021.10.16 |
    | IF Sturla                     | 1529        | 364   | Høyde   | Haakon Sørstad                   | Rjukan                 | 1,51       | 2021.09.12 |
    | IF Sturla                     | 1530        | 343   | 200     | Sean Andresen                    | Sande                  | 27,90      | 2021.10.07 |
    | IF Sturla                     | 1531        | 323   | 400     | Jonas Sletten                    | Drammen                | 1,03,38    | 2021.10.16 |
    | IF Sturla                     | 1532        | 320   | 800     | Fredrik Skretteberg              | Drammen                | 2,27,61    | 2021.10.16 |
    | IF Sturla                     | 1533        | 303   | 400     | Frode Holt                       | Hamar                  | 1,04,17    | 2021.08.22 |
    | IF Sturla                     | 1534        | 278   | 3000    | Haakon Sørstad                   | Asker                  | 11,25,17   | 2021.09.26 |
    | IF Sturla                     | 1535        | 206   | 400     | Fredrik Skretteberg              | Drammen                | 1,08,42    | 2021.10.16 |
    | IF Sturla                     | 1536        | 168   | 200     | Henrik Andresen                  | Sande                  | 30,94      | 2021.10.07 |
    | IF Sturla                     | 1537        | 167   | Høyde   | Fredrik Stabæk                   | Sande                  | 1,35       | 2021.10.07 |
    | IF Sturla                     | 1538        | 157   | Stav    | Frode Holt                       | Hamar                  | 1,90       | 2021.08.22 |
    | IF Sturla                     | 1539        | 157   | Stav    | Vemund Sørstad                   | Moss                   | 1,90       | 2021.10.09 |
    | IF Sturla                     | 1540        | 150   | 1500    | Thorbjørn Magnussen              | Sande                  | 5,44,82    | 2021.10.07 |
    | IF Sturla                     | 1541        | 143   | 200     | Thorbjørn Magnussen              | Sande                  | 31,42      | 2021.10.07 |
    | IF Sturla                     | 1542        | 126   | 200     | Haakon Sørstad                   | Sande                  | 31,76      | 2021.10.07 |
    | IK Grane                      | 1543        | 736   | 100     | Henrik Danielsen                 | Arendal                | 11,43      | 2021.08.21 |
    | IK Grane                      | 1544        | 715   | 200     | Henrik Danielsen                 | Nadderud               | 23,32      | 2021.10.16 |
    | IK Grane                      | 1545        | 640   | Lengde  | Magnus Storfjord                 | Kristiansand           | 6,15       | 2021.10.06 |
    | IK Grane                      | 1546        | 639   | Diskos  | Tom Helgesen                     | Arendal                | 37,57      | 2021.08.21 |
    | IK Grane                      | 1547        | 629   | Lengde  | Henrik Danielsen                 | Arendal                | 6,10       | 2021.08.21 |
    | IK Grane                      | 1548        | 610   | 400     | Henrik Danielsen                 | Tvedestrand            | 53,7       | 2021.09.15 |
    | IK Grane                      | 1549        | 600   | Slegge  | Tom Helgesen                     | Kristiansand           | 39,01      | 2021.10.06 |
    | IK Grane                      | 1550        | 584   | Kule    | Tom Helgesen                     | Arendal                | 11,82      | 2021.08.21 |
    | IK Grane                      | 1551        | 577   | Lut     | Magnus Storfjord                 | Grimstad               | 2,83       | 2021.10.25 |
    | IK Grane                      | 1552        | 525   | Tresteg | Magnus Storfjord                 | Trondheim              | 11,69      | 2021.09.28 |
    | IK Grane                      | 1553        | 501   | 100     | Magnus Storfjord                 | Kristiansand           | 12,55      | 2021.10.06 |
    | IK Grane                      | 1554        | 491   | Lengde  | Anthony Johnsen                  | Haugesund              | 5,50       | 2021.09.12 |
    | IK Grane                      | 1555        | 481   | 100     | Anthony Johnsen                  | Tvedestrand            | 12,66      | 2021.09.15 |
    | IK Grane                      | 1556        | 456   | Kule    | Oddbjørn Guttormsen              | Greveskogen            | 10,09      | 2021.10.30 |
    | IK Grane                      | 1557        | 360   | Kule    | Henrik Danielsen                 | Tvedestrand            | 8,83       | 2021.09.15 |
    | IK Grane                      | 1558        | 325   | Lut     | Oddbjørn Guttormsen              | Grimstad               | 2,45       | 2021.10.25 |
    | IK Grane                      | 1559        | 137   | Lengde  | Elias Svenningsen                | Arendal                | 4,07       | 2021.08.21 |
    | IK Grane                      | 1560        | 61    | Lengde  | Mathias Lauvrak                  | Arendal                | 3,78       | 2021.08.21 |
    | IK Grane                      | 1561        | 30    | Lut     | Jørgen Olsen                     | Hvam                   | 2,15       | 2021.10.23 |
    | IK Hind                       | 1562        | 808   | 400     | Tobias Johansen                  | Lillehammer            | 49,54      | 2021.09.26 |
    | IK Hind                       | 1563        | 774   | 800     | Tobias Johansen                  | Lillehammer            | 1,55,84    | 2021.09.26 |
    | IK Hind                       | 1564        | 767   | 400     | Robert Sheath                    | Ravnanger              | 50,34      | 2021.09.15 |
    | IK Hind                       | 1565        | 753   | 200     | Tobias Johansen                  | Finnsnes               | 22,96      | 2021.07.11 |
    | IK Hind                       | 1566        | 746   | 10000   | Erik Nilsen                      | Jessheim               | 31,52,30   | 2021.09.09 |
    | IK Hind                       | 1567        | 740   | 200     | Robert Sheath                    | Finnsnes               | 23,08      | 2021.07.11 |
    | IK Hind                       | 1568        | 731   | 10000   | Martin Kaarby                    | Harstad                | 32,07,73   | 2021.09.25 |
    | IK Hind                       | 1569        | 720   | 100     | Robert Sheath                    | Harstad                | 11,50      | 2021.09.25 |
    | IK Hind                       | 1570        | 720   | 5000    | Erik Nilsen                      | Oslo/Bi                | 15,23,68   | 2021.09.25 |
    | IK Hind                       | 1571        | 704   | 3000    | Stian Eilertsen                  | Harstad                | 8,55,83    | 2021.09.25 |
    | IK Hind                       | 1572        | 698   | 3000    | Martin Kaarby                    | Harstad                | 8,57,32    | 2021.09.25 |
    | IK Hind                       | 1573        | 696   | 3000    | Erik Nilsen                      | Harstad                | 8,57,99    | 2021.09.25 |
    | IK Hind                       | 1574        | 695   | 200     | Birk Arvola                      | Trondheim              | 23,52      | 2021.09.28 |
    | IK Hind                       | 1575        | 683   | 5000    | Martin Kaarby                    | Harstad                | 15,41,16   | 2021.09.25 |
    | IK Hind                       | 1576        | 676   | 1500    | Stian Eilertsen                  | Harstad                | 4,09,48    | 2021.09.25 |
    | IK Hind                       | 1577        | 675   | 100     | Tobias Johansen                  | Sortland               | 11,70      | 2021.08.22 |
    | IK Hind                       | 1578        | 669   | 5000    | Stian Eilertsen                  | Tromsø                 | 15,48,07   | 2021.09.15 |
    | IK Hind                       | 1579        | 668   | 3000    | Per-Christian Pedersen           | Harstad                | 9,05,32    | 2021.09.25 |
    | IK Hind                       | 1580        | 666   | 10000   | Per-Christian Pedersen           | Harstad                | 33,16,89   | 2021.09.25 |
    | IK Hind                       | 1581        | 651   | 3000    | Martin Granild                   | Harstad                | 9,10,03    | 2021.09.25 |
    | IK Hind                       | 1582        | 644   | 100     | Birk Arvola                      | Sortland               | 11,84      | 2021.08.22 |
    | IK Hind                       | 1583        | 643   | 5000    | Per-Christian Pedersen           | Harstad                | 16,00,98   | 2021.09.25 |
    | IK Hind                       | 1584        | 621   | Spyd    | Stein Eliseussen                 | Harstad                | 49,62      | 2021.09.25 |
    | IK Hind                       | 1585        | 605   | 400     | Kristian Sheath                  | Tromsø                 | 53,96      | 2021.09.15 |
    | IK Hind                       | 1586        | 604   | 400     | Birk Arvola                      | Tromsø                 | 53,98      | 2021.09.15 |
    | IK Hind                       | 1587        | 600   | 3000    | Truls Torblå                     | Harstad                | 9,24,37    | 2021.09.25 |
    | IK Hind                       | 1588        | 581   | 400h    | Tobias Johansen                  | Harstad                | 1,01,71    | 2021.09.25 |
    | IK Hind                       | 1589        | 580   | 400     | Oskar Stattin                    | Steinkjer              | 54,62      | 2021.09.30 |
    | IK Hind                       | 1590        | 565   | 200     | Oskar Stattin                    | Finnsnes               | 24,89      | 2021.07.11 |
    | IK Hind                       | 1591        | 565   | Lengde  | Tobias Johansen                  | Harstad                | 5,82       | 2021.09.25 |
    | IK Hind                       | 1592        | 565   | 200     | Kristian Sheath                  | Trondheim              | 24,90      | 2021.09.28 |
    | IK Hind                       | 1593        | 563   | 3000    | Gaute Bere                       | Ystad/SWE              | 9,36,00    | 2021.06.16 |
    | IK Hind                       | 1594        | 519   | 100     | Kristian Sheath                  | Sortland               | 12,46      | 2021.08.22 |
    | IK Hind                       | 1595        | 518   | Tresteg | Oskar Stattin                    | Harstad                | 11,63      | 2021.09.25 |
    | IK Hind                       | 1596        | 516   | Lengde  | Oskar Stattin                    | Trondheim              | 5,61       | 2021.09.28 |
    | IK Hind                       | 1597        | 511   | Høyde   | Tobias Johansen                  | Harstad                | 1,65       | 2021.09.25 |
    | IK Hind                       | 1598        | 478   | 100     | Oskar Stattin                    | Nadderud               | 12,68      | 2021.10.16 |
    | IK Hind                       | 1599        | 436   | 400     | Nikolai Hansen                   | Tromsø                 | 59,08      | 2021.09.15 |
    | IK Hind                       | 1600        | 433   | 200     | Christoffer Torbergsen           | Harstad                | 26,57      | 2021.09.25 |
    | IK Hind                       | 1601        | 432   | 200     | Nikolai Hansen                   | Harstad                | 26,58      | 2021.09.25 |
    | IK Hind                       | 1602        | 403   | 100     | Christoffer Torbergsen           | Tromsø                 | 13,10      | 2021.09.15 |
    | IK Hind                       | 1603        | 381   | Lengde  | Nikolai Hansen                   | Harstad                | 5,04       | 2021.09.25 |
    | IK Hind                       | 1604        | 309   | 200     | Mathias Johansen                 | Sortland               | 28,45      | 2021.08.22 |
    | IK Hind                       | 1605        | 302   | 1500    | Leif-Andreas Borgersen           | Måndalen               | 5,09,86    | 2021.09.12 |
    | IK Hind                       | 1606        | 295   | Høyde   | Leif-Andreas Borgersen           | Bodø                   | 1,45       | 2021.09.21 |
    | IK Hind                       | 1607        | 266   | 1500    | Karl-Henrik Borgersen            | Bodø                   | 5,17,61    | 2021.09.21 |
    | IK Hind                       | 1608        | 251   | 200     | Simon Kaarbø                     | Harstad                | 29,42      | 2021.09.25 |
    | IK Hind                       | 1609        | 233   | Høyde   | Karl-Henrik Borgersen            | Harstad                | 1,40       | 2021.09.25 |
    | IK Hind                       | 1610        | 222   | 200     | Leif-Andreas Borgersen           | Finnsnes               | 29,93      | 2021.07.11 |
    | IK Hind                       | 1611        | 199   | 200     | Jesper Moe                       | Harstad                | 30,35      | 2021.09.25 |
    | IK Hind                       | 1612        | 186   | 200     | Viktor Stattin                   | Tromsø                 | 30,59      | 2021.09.15 |
    | IK Hind                       | 1613        | 184   | Stav    | Karl-Henrik Borgersen            | Måndalen               | 1,97       | 2021.09.12 |
    | IK Hind                       | 1614        | 167   | Høyde   | Mathias Johansen                 | Harstad                | 1,35       | 2021.09.25 |
    | IK Hind                       | 1615        | 156   | 200     | Karl-Henrik Borgersen            | Finnsnes               | 31,17      | 2021.07.11 |
    | IK Hind                       | 1616        | 116   | Stav    | Viktor Stattin                   | Finnsnes               | 1,80       | 2021.07.11 |
    | IK Hind                       | 1617        | 31    | 200     | Håkon Nilsen                     | Harstad                | 33,73      | 2021.09.25 |
    | IK Hind                       | 1618        | 22    | 200     | Per-Kristian Kjøren              | Harstad                | 33,91      | 2021.09.25 |
    | IK Tjalve                     | 1619        | 1135  | Slegge  | Eivind Henriksen                 | Tokyo/JPN              | 81,58      | 2021.08.29 |
    | IK Tjalve                     | 1620        | 1109  | Kule    | Marcus Thomsen                   | Helsingborg/SWE        | 20,96      | 2021.05.22 |
    | IK Tjalve                     | 1621        | 1030  | 3000    | Ferdinand Edman                  | Jessheim               | 7,45,52    | 2021.09.09 |
    | IK Tjalve                     | 1622        | 1018  | 800     | Tobias Grønstad                  | Halluin/FRA            | 1,46,46    | 2021.09.01 |
    | IK Tjalve                     | 1623        | 1014  | 1500    | Ferdinand Edman                  | Oslo/Bi                | 3,37,98+   | 2021.09.25 |
    | IK Tjalve                     | 1624        | 980   | 5000    | Ferdinand Edman                  | Greveskogen            | 13,39,23   | 2021.10.30 |
    | IK Tjalve                     | 1625        | 943   | 800     | Luca Thompson                    | Fana                   | 1,49,05    | 2021.09.28 |
    | IK Tjalve                     | 1626        | 942   | Lengde  | Sander Skotheim                  | Tallinn/EST            | 7,55       | 2021.07.18 |
    | IK Tjalve                     | 1627        | 937   | 200     | Kenny Tijani-Ajayi               | Lillehammer            | 21,37      | 2021.09.26 |
    | IK Tjalve                     | 1628        | 917   | Lengde  | Markus Rooth                     | Ravnanger              | 7,43       | 2021.09.15 |
    | IK Tjalve                     | 1629        | 913   | 100     | Kenny Tijani-Ajayi               | Trondheim              | 10,73      | 2021.09.28 |
    | IK Tjalve                     | 1630        | 913   | 3000    | Ibrahim Buras                    | Jessheim               | 8,08,62    | 2021.09.09 |
    | IK Tjalve                     | 1631        | 912   | Diskos  | Eivind Henriksen                 | Kristiansand           | 53,41      | 2021.10.06 |
    | IK Tjalve                     | 1632        | 910   | Stav    | Sander Skotheim                  | Oslo/NIH               | 5,01       | 2021.09.22 |
    | IK Tjalve                     | 1633        | 905   | Lengde  | Abraham Vogelsang                | Trondheim              | 7,37       | 2021.09.28 |
    | IK Tjalve                     | 1634        | 903   | Høyde   | Sander Skotheim                  | Oslo/Bi                | 2,10       | 2021.09.25 |
    | IK Tjalve                     | 1635        | 888   | Stav    | Markus Rooth                     | Ravnanger              | 4,90       | 2021.09.15 |
    | IK Tjalve                     | 1636        | 888   | Stav    | Abraham Vogelsang                | Tallinn/EST            | 4,90       | 2021.07.18 |
    | IK Tjalve                     | 1637        | 886   | Høyde   | Abraham Vogelsang                | Kristiansand           | 2,08       | 2021.10.06 |
    | IK Tjalve                     | 1638        | 885   | 5000    | Petter Rypdal                    | Greveskogen            | 14,13,07   | 2021.10.30 |
    | IK Tjalve                     | 1639        | 881   | 400     | Tobias Grønstad                  | Oslo/Bi                | 48,18      | 2021.09.25 |
    | IK Tjalve                     | 1640        | 881   | 1500    | Ibrahim Buras                    | Oslo/Bi                | 3,48,49    | 2021.09.25 |
    | IK Tjalve                     | 1641        | 881   | 400     | Luca Thompson                    | Lillehammer            | 48,18      | 2021.09.26 |
    | IK Tjalve                     | 1642        | 876   | Tresteg | Elias Søvik                      | Kristiansand           | 14,97      | 2021.10.06 |
    | IK Tjalve                     | 1643        | 872   | 110h    | Markus Rooth                     | Tallinn/EST            | 14,61      | 2021.07.18 |
    | IK Tjalve                     | 1644        | 870   | 110h    | Joachim Sandberg                 | Lillehammer            | 14,62      | 2021.09.26 |
    | IK Tjalve                     | 1645        | 867   | 5000    | Ibrahim Buras                    | Kristiansand           | 14,20,24   | 2021.10.06 |
    | IK Tjalve                     | 1646        | 866   | 10000   | Kristian Pytten                  | Kristiansand           | 30,00,00   | 2021.10.06 |
    | IK Tjalve                     | 1647        | 865   | Diskos  | Thor Rosvold                     | Heggedal               | 50,44      | 2021.09.26 |
    | IK Tjalve                     | 1648        | 851   | Stav    | Andreas Gjesdal                  | Kristiansand           | 4,70       | 2021.10.06 |
    | IK Tjalve                     | 1649        | 847   | 200     | Luca Thompson                    | Lillehammer            | 22,11      | 2021.09.26 |
    | IK Tjalve                     | 1650        | 846   | Diskos  | Erik Rosvold                     | Kristiansand           | 49,30      | 2021.10.06 |
    | IK Tjalve                     | 1651        | 846   | 100     | Markus Rooth                     | Götzis/AUT             | 10,98      | 2021.05.29 |
    | IK Tjalve                     | 1652        | 836   | 400     | Sander Skotheim                  | Oslo/Bi                | 49,00      | 2021.09.25 |
    | IK Tjalve                     | 1653        | 834   | 100     | Joachim Sandberg                 | Oslo/Bi                | 11,03      | 2021.09.25 |
    | IK Tjalve                     | 1654        | 832   | 200     | Joachim Sandberg                 | Lillehammer            | 22,25      | 2021.09.26 |
    | IK Tjalve                     | 1655        | 831   | 10000   | Petter Rypdal                    | Kristiansand           | 30,30,78   | 2021.10.06 |
    | IK Tjalve                     | 1656        | 828   | 5000    | Kristian Pytten                  | Oslo/Bi                | 14,35,94   | 2021.09.25 |
    | IK Tjalve                     | 1657        | 825   | Kule    | Eivind Henriksen                 | Kristiansand           | 15,47      | 2021.10.06 |
    | IK Tjalve                     | 1658        | 813   | Diskos  | Markus Rooth                     | Tallinn/EST            | 47,31      | 2021.07.18 |
    | IK Tjalve                     | 1659        | 812   | 400     | Markus Rooth                     | Tallinn/EST            | 49,46      | 2021.07.18 |
    | IK Tjalve                     | 1660        | 801   | 100     | Sander Myrvang                   | Oslo/Bi                | 11,16      | 2021.09.25 |
    | IK Tjalve                     | 1661        | 798   | 3000    | Petter Rypdal                    | Oslo/Bi                | 8,33,35    | 2021.09.25 |
    | IK Tjalve                     | 1662        | 796   | Høyde   | Markus Rooth                     | Götzis/AUT             | 1,97       | 2021.05.29 |
    | IK Tjalve                     | 1663        | 796   | 3000    | Mikkel Bakken                    | Oslo/Bi                | 8,33,75    | 2021.09.25 |
    | IK Tjalve                     | 1664        | 795   | 5000    | Iver Glomnes                     | Kristiansand           | 14,50,02   | 2021.10.06 |
    | IK Tjalve                     | 1665        | 781   | Spyd    | Markus Rooth                     | Ravnanger              | 61,65      | 2021.09.15 |
    | IK Tjalve                     | 1666        | 779   | Spyd    | Sander Skotheim                  | Bækkelaget             | 61,47      | 2021.10.04 |
    | IK Tjalve                     | 1667        | 775   | Lengde  | Elias Søvik                      | Leikvang               | 6,76       | 2021.08.29 |
    | IK Tjalve                     | 1668        | 774   | 100     | Per Aalerud                      | Ravnanger              | 11,27      | 2021.09.15 |
    | IK Tjalve                     | 1669        | 774   | 100     | Sander Skotheim                  | Oslo/Bi                | 11,27      | 2021.09.25 |
    | IK Tjalve                     | 1670        | 761   | 3000    | Iver Glomnes                     | Oslo/Bi                | 8,41,93    | 2021.09.25 |
    | IK Tjalve                     | 1671        | 755   | 100     | Sindre Olsvik                    | Oslo/Bi                | 11,35      | 2021.09.25 |
    | IK Tjalve                     | 1672        | 751   | 400     | Abraham Vogelsang                | Tallinn/EST            | 50,66      | 2021.07.18 |
    | IK Tjalve                     | 1673        | 748   | 5000    | Emil Ahlbäck                     | Oslo/Bi                | 15,10,77   | 2021.09.25 |
    | IK Tjalve                     | 1674        | 743   | 100     | Albin Botez                      | Trondheim              | 11,40      | 2021.09.28 |
    | IK Tjalve                     | 1675        | 742   | 3000    | Emil Ahlbäck                     | Oslo/Bi                | 8,46,55    | 2021.09.25 |
    | IK Tjalve                     | 1676        | 739   | 200     | Sander Myrvang                   | Kristiansand           | 23,09      | 2021.10.06 |
    | IK Tjalve                     | 1677        | 739   | 100     | Abraham Vogelsang                | Oslo/Bi                | 11,42      | 2021.09.25 |
    | IK Tjalve                     | 1678        | 739   | 100     | Håkon Skaftun                    | Lillehammer            | 11,42      | 2021.09.26 |
    | IK Tjalve                     | 1679        | 734   | Kule    | Markus Rooth                     | Götzis/AUT             | 14,01      | 2021.05.29 |
    | IK Tjalve                     | 1680        | 729   | 200     | Håkon Skaftun                    | Nittedal               | 23,19      | 2021.10.30 |
    | IK Tjalve                     | 1681        | 726   | Kule    | Erik Rosvold                     | Kristiansand           | 13,88      | 2021.10.06 |
    | IK Tjalve                     | 1682        | 724   | 10000   | Jonas Riseth                     | Oslo/Bi                | 32,14,73   | 2021.09.25 |
    | IK Tjalve                     | 1683        | 723   | Spyd    | Abraham Vogelsang                | Oslo/Bi                | 57,25      | 2021.09.25 |
    | IK Tjalve                     | 1684        | 719   | 1500    | Mikkel Bakken                    | Oslo/Bi                | 4,04,49    | 2021.09.25 |
    | IK Tjalve                     | 1685        | 718   | 5000    | Jonas Riseth                     | Oslo/Bi                | 15,24,86   | 2021.09.25 |
    | IK Tjalve                     | 1686        | 711   | 800     | Bendik Lillemoen                 | Oslo/Bi                | 1,58,82    | 2021.09.25 |
    | IK Tjalve                     | 1687        | 694   | 1500    | Henrik Velle                     | Oslo/Bi                | 4,07,33    | 2021.09.25 |
    | IK Tjalve                     | 1688        | 690   | 3000    | Jonas Riseth                     | Nadderud               | 8,59,49    | 2021.10.16 |
    | IK Tjalve                     | 1689        | 689   | Tresteg | Per Aalerud                      | Oslo/Bi                | 13,18      | 2021.09.25 |
    | IK Tjalve                     | 1690        | 678   | Høyde   | Jørgen Bergh                     | Greveskogen            | 1,83       | 2021.10.30 |
    | IK Tjalve                     | 1691        | 674   | 1500    | Jonas Riseth                     | Oslo/Bi                | 4,09,64    | 2021.09.25 |
    | IK Tjalve                     | 1692        | 663   | 3000    | Henrik Velle                     | Nadderud               | 9,06,64    | 2021.10.16 |
    | IK Tjalve                     | 1693        | 658   | 800     | Lars Møller                      | Nittedal               | 2,01,53    | 2021.10.30 |
    | IK Tjalve                     | 1694        | 652   | 5000    | Henrik Velle                     | Lillehammer            | 15,56,67   | 2021.09.26 |
    | IK Tjalve                     | 1695        | 643   | Diskos  | Rune Godtland                    | Førde                  | 37,76      | 2021.08.22 |
    | IK Tjalve                     | 1696        | 643   | 200     | Albin Botez                      | Oslo/Bi                | 24,04      | 2021.09.25 |
    | IK Tjalve                     | 1697        | 641   | 400     | Håkon Skaftun                    | Oslo/Bi                | 53,08      | 2021.09.25 |
    | IK Tjalve                     | 1698        | 637   | 1500    | Lars Møller                      | Oslo/Bi                | 4,14,33    | 2021.09.25 |
    | IK Tjalve                     | 1699        | 636   | 400     | Leonard-Johan Nesheim            | Oslo/Bi                | 53,19      | 2021.09.25 |
    | IK Tjalve                     | 1700        | 630   | 3000    | Bendik Lillemoen                 | Oslo/Bi                | 9,15,88    | 2021.09.25 |
    | IK Tjalve                     | 1701        | 627   | 10000   | Henrik Velle                     | Oslo/Bi                | 34,00,22   | 2021.09.25 |
    | IK Tjalve                     | 1702        | 626   | 3000    | Lars Møller                      | Trondheim              | 9,17,15    | 2021.09.28 |
    | IK Tjalve                     | 1703        | 621   | 800     | Henrik Velle                     | Lillehammer            | 2,03,66    | 2021.09.26 |
    | IK Tjalve                     | 1704        | 613   | 100     | Benjamin Strømsvold              | Oslo/Bi                | 11,99      | 2021.09.25 |
    | IK Tjalve                     | 1705        | 613   | 800     | Jonas Riseth                     | Nadderud               | 2,04,09    | 2021.10.16 |
    | IK Tjalve                     | 1706        | 610   | 800     | Mikkel Bakken                    | Nittedal               | 2,04,28    | 2021.10.30 |
    | IK Tjalve                     | 1707        | 594   | Lut     | Jørgen Bergh                     | Greveskogen            | 2,86       | 2021.10.30 |
    | IK Tjalve                     | 1708        | 586   | 1500    | Bendik Lillemoen                 | Oslo/Bi                | 4,21,13    | 2021.09.25 |
    | IK Tjalve                     | 1709        | 572   | Lut     | Sander Myrvang                   | Lillehammer            | 2,82       | 2021.09.26 |
    | IK Tjalve                     | 1710        | 570   | 800     | Emil Ahlbäck                     | Oslo/Bi                | 2,06,79    | 2021.09.25 |
    | IK Tjalve                     | 1711        | 540   | 100     | Jørgen Bergh                     | Trondheim              | 12,35      | 2021.09.28 |
    | IK Tjalve                     | 1712        | 523   | Stav    | Lucas Gjesdal                    | Trondheim              | 3,10       | 2021.09.28 |
    | IK Tjalve                     | 1713        | 519   | Slegge  | Erik Rosvold                     | Heggedal               | 33,66      | 2021.09.26 |
    | IK Tjalve                     | 1714        | 500   | 400     | Lars Møller                      | Lillehammer            | 56,95      | 2021.09.26 |
    | IK Tjalve                     | 1715        | 493   | 1500    | Sander Skotheim                  | Tallinn/EST            | 4,35,03    | 2021.07.18 |
    | IK Tjalve                     | 1716        | 485   | 1500    | Markus Rooth                     | Tallinn/EST            | 4,36,30    | 2021.07.18 |
    | IK Tjalve                     | 1717        | 481   | Høyde   | Andreas Haga                     | Oslo/NIH               | 1,62       | 2021.09.22 |
    | IK Tjalve                     | 1718        | 446   | Lengde  | Jørgen Bergh                     | Jessheim               | 5,31       | 2021.09.09 |
    | IK Tjalve                     | 1719        | 430   | Spyd    | Erik Rosvold                     | Asker                  | 36,21      | 2021.09.26 |
    | IK Tjalve                     | 1720        | 388   | 1500    | Abraham Vogelsang                | Oslo/Bi                | 4,53,02    | 2021.09.25 |
    | IK Våg                        | 1721        | 722   | 100     | Rayan Rangassamy                 | Grimstad               | 11,49      | 2021.10.25 |
    | IK Våg                        | 1722        | 719   | 200     | Rayan Rangassamy                 | Grimstad               | 23,28      | 2021.10.25 |
    | IK Våg                        | 1723        | 672   | Lengde  | Rayan Rangassamy                 | Nadderud               | 6,29       | 2021.10.16 |
    | IK Våg                        | 1724        | 635   | Tresteg | Rayan Rangassamy                 | Nadderud               | 12,68      | 2021.10.16 |
    | IK Våg                        | 1725        | 562   | 100     | Theodor Pedersen                 | Nadderud               | 12,24      | 2021.10.16 |
    | IK Våg                        | 1726        | 531   | 200     | Theodor Pedersen                 | Nadderud               | 25,30      | 2021.10.16 |
    | IK Våg                        | 1727        | 461   | Høyde   | Rayan Rangassamy                 | Grimstad               | 1,60       | 2021.10.25 |
    | IK Våg                        | 1728        | 94    | 800     | Tobias Rødland                   | Kristiansand           | 2,52,82    | 2021.10.06 |
    | IL Bjarg                      | 1729        | 656   | 10000   | Andreas Torsvik                  | Kristiansand           | 33,27,27   | 2021.10.06 |
    | IL Bjarg                      | 1730        | 356   | 1500    | Martin Mjelde                    | Leirvik                | 4,59,11    | 2021.09.13 |
    | IL Bjarg                      | 1731        | 213   | 100     | Mikkel Larsen                    | Leikvang               | 14,34      | 2021.08.29 |
    | IL Bjarg                      | 1732        | 175   | 200     | Martin Mjelde                    | Fana                   | 30,81      | 2021.09.28 |
    | IL Bjarg                      | 1733        | 82    | 200     | Vetle Haaland                    | Fana                   | 32,65      | 2021.09.28 |
    | IL Bjarg                      | 1734        | 25    | 100     | Ian Mugge-Angelvik               | Leikvang               | 15,85      | 2021.08.29 |
    | IL Bjarg                      | 1735        | 6     | 200     | Vetle Roiha                      | Fana                   | 34,27      | 2021.09.28 |
    | IL Bjørn                      | 1736        | 64    | 1500    | Gard Sønnesyn                    | Sogndal                | 6,08,57    | 2021.05.12 |
    | IL Dalebrand                  | 1737        | 392   | 5000    | Rolf Hernes                      | Stjørdal               | 18,30,40   | 2021.10.23 |
    | IL Dalebrand                  | 1738        | 308   | 1500    | Rolf Hernes                      | Stjørdal               | 5,08,6     | 2021.10.23 |
    | IL Dalebrand                  | 1739        | 180   | Lut     | Kjell Storflor                   | Stjørdal               | 2,30       | 2021.10.23 |
    | IL Express                    | 1740        | 582   | 5000    | Terje Bruborg                    | Fevik                  | 16,33,2    | 2021.08.08 |
    | IL Express                    | 1741        | 188   | 5000    | Lasse Andersen                   | Fevik                  | 21,21,9    | 2021.08.08 |
    | IL Express                    | 1742        | 184   | 5000    | Albert Anderssen                 | Fevik                  | 21,25,9    | 2021.08.08 |
    | IL Fri                        | 1743        | 936   | Lengde  | Martin Roe                       | Arona/ESP              | 7,52       | 2021.06.13 |
    | IL Fri                        | 1744        | 879   | Stav    | Martin Roe                       | Lana/ITA               | 4,85       | 2021.04.25 |
    | IL Fri                        | 1745        | 878   | 100     | Martin Roe                       | Tokyo/JPN              | 10,86      | 2021.08.29 |
    | IL Fri                        | 1746        | 831   | Diskos  | Martin Roe                       | Tokyo/JPN              | 48,37      | 2021.08.29 |
    | IL Fri                        | 1747        | 830   | Spyd    | Martin Roe                       | Lana/ITA               | 65,14      | 2021.04.25 |
    | IL Fri                        | 1748        | 790   | Kule    | Martin Roe                       | Lana/ITA               | 14,88      | 2021.04.25 |
    | IL Fri                        | 1749        | 788   | Høyde   | Martin Roe                       | Tokyo/JPN              | 1,96       | 2021.08.29 |
    | IL Fri                        | 1750        | 776   | 110h    | Martin Roe                       | Arona/ESP              | 15,33      | 2021.06.13 |
    | IL Fri                        | 1751        | 760   | 400     | Martin Roe                       | Lana/ITA               | 50,48      | 2021.04.25 |
    | IL Fri                        | 1752        | 725   | 3000    | Espen Joensen                    | Arna                   | 8,50,67    | 2021.10.13 |
    | IL Fri                        | 1753        | 722   | 5000    | Espen Joensen                    | Arna                   | 15,22,79   | 2021.10.13 |
    | IL Fri                        | 1754        | 646   | 3000    | Torstein Mastervik               | Trondheim              | 9,11,25    | 2021.09.28 |
    | IL Fri                        | 1755        | 641   | 200     | Thord Iversen                    | Leikvang               | 24,06      | 2021.08.29 |
    | IL Fri                        | 1756        | 639   | 800     | Torstein Mastervik               | Trondheim              | 2,02,61    | 2021.09.28 |
    | IL Fri                        | 1757        | 621   | 100     | Nikolai Marøy                    | Leikvang               | 11,95      | 2021.08.29 |
    | IL Fri                        | 1758        | 617   | Spyd    | Niklas Rutle                     | Arna                   | 49,32      | 2021.10.13 |
    | IL Fri                        | 1759        | 606   | 100     | Thord Iversen                    | Leikvang               | 12,02      | 2021.08.29 |
    | IL Fri                        | 1760        | 604   | 100     | Lars Birketveit                  | Trondheim              | 12,03      | 2021.09.28 |
    | IL Fri                        | 1761        | 602   | 3000    | Sondre Brattabø                  | Arna                   | 9,23,85    | 2021.10.13 |
    | IL Fri                        | 1762        | 600   | 5000    | Sander Lie                       | Arna                   | 16,23,36   | 2021.10.13 |
    | IL Fri                        | 1763        | 598   | 5000    | Espen Haugen                     | Arna                   | 16,24,78   | 2021.10.13 |
    | IL Fri                        | 1764        | 596   | 1500    | Torstein Mastervik               | Fana                   | 4,19,69    | 2021.09.28 |
    | IL Fri                        | 1765        | 562   | 3000    | Eirik Vestrheim                  | Arna                   | 9,36,22    | 2021.10.13 |
    | IL Fri                        | 1766        | 562   | 3000    | Sander Lie                       | Arna                   | 9,36,12    | 2021.10.13 |
    | IL Fri                        | 1767        | 545   | Diskos  | Olav Hansen                      | Bergen                 | 32,95      | 2021.10.30 |
    | IL Fri                        | 1768        | 542   | 3000    | Karl Pettersson                  | Arna                   | 9,42,55    | 2021.10.13 |
    | IL Fri                        | 1769        | 540   | 3000    | Espen Haugen                     | Arna                   | 9,43,15    | 2021.10.13 |
    | IL Fri                        | 1770        | 539   | Kule    | Stein Fossen                     | Arna                   | 11,21      | 2021.10.13 |
    | IL Fri                        | 1771        | 530   | 100     | Even Olsnes                      | Leikvang               | 12,40      | 2021.08.29 |
    | IL Fri                        | 1772        | 521   | Slegge  | Stein Fossen                     | Bergen                 | 33,75      | 2021.10.30 |
    | IL Fri                        | 1773        | 516   | 800     | Mathias Berg                     | Osterøy                | 2,10,62    | 2021.10.24 |
    | IL Fri                        | 1774        | 506   | 3000    | Andreas Vågen                    | Arna                   | 9,54,36    | 2021.10.13 |
    | IL Fri                        | 1775        | 500   | 3000    | Mathias Berg                     | Arna                   | 9,56,34    | 2021.10.13 |
    | IL Fri                        | 1776        | 481   | 1500    | Christer Sælen                   | Arna                   | 4,37,08    | 2021.10.13 |
    | IL Fri                        | 1777        | 476   | Slegge  | Olav Hansen                      | Bergen                 | 30,95      | 2021.10.30 |
    | IL Fri                        | 1778        | 475   | 3000    | Christer Sælen                   | Arna                   | 10,05,19   | 2021.10.13 |
    | IL Fri                        | 1779        | 466   | 5000    | Christer Sælen                   | Arna                   | 17,41,47   | 2021.10.13 |
    | IL Fri                        | 1780        | 465   | Diskos  | Stein Fossen                     | Bergen                 | 29,44      | 2021.10.30 |
    | IL Fri                        | 1781        | 457   | Kule    | Olav Hansen                      | Bergen                 | 10,10      | 2021.10.30 |
    | IL Fri                        | 1782        | 448   | 3000    | Jon Djønne                       | Arna                   | 10,14,66   | 2021.10.13 |
    | IL Fri                        | 1783        | 446   | 1500    | Martin Roe                       | Arona/ESP              | 4,42,83    | 2021.06.13 |
    | IL Fri                        | 1784        | 402   | Spyd    | Olav Hansen                      | Bergen                 | 34,43      | 2021.10.30 |
    | IL Fri                        | 1785        | 402   | 3000    | Nils Sæterdal                    | Arna                   | 10,31,89   | 2021.10.13 |
    | IL Fri                        | 1786        | 398   | 1500    | Nils Sæterdal                    | Arna                   | 4,51,26    | 2021.10.13 |
    | IL Fri                        | 1787        | 359   | 800     | Nils Sæterdal                    | Førde                  | 2,23,75    | 2021.08.22 |
    | IL Fri                        | 1788        | 356   | 100     | Aslak Monstad                    | Arna                   | 13,38      | 2021.10.13 |
    | IL Fri                        | 1789        | 344   | 800     | Christer Sælen                   | Arna                   | 2,25,21    | 2021.10.13 |
    | IL Fri                        | 1790        | 322   | 5000    | Erik Iden                        | Arna                   | 19,22,53   | 2021.10.13 |
    | IL Fri                        | 1791        | 310   | 800     | Haakon Gunby                     | Førde                  | 2,28,53    | 2021.08.22 |
    | IL Fri                        | 1792        | 288   | Lut     | Stein Fossen                     | Arna                   | 2,41       | 2021.10.13 |
    | IL Fri                        | 1793        | 283   | 3000    | Erik Iden                        | Arna                   | 11,22,77   | 2021.10.13 |
    | IL Fri                        | 1794        | 272   | 400     | Haakon Gunby                     | Arna                   | 1,05,52    | 2021.10.13 |
    | IL Fri                        | 1795        | 267   | 200     | Odd Byrknes                      | Arna                   | 28,9       | 2021.10.13 |
    | IL Fri                        | 1796        | 246   | 200     | Haakon Gunby                     | Førde                  | 29,50      | 2021.08.22 |
    | IL Fri                        | 1797        | 222   | Spyd    | Stein Fossen                     | Bergen                 | 23,95      | 2021.10.30 |
    | IL Fri                        | 1798        | 204   | Spyd    | Torstein Mastervik               | Osterøy                | 23,04      | 2021.10.24 |
    | IL Fri                        | 1799        | 200   | 200     | Lars Fjelde                      | Arna                   | 30,1       | 2021.10.13 |
    | IL Fri                        | 1800        | 191   | 200     | Magnus Skjoldal                  | Arna                   | 30,51      | 2021.10.13 |
    | IL Fri                        | 1801        | 186   | 100     | Magnus Skjoldal                  | Arna                   | 14,54      | 2021.10.13 |
    | IL Fri                        | 1802        | 176   | 800     | Knut Engesæt                     | Førde                  | 2,43,06    | 2021.08.22 |
    | IL Fri                        | 1803        | 145   | 200     | Espen Haugen                     | Førde                  | 31,37      | 2021.08.22 |
    | IL Fri                        | 1804        | 144   | 100     | Lars Fjelde                      | Arna                   | 14,86      | 2021.10.13 |
    | IL Fri                        | 1805        | 128   | 1500    | Odd Byrknes                      | Os                     | 5,50,76    | 2021.09.26 |
    | IL Fri                        | 1806        | 122   | 3000    | Odd Byrknes                      | Arna                   | 12,50,71   | 2021.10.13 |
    | IL Fri                        | 1807        | 105   | 200     | Andreas Sandin                   | Arna                   | 32,18      | 2021.10.13 |
    | IL Fri                        | 1808        | 94    | 200     | Levi Rørbakken                   | Arna                   | 32,39      | 2021.10.13 |
    | IL Fri                        | 1809        | 69    | 200     | EiVind: Sæbø                     | Arna                   | 32,91      | 2021.10.13 |
    | IL Fri                        | 1810        | 33    | 5000    | Frode Eikeland                   | Førde                  | 24,27,46   | 2021.08.22 |
    | IL Fri                        | 1811        | 22    | 200     | Roger Larsen                     | Arna                   | 33,92      | 2021.10.13 |
    | IL Fri                        | 1812        | 19    | Høyde   | Andreas Sandin                   | Arna                   | 1,25       | 2021.10.13 |
    | IL Fri                        | 1813        | 11    | 100     | Roger Larsen                     | Arna                   | 15,98      | 2021.10.13 |
    | IL Gneist                     | 1814        | 959   | 200     | Herman Ellingsen                 | Lillehammer            | 21,20      | 2021.09.26 |
    | IL Gneist                     | 1815        | 924   | 100     | Herman Ellingsen                 | Ravnanger              | 10,69      | 2021.09.15 |
    | IL Gneist                     | 1816        | 912   | 400     | Thomas Strønstad-Løseth          | Fana                   | 47,65      | 2021.09.28 |
    | IL Gneist                     | 1817        | 904   | 1500    | Anders Bjørndal                  | Oslo/Bi                | 3,46,51    | 2021.09.25 |
    | IL Gneist                     | 1818        | 903   | 3000    | Anders Bjørndal                  | Fana                   | 8,10,76    | 2021.09.28 |
    | IL Gneist                     | 1819        | 890   | 400h    | Herman Ellingsen                 | Fana                   | 52,23      | 2021.09.28 |
    | IL Gneist                     | 1820        | 885   | 3000    | Philip Massacand                 | Jessheim               | 8,14,45    | 2021.09.09 |
    | IL Gneist                     | 1821        | 879   | 110h    | Herman Ellingsen                 | Fana                   | 14,56      | 2021.09.28 |
    | IL Gneist                     | 1822        | 878   | 10000   | Philip Massacand                 | Kristiansand           | 29,49,72   | 2021.10.06 |
    | IL Gneist                     | 1823        | 870   | 5000    | Jon Sætre                        | Greveskogen            | 14,19,00   | 2021.10.30 |
    | IL Gneist                     | 1824        | 867   | Lengde  | Gjert Sjursen                    | Oslo/Bi                | 7,19       | 2021.09.25 |
    | IL Gneist                     | 1825        | 866   | 200     | Thomas Strønstad-Løseth          | Trondheim              | 21,95      | 2021.09.28 |
    | IL Gneist                     | 1826        | 854   | 5000    | Philip Massacand                 | Ravnanger              | 14,25,35   | 2021.09.15 |
    | IL Gneist                     | 1827        | 841   | 100     | Gjert Sjursen                    | Leikvang               | 11,00      | 2021.08.29 |
    | IL Gneist                     | 1828        | 840   | 400     | Herman Ellingsen                 | Oslo/Bi                | 48,93      | 2021.09.25 |
    | IL Gneist                     | 1829        | 834   | 200     | Kristoffer Blücher               | Fana                   | 22,23      | 2021.09.28 |
    | IL Gneist                     | 1830        | 826   | 100     | Kristoffer Blücher               | Fana                   | 11,06      | 2021.09.28 |
    | IL Gneist                     | 1831        | 825   | 110h    | Gjert Sjursen                    | Lillehammer            | 14,95      | 2021.09.26 |
    | IL Gneist                     | 1832        | 813   | 800     | Anders Bjørndal                  | Greveskogen            | 1,54,13    | 2021.10.30 |
    | IL Gneist                     | 1833        | 811   | 200     | Gjert Sjursen                    | Haugesund              | 22,43      | 2021.09.12 |
    | IL Gneist                     | 1834        | 811   | 400     | Kristoffer Blücher               | Oslo/Bi                | 49,48      | 2021.09.25 |
    | IL Gneist                     | 1835        | 801   | 100     | Ole Flatjord                     | Lillehammer            | 11,16      | 2021.09.26 |
    | IL Gneist                     | 1836        | 795   | 200     | Sindre Strønstad-Løseth          | Jessheim               | 22,57      | 2021.09.09 |
    | IL Gneist                     | 1837        | 793   | Tresteg | Gjert Sjursen                    | Ravnanger              | 14,17      | 2021.09.15 |
    | IL Gneist                     | 1838        | 792   | 400     | Sindre Strønstad-Løseth          | Kristiansand           | 49,85      | 2021.10.06 |
    | IL Gneist                     | 1839        | 777   | 200     | Ole Flatjord                     | Leikvang               | 22,74      | 2021.08.29 |
    | IL Gneist                     | 1840        | 768   | 1500    | Hans-Magnus Haukøy               | Fana                   | 3,59,26    | 2021.09.28 |
    | IL Gneist                     | 1841        | 767   | 3000    | Tobias Allers-Hansen             | Fana                   | 8,40,68    | 2021.09.28 |
    | IL Gneist                     | 1842        | 764   | 800     | Hans-Magnus Haukøy               | Fana                   | 1,56,31    | 2021.09.28 |
    | IL Gneist                     | 1843        | 760   | Hut     | Gjert Sjursen                    | Bergen/Hø              | 1,58       | 2021.10.08 |
    | IL Gneist                     | 1844        | 756   | 1500    | Philip Massacand                 | Arna                   | 4,00,43    | 2021.10.13 |
    | IL Gneist                     | 1845        | 754   | 400     | Filip Holdhus                    | Fana                   | 50,59      | 2021.09.28 |
    | IL Gneist                     | 1846        | 754   | 1500    | Tobias Allers-Hansen             | Oslo/Bi                | 4,00,66    | 2021.09.25 |
    | IL Gneist                     | 1847        | 753   | 800     | Tobias Allers-Hansen             | Fana                   | 1,56,78    | 2021.09.28 |
    | IL Gneist                     | 1848        | 752   | 3000H   | Espen Karlsen                    | Fana                   | 9,30,87    | 2021.09.28 |
    | IL Gneist                     | 1849        | 746   | 100     | Sindre Strønstad-Løseth          | Fana                   | 11,39      | 2021.09.28 |
    | IL Gneist                     | 1850        | 742   | 200     | Filip Holdhus                    | Trondheim              | 23,06      | 2021.09.28 |
    | IL Gneist                     | 1851        | 735   | 1500    | André Seliussen                  | Arna                   | 4,02,74    | 2021.10.13 |
    | IL Gneist                     | 1852        | 731   | 5000    | Espen Karlsen                    | Fana                   | 15,18,45   | 2021.09.28 |
    | IL Gneist                     | 1853        | 723   | 5000    | Andreas Størkson                 | Osterøy                | 15,22,22   | 2021.10.24 |
    | IL Gneist                     | 1854        | 720   | Stav    | Gjert Sjursen                    | Ravnanger              | 4,00       | 2021.09.15 |
    | IL Gneist                     | 1855        | 720   | Slegge  | Sondre Kolbjørnsen               | Bergen                 | 47,58      | 2021.10.30 |
    | IL Gneist                     | 1856        | 720   | 100     | Filip Holdhus                    | Lillehammer            | 11,50      | 2021.09.26 |
    | IL Gneist                     | 1857        | 719   | 3000    | Andreas Størkson                 | Fana                   | 8,52,26    | 2021.09.28 |
    | IL Gneist                     | 1858        | 718   | 3000    | Hans-Magnus Haukøy               | Fana                   | 8,52,41    | 2021.09.28 |
    | IL Gneist                     | 1859        | 706   | 5000    | André Seliussen                  | Oslo/Bi                | 15,30,23   | 2021.09.25 |
    | IL Gneist                     | 1860        | 705   | 400     | Gjert Sjursen                    | Oslo/Bi                | 51,63      | 2021.09.25 |
    | IL Gneist                     | 1861        | 705   | Høyde   | Gjert Sjursen                    | Oslo/Bi                | 1,86       | 2021.09.25 |
    | IL Gneist                     | 1862        | 705   | Hut     | Herman Ellingsen                 | Bergen/Hø              | 1,53       | 2021.10.08 |
    | IL Gneist                     | 1863        | 704   | 3000    | Jon-Anders Haukøy                | Fana                   | 8,55,90    | 2021.09.28 |
    | IL Gneist                     | 1864        | 700   | Lut     | Jakob Ånonli                     | Bergen/Hø              | 3,05       | 2021.10.08 |
    | IL Gneist                     | 1865        | 700   | 1500    | Andreas Størkson                 | Fana                   | 4,06,55    | 2021.09.28 |
    | IL Gneist                     | 1866        | 700   | 3000H   | Tobias Allers-Hansen             | Stavanger              | 9,46,50    | 2021.10.27 |
    | IL Gneist                     | 1867        | 688   | Diskos  | Gjert Sjursen                    | Bergen                 | 40,19      | 2021.10.30 |
    | IL Gneist                     | 1868        | 687   | Høyde   | Oscar Ellingsen                  | Fana                   | 1,84       | 2021.09.28 |
    | IL Gneist                     | 1869        | 683   | 800     | Thomas Strønstad-Løseth          | Fana                   | 2,00,19    | 2021.09.28 |
    | IL Gneist                     | 1870        | 676   | 10000   | Lucas Marechet                   | Fana                   | 33,05,55   | 2021.09.28 |
    | IL Gneist                     | 1871        | 668   | 3000H   | André Seliussen                  | Ravnanger              | 9,57,03    | 2021.09.15 |
    | IL Gneist                     | 1872        | 659   | 3000    | Lucas Marechet                   | Fana                   | 9,07,81    | 2021.09.28 |
    | IL Gneist                     | 1873        | 654   | 1500    | Jon-Anders Haukøy                | Fana                   | 4,12,11    | 2021.09.28 |
    | IL Gneist                     | 1874        | 653   | Spyd    | Gjert Sjursen                    | Bergen                 | 51,99      | 2021.10.30 |
    | IL Gneist                     | 1875        | 651   | 5000    | Jon-Anders Haukøy                | Ravnanger              | 15,57,16   | 2021.09.15 |
    | IL Gneist                     | 1876        | 634   | 800     | Andreas Størkson                 | Fana                   | 2,02,85    | 2021.09.28 |
    | IL Gneist                     | 1877        | 633   | Lut     | Gjert Sjursen                    | Bergen/Hø              | 2,93       | 2021.10.08 |
    | IL Gneist                     | 1878        | 628   | 5000    | Tobias Allers-Hansen             | Ravnanger              | 16,09,17   | 2021.09.15 |
    | IL Gneist                     | 1879        | 617   | Diskos  | Sondre Kolbjørnsen               | Bergen                 | 36,42      | 2021.10.30 |
    | IL Gneist                     | 1880        | 614   | 800     | Filip Holdhus                    | Fana                   | 2,04,05    | 2021.09.28 |
    | IL Gneist                     | 1881        | 608   | 800     | André Seliussen                  | Fana                   | 2,04,39    | 2021.09.28 |
    | IL Gneist                     | 1882        | 605   | 800     | Jon-Anders Haukøy                | Fana                   | 2,04,57    | 2021.09.28 |
    | IL Gneist                     | 1883        | 600   | 100     | Torleiv Lygren                   | Fana                   | 12,05      | 2021.09.28 |
    | IL Gneist                     | 1884        | 599   | 200     | Torleiv Lygren                   | Bergen/La              | 24,51      | 2021.09.29 |
    | IL Gneist                     | 1885        | 589   | Spyd    | Thomas Brattaule                 | Bergen                 | 47,26      | 2021.10.30 |
    | IL Gneist                     | 1886        | 587   | 200     | Nicolai Holdhus                  | Os                     | 24,64      | 2021.09.26 |
    | IL Gneist                     | 1887        | 586   | Kule    | Gjert Sjursen                    | Oslo/Bi                | 11,86      | 2021.09.25 |
    | IL Gneist                     | 1888        | 584   | 3000    | Noah Martinsen                   | Arna                   | 9,29,44    | 2021.10.13 |
    | IL Gneist                     | 1889        | 581   | 5000    | Noah Martinsen                   | Fana                   | 16,33,99   | 2021.09.28 |
    | IL Gneist                     | 1890        | 572   | Hut     | Sondre Kolbjørnsen               | Bergen/Hø              | 1,41       | 2021.10.08 |
    | IL Gneist                     | 1891        | 561   | Stav    | Kirill Eikanger                  | Fana                   | 3,26       | 2021.09.28 |
    | IL Gneist                     | 1892        | 561   | Lut     | Sondre Kolbjørnsen               | Bergen/Hø              | 2,80       | 2021.10.08 |
    | IL Gneist                     | 1893        | 552   | 200     | Kristoffer Andreassen            | Fana                   | 25,04      | 2021.09.28 |
    | IL Gneist                     | 1894        | 550   | 400     | Torleiv Lygren                   | Arna                   | 55,46      | 2021.10.13 |
    | IL Gneist                     | 1895        | 546   | 100     | Kristoffer Andreassen            | Fana                   | 12,32      | 2021.09.28 |
    | IL Gneist                     | 1896        | 538   | Lut     | Herman Ellingsen                 | Bergen/Hø              | 2,76       | 2021.10.08 |
    | IL Gneist                     | 1897        | 526   | 800     | Philip Massacand                 | Arna                   | 2,09,88    | 2021.10.13 |
    | IL Gneist                     | 1898        | 513   | 3000    | Bjarte Eikanger                  | Arna                   | 9,52,21    | 2021.10.13 |
    | IL Gneist                     | 1899        | 512   | 1500    | Noah Martinsen                   | Arna                   | 4,32,01    | 2021.10.13 |
    | IL Gneist                     | 1900        | 487   | 800     | Noah Martinsen                   | Trondheim              | 2,12,76    | 2021.09.28 |
    | IL Gneist                     | 1901        | 484   | 1500    | Tord Andresen                    | Fana                   | 4,36,57    | 2021.09.28 |
    | IL Gneist                     | 1902        | 483   | 1500    | Didrik Hatlelid                  | Fana                   | 4,36,63    | 2021.09.28 |
    | IL Gneist                     | 1903        | 474   | 800     | Nicolai Holdhus                  | Os                     | 2,13,83    | 2021.09.26 |
    | IL Gneist                     | 1904        | 474   | Kule    | Sondre Kolbjørnsen               | Fana                   | 10,33      | 2021.09.28 |
    | IL Gneist                     | 1905        | 467   | 200h    | Peter Bjørndal                   | Haugesund              | 30,53      | 2021.09.12 |
    | IL Gneist                     | 1906        | 462   | 400     | Trygve Havro                     | Nadderud               | 58,18      | 2021.10.16 |
    | IL Gneist                     | 1907        | 454   | 3000    | Tord Andresen                    | Arna                   | 10,12,51   | 2021.10.13 |
    | IL Gneist                     | 1908        | 452   | 1500    | Sondre Haukanes                  | Haugesund              | 4,41,83    | 2021.09.12 |
    | IL Gneist                     | 1909        | 452   | 3000    | Sondre Haukanes                  | Leikvang               | 10,13,2    | 2021.08.29 |
    | IL Gneist                     | 1910        | 425   | 800     | Didrik Hatlelid                  | Arna                   | 2,17,83    | 2021.10.13 |
    | IL Gneist                     | 1911        | 423   | 200     | Peter Bjørndal                   | Fana                   | 26,71      | 2021.09.28 |
    | IL Gneist                     | 1912        | 413   | 1500    | Trygve Havro                     | Kristiansand           | 4,48,58    | 2021.10.06 |
    | IL Gneist                     | 1913        | 413   | 100     | Trygve Havro                     | Kristiansand           | 13,04      | 2021.10.06 |
    | IL Gneist                     | 1914        | 402   | 400     | Thorben Bücker                   | Arna                   | 1,00,27    | 2021.10.13 |
    | IL Gneist                     | 1915        | 382   | 1500    | Gjert Sjursen                    | Oslo/Bi                | 4,54,31    | 2021.09.25 |
    | IL Gneist                     | 1916        | 373   | Spyd    | Hans-Magnus Haukøy               | Fana                   | 32,61      | 2021.09.28 |
    | IL Gneist                     | 1917        | 354   | Spyd    | Thomas Ødegaard                  | Fana                   | 31,42      | 2021.09.28 |
    | IL Gneist                     | 1918        | 345   | 1500    | Daniel Wasbø                     | Leirvik                | 5,01,21    | 2021.09.13 |
    | IL Gneist                     | 1919        | 341   | 200     | Sondre Haukanes                  | Fana                   | 27,93      | 2021.09.28 |
    | IL Gneist                     | 1920        | 326   | Spyd    | Herman Ellingsen                 | Fana                   | 29,76      | 2021.09.28 |
    | IL Gneist                     | 1921        | 295   | Spyd    | Sondre Kolbjørnsen               | Fana                   | 27,96      | 2021.09.28 |
    | IL Gneist                     | 1922        | 295   | 200     | Heine Strønstad-Løseth           | Jessheim               | 28,68      | 2021.09.09 |
    | IL Gneist                     | 1923        | 295   | 200     | Kirill Eikanger                  | Os                     | 28,68      | 2021.09.26 |
    | IL Gneist                     | 1924        | 275   | Kule    | Hans-Magnus Haukøy               | Fana                   | 7,79       | 2021.09.28 |
    | IL Gneist                     | 1925        | 270   | Høyde   | Oskar Trumpy                     | Os                     | 1,43       | 2021.09.26 |
    | IL Gneist                     | 1926        | 266   | Stav    | Sondre Haukanes                  | Leirvik                | 2,20       | 2021.09.13 |
    | IL Gneist                     | 1927        | 256   | Kule    | Bjarne Kleivane                  | Fana                   | 7,56       | 2021.09.28 |
    | IL Gneist                     | 1928        | 255   | Kule    | Thomas Ødegaard                  | Fana                   | 7,54       | 2021.09.28 |
    | IL Gneist                     | 1929        | 242   | Kule    | Thomas Strønstad-Løseth          | Fana                   | 7,39       | 2021.09.28 |
    | IL Gneist                     | 1930        | 240   | Lengde  | Trygve Havro                     | Fana                   | 4,47       | 2021.09.28 |
    | IL Gneist                     | 1931        | 234   | 200     | Oskar Trumpy                     | Os                     | 29,72      | 2021.09.26 |
    | IL Gneist                     | 1932        | 233   | Kule    | Andreas Størkson                 | Fana                   | 7,29       | 2021.09.28 |
    | IL Gneist                     | 1933        | 220   | 200     | Jacob Heggland                   | Fana                   | 29,97      | 2021.09.28 |
    | IL Gneist                     | 1934        | 214   | 200     | Daniel Wasbø                     | Fana                   | 30,08      | 2021.09.28 |
    | IL Gneist                     | 1935        | 208   | Spyd    | Thomas Strønstad-Løseth          | Fana                   | 23,24      | 2021.09.28 |
    | IL Gneist                     | 1936        | 200   | Lut     | Trygve Havro                     | Bergen/Hø              | 2,32       | 2021.10.08 |
    | IL Gneist                     | 1937        | 176   | Spyd    | Tobias Allers-Hansen             | Fana                   | 21,66      | 2021.09.28 |
    | IL Gneist                     | 1938        | 167   | 1500    | Marius Endresen                  | Fana                   | 5,40,68    | 2021.09.28 |
    | IL Gneist                     | 1939        | 163   | Kule    | Sindre Strønstad-Løseth          | Fana                   | 6,49       | 2021.09.28 |
    | IL Gneist                     | 1940        | 139   | 200     | Andreas Vold                     | Fana                   | 31,49      | 2021.09.28 |
    | IL Gneist                     | 1941        | 110   | Lut     | Oskar Trumpy                     | Bergen/Hø              | 2,23       | 2021.10.08 |
    | IL Gneist                     | 1942        | 90    | Lut     | Sondre Haukanes                  | Bergen/Hø              | 2,21       | 2021.10.08 |
    | IL Gneist                     | 1943        | 80    | Hut     | Trygve Havro                     | Bergen/Hø              | 1,10       | 2021.10.08 |
    | IL Gneist                     | 1944        | 78    | Kule    | Trygve Havro                     | Fana                   | 5,58       | 2021.09.28 |
    | IL Gneist                     | 1945        | 60    | Kule    | Tobias Allers-Hansen             | Fana                   | 5,39       | 2021.09.28 |
    | IL Gneist                     | 1946        | 45    | 100     | Henrik Abrahamsen                | Fana                   | 15,68      | 2021.09.28 |
    | IL Gneist                     | 1947        | 37    | Diskos  | Andreas Størkson                 | Fana                   | 14,08      | 2021.09.28 |
    | IL Gneist                     | 1948        | 26    | Lengde  | Henrik Abrahamsen                | Fana                   | 3,65       | 2021.09.28 |
    | IL Gneist                     | 1949        | 19    | Høyde   | Kirill Eikanger                  | Knarvik                | 1,25       | 2021.09.23 |
    | IL Gneist                     | 1950        | 18    | 200     | Aksel Larsen                     | Fana                   | 34,01      | 2021.09.28 |
    | IL Gular                      | 1951        | 1036  | 100     | Even Meinseth                    | Jessheim               | 10,30      | 2021.09.09 |
    | IL Gular                      | 1952        | 994   | 1500    | Mats Hauge                       | Watford/GBR            | 3,39,40    | 2021.08.11 |
    | IL Gular                      | 1953        | 990   | 3000    | Marius Vedvik                    | Jessheim               | 7,53,01    | 2021.09.09 |
    | IL Gular                      | 1954        | 988   | 5000    | Marius Vedvik                    | Oslo/Bi                | 13,36,60   | 2021.09.25 |
    | IL Gular                      | 1955        | 980   | 400     | Andreas Bakketun                 | Fana                   | 46,50      | 2021.09.28 |
    | IL Gular                      | 1956        | 959   | 3000    | Bjørnar Lillefosse               | Fana                   | 7,59,17    | 2021.09.28 |
    | IL Gular                      | 1957        | 959   | 200     | Andreas Bakketun                 | Fana                   | 21,20      | 2021.09.28 |
    | IL Gular                      | 1958        | 949   | 3000    | Mats Hauge                       | Fana                   | 8,01,20    | 2021.09.28 |
    | IL Gular                      | 1959        | 928   | 1500    | Marius Vedvik                    | Oslo/Bi                | 3,44,55    | 2021.09.25 |
    | IL Gular                      | 1960        | 916   | 800     | Mats Hauge                       | Jessheim               | 1,50,03    | 2021.09.09 |
    | IL Gular                      | 1961        | 912   | 5000    | Bjørnar Lillefosse               | Kristiansand           | 14,02,85   | 2021.10.06 |
    | IL Gular                      | 1962        | 910   | 10000   | Bjørnar Lillefosse               | Kristiansand           | 29,22,91   | 2021.10.06 |
    | IL Gular                      | 1963        | 908   | 3000    | Eivind Wikshåland                | Jessheim               | 8,09,70    | 2021.09.09 |
    | IL Gular                      | 1964        | 906   | 200     | Even Meinseth                    | Grimstad               | 21,62      | 2021.10.25 |
    | IL Gular                      | 1965        | 897   | 10000   | Marius Vedvik                    | Kristiansand           | 29,33,13   | 2021.10.06 |
    | IL Gular                      | 1966        | 888   | 1500    | Eivind Wikshåland                | Fana                   | 3,47,87    | 2021.09.28 |
    | IL Gular                      | 1967        | 881   | 400     | Tor-Junor Vedde                  | Oslo/Bi                | 48,19      | 2021.09.25 |
    | IL Gular                      | 1968        | 878   | 1500    | Bjørnar Lillefosse               | Fana                   | 3,48,79    | 2021.09.28 |
    | IL Gular                      | 1969        | 875   | 100     | Sondre Gjesdal                   | Kristiansand           | 10,87      | 2021.10.06 |
    | IL Gular                      | 1970        | 871   | 200     | Tor-Junor Vedde                  | Leikvang               | 21,91      | 2021.08.29 |
    | IL Gular                      | 1971        | 866   | 3000    | Sondre Hoff                      | Jessheim               | 8,18,45    | 2021.09.09 |
    | IL Gular                      | 1972        | 865   | 400h    | Andreas Bakketun                 | Arna                   | 52,78      | 2021.10.13 |
    | IL Gular                      | 1973        | 864   | 200     | Sondre Gjesdal                   | Lillehammer            | 21,97      | 2021.09.26 |
    | IL Gular                      | 1974        | 864   | 3000    | Eldar Fagerbakke                 | Jessheim               | 8,18,96    | 2021.09.09 |
    | IL Gular                      | 1975        | 861   | 5000    | Eivind Wikshåland                | Oslo/Bi                | 14,22,39   | 2021.09.25 |
    | IL Gular                      | 1976        | 860   | 800     | Robin Nedrehagen                 | Eltham/GBR             | 1,52,20    | 2021.08.14 |
    | IL Gular                      | 1977        | 851   | 3000    | Johannes Teigland                | Jessheim               | 8,21,79    | 2021.09.09 |
    | IL Gular                      | 1978        | 849   | 1500    | Sondre Hoff                      | Oslo/Bi                | 3,51,36    | 2021.09.25 |
    | IL Gular                      | 1979        | 846   | 100     | Tor-Junor Vedde                  | Leikvang               | 10,98      | 2021.08.29 |
    | IL Gular                      | 1980        | 842   | 3000    | Matias Førde                     | Jessheim               | 8,23,76    | 2021.09.09 |
    | IL Gular                      | 1981        | 842   | 1500    | Johannes Teigland                | Kristiansand           | 3,51,97    | 2021.10.06 |
    | IL Gular                      | 1982        | 841   | 1500    | Matias Førde                     | Fana                   | 3,52,11    | 2021.09.28 |
    | IL Gular                      | 1983        | 838   | 800     | Kristoffer Grindedal             | Strandebarm            | 1,53,10    | 2021.09.22 |
    | IL Gular                      | 1984        | 826   | 400     | Sebastian Plows                  | Ravnanger              | 49,20      | 2021.09.15 |
    | IL Gular                      | 1985        | 812   | 800     | Bjørnar Lillefosse               | Strandebarm            | 1,54,19    | 2021.09.22 |
    | IL Gular                      | 1986        | 811   | 5000    | Johannes Teigland                | Greveskogen            | 14,43,18   | 2021.10.30 |
    | IL Gular                      | 1987        | 802   | 3000    | Tore Akerlie                     | Fana                   | 8,32,45    | 2021.09.28 |
    | IL Gular                      | 1988        | 801   | 800     | Timmi Anderl                     | Trondheim              | 1,54,63    | 2021.09.28 |
    | IL Gular                      | 1989        | 801   | 100     | Erlend Nilsen                    | Jessheim               | 11,16      | 2021.09.09 |
    | IL Gular                      | 1990        | 801   | 800     | Marius Vedvik                    | Fana                   | 1,54,63    | 2021.09.28 |
    | IL Gular                      | 1991        | 799   | 800     | Matias Førde                     | Fana                   | 1,54,72    | 2021.09.28 |
    | IL Gular                      | 1992        | 798   | 5000    | Eldar Fagerbakke                 | Fana                   | 14,48,39   | 2021.09.28 |
    | IL Gular                      | 1993        | 795   | 5000    | Tore Akerlie                     | Oslo/Bi                | 14,49,76   | 2021.09.25 |
    | IL Gular                      | 1994        | 795   | 800     | Sondre Hoff                      | Oslo/Bi                | 1,54,90    | 2021.09.25 |
    | IL Gular                      | 1995        | 795   | 200     | Sebastian Plows                  | Leikvang               | 22,57      | 2021.08.29 |
    | IL Gular                      | 1996        | 787   | 800     | Johannes Teigland                | Oslo/Bi                | 1,55,28    | 2021.09.25 |
    | IL Gular                      | 1997        | 782   | 400     | Sivert Sellevold                 | Ravnanger              | 50,05      | 2021.09.15 |
    | IL Gular                      | 1998        | 781   | 1500    | Eldar Fagerbakke                 | Kristiansand           | 3,57,96    | 2021.10.06 |
    | IL Gular                      | 1999        | 772   | Spyd    | Sebastian Rolland                | Bergen                 | 60,95      | 2021.10.30 |
    | IL Gular                      | 2000        | 771   | 200     | Sivert Sellevold                 | Lillehammer            | 22,79      | 2021.09.26 |
    | IL Gular                      | 2001        | 769   | 10000   | Tore Akerlie                     | Fana                   | 31,29,58   | 2021.09.28 |
    | IL Gular                      | 2002        | 755   | 100     | Sebastian Plows                  | Leikvang               | 11,35      | 2021.08.29 |
    | IL Gular                      | 2003        | 749   | 10000   | Lars-Olav Apold                  | Fana                   | 31,48,93   | 2021.09.28 |
    | IL Gular                      | 2004        | 747   | 1500    | Tore Akerlie                     | Oslo/Bi                | 4,01,36    | 2021.09.25 |
    | IL Gular                      | 2005        | 729   | 3000    | Lars-Olav Apold                  | Husnes                 | 8,49,8     | 2021.09.08 |
    | IL Gular                      | 2006        | 717   | 200     | Erlend Nilsen                    | Trondheim              | 23,30      | 2021.09.28 |
    | IL Gular                      | 2007        | 714   | 10000   | Ken Johansen                     | Fana                   | 32,24,95   | 2021.09.28 |
    | IL Gular                      | 2008        | 704   | 5000    | Daniel Beeder                    | Arna                   | 15,31,23   | 2021.10.13 |
    | IL Gular                      | 2009        | 702   | 1500    | Daniel Jacobsen                  | Oslo/Bi                | 4,06,31    | 2021.09.25 |
    | IL Gular                      | 2010        | 695   | 1500    | Lars-Olav Apold                  | Fana                   | 4,07,15    | 2021.09.28 |
    | IL Gular                      | 2011        | 693   | 5000    | Daniel Jacobsen                  | Fana                   | 15,36,49   | 2021.09.28 |
    | IL Gular                      | 2012        | 693   | 3000    | Daniel Beeder                    | Fana                   | 8,58,76    | 2021.09.28 |
    | IL Gular                      | 2013        | 689   | 10000   | Daniel Beeder                    | Fana                   | 32,51,54   | 2021.09.28 |
    | IL Gular                      | 2014        | 689   | 3000H   | Daniel Jacobsen                  | Fana                   | 9,50,13    | 2021.09.28 |
    | IL Gular                      | 2015        | 688   | 100     | Sivert Sellevold                 | Leikvang               | 11,64      | 2021.08.29 |
    | IL Gular                      | 2016        | 688   | Lut     | Sivert Sellevold                 | Leikvang               | 3,03       | 2021.08.29 |
    | IL Gular                      | 2017        | 688   | Lut     | Erlend Nilsen                    | Arna                   | 3,03       | 2021.10.13 |
    | IL Gular                      | 2018        | 686   | 3000    | Ragnar Nersten                   | Fana                   | 9,00,64    | 2021.09.28 |
    | IL Gular                      | 2019        | 676   | 3000    | Daniel Jacobsen                  | Fana                   | 9,03,19    | 2021.09.28 |
    | IL Gular                      | 2020        | 668   | 110h    | Andreas Bakketun                 | Cluj-Napoca/ROU        | 16,33      | 2021.06.20 |
    | IL Gular                      | 2021        | 664   | 3000    | Ken Johansen                     | Arna                   | 9,06,50    | 2021.10.13 |
    | IL Gular                      | 2022        | 656   | 800     | Thomas Iversen-Skoge             | Strandebarm            | 2,01,61    | 2021.09.22 |
    | IL Gular                      | 2023        | 654   | 800     | Lars-Olav Apold                  | Strandebarm            | 2,01,73    | 2021.09.22 |
    | IL Gular                      | 2024        | 649   | 1500    | Ken Johansen                     | Fana                   | 4,12,69    | 2021.09.28 |
    | IL Gular                      | 2025        | 642   | 400     | Timmi Anderl                     | Arna                   | 53,06      | 2021.10.13 |
    | IL Gular                      | 2026        | 641   | 1500    | Thomas Iversen-Skoge             | Fana                   | 4,13,73    | 2021.09.28 |
    | IL Gular                      | 2027        | 633   | 5000    | Ken Johansen                     | Arna                   | 16,06,24   | 2021.10.13 |
    | IL Gular                      | 2028        | 618   | 3000    | Thomas Iversen-Skoge             | Nadderud               | 9,19,45    | 2021.10.16 |
    | IL Gular                      | 2029        | 617   | 10000   | Daniel Fadnes                    | Fana                   | 34,11,49   | 2021.09.28 |
    | IL Gular                      | 2030        | 615   | 5000    | Thomas Iversen-Skoge             | Arna                   | 16,15,51   | 2021.10.13 |
    | IL Gular                      | 2031        | 598   | 800     | Ken Johansen                     | Strandebarm            | 2,04,97    | 2021.09.22 |
    | IL Gular                      | 2032        | 580   | 3000    | Daniel Fadnes                    | Husnes                 | 9,30,5     | 2021.09.08 |
    | IL Gular                      | 2033        | 552   | 1500    | Daniel Fadnes                    | Fana                   | 4,25,98    | 2021.09.28 |
    | IL Gular                      | 2034        | 536   | 100     | Morten Solheim                   | Osterøy                | 12,37      | 2021.10.24 |
    | IL Gular                      | 2035        | 499   | 3000    | Sondre Måge                      | Fana                   | 9,56,72    | 2021.09.28 |
    | IL Gular                      | 2036        | 496   | 100     | Fahad Alrantisi                  | Fana                   | 12,58      | 2021.09.28 |
    | IL Gular                      | 2037        | 494   | 400     | Lukas Lie                        | Arna                   | 57,13      | 2021.10.13 |
    | IL Gular                      | 2038        | 491   | 200     | Fahad Alrantisi                  | Fana                   | 25,79      | 2021.09.28 |
    | IL Gular                      | 2039        | 472   | 800     | Lukas Lie                        | Fana                   | 2,13,98    | 2021.09.28 |
    | IL Gular                      | 2040        | 459   | 800     | Sondre Måge                      | Leikvang               | 2,14,98    | 2021.08.29 |
    | IL Gular                      | 2041        | 453   | 800     | Kjetil Steinstø                  | Strandebarm            | 2,15,48    | 2021.09.22 |
    | IL Gular                      | 2042        | 113   | 400     | Øystein Isaksen                  | Os                     | 1,12,81    | 2021.09.26 |
    | IL Gular                      | 2043        | 96    | Høyde   | Frank Kvinge                     | Os                     | 1,30       | 2021.09.26 |
    | IL Gular                      | 2044        | 65    | 800     | Øystein Isaksen                  | Os                     | 2,56,37    | 2021.09.26 |
    | IL Gular                      | 2045        | 64    | 200     | Frank Kvinge                     | Os                     | 33,01      | 2021.09.26 |
    | IL Gular                      | 2046        | 51    | 1500    | Øystein Isaksen                  | Os                     | 6,12,24    | 2021.09.26 |
    | IL Gular                      | 2047        | 44    | 200     | Øystein Isaksen                  | Os                     | 33,44      | 2021.09.26 |
    | IL Gular                      | 2048        | 40    | Lengde  | Oliver Aadland                   | Leikvang               | 3,70       | 2021.08.29 |
    | IL Gular                      | 2049        | 22    | 3000K   | Arthur Lillefosse                | Os                     | 21,24,89   | 2021.09.26 |
    | IL Gular                      | 2050        | 19    | 5000K   | Arthur Lillefosse                | Førde                  | 36,14,98   | 2021.08.22 |
    | IL Gular                      | 2051        | 6     | 100     | Frank Kvinge                     | Os                     | 16,02      | 2021.09.26 |
    | IL Heming                     | 2052        | 693   | 3000    | Lars Muren                       | Nadderud               | 8,58,64    | 2021.10.16 |
    | IL Koll                       | 2053        | 747   | 10000   | Kristoffer Tollås                | Oslo/Bi                | 31,51,13   | 2021.09.25 |
    | IL Koll                       | 2054        | 450   | 1500    | Axel Møller                      | Oslo/St                | 4,42,15    | 2021.10.16 |
    | IL Koll                       | 2055        | 415   | 800     | Axel Møller                      | Nittedal               | 2,18,66    | 2021.10.30 |
    | IL Koll                       | 2056        | 368   | 1500    | August Bruland                   | Rjukan                 | 4,56,77    | 2021.09.12 |
    | IL Koll                       | 2057        | 357   | 800     | Jakob Kolderup                   | Nittedal               | 2,23,98    | 2021.10.30 |
    | IL Koll                       | 2058        | 356   | 200h    | Morten Bech                      | Rjukan                 | 32,82      | 2021.09.12 |
    | IL Koll                       | 2059        | 348   | 200     | Even Nørjordet                   | Jessheim               | 27,82      | 2021.09.09 |
    | IL Koll                       | 2060        | 340   | 200     | Njål Hein-Gutierrez              | Oslo/NIH               | 27,7       | 2021.09.22 |
    | IL Koll                       | 2061        | 328   | 200     | Morten Bech                      | Oslo/St                | 28,14      | 2021.10.16 |
    | IL Koll                       | 2062        | 319   | 400     | Axel Møller                      | Nittedal               | 1,03,52    | 2021.10.30 |
    | IL Koll                       | 2063        | 299   | 1500    | Henrik Ellingvåg                 | Rjukan                 | 5,10,41    | 2021.09.12 |
    | IL Koll                       | 2064        | 282   | 200     | Jakob Kolderup                   | Rjukan                 | 28,90      | 2021.09.12 |
    | IL Koll                       | 2065        | 257   | 200     | Philip Flo                       | Nadderud               | 29,31      | 2021.10.16 |
    | IL Koll                       | 2066        | 254   | 1500    | Oliver Sweetman                  | Nadderud               | 5,20,15    | 2021.10.16 |
    | IL Koll                       | 2067        | 250   | 200     | Henrik Ellingvåg                 | Oslo/NIH               | 29,2       | 2021.09.22 |
    | IL Koll                       | 2068        | 250   | Stav    | Morten Bech                      | Oslo/NIH               | 2,15       | 2021.09.22 |
    | IL Koll                       | 2069        | 233   | Høyde   | Even Nørjordet                   | Oslo/NIH               | 1,40       | 2021.09.22 |
    | IL Koll                       | 2070        | 215   | 400     | Leo Aas                          | Nittedal               | 1,08,01    | 2021.10.30 |
    | IL Koll                       | 2071        | 194   | 200     | Leo Aas                          | Nadderud               | 30,44      | 2021.10.16 |
    | IL Koll                       | 2072        | 190   | 800     | Oliver Sweetman                  | Nittedal               | 2,41,42    | 2021.10.30 |
    | IL Koll                       | 2073        | 189   | 200     | Oscar Harbo-Lervik               | Oslo/NIH               | 30,3       | 2021.09.22 |
    | IL Koll                       | 2074        | 187   | Lengde  | Njål Hein-Gutierrez              | Oslo/NIH               | 4,26       | 2021.09.22 |
    | IL Koll                       | 2075        | 167   | Høyde   | Aksel Gulowsen                   | Oslo/NIH               | 1,35       | 2021.09.22 |
    | IL Koll                       | 2076        | 155   | 200     | Oliver Sweetman                  | Nadderud               | 31,19      | 2021.10.16 |
    | IL Koll                       | 2077        | 142   | 200     | Theo Mølmann-Sand                | Oslo/NIH               | 31,2       | 2021.09.22 |
    | IL Koll                       | 2078        | 111   | Høyde   | Philip Flo                       | Rjukan                 | 1,31       | 2021.09.12 |
    | IL Koll                       | 2079        | 96    | Høyde   | Oliver Sweetman                  | Oslo/St                | 1,30       | 2021.10.16 |
    | IL Koll                       | 2080        | 58    | 200     | Per Øien                         | Oslo/NIH               | 32,9       | 2021.09.22 |
    | IL Koll                       | 2081        | 58    | 200     | Eirik Stølan                     | Oslo/NIH               | 32,9       | 2021.09.22 |
    | IL Koll                       | 2082        | 49    | 200     | Paal Thorkildsen                 | Oslo/NIH               | 33,1       | 2021.09.22 |
    | IL Koll                       | 2083        | 27    | 100     | Leo Aas                          | Nittedal               | 15,84      | 2021.10.30 |
    | IL Koll                       | 2084        | 19    | Høyde   | Benjamin Køber                   | Nittedal               | 1,25       | 2021.10.30 |
    | IL Korlevoll-Odda             | 2085        | 594   | 3000    | Øystein Halldorsson              | Husnes                 | 9,26,4     | 2021.09.08 |
    | IL Molde-Olymp                | 2086        | 653   | 100     | Mathias Sjåholm                  | Molde                  | 11,80      | 2021.06.20 |
    | IL Molde-Olymp                | 2087        | 645   | Slegge  | Amund Vaagen                     | Molde                  | 42,13      | 2021.06.20 |
    | IL Molde-Olymp                | 2088        | 626   | 200     | Mathias Sjåholm                  | Lillehammer            | 24,22      | 2021.09.26 |
    | IL Molde-Olymp                | 2089        | 565   | 3000    | Simen Olsen                      | Molde                  | 9,35,15    | 2021.06.20 |
    | IL Molde-Olymp                | 2090        | 452   | 100     | Oliver Eidet                     | Molde                  | 12,82      | 2021.06.20 |
    | IL Molde-Olymp                | 2091        | 412   | 200     | Arn Bredeli                      | Ulsteinvik             | 26,87      | 2021.10.28 |
    | IL Molde-Olymp                | 2092        | 232   | 200     | Martin Ødegård                   | Molde                  | 29,76      | 2021.06.20 |
    | IL Molde-Olymp                | 2093        | 196   | 200     | Leon Horneland                   | Molde                  | 30,41      | 2021.06.20 |
    | IL Molde-Olymp                | 2094        | 116   | 200     | Eirik Lillås                     | Molde                  | 31,95      | 2021.06.20 |
    | IL Nidelv                     | 2095        | 579   | 800     | Nicolai Ulvan                    | Trondheim              | 2,06,24    | 2021.09.28 |
    | IL Nidelv                     | 2096        | 573   | 400     | Nicolai Ulvan                    | Lillehammer            | 54,83      | 2021.09.26 |
    | IL Nidelv                     | 2097        | 168   | 3000    | Bård Roll                        | Stjørdal               | 12,22,4    | 2021.10.23 |
    | IL Nidelv                     | 2098        | 112   | 1500    | Bård Roll                        | Stjørdal               | 5,55,0     | 2021.10.23 |
    | IL Nidelv                     | 2099        | 39    | 200     | Eilif Mjøsund                    | Trondheim              | 33,55      | 2021.09.28 |
    | IL Nordlys                    | 2100        | 265   | 3000    | Ravn-Mathias Gulsrud             | Vadsø                  | 11,31,4    | 2021.09.05 |
    | IL Nordlys                    | 2101        | 262   | 3000    | Mihkkal Javo                     | Vadsø                  | 11,32,6    | 2021.09.05 |
    | IL Nordlys                    | 2102        | 239   | 800     | Mihkkal Javo                     | Vadsø                  | 2,36,0     | 2021.09.05 |
    | IL Nordlys                    | 2103        | 212   | 800     | Ravn-Mathias Gulsrud             | Vadsø                  | 2,39,0     | 2021.09.05 |
    | IL Nordlys                    | 2104        | 87    | 400     | Ravn-Mathias Gulsrud             | Vadsø                  | 1,13,9     | 2021.09.05 |
    | IL Norodd                     | 2105        | 566   | 5000    | Fredrik Bru                      | Tingvoll               | 16,42,20   | 2021.09.18 |
    | IL Norodd                     | 2106        | 546   | 5000    | Per Myren                        | Tingvoll               | 16,53,10   | 2021.09.18 |
    | IL Norodd                     | 2107        | 500   | 100     | Axel Frei                        | Molde                  | 12,56      | 2021.06.20 |
    | IL Norodd                     | 2108        | 456   | 100     | Tor Lien                         | Molde                  | 12,80      | 2021.06.20 |
    | IL Norodd                     | 2109        | 441   | 200     | Tor Lien                         | Molde                  | 26,45      | 2021.06.20 |
    | IL Norodd                     | 2110        | 432   | 5000    | Einar Engvig                     | Tingvoll               | 18,03,35   | 2021.09.18 |
    | IL Norodd                     | 2111        | 410   | 200     | Axel Frei                        | Molde                  | 26,90      | 2021.06.20 |
    | IL Norodd                     | 2112        | 403   | Lengde  | Tor Lien                         | Tingvoll               | 5,13       | 2021.09.18 |
    | IL Norodd                     | 2113        | 369   | Kule    | Lucjan Kwit                      | Førde                  | 8,95       | 2021.08.22 |
    | IL Norodd                     | 2114        | 341   | 5000    | Ole Myren                        | Tingvoll               | 19,07,55   | 2021.09.18 |
    | IL Norodd                     | 2115        | 305   | Lengde  | Andreas Jensen                   | Tingvoll               | 4,73       | 2021.09.18 |
    | IL Norodd                     | 2116        | 294   | 100     | Andreas Jensen                   | Tingvoll               | 13,78      | 2021.09.18 |
    | IL Norodd                     | 2117        | 257   | 3000    | Ole Ulseth                       | Tingvoll               | 11,35,10   | 2021.09.18 |
    | IL Norodd                     | 2118        | 153   | Lengde  | Theo Knudsen                     | Tingvoll               | 4,13       | 2021.09.18 |
    | IL Norodd                     | 2119        | 83    | 800     | Tor Lien                         | Tingvoll               | 2,54,15    | 2021.09.18 |
    | IL Norodd                     | 2120        | 82    | 3000    | Bernt Solvik                     | Tingvoll               | 13,17,15   | 2021.09.18 |
    | IL Nybrott                    | 2121        | 681   | 3000    | Ole Prigge                       | Trondheim              | 9,01,92    | 2021.09.28 |
    | IL Nybrott                    | 2122        | 667   | 1500    | Ole Prigge                       | Stjørdal               | 4,10,52    | 2021.10.23 |
    | IL Nybrott                    | 2123        | 656   | 5000    | Ole Prigge                       | Ravnanger              | 15,54,70   | 2021.09.15 |
    | IL Nybrott                    | 2124        | 581   | 800     | Ole Prigge                       | Trondheim              | 2,06,07    | 2021.09.28 |
    | IL Nybrott                    | 2125        | 379   | 1500    | Mohamed Ali                      | Steinkjer              | 4,54,83    | 2021.09.30 |
    | IL Nybrott                    | 2126        | 279   | 1500    | Vebjørn Prigge                   | Stjørdal               | 5,14,8     | 2021.10.23 |
    | IL Nybrott                    | 2127        | 241   | 200     | Noah Espejord                    | Stjørdal               | 29,59      | 2021.10.23 |
    | IL Nybrott                    | 2128        | 202   | 800     | Liam Berdahl                     | Stadsbygd              | 2,40,1     | 2021.05.09 |
    | IL Nybrott                    | 2129        | 191   | 100     | Noah Espejord                    | Stjørdal               | 14,50      | 2021.10.23 |
    | IL Nybrott                    | 2130        | 176   | 200     | Liam Berdahl                     | Trondheim              | 30,78      | 2021.09.28 |
    | IL Nybrott                    | 2131        | 165   | Stav    | Hampus Tronvoll                  | Måndalen               | 1,92       | 2021.09.12 |
    | IL Nybrott                    | 2132        | 159   | 800     | Vebjørn Prigge                   | Stadsbygd              | 2,45,0     | 2021.05.09 |
    | IL Nybrott                    | 2133        | 149   | 1500    | Petter Reiten                    | Stjørdal               | 5,45,2     | 2021.10.23 |
    | IL Nybrott                    | 2134        | 112   | 200     | Vebjørn Prigge                   | Trondheim              | 32,03      | 2021.09.28 |
    | IL Nybrott                    | 2135        | 66    | 100     | Liam Berdahl                     | Stjørdal               | 15,50      | 2021.10.23 |
    | IL Nybrott                    | 2136        | 56    | 200     | Thomas Lund                      | Trondheim              | 33,19      | 2021.09.28 |
    | IL Nybrott                    | 2137        | 19    | Høyde   | Olivier Krzystek                 | Steinkjer              | 1,25       | 2021.09.30 |
    | IL Pioner                     | 2138        | 740   | Stav    | Bjørn Berger                     | Finnsnes               | 4,10       | 2021.07.11 |
    | IL Pioner                     | 2139        | 730   | Stav    | Ivar Løwø                        | Stjørdal               | 4,05       | 2021.10.23 |
    | IL Pioner                     | 2140        | 386   | 200     | Eurico Bergum                    | Finnsnes               | 27,24      | 2021.07.11 |
    | IL Pioner                     | 2141        | 367   | Hut     | Bjørn Berger                     | Finnsnes               | 1,25       | 2021.07.11 |
    | IL Pioner                     | 2142        | 316   | 200h    | Eurico Bergum                    | Måndalen               | 33,66      | 2021.09.12 |
    | IL Pioner                     | 2143        | 220   | Lut     | Bjørn Berger                     | Finnsnes               | 2,34       | 2021.07.11 |
    | IL Pioner                     | 2144        | 215   | Lengde  | Eurico Bergum                    | Tromsø                 | 4,37       | 2021.09.15 |
    | IL Pioner                     | 2145        | 165   | Stav    | Eurico Bergum                    | Måndalen               | 1,92       | 2021.09.12 |
    | IL Pioner                     | 2146        | 127   | 200     | Ludvik Pedersen                  | Harstad                | 31,73      | 2021.09.25 |
    | IL Pioner                     | 2147        | 96    | Høyde   | Ludvik Pedersen                  | Harstad                | 1,30       | 2021.09.25 |
    | IL Pioner                     | 2148        | 80    | Lut     | Eurico Bergum                    | Finnsnes               | 2,20       | 2021.07.11 |
    | IL Runar                      | 2149        | 985   | 5000    | Simen Haugen                     | Oslo/Bi                | 13,37,74   | 2021.09.25 |
    | IL Runar                      | 2150        | 969   | 3000    | Simen Haugen                     | Fana                   | 7,57,18    | 2021.09.28 |
    | IL Runar                      | 2151        | 948   | 5000    | Abdullahi Rabi                   | Greveskogen            | 13,49,88   | 2021.10.30 |
    | IL Runar                      | 2152        | 923   | 1500    | Simen Haugen                     | Oslo/Bi                | 3,44,92    | 2021.09.25 |
    | IL Runar                      | 2153        | 810   | 800     | Simen Haugen                     | Oslo/Bi                | 1,54,27    | 2021.09.25 |
    | IL Runar                      | 2154        | 760   | 5000    | Oskar Vike                       | Greveskogen            | 15,05,53   | 2021.10.30 |
    | IL Runar                      | 2155        | 533   | 800     | Sebastian Skjelbred              | Greveskogen            | 2,09,34    | 2021.10.30 |
    | IL Runar                      | 2156        | 485   | 1500    | Andreas Tveite                   | Greveskogen            | 4,36,29    | 2021.10.30 |
    | IL Runar                      | 2157        | 461   | 1500    | Per Haugen                       | Larvik                 | 4,40,32    | 2021.09.15 |
    | IL Runar                      | 2158        | 456   | 800     | Andreas Tveite                   | Larvik                 | 2,15,24    | 2021.09.15 |
    | IL Runar                      | 2159        | 441   | 1500    | Magnus Liljedal                  | Greveskogen            | 4,43,66    | 2021.10.30 |
    | IL Runar                      | 2160        | 440   | 1500    | Sebastian Skjelbred              | Larvik                 | 4,43,81    | 2021.09.15 |
    | IL Runar                      | 2161        | 419   | 800     | Magnus Liljedal                  | Larvik                 | 2,18,32    | 2021.09.15 |
    | IL Runar                      | 2162        | 394   | 200     | Sebastian Skjelbred              | Greveskogen            | 27,13      | 2021.10.30 |
    | IL Runar                      | 2163        | 382   | 1500    | Lars Abrahamsen                  | Greveskogen            | 4,54,31    | 2021.10.30 |
    | IL Runar                      | 2164        | 355   | 800     | Lars Abrahamsen                  | Greveskogen            | 2,24,16    | 2021.10.30 |
    | IL Runar                      | 2165        | 353   | 800     | Per Haugen                       | Greveskogen            | 2,24,36    | 2021.10.30 |
    | IL Runar                      | 2166        | 186   | 200     | Per Haugen                       | Greveskogen            | 30,59      | 2021.10.30 |
    | IL Runar                      | 2167        | 180   | Lut     | Einar Trollerud                  | Hvam                   | 2,30       | 2021.10.23 |
    | IL Sand                       | 2168        | 268   | 200     | Jostein Hølland                  | Haugesund              | 29,13      | 2021.09.12 |
    | IL Sandvin                    | 2169        | 750   | 100     | Alexander Tomala                 | Jessheim               | 11,37      | 2021.09.09 |
    | IL Sandvin                    | 2170        | 738   | 200     | Alexander Tomala                 | Nadderud               | 23,10      | 2021.10.16 |
    | IL Sandvin                    | 2171        | 727   | 100     | Martin Jensen                    | Sande                  | 11,47      | 2021.10.07 |
    | IL Sandvin                    | 2172        | 723   | Kule    | Fredrik Simensen                 | Sande                  | 13,84      | 2021.10.07 |
    | IL Sandvin                    | 2173        | 718   | 200     | Martin Jensen                    | Sande                  | 23,29      | 2021.10.07 |
    | IL Sandvin                    | 2174        | 700   | Stav    | Simen Teigstad                   | Hamar                  | 3,90       | 2021.08.22 |
    | IL Sandvin                    | 2175        | 685   | 400h    | Martin Jensen                    | Sande                  | 57,74      | 2021.10.07 |
    | IL Sandvin                    | 2176        | 662   | Diskos  | Fredrik Simensen                 | Sande                  | 38,80      | 2021.10.07 |
    | IL Sandvin                    | 2177        | 626   | 400     | Simen Teigstad                   | Hamar                  | 53,44      | 2021.08.22 |
    | IL Sandvin                    | 2178        | 617   | Slegge  | Oliver Engen                     | Geithus                | 40,20      | 2021.08.25 |
    | IL Sandvin                    | 2179        | 616   | Diskos  | Oliver Engen                     | Geithus                | 36,41      | 2021.08.25 |
    | IL Sandvin                    | 2180        | 613   | Lengde  | Simen Teigstad                   | Larvik                 | 6,03       | 2021.09.15 |
    | IL Sandvin                    | 2181        | 607   | Høyde   | Simen Teigstad                   | Jessheim               | 1,75       | 2021.09.09 |
    | IL Sandvin                    | 2182        | 596   | Kule    | Oliver Engen                     | Geithus                | 11,99      | 2021.08.25 |
    | IL Sandvin                    | 2183        | 592   | 100     | Sander Lindseth                  | Sande                  | 12,09      | 2021.10.07 |
    | IL Sandvin                    | 2184        | 580   | 200     | Simen Teigstad                   | Sande                  | 24,72      | 2021.10.07 |
    | IL Sandvin                    | 2185        | 577   | Lut     | Fredrik Simensen                 | Sande                  | 2,83       | 2021.10.07 |
    | IL Sandvin                    | 2186        | 568   | 100     | Oliver Tomala                    | Sande                  | 12,21      | 2021.10.07 |
    | IL Sandvin                    | 2187        | 566   | 200     | Oliver Tomala                    | Rjukan                 | 24,88      | 2021.09.12 |
    | IL Sandvin                    | 2188        | 560   | 100     | Simen Teigstad                   | Hamar                  | 12,25      | 2021.08.22 |
    | IL Sandvin                    | 2189        | 560   | Høyde   | Oliver Engen                     | Geithus                | 1,70       | 2021.08.25 |
    | IL Sandvin                    | 2190        | 555   | Tresteg | Simen Teigstad                   | Sande                  | 11,96      | 2021.10.07 |
    | IL Sandvin                    | 2191        | 550   | 200     | Sander Lindseth                  | Trondheim              | 25,07      | 2021.09.28 |
    | IL Sandvin                    | 2192        | 538   | Lut     | Alexander Tomala                 | Sande                  | 2,76       | 2021.10.07 |
    | IL Sandvin                    | 2193        | 519   | Spyd    | Fredrik Simensen                 | Sande                  | 42,24      | 2021.10.07 |
    | IL Sandvin                    | 2194        | 500   | Stav    | Tobias Thorbjørnsen              | Moss                   | 3,00       | 2021.10.09 |
    | IL Sandvin                    | 2195        | 478   | Lut     | Simen Teigstad                   | Sande                  | 2,66       | 2021.10.07 |
    | IL Sandvin                    | 2196        | 460   | Lut     | Sander Lindseth                  | Sande                  | 2,63       | 2021.10.07 |
    | IL Sandvin                    | 2197        | 446   | Lengde  | Sander Lindseth                  | Sande                  | 5,31       | 2021.10.07 |
    | IL Sandvin                    | 2198        | 408   | Høyde   | Tobias Thorbjørnsen              | Jessheim               | 1,55       | 2021.09.09 |
    | IL Sandvin                    | 2199        | 408   | Lengde  | Tobias Thorbjørnsen              | Sande                  | 5,15       | 2021.10.07 |
    | IL Sandvin                    | 2200        | 404   | Tresteg | Tobias Thorbjørnsen              | Sande                  | 10,63      | 2021.10.07 |
    | IL Sandvin                    | 2201        | 398   | Lut     | Igor Skoczylas                   | Sande                  | 2,54       | 2021.10.07 |
    | IL Sandvin                    | 2202        | 393   | 200     | Tobias Thorbjørnsen              | Sande                  | 27,14      | 2021.10.07 |
    | IL Sandvin                    | 2203        | 393   | Lengde  | Oliver Tomala                    | Sande                  | 5,09       | 2021.10.07 |
    | IL Sandvin                    | 2204        | 374   | 1500    | Simen Teigstad                   | Hamar                  | 4,55,78    | 2021.08.22 |
    | IL Sandvin                    | 2205        | 364   | 800     | Tobias Thorbjørnsen              | Sande                  | 2,23,3     | 2021.10.07 |
    | IL Sandvin                    | 2206        | 358   | 200     | Siver Ebbestad                   | Nadderud               | 27,67      | 2021.10.16 |
    | IL Sandvin                    | 2207        | 354   | 400     | Tobias Thorbjørnsen              | Jessheim               | 1,02,12    | 2021.09.09 |
    | IL Sandvin                    | 2208        | 353   | 200     | Lucas Bricot                     | Rjukan                 | 27,74      | 2021.09.12 |
    | IL Sandvin                    | 2209        | 353   | Høyde   | Christoffer Rønning              | Jessheim               | 1,50       | 2021.09.09 |
    | IL Sandvin                    | 2210        | 350   | 200     | Christoffer Rønning              | Lillestrøm             | 27,78      | 2021.08.29 |
    | IL Sandvin                    | 2211        | 348   | 100     | Tobias Thorbjørnsen              | Sande                  | 13,43      | 2021.10.07 |
    | IL Sandvin                    | 2212        | 303   | Slegge  | Ingolf Thorbjørnsen              | Sande                  | 21,43      | 2021.10.07 |
    | IL Sandvin                    | 2213        | 300   | 100     | Christoffer Rønning              | Nittedal               | 13,74      | 2021.10.30 |
    | IL Sandvin                    | 2214        | 298   | Lut     | Tobias Thorbjørnsen              | Sande                  | 2,42       | 2021.10.07 |
    | IL Sandvin                    | 2215        | 298   | Kule    | Ingolf Thorbjørnsen              | Sande                  | 8,06       | 2021.10.07 |
    | IL Sandvin                    | 2216        | 295   | Høyde   | Sander Lindseth                  | Sande                  | 1,45       | 2021.10.07 |
    | IL Sandvin                    | 2217        | 277   | 100     | Siver Ebbestad                   | Sande                  | 13,89      | 2021.10.07 |
    | IL Sandvin                    | 2218        | 276   | Stav    | Siver Ebbestad                   | Rjukan                 | 2,23       | 2021.09.12 |
    | IL Sandvin                    | 2219        | 247   | 100     | Arsenii Perebyinis               | Sande                  | 14,10      | 2021.10.07 |
    | IL Sandvin                    | 2220        | 239   | Spyd    | Ingolf Thorbjørnsen              | Sande                  | 24,87      | 2021.10.07 |
    | IL Sandvin                    | 2221        | 228   | Diskos  | Ingolf Thorbjørnsen              | Sande                  | 20,48      | 2021.10.07 |
    | IL Sandvin                    | 2222        | 210   | Lut     | Siver Ebbestad                   | Sande                  | 2,33       | 2021.10.07 |
    | IL Sandvin                    | 2223        | 209   | 200     | Haakon Johansen                  | Sande                  | 30,18      | 2021.10.07 |
    | IL Sandvin                    | 2224        | 188   | 200     | Hans Sundve                      | Sande                  | 30,56      | 2021.10.07 |
    | IL Sandvin                    | 2225        | 169   | 200     | Jonas Jensen                     | Sande                  | 30,92      | 2021.10.07 |
    | IL Sandvin                    | 2226        | 162   | 200     | Fredrik Blikom                   | Sande                  | 31,06      | 2021.10.07 |
    | IL Sandvin                    | 2227        | 130   | Lut     | Ingolf Thorbjørnsen              | Sande                  | 2,25       | 2021.10.07 |
    | IL Sandvin                    | 2228        | 106   | 100     | Ingolf Thorbjørnsen              | Sande                  | 15,17      | 2021.10.07 |
    | IL Sandvin                    | 2229        | 96    | Høyde   | Siver Ebbestad                   | Moss                   | 1,30       | 2021.10.09 |
    | IL Sandvin                    | 2230        | 72    | Stav    | Hans Sundve                      | Sande                  | 1,70       | 2021.10.07 |
    | IL Sandvin                    | 2231        | 70    | Lut     | Lucas Bricot                     | Sande                  | 2,19       | 2021.10.07 |
    | IL Sandvin                    | 2232        | 35    | 100     | Jonas Jensen                     | Sande                  | 15,77      | 2021.10.07 |
    | IL Sandvin                    | 2233        | 19    | Høyde   | Hans Sundve                      | Sande                  | 1,25       | 2021.10.07 |
    | IL Sandvin                    | 2234        | 1     | 200     | Anna Storevold-Sola              | Sande                  | 34,37      | 2021.10.07 |
    | IL Stein                      | 2235        | 206   | 200     | Kristian Kvamme                  | Måndalen               | 30,23      | 2021.09.12 |
    | IL Stein                      | 2236        | 111   | Høyde   | Kristian Kvamme                  | Måndalen               | 1,31       | 2021.09.12 |
    | IL Stjørdals-Blink            | 2237        | 167   | Høyde   | Oliver Meldal                    | Stjørdal               | 1,35       | 2021.10.23 |
    | IL Trio                       | 2238        | 322   | 5000    | Kenneth Blom                     | Husnes                 | 19,22,7    | 2021.09.08 |
    | IL Trio                       | 2239        | 319   | 3000    | Kenneth Blom                     | Husnes                 | 11,06,6    | 2021.09.08 |
    | IL Trio                       | 2240        | 246   | Høyde   | Ådne Opsanger-Tveit              | Leikvang               | 1,41       | 2021.08.29 |
    | IL Trio                       | 2241        | 238   | Slegge  | Arne Torget                      | Husnes                 | 18,45      | 2021.09.08 |
    | IL Trio                       | 2242        | 232   | Diskos  | Arne Torget                      | Husnes                 | 20,62      | 2021.09.08 |
    | IL Trio                       | 2243        | 231   | 5000    | Tor Bringedal                    | Husnes                 | 20,40,0    | 2021.09.08 |
    | IL Trio                       | 2244        | 202   | 3000    | Tor Bringedal                    | Husnes                 | 12,03,5    | 2021.09.08 |
    | IL Trio                       | 2245        | 188   | 5000    | Gunnar Vaage                     | Husnes                 | 21,21,3    | 2021.09.08 |
    | IL Trio                       | 2246        | 175   | 200     | Andrei Bringedal                 | Os                     | 30,80      | 2021.09.26 |
    | IL Trio                       | 2247        | 150   | 3000    | Gunnar Vaage                     | Husnes                 | 12,33,2    | 2021.09.08 |
    | IL Trio                       | 2248        | 105   | 200     | Ådne Opsanger-Tveit              | Os                     | 32,18      | 2021.09.26 |
    | IL Trio                       | 2249        | 80    | 800     | Sander Jensen                    | Husnes                 | 2,54,5     | 2021.09.08 |
    | IL Trio                       | 2250        | 47    | 800     | Andrei Bringedal                 | Husnes                 | 2,58,6     | 2021.09.08 |
    | IL Trio                       | 2251        | 3     | 1500    | Sander Jensen                    | Husnes                 | 6,27,5     | 2021.09.08 |
    | IL Tyrving                    | 2252        | 947   | Spyd    | Sondre Høyland                   | Kristiansand           | 73,14      | 2021.10.06 |
    | IL Tyrving                    | 2253        | 921   | 100     | Even Pettersen                   | Oslo/Bi                | 10,70      | 2021.09.25 |
    | IL Tyrving                    | 2254        | 904   | 100     | Patrick Bifuko                   | Jessheim               | 10,76      | 2021.09.09 |
    | IL Tyrving                    | 2255        | 845   | 200     | Even Pettersen                   | Oslo/Bi                | 22,13      | 2021.09.25 |
    | IL Tyrving                    | 2256        | 829   | 100     | Einar Rye                        | Jessheim               | 11,05      | 2021.09.09 |
    | IL Tyrving                    | 2257        | 826   | 200     | Patrick Bifuko                   | Lillehammer            | 22,30      | 2021.09.26 |
    | IL Tyrving                    | 2258        | 825   | 200     | Peter Svoren                     | Lillehammer            | 22,31      | 2021.09.26 |
    | IL Tyrving                    | 2259        | 804   | 100     | Tobias Windjusveen               | Lillehammer            | 11,15      | 2021.09.26 |
    | IL Tyrving                    | 2260        | 794   | 200     | Sigurd Clementsen                | Oslo/St                | 22,58      | 2021.10.16 |
    | IL Tyrving                    | 2261        | 792   | 200     | Kristian Drabløs                 | Jessheim               | 22,60      | 2021.09.09 |
    | IL Tyrving                    | 2262        | 784   | 100     | Christian Wright                 | Trondheim              | 11,23      | 2021.09.28 |
    | IL Tyrving                    | 2263        | 782   | Hut     | Sondre Høyland                   | Bærum                  | 1,60       | 2021.10.25 |
    | IL Tyrving                    | 2264        | 778   | 200     | Einar Rye                        | Ravnanger              | 22,73      | 2021.09.15 |
    | IL Tyrving                    | 2265        | 767   | 100     | Kristian Drabløs                 | Jessheim               | 11,30      | 2021.09.09 |
    | IL Tyrving                    | 2266        | 755   | 200     | Christian Wright                 | Oslo/St                | 22,94      | 2021.10.16 |
    | IL Tyrving                    | 2267        | 750   | 10000   | Karl Fremstad                    | Arna                   | 31,48,34   | 2021.10.13 |
    | IL Tyrving                    | 2268        | 748   | 3000    | Halvard Fladby                   | Trondheim              | 8,45,08    | 2021.09.28 |
    | IL Tyrving                    | 2269        | 748   | 400     | Jonatan Bjerkaas                 | Nadderud               | 50,71      | 2021.10.16 |
    | IL Tyrving                    | 2270        | 746   | 1500    | Halvard Fladby                   | Oslo/Bi                | 4,01,45    | 2021.09.25 |
    | IL Tyrving                    | 2271        | 746   | 100     | Peter Svoren                     | Oslo/Bi                | 11,39      | 2021.09.25 |
    | IL Tyrving                    | 2272        | 745   | 400h    | Sigurd Clementsen                | Nadderud               | 55,86      | 2021.10.16 |
    | IL Tyrving                    | 2273        | 743   | 100     | Sigurd Clementsen                | Trondheim              | 11,40      | 2021.09.28 |
    | IL Tyrving                    | 2274        | 742   | Lengde  | Sigmund Fjeld                    | Trondheim              | 6,61       | 2021.09.28 |
    | IL Tyrving                    | 2275        | 733   | Tresteg | Sigmund Fjeld                    | Trondheim              | 13,60      | 2021.09.28 |
    | IL Tyrving                    | 2276        | 732   | 100     | Theo Halvorsen                   | Oslo/St                | 11,45      | 2021.10.16 |
    | IL Tyrving                    | 2277        | 731   | 800     | Halvard Fladby                   | Nittedal               | 1,57,84    | 2021.10.30 |
    | IL Tyrving                    | 2278        | 726   | 200     | Theo Halvorsen                   | Oslo/St                | 23,22      | 2021.10.16 |
    | IL Tyrving                    | 2279        | 715   | 100     | Jonathan Hertwig-Ødegaard        | Ravnanger              | 11,52      | 2021.09.15 |
    | IL Tyrving                    | 2280        | 711   | 3000    | Brage Hammerstad                 | Trondheim              | 8,54,12    | 2021.09.28 |
    | IL Tyrving                    | 2281        | 711   | Lut     | Sondre Høyland                   | Bærum                  | 3,07       | 2021.10.25 |
    | IL Tyrving                    | 2282        | 709   | 100     | Sigmund Fjeld                    | Lillehammer            | 11,55      | 2021.09.26 |
    | IL Tyrving                    | 2283        | 706   | 200     | Jonathan Hertwig-Ødegaard        | Trondheim              | 23,41      | 2021.09.28 |
    | IL Tyrving                    | 2284        | 702   | 200     | Kim Kamanzi                      | Lillestrøm             | 23,45      | 2021.08.29 |
    | IL Tyrving                    | 2285        | 702   | 100     | Kim Kamanzi                      | Jessheim               | 11,58      | 2021.09.09 |
    | IL Tyrving                    | 2286        | 700   | 200     | Sigmund Fjeld                    | Ravnanger              | 23,47      | 2021.09.15 |
    | IL Tyrving                    | 2287        | 699   | Tresteg | Simen Gimnes                     | Moss                   | 13,28      | 2021.10.09 |
    | IL Tyrving                    | 2288        | 698   | Lengde  | Simen Gimnes                     | Nadderud               | 6,41       | 2021.10.16 |
    | IL Tyrving                    | 2289        | 695   | 3000    | Trond Gjønnes                    | Nadderud               | 8,58,20    | 2021.10.16 |
    | IL Tyrving                    | 2290        | 695   | 100     | Hampus Åstrand                   | Ravnanger              | 11,61      | 2021.09.15 |
    | IL Tyrving                    | 2291        | 692   | Kule    | Sondre Høyland                   | Kristiansand           | 13,37      | 2021.10.06 |
    | IL Tyrving                    | 2292        | 685   | Lengde  | Jonathan Hertwig-Ødegaard        | Ravnanger              | 6,35       | 2021.09.15 |
    | IL Tyrving                    | 2293        | 681   | 200     | Hampus Åstrand                   | Oslo/Bi                | 23,66      | 2021.09.25 |
    | IL Tyrving                    | 2294        | 679   | 5000    | Trond Gjønnes                    | Oslo/Bi                | 15,43,44   | 2021.09.25 |
    | IL Tyrving                    | 2295        | 679   | Stav    | Jonathan Hertwig-Ødegaard        | Trondheim              | 3,80       | 2021.09.28 |
    | IL Tyrving                    | 2296        | 678   | Høyde   | Torgrim Frøystein                | Nadderud               | 1,83       | 2021.10.16 |
    | IL Tyrving                    | 2297        | 672   | 400     | Sigurd Clementsen                | Lillehammer            | 52,35      | 2021.09.26 |
    | IL Tyrving                    | 2298        | 670   | Høyde   | Simen Gimnes                     | Heggedal               | 1,82       | 2021.09.26 |
    | IL Tyrving                    | 2299        | 669   | 1500    | Brage Hammerstad                 | Oslo/Bi                | 4,10,30    | 2021.09.25 |
    | IL Tyrving                    | 2300        | 669   | 1500    | Trond Gjønnes                    | Nadderud               | 4,10,29    | 2021.10.16 |
    | IL Tyrving                    | 2301        | 657   | 100     | Sondre Vik                       | Trondheim              | 11,78      | 2021.09.28 |
    | IL Tyrving                    | 2302        | 657   | 800     | Marcus Svarva                    | Trondheim              | 2,01,56    | 2021.09.28 |
    | IL Tyrving                    | 2303        | 656   | 200     | Lasse Alm                        | Nadderud               | 23,91      | 2021.10.16 |
    | IL Tyrving                    | 2304        | 655   | Lut     | Sigmund Fjeld                    | Bærum                  | 2,97       | 2021.10.25 |
    | IL Tyrving                    | 2305        | 638   | 400     | Jonathan Hertwig-Ødegaard        | Hamar                  | 53,16      | 2021.08.22 |
    | IL Tyrving                    | 2306        | 626   | 5000    | Jon Fiva                         | Oslo/Bi                | 16,10,10   | 2021.09.25 |
    | IL Tyrving                    | 2307        | 622   | Lut     | Markus Fjeld                     | Bærum                  | 2,91       | 2021.10.25 |
    | IL Tyrving                    | 2308        | 613   | 200     | Markus Fjeld                     | Oslo/St                | 24,36      | 2021.10.16 |
    | IL Tyrving                    | 2309        | 608   | 400     | Halvard Fladby                   | Nadderud               | 53,88      | 2021.10.16 |
    | IL Tyrving                    | 2310        | 600   | 100     | Markus Fjeld                     | Nadderud               | 12,05      | 2021.10.16 |
    | IL Tyrving                    | 2311        | 600   | 400     | Marcus Svarva                    | Oslo/Bi                | 54,10      | 2021.09.25 |
    | IL Tyrving                    | 2312        | 598   | 100     | Simen Gimnes                     | Nadderud               | 12,06      | 2021.10.16 |
    | IL Tyrving                    | 2313        | 596   | 800     | Brage Hammerstad                 | Trondheim              | 2,05,13    | 2021.09.28 |
    | IL Tyrving                    | 2314        | 596   | 3000    | Christer Gjerald                 | Lillehammer            | 9,25,68    | 2021.09.26 |
    | IL Tyrving                    | 2315        | 584   | 800     | Lewis Kjemhus                    | Nadderud               | 2,05,89    | 2021.10.16 |
    | IL Tyrving                    | 2316        | 567   | Lengde  | Markus Fjeld                     | Nadderud               | 5,83       | 2021.10.16 |
    | IL Tyrving                    | 2317        | 566   | Lut     | Morten Haave                     | Bærum                  | 2,81       | 2021.10.25 |
    | IL Tyrving                    | 2318        | 566   | Tresteg | Markus Fjeld                     | Oslo/St                | 12,06      | 2021.10.16 |
    | IL Tyrving                    | 2319        | 548   | 3000    | Sebastian Selbekk                | Nadderud               | 9,40,41    | 2021.10.16 |
    | IL Tyrving                    | 2320        | 543   | 1500    | Andreas Lerø                     | Oslo/Bi                | 4,27,26    | 2021.09.25 |
    | IL Tyrving                    | 2321        | 540   | Lengde  | Sondre Vik                       | Nadderud               | 5,71       | 2021.10.16 |
    | IL Tyrving                    | 2322        | 533   | Spyd    | Sondre Thorvik                   | Ski                    | 43,26      | 2021.09.25 |
    | IL Tyrving                    | 2323        | 522   | 800     | Sigurd Clementsen                | Nadderud               | 2,10,15    | 2021.10.16 |
    | IL Tyrving                    | 2324        | 514   | 1500    | Eirik Alvik                      | Nadderud               | 4,31,79    | 2021.10.16 |
    | IL Tyrving                    | 2325        | 509   | Diskos  | Sondre Høyland                   | Nadderud               | 31,34      | 2021.10.16 |
    | IL Tyrving                    | 2326        | 507   | Spyd    | Jørgen Loennechen                | Oslo/Bi                | 41,39      | 2021.09.25 |
    | IL Tyrving                    | 2327        | 504   | 3000    | Eirik Alvik                      | Oslo/St                | 9,55,18    | 2021.10.16 |
    | IL Tyrving                    | 2328        | 497   | 800     | Lukas Hollund                    | Oslo/St                | 2,11,95    | 2021.10.16 |
    | IL Tyrving                    | 2329        | 479   | Slegge  | Sondre Høyland                   | Nadderud               | 31,16      | 2021.10.16 |
    | IL Tyrving                    | 2330        | 474   | 800     | Eirik Alvik                      | Nadderud               | 2,13,77    | 2021.10.16 |
    | IL Tyrving                    | 2331        | 471   | 200     | Lukas Hollund                    | Oslo/St                | 26,06      | 2021.10.16 |
    | IL Tyrving                    | 2332        | 469   | 3000    | Magnus Lindhjem-Godal            | Oslo/St                | 10,07,17   | 2021.10.16 |
    | IL Tyrving                    | 2333        | 456   | 1500    | Lukas Hollund                    | Oslo/Bi                | 4,41,05    | 2021.09.25 |
    | IL Tyrving                    | 2334        | 423   | 400     | Lukas Hollund                    | Nadderud               | 59,55      | 2021.10.16 |
    | IL Tyrving                    | 2335        | 422   | 3000    | Akos Nagy                        | Nadderud               | 10,24,45   | 2021.10.16 |
    | IL Tyrving                    | 2336        | 422   | 200     | Geir Kaasen                      | Førde                  | 26,72      | 2021.08.22 |
    | IL Tyrving                    | 2337        | 419   | Høyde   | Jonathan Hertwig-Ødegaard        | Hamar                  | 1,56       | 2021.08.22 |
    | IL Tyrving                    | 2338        | 416   | 800     | Benjamin Bævre-Jensen            | Nadderud               | 2,18,65    | 2021.10.16 |
    | IL Tyrving                    | 2339        | 412   | 200     | Benjamin Bævre-Jensen            | Nadderud               | 26,86      | 2021.10.16 |
    | IL Tyrving                    | 2340        | 401   | 1500    | Magnus Lindhjem-Godal            | Oslo/Bi                | 4,50,73    | 2021.09.25 |
    | IL Tyrving                    | 2341        | 399   | 800     | Akos Nagy                        | Nadderud               | 2,20,10    | 2021.10.16 |
    | IL Tyrving                    | 2342        | 393   | 100     | Geir Kaasen                      | Raufoss                | 13,16      | 2021.06.20 |
    | IL Tyrving                    | 2343        | 393   | 100     | Jørgen Loennechen                | Oslo/St                | 13,16      | 2021.10.16 |
    | IL Tyrving                    | 2344        | 390   | 100     | Benjamin Bævre-Jensen            | Nadderud               | 13,18      | 2021.10.16 |
    | IL Tyrving                    | 2345        | 378   | 1500    | Jonathan Hertwig-Ødegaard        | Hamar                  | 4,55,00    | 2021.08.22 |
    | IL Tyrving                    | 2346        | 375   | Lut     | Christian Lervik                 | Bærum                  | 2,51       | 2021.10.25 |
    | IL Tyrving                    | 2347        | 351   | 1500    | Akos Nagy                        | Nadderud               | 5,00,0     | 2021.10.16 |
    | IL Tyrving                    | 2348        | 339   | 1500    | August Paus                      | Nadderud               | 5,02,5     | 2021.10.16 |
    | IL Tyrving                    | 2349        | 326   | 100     | Herman Ådland                    | Oslo/St                | 13,57      | 2021.10.16 |
    | IL Tyrving                    | 2350        | 300   | 400     | Geir Kaasen                      | Førde                  | 1,04,29    | 2021.08.22 |
    | IL Tyrving                    | 2351        | 299   | 800     | Håvard Lian                      | Nadderud               | 2,29,60    | 2021.10.16 |
    | IL Tyrving                    | 2352        | 292   | 200     | Herman Ådland                    | Oslo/St                | 28,73      | 2021.10.16 |
    | IL Tyrving                    | 2353        | 291   | 1500    | Thomas Helland                   | Nadderud               | 5,12,14    | 2021.10.16 |
    | IL Tyrving                    | 2354        | 275   | 3000    | Bjørn Hegna-Nilssen              | Nadderud               | 11,26,41   | 2021.10.16 |
    | IL Tyrving                    | 2355        | 238   | 1500    | Elias Olsen                      | Nadderud               | 5,23,77    | 2021.10.16 |
    | IL Tyrving                    | 2356        | 233   | Høyde   | Thomas Næss                      | Nadderud               | 1,40       | 2021.10.16 |
    | IL Tyrving                    | 2357        | 225   | 1500    | Håvard Lian                      | Nadderud               | 5,26,8     | 2021.10.16 |
    | IL Tyrving                    | 2358        | 168   | 200     | Anders Halvorsen                 | Nadderud               | 30,93      | 2021.10.16 |
    | IL Tyrving                    | 2359        | 163   | 200     | Gabriel Jensen                   | Nadderud               | 31,03      | 2021.10.16 |
    | IL Tyrving                    | 2360        | 159   | 200     | Pilo Thiis-Messel                | Nadderud               | 31,11      | 2021.10.16 |
    | IL Tyrving                    | 2361        | 154   | 800     | Thomas Helland                   | Nittedal               | 2,45,56    | 2021.10.30 |
    | IL Tyrving                    | 2362        | 146   | 1500    | Ulrik Holstrøm                   | Nadderud               | 5,45,99    | 2021.10.16 |
    | IL Tyrving                    | 2363        | 138   | 1500    | Anders Halvorsen                 | Nadderud               | 5,47,99    | 2021.10.16 |
    | IL Tyrving                    | 2364        | 94    | 1500    | Adrian Tjørnhom                  | Nadderud               | 5,59,86    | 2021.10.16 |
    | IL Tyrving                    | 2365        | 79    | 200     | Mathias Gunstad                  | Nadderud               | 32,71      | 2021.10.16 |
    | IL Tyrving                    | 2366        | 61    | 200     | Jørgen Skilbrei                  | Nadderud               | 33,08      | 2021.10.16 |
    | IL Tyrving                    | 2367        | 59    | 200     | Theodor Lundamo                  | Nadderud               | 33,13      | 2021.10.16 |
    | IL Tyrving                    | 2368        | 57    | 200     | Markus Bjørtomt                  | Nadderud               | 33,16      | 2021.10.16 |
    | IL Tyrving                    | 2369        | 53    | 1500    | Thomas Svendsen                  | Nadderud               | 6,11,92    | 2021.10.16 |
    | IL Tyrving                    | 2370        | 15    | 1500    | William Jensen                   | Nadderud               | 6,23,81    | 2021.10.16 |
    | IL Tyrving                    | 2371        | 7     | 200     | Edvard Asplund                   | Nadderud               | 34,24      | 2021.10.16 |
    | IL Tyrving                    | 2372        | 5     | 200     | Iver Fykerud                     | Nadderud               | 34,28      | 2021.10.16 |
    | IL i BUL                      | 2373        | 992   | 800     | Markus Einan                     | Oslo/Bi                | 1,47,34    | 2021.09.25 |
    | IL i BUL                      | 2374        | 924   | 100     | Per Fremstad-Waldron             | Kristiansand           | 10,69      | 2021.10.06 |
    | IL i BUL                      | 2375        | 911   | 5000    | Simon Steinshamn                 | Greveskogen            | 14,03,42   | 2021.10.30 |
    | IL i BUL                      | 2376        | 904   | 100     | Edem Agbo                        | Lillehammer            | 10,76      | 2021.09.26 |
    | IL i BUL                      | 2377        | 902   | 1500    | Simon Steinshamn                 | Oslo/Bi                | 3,46,66    | 2021.09.25 |
    | IL i BUL                      | 2378        | 897   | 3000    | Simon Steinshamn                 | Jessheim               | 8,12,02    | 2021.09.09 |
    | IL i BUL                      | 2379        | 889   | 800     | Leon Mjaaland                    | Greveskogen            | 1,51,06    | 2021.10.30 |
    | IL i BUL                      | 2380        | 880   | 10000   | Simon Steinshamn                 | Kristiansand           | 29,47,93   | 2021.10.06 |
    | IL i BUL                      | 2381        | 841   | 3000    | Filip Meo                        | Jessheim               | 8,23,84    | 2021.09.09 |
    | IL i BUL                      | 2382        | 841   | 800     | Snorre Bonesmo                   | Kristiansand           | 1,52,95    | 2021.10.06 |
    | IL i BUL                      | 2383        | 831   | 400     | Leon Mjaaland                    | Oslo/Bi                | 49,11      | 2021.09.25 |
    | IL i BUL                      | 2384        | 826   | 100     | Sander Nilsen                    | Jessheim               | 11,06      | 2021.09.09 |
    | IL i BUL                      | 2385        | 826   | 100     | Jonathan Holen                   | Jessheim               | 11,06      | 2021.09.09 |
    | IL i BUL                      | 2386        | 822   | 200     | Stephan Kyeremeh                 | Oslo/Bi                | 22,33      | 2021.09.25 |
    | IL i BUL                      | 2387        | 822   | 5000    | Filip Meo                        | Kristiansand           | 14,38,67   | 2021.10.06 |
    | IL i BUL                      | 2388        | 816   | 100     | Stephan Kyeremeh                 | Oslo/St                | 11,10      | 2021.10.16 |
    | IL i BUL                      | 2389        | 808   | 10000   | Weldu Gebretsadik                | Kristiansand           | 30,52,36   | 2021.10.06 |
    | IL i BUL                      | 2390        | 806   | 10000   | Filip Meo                        | Kristiansand           | 30,54,21   | 2021.10.06 |
    | IL i BUL                      | 2391        | 804   | 5000    | Roderick Duodu                   | Oslo/Bi                | 14,45,91   | 2021.09.25 |
    | IL i BUL                      | 2392        | 794   | 3000    | Roderick Duodu                   | Nadderud               | 8,34,28    | 2021.10.16 |
    | IL i BUL                      | 2393        | 794   | 200     | Philip Omollo                    | Ravnanger              | 22,58      | 2021.09.15 |
    | IL i BUL                      | 2394        | 792   | 200     | Anders Bovolden                  | Ravnanger              | 22,60      | 2021.09.15 |
    | IL i BUL                      | 2395        | 786   | 800     | Martin Mæle                      | Trondheim              | 1,55,30    | 2021.09.28 |
    | IL i BUL                      | 2396        | 784   | 400     | Snorre Bonesmo                   | Oslo/Bi                | 50,00      | 2021.09.25 |
    | IL i BUL                      | 2397        | 782   | 100     | Philip Omollo                    | Oslo/Bi                | 11,24      | 2021.09.25 |
    | IL i BUL                      | 2398        | 782   | 100     | Riquelvys Santiago               | Oslo/Bi                | 11,24      | 2021.09.25 |
    | IL i BUL                      | 2399        | 776   | 10000   | Karl Russnes                     | Oslo/Bi                | 31,22,49   | 2021.09.25 |
    | IL i BUL                      | 2400        | 775   | 200     | Mads Hjort-Larsen                | Trondheim              | 22,76      | 2021.09.28 |
    | IL i BUL                      | 2401        | 774   | 5000    | Karl Russnes                     | Kristiansand           | 14,59,31   | 2021.10.06 |
    | IL i BUL                      | 2402        | 770   | 100     | Anders Bovolden                  | Lillehammer            | 11,29      | 2021.09.26 |
    | IL i BUL                      | 2403        | 765   | 200     | Leon Mjaaland                    | Oslo/Bi                | 22,85      | 2021.09.25 |
    | IL i BUL                      | 2404        | 761   | 200     | Theodore Fremstad-Waldron        | Oslo/St                | 22,88      | 2021.10.16 |
    | IL i BUL                      | 2405        | 761   | 3000    | Endre Wigaard                    | Jessheim               | 8,41,91    | 2021.09.09 |
    | IL i BUL                      | 2406        | 760   | Lut     | Edem Agbo                        | Lillehammer            | 3,16       | 2021.09.26 |
    | IL i BUL                      | 2407        | 757   | 10000   | Endre Wigaard                    | Oslo/Bi                | 31,41,29   | 2021.09.25 |
    | IL i BUL                      | 2408        | 757   | 1500    | Martin Mæle                      | Trondheim              | 4,00,37    | 2021.09.28 |
    | IL i BUL                      | 2409        | 755   | 3000    | Karl Russnes                     | Oslo/Bi                | 8,43,34    | 2021.09.25 |
    | IL i BUL                      | 2410        | 741   | 200     | Sander Nilsen                    | Oslo/St                | 23,07      | 2021.10.16 |
    | IL i BUL                      | 2411        | 741   | 100     | Theodore Fremstad-Waldron        | Ravnanger              | 11,41      | 2021.09.15 |
    | IL i BUL                      | 2412        | 739   | 100     | Thomas Graftås                   | Lillehammer            | 11,42      | 2021.09.26 |
    | IL i BUL                      | 2413        | 737   | 5000    | Endre Wigaard                    | Kristiansand           | 15,15,96   | 2021.10.06 |
    | IL i BUL                      | 2414        | 737   | 200     | Thomas Graftås                   | Asker                  | 23,11      | 2021.09.26 |
    | IL i BUL                      | 2415        | 735   | Spyd    | Ruben Martinsen                  | Bækkelaget             | 58,20      | 2021.10.04 |
    | IL i BUL                      | 2416        | 735   | 200     | Sean Bloom                       | Lillehammer            | 23,13      | 2021.09.26 |
    | IL i BUL                      | 2417        | 727   | 200     | Riquelvys Santiago               | Oslo/Bi                | 23,21      | 2021.09.25 |
    | IL i BUL                      | 2418        | 725   | 400     | Mads Hjort-Larsen                | Oslo/Bi                | 51,21      | 2021.09.25 |
    | IL i BUL                      | 2419        | 723   | 10000   | Michael Tesfamichael             | Jessheim               | 32,15,99   | 2021.09.09 |
    | IL i BUL                      | 2420        | 716   | 800     | Roderick Duodu                   | Nadderud               | 1,58,58    | 2021.10.16 |
    | IL i BUL                      | 2421        | 711   | 100     | Sean Bloom                       | Oslo/Bi                | 11,54      | 2021.09.25 |
    | IL i BUL                      | 2422        | 704   | 100     | Simon Stornes                    | Oslo/Bi                | 11,57      | 2021.09.25 |
    | IL i BUL                      | 2423        | 702   | 1500    | Svein Tønnesen                   | Oslo/Bi                | 4,06,36    | 2021.09.25 |
    | IL i BUL                      | 2424        | 697   | 1500    | Filip Meo                        | Oslo/Bi                | 4,06,88    | 2021.09.25 |
    | IL i BUL                      | 2425        | 693   | 800     | Simen Seeberg-Rommetveit         | Oslo/Bi                | 1,59,70    | 2021.09.25 |
    | IL i BUL                      | 2426        | 691   | Spyd    | Dag Wergeland                    | Ski                    | 54,85      | 2021.09.25 |
    | IL i BUL                      | 2427        | 689   | 1500    | Christian Olsen                  | Málaga/ESP             | 4,07,84    | 2021.05.23 |
    | IL i BUL                      | 2428        | 688   | 100     | Felix Christensen                | Asker                  | 11,64      | 2021.09.26 |
    | IL i BUL                      | 2429        | 687   | 200     | Bereket Wayu                     | Asker                  | 23,60      | 2021.09.26 |
    | IL i BUL                      | 2430        | 687   | 200     | Simon Stornes                    | Trondheim              | 23,60      | 2021.09.28 |
    | IL i BUL                      | 2431        | 684   | 100     | Rune Liholt                      | Oslo/Bi                | 11,66      | 2021.09.25 |
    | IL i BUL                      | 2432        | 684   | 400     | Sean Bloom                       | Oslo/Bi                | 52,08      | 2021.09.25 |
    | IL i BUL                      | 2433        | 684   | 1500    | Endre Wigaard                    | Jessheim               | 4,08,51    | 2021.09.09 |
    | IL i BUL                      | 2434        | 679   | 200     | Nicolas Eriksen                  | Oslo/St                | 23,68      | 2021.10.16 |
    | IL i BUL                      | 2435        | 675   | 1500    | Adrian Olsen                     | Oslo/Bi                | 4,09,52    | 2021.09.25 |
    | IL i BUL                      | 2436        | 673   | 800     | Christian Olsen                  | Jessheim               | 2,00,75    | 2021.09.09 |
    | IL i BUL                      | 2437        | 669   | 3000    | Adrian Olsen                     | Trondheim              | 9,05,15    | 2021.09.28 |
    | IL i BUL                      | 2438        | 662   | 800     | Adrian Olsen                     | Trondheim              | 2,01,31    | 2021.09.28 |
    | IL i BUL                      | 2439        | 662   | 1500    | Samuel Hafsahl                   | Oslo/Bi                | 4,11,17    | 2021.09.25 |
    | IL i BUL                      | 2440        | 659   | 200     | Rune Liholt                      | Oslo/Bi                | 23,88      | 2021.09.25 |
    | IL i BUL                      | 2441        | 651   | 100     | Nicolas Eriksen                  | Oslo/St                | 11,81      | 2021.10.16 |
    | IL i BUL                      | 2442        | 651   | 100     | Bereket Wayu                     | Nittedal               | 11,81      | 2021.10.30 |
    | IL i BUL                      | 2443        | 642   | 100     | Mads Hjort-Larsen                | Nittedal               | 11,85      | 2021.10.30 |
    | IL i BUL                      | 2444        | 639   | Tresteg | Sander Nilsen                    | Oslo/St                | 12,72      | 2021.10.16 |
    | IL i BUL                      | 2445        | 637   | 800     | Mads Hjort-Larsen                | Oslo/St                | 2,02,68    | 2021.10.16 |
    | IL i BUL                      | 2446        | 634   | 100     | David-Thierry Dramstad           | Trondheim              | 11,89      | 2021.09.28 |
    | IL i BUL                      | 2447        | 628   | 1500    | Simen Seeberg-Rommetveit         | Jessheim               | 4,15,45    | 2021.09.09 |
    | IL i BUL                      | 2448        | 627   | Lengde  | Sander Nilsen                    | Nadderud               | 6,09       | 2021.10.16 |
    | IL i BUL                      | 2449        | 626   | 800     | Sean Bloom                       | Oslo/Bi                | 2,03,32    | 2021.09.25 |
    | IL i BUL                      | 2450        | 622   | 200     | Akshathan Nadarajah              | Oslo/St                | 24,27      | 2021.10.16 |
    | IL i BUL                      | 2451        | 621   | 3000    | Christian Hannestad              | Lillehammer            | 9,18,58    | 2021.09.26 |
    | IL i BUL                      | 2452        | 610   | 100     | Benjamin Owusu                   | Oslo/St                | 12,00      | 2021.10.16 |
    | IL i BUL                      | 2453        | 608   | 5000    | Adrian Olsen                     | Oslo/Bi                | 16,19,06   | 2021.09.25 |
    | IL i BUL                      | 2454        | 608   | 200     | Benjamin Owusu                   | Oslo/St                | 24,41      | 2021.10.16 |
    | IL i BUL                      | 2455        | 602   | 100     | Birk Staven                      | Nesodden               | 12,04      | 2021.09.14 |
    | IL i BUL                      | 2456        | 600   | 100     | Trygve Ilseng                    | Oslo/Bi                | 12,05      | 2021.09.25 |
    | IL i BUL                      | 2457        | 600   | 100     | Akshathan Nadarajah              | Oslo/St                | 12,05      | 2021.10.16 |
    | IL i BUL                      | 2458        | 582   | 400     | Simon Stornes                    | Oslo/St                | 54,59      | 2021.10.16 |
    | IL i BUL                      | 2459        | 580   | 200     | Jørgen Gran                      | Oslo/St                | 24,73      | 2021.10.16 |
    | IL i BUL                      | 2460        | 579   | Lengde  | Thai Drager                      | Oslo/St                | 5,88       | 2021.10.16 |
    | IL i BUL                      | 2461        | 573   | 400     | Sondre Martinsen                 | Nesodden               | 54,82      | 2021.09.14 |
    | IL i BUL                      | 2462        | 569   | Tresteg | Thai Drager                      | Nadderud               | 12,08      | 2021.10.16 |
    | IL i BUL                      | 2463        | 561   | 400     | Bård Knudsen                     | Førde                  | 55,14      | 2021.08.22 |
    | IL i BUL                      | 2464        | 558   | 200     | Birk Staven                      | Nesodden               | 24,97      | 2021.09.14 |
    | IL i BUL                      | 2465        | 558   | 100     | Thai Drager                      | Oslo/Bi                | 12,26      | 2021.09.25 |
    | IL i BUL                      | 2466        | 556   | 100     | Jørgen Gran                      | Trondheim              | 12,27      | 2021.09.28 |
    | IL i BUL                      | 2467        | 556   | 200     | Bård Knudsen                     | Førde                  | 25,00      | 2021.08.22 |
    | IL i BUL                      | 2468        | 540   | Lengde  | Jørgen Gran                      | Trondheim              | 5,71       | 2021.09.28 |
    | IL i BUL                      | 2469        | 538   | 100     | Ariand Shegani                   | Oslo/Bi                | 12,36      | 2021.09.25 |
    | IL i BUL                      | 2470        | 537   | 400     | Benjamin Owusu                   | Oslo/St                | 55,84      | 2021.10.16 |
    | IL i BUL                      | 2471        | 536   | 400     | Nicolas Eriksen                  | Nadderud               | 55,86      | 2021.10.16 |
    | IL i BUL                      | 2472        | 533   | 800     | Nils Christensen                 | Fredrikstad            | 2,09,39    | 2021.09.29 |
    | IL i BUL                      | 2473        | 529   | 400     | Birk Staven                      | Nesodden               | 56,07      | 2021.09.14 |
    | IL i BUL                      | 2474        | 528   | 200     | Tobias Gulbrandsen               | Oslo/St                | 25,33      | 2021.10.16 |
    | IL i BUL                      | 2475        | 528   | 800     | Adrian Sevaldstad                | Trondheim              | 2,09,70    | 2021.09.28 |
    | IL i BUL                      | 2476        | 525   | 1500    | Alexander Skjeldal               | Nittedal               | 4,30,03    | 2021.10.30 |
    | IL i BUL                      | 2477        | 525   | 100     | Magnus Kringstad                 | Oslo/Bi                | 12,43      | 2021.09.25 |
    | IL i BUL                      | 2478        | 520   | 400     | Adrian Sevaldstad                | Oslo/Bi                | 56,35      | 2021.09.25 |
    | IL i BUL                      | 2479        | 516   | Lengde  | Felix Naue                       | Oslo/St                | 5,61       | 2021.10.16 |
    | IL i BUL                      | 2480        | 511   | Høyde   | Sander Nilsen                    | Nadderud               | 1,65       | 2021.10.16 |
    | IL i BUL                      | 2481        | 498   | 200     | Adrian Sevaldstad                | Oslo/St                | 25,70      | 2021.10.16 |
    | IL i BUL                      | 2482        | 497   | 200     | David-Thierry Dramstad           | Trondheim              | 25,71      | 2021.09.28 |
    | IL i BUL                      | 2483        | 495   | 800     | Alexander Skjeldal               | Oslo/St                | 2,12,16    | 2021.10.16 |
    | IL i BUL                      | 2484        | 484   | 200     | Sondre Martinsen                 | Nesodden               | 25,88      | 2021.09.14 |
    | IL i BUL                      | 2485        | 477   | 200     | Herman Røe                       | Oslo/St                | 25,98      | 2021.10.16 |
    | IL i BUL                      | 2486        | 464   | 200     | Asle Offerdal                    | Førde                  | 26,14      | 2021.08.22 |
    | IL i BUL                      | 2487        | 462   | 400h    | Akshathan Nadarajah              | Oslo/St                | 1,07,57    | 2021.10.16 |
    | IL i BUL                      | 2488        | 461   | 200     | Magnus Kringstad                 | Jessheim               | 26,18      | 2021.09.09 |
    | IL i BUL                      | 2489        | 456   | 100     | Owain Jones                      | Nadderud               | 12,80      | 2021.10.16 |
    | IL i BUL                      | 2490        | 451   | Lengde  | Benjamin Owusu                   | Oslo/St                | 5,33       | 2021.10.16 |
    | IL i BUL                      | 2491        | 450   | 400     | Felix Naue                       | Nesodden               | 58,60      | 2021.09.14 |
    | IL i BUL                      | 2492        | 449   | 200     | Felix Naue                       | Nesodden               | 26,35      | 2021.09.14 |
    | IL i BUL                      | 2493        | 448   | 100     | Felix Naue                       | Nesodden               | 12,84      | 2021.09.14 |
    | IL i BUL                      | 2494        | 447   | 800     | Akshathan Nadarajah              | Oslo/St                | 2,15,98    | 2021.10.16 |
    | IL i BUL                      | 2495        | 439   | 200     | Owain Jones                      | Oslo/St                | 26,48      | 2021.10.16 |
    | IL i BUL                      | 2496        | 413   | 400     | Asle Offerdal                    | Førde                  | 59,91      | 2021.08.22 |
    | IL i BUL                      | 2497        | 408   | Høyde   | Henrik Johannessen               | Oslo/St                | 1,55       | 2021.10.16 |
    | IL i BUL                      | 2498        | 388   | 100     | Kasper Engvik                    | Oslo/St                | 13,19      | 2021.10.16 |
    | IL i BUL                      | 2499        | 349   | 200     | Kasper Engvik                    | Oslo/St                | 27,80      | 2021.10.16 |
    | IL i BUL                      | 2500        | 321   | Spyd    | Sondre Martinsen                 | Nesodden               | 29,44      | 2021.09.14 |
    | IL i BUL                      | 2501        | 295   | Høyde   | Felix Naue                       | Nesodden               | 1,45       | 2021.09.14 |
    | IL i BUL                      | 2502        | 275   | 200     | Henrik Johannessen               | Oslo/St                | 29,01      | 2021.10.16 |
    | IL i BUL                      | 2503        | 275   | 1500    | Benjamin Sem-Jacobsen            | Oslo/St                | 5,15,63    | 2021.10.16 |
    | IL i BUL                      | 2504        | 238   | Spyd    | Owain Jones                      | Nesodden               | 24,80      | 2021.09.14 |
    | IL i BUL                      | 2505        | 228   | 1500    | Felix Naue                       | Nesodden               | 5,25,95    | 2021.09.14 |
    | IL i BUL                      | 2506        | 186   | 200     | Elias Hardersen                  | Nesodden               | 30,59      | 2021.09.14 |
    | IL i BUL                      | 2507        | 176   | 200     | Fredrik Evensmo                  | Oslo/St                | 30,79      | 2021.10.16 |
    | IL i BUL                      | 2508        | 155   | 1500    | Fredrik Evensmo                  | Oslo/St                | 5,43,64    | 2021.10.16 |
    | IL i BUL                      | 2509        | 152   | 1500    | Trygve Bjærke                    | Oslo/St                | 5,44,29    | 2021.10.16 |
    | IL i BUL                      | 2510        | 124   | 200     | Ola Jarning                      | Oslo/St                | 31,79      | 2021.10.16 |
    | IL i BUL                      | 2511        | 83    | 200     | Leo Røren                        | Oslo/St                | 32,63      | 2021.10.16 |
    | IL i BUL                      | 2512        | 73    | 200     | Jørgen Engebretsen               | Oslo/St                | 32,84      | 2021.10.16 |
    | IL i BUL                      | 2513        | 19    | Høyde   | Marcus Hoen                      | Nadderud               | 1,25       | 2021.10.16 |
    | IL i BUL Tromsø               | 2514        | 806   | 3000H   | Jesper Lundin                    | Kristiansand           | 9,15,56    | 2021.10.06 |
    | IL i BUL Tromsø               | 2515        | 794   | 3000    | Jesper Lundin                    | Nadderud               | 8,34,24    | 2021.10.16 |
    | IL i BUL Tromsø               | 2516        | 787   | 5000    | Jesper Lundin                    | Oslo/Bi                | 14,53,54   | 2021.09.25 |
    | IL i BUL Tromsø               | 2517        | 748   | 5000    | Bendik Blix                      | Ravnanger              | 15,10,51   | 2021.09.15 |
    | IL i BUL Tromsø               | 2518        | 742   | 3000    | Aleksander Simonsen              | Trondheim              | 8,46,55    | 2021.09.28 |
    | IL i BUL Tromsø               | 2519        | 721   | 800     | Jesper Lundin                    | Steinkjer              | 1.58,32    | 2021.09.30 |
    | IL i BUL Tromsø               | 2520        | 717   | 800     | Aleksander Simonsen              | Steinkjer              | 1.58,52    | 2021.09.30 |
    | IL i BUL Tromsø               | 2521        | 713   | 1500    | Aleksander Simonsen              | Steinkjer              | 4.05,18    | 2021.09.30 |
    | IL i BUL Tromsø               | 2522        | 690   | 5000    | Aleksander Simonsen              | Trondheim              | 15,38,11   | 2021.09.28 |
    | IL i BUL Tromsø               | 2523        | 685   | 1500    | Sindre Moland                    | Harstad                | 4,08,31    | 2021.09.25 |
    | IL i BUL Tromsø               | 2524        | 682   | 800     | Sindre Moland                    | Harstad                | 2,00,28    | 2021.09.25 |
    | IL i BUL Tromsø               | 2525        | 656   | Spyd    | Fredrik Haraldstad               | Harstad                | 52,22      | 2021.09.25 |
    | IL i BUL Tromsø               | 2526        | 646   | 5000    | Sindre Moland                    | Tromsø                 | 15,59,74   | 2021.09.15 |
    | IL i BUL Tromsø               | 2527        | 634   | 3000    | Sindre Moland                    | Tromsø                 | 9,14,83    | 2021.09.15 |
    | IL i BUL Tromsø               | 2528        | 630   | 3000    | Håvard Bernhardsen               | Trondheim              | 9,15,80    | 2021.09.28 |
    | IL i BUL Tromsø               | 2529        | 628   | 1500    | Bendik Blix                      | Ravnanger              | 4,15,47    | 2021.09.15 |
    | IL i BUL Tromsø               | 2530        | 627   | 3000H   | Sindre Moland                    | Ravnanger              | 10,10,71   | 2021.09.15 |
    | IL i BUL Tromsø               | 2531        | 571   | 3000    | Fredrik Sandberg                 | Tromsø                 | 9,33,45    | 2021.09.15 |
    | IL i BUL Tromsø               | 2532        | 560   | Høyde   | Fredrik Haraldstad               | Harstad                | 1,70       | 2021.09.25 |
    | IL i BUL Tromsø               | 2533        | 542   | Tresteg | Fredrik Haraldstad               | Harstad                | 11,84      | 2021.09.25 |
    | IL i BUL Tromsø               | 2534        | 532   | 3000    | William Lundberg                 | Tromsø                 | 9,45,85    | 2021.09.15 |
    | IL i BUL Tromsø               | 2535        | 521   | 3000    | Vetle Skildheim                  | Tromsø                 | 9,49,30    | 2021.09.15 |
    | IL i BUL Tromsø               | 2536        | 511   | Høyde   | Johannes Elvegård                | Narvik                 | 1,65       | 2021.06.13 |
    | IL i BUL Tromsø               | 2537        | 486   | 3000    | Kristian Vatne                   | Tromsø                 | 10,01,40   | 2021.09.15 |
    | IL i BUL Tromsø               | 2538        | 460   | 3000    | Audun Simonsen                   | Tromsø                 | 10,10,56   | 2021.09.15 |
    | IL i BUL Tromsø               | 2539        | 459   | 200     | Adrian Eriksen                   | Finnsnes               | 26,21      | 2021.07.11 |
    | IL i BUL Tromsø               | 2540        | 455   | 3000    | Jonas Pedersen                   | Finnsnes               | 10,12,17   | 2021.07.11 |
    | IL i BUL Tromsø               | 2541        | 441   | 3000    | Daniel Uglehus                   | Tromsø                 | 10,17,27   | 2021.09.15 |
    | IL i BUL Tromsø               | 2542        | 422   | 200     | Magnus Elvegård                  | Måndalen               | 26,73      | 2021.09.12 |
    | IL i BUL Tromsø               | 2543        | 419   | 3000    | Carl Fensbekk                    | Tromsø                 | 10,25,74   | 2021.09.15 |
    | IL i BUL Tromsø               | 2544        | 416   | 3000    | Sivert Gerhardsen                | Tromsø                 | 10,26,70   | 2021.09.15 |
    | IL i BUL Tromsø               | 2545        | 400   | 800     | Jonas Pedersen                   | Finnsnes               | 2,19,97    | 2021.07.11 |
    | IL i BUL Tromsø               | 2546        | 400   | 200     | Johannes Elvegård                | Harstad                | 27,03      | 2021.09.25 |
    | IL i BUL Tromsø               | 2547        | 397   | 3000    | Henning Strand                   | Tromsø                 | 10,33,75   | 2021.09.15 |
    | IL i BUL Tromsø               | 2548        | 393   | Lengde  | Adrian Eriksen                   | Måndalen               | 5,09       | 2021.09.12 |
    | IL i BUL Tromsø               | 2549        | 391   | 1500    | Jonas Pedersen                   | Vik                    | 4,52,56    | 2021.10.02 |
    | IL i BUL Tromsø               | 2550        | 390   | 400     | Johannes Elvegård                | Sortland               | 1,00,72    | 2021.08.22 |
    | IL i BUL Tromsø               | 2551        | 388   | Tresteg | Adrian Eriksen                   | Tromsø                 | 10,49      | 2021.09.15 |
    | IL i BUL Tromsø               | 2552        | 387   | 800     | Erik Bertheussen                 | Coulsdon/GBR           | 2,21,2     | 2021.07.10 |
    | IL i BUL Tromsø               | 2553        | 381   | Lengde  | Georg Woll                       | Tromsø                 | 5,04       | 2021.09.15 |
    | IL i BUL Tromsø               | 2554        | 380   | Slegge  | Stig Fremnesvik                  | Lenangen               | 25,41      | 2021.10.09 |
    | IL i BUL Tromsø               | 2555        | 375   | Kule    | Stig Fremnesvik                  | Lenangen               | 9,02       | 2021.10.09 |
    | IL i BUL Tromsø               | 2556        | 364   | Høyde   | Magnus Elvegård                  | Måndalen               | 1,51       | 2021.09.12 |
    | IL i BUL Tromsø               | 2557        | 364   | Høyde   | Adrian Eriksen                   | Måndalen               | 1,51       | 2021.09.12 |
    | IL i BUL Tromsø               | 2558        | 364   | 200     | Magnus Olsen                     | Nadderud               | 27,57      | 2021.10.16 |
    | IL i BUL Tromsø               | 2559        | 357   | 3000    | Ola Huglen                       | Tromsø                 | 10,50,11   | 2021.09.15 |
    | IL i BUL Tromsø               | 2560        | 347   | 3000    | Håkon Romsaas                    | Tromsø                 | 10,54,26   | 2021.09.15 |
    | IL i BUL Tromsø               | 2561        | 345   | 100     | Eirik Uhre                       | Tromsø                 | 13,45      | 2021.09.15 |
    | IL i BUL Tromsø               | 2562        | 328   | 1500    | Erik Bertheussen                 | Carshalton/GBR         | 5,04,6     | 2021.08.15 |
    | IL i BUL Tromsø               | 2563        | 318   | 100     | Georg Woll                       | Tromsø                 | 13,62      | 2021.09.15 |
    | IL i BUL Tromsø               | 2564        | 314   | 200     | Trym Bugge-Olsen                 | Måndalen               | 28,37      | 2021.09.12 |
    | IL i BUL Tromsø               | 2565        | 307   | Spyd    | Stig Fremnesvik                  | Lenangen               | 28,67      | 2021.10.09 |
    | IL i BUL Tromsø               | 2566        | 281   | 3000    | Brage Skille                     | Tromsø                 | 11,23,70   | 2021.09.15 |
    | IL i BUL Tromsø               | 2567        | 272   | 400     | Eirik Uhre                       | Tromsø                 | 1,05,50    | 2021.09.15 |
    | IL i BUL Tromsø               | 2568        | 258   | Høyde   | Magnus Olsen                     | Tromsø                 | 1,42       | 2021.09.15 |
    | IL i BUL Tromsø               | 2569        | 216   | 3000    | Hans Brox                        | Tromsø                 | 11,56,24   | 2021.09.15 |
    | IL i BUL Tromsø               | 2570        | 213   | 3000    | Viljar Sønvisen-Valnes           | Tromsø                 | 11,57,43   | 2021.09.15 |
    | IL i BUL Tromsø               | 2571        | 201   | Diskos  | Stig Fremnesvik                  | Lenangen               | 19,55      | 2021.10.09 |
    | IL i BUL Tromsø               | 2572        | 188   | 3000    | Philip Korneliussen-Eriksen      | Tromsø                 | 12,10,98   | 2021.09.15 |
    | IL i BUL Tromsø               | 2573        | 163   | 3000    | Jacob Øverås                     | Tromsø                 | 12,25,53   | 2021.09.15 |
    | IL i BUL Tromsø               | 2574        | 109   | 3000    | Jan Trondsen                     | Tromsø                 | 12,58,78   | 2021.09.15 |
    | IL i BUL Tromsø               | 2575        | 96    | Høyde   | Isak Lysnes                      | Harstad                | 1,30       | 2021.09.25 |
    | IL i BUL Tromsø               | 2576        | 92    | 1500    | Magnus Olsen                     | Tromsø                 | 6,00,54    | 2021.09.15 |
    | IL i BUL Tromsø               | 2577        | 90    | 3000    | Trym Bugge-Olsen                 | Tromsø                 | 13,11,45   | 2021.09.15 |
    | IL i BUL Tromsø               | 2578        | 70    | 1500    | Leonard Hausner                  | Tromsø                 | 6,06,80    | 2021.09.15 |
    | IL i BUL Tromsø               | 2579        | 70    | 200     | Isak Lysnes                      | Harstad                | 32,89      | 2021.09.25 |
    | IL i BUL Tromsø               | 2580        | 60    | 200     | Jonas Aarsæther                  | Tromsø                 | 33,11      | 2021.09.15 |
    | IL i BUL Tromsø               | 2581        | 9     | 1500    | Olav Moe                         | Tromsø                 | 6,25,63    | 2021.09.15 |
    | Idrettsforeningen Ørn         | 2582        | 561   | Hut     | Espen Bergstrøm                  | Hvam                   | 1,40       | 2021.10.23 |
    | Idrettsforeningen Ørn         | 2583        | 453   | Lut     | Espen Bergstrøm                  | Hvam                   | 2,62       | 2021.10.23 |
    | Idrettslaget Fram             | 2584        | 18    | 1500    | Martin Brønn                     | Stjørdal               | 6,22,6     | 2021.10.23 |
    | Idrettslaget Ilar             | 2585        | 122   | 200     | Juhan Aasprong                   | Alta                   | 31,84      | 2021.08.22 |
    | Idrettslaget Skjalg           | 2586        | 1028  | 200     | Mathias Johansen                 | Jessheim               | 20,68      | 2021.09.09 |
    | Idrettslaget Skjalg           | 2587        | 1009  | 100     | Mathias Johansen                 | Kuortane/FIN           | 10,39      | 2021.06.26 |
    | Idrettslaget Skjalg           | 2588        | 926   | 100     | Simen Larsen                     | Jessheim               | 10,68      | 2021.09.09 |
    | Idrettslaget Skjalg           | 2589        | 888   | 200     | Simen Larsen                     | Sandnes                | 21,77      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2590        | 869   | 3000    | Erik Gundersen                   | Fana                   | 8,17,93    | 2021.09.28 |
    | Idrettslaget Skjalg           | 2591        | 867   | 10000   | Erik Gundersen                   | Kristiansand           | 29,58,79   | 2021.10.06 |
    | Idrettslaget Skjalg           | 2592        | 836   | 400h    | Oscar Harestad                   | Kristiansand           | 53,46      | 2021.10.06 |
    | Idrettslaget Skjalg           | 2593        | 828   | 400     | Mike Lubsen                      | Stavanger              | 49,15      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2594        | 826   | 100     | Mike Lubsen                      | Oslo/Bi                | 11,06      | 2021.09.25 |
    | Idrettslaget Skjalg           | 2595        | 825   | 5000    | Erik Gundersen                   | Greveskogen            | 14,37,28   | 2021.10.30 |
    | Idrettslaget Skjalg           | 2596        | 822   | 200     | Mike Lubsen                      | Oslo/Bi                | 22,33      | 2021.09.25 |
    | Idrettslaget Skjalg           | 2597        | 811   | 400     | Oscar Harestad                   | Fana                   | 49,48      | 2021.09.28 |
    | Idrettslaget Skjalg           | 2598        | 803   | 200     | Oscar Harestad                   | Stavanger              | 22,50      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2599        | 798   | 1500    | Erik Gundersen                   | Oslo/Bi                | 3,56,20    | 2021.09.25 |
    | Idrettslaget Skjalg           | 2600        | 792   | 3000    | Vetle Farbu-Solbakken            | Nadderud               | 8,34,75    | 2021.10.16 |
    | Idrettslaget Skjalg           | 2601        | 791   | 3000    | Johannes Dalland                 | Nadderud               | 8,34,89    | 2021.10.16 |
    | Idrettslaget Skjalg           | 2602        | 779   | 100     | Oscar Harestad                   | Ravnanger              | 11,25      | 2021.09.15 |
    | Idrettslaget Skjalg           | 2603        | 772   | 100     | Sergejs Kononovs                 | Sandnes                | 11,28      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2604        | 761   | Slegge  | Daniel Korhonen                  | Stavanger              | 50,69      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2605        | 753   | 1500    | Johannes Dalland                 | Oslo/Bi                | 4,00,72    | 2021.09.25 |
    | Idrettslaget Skjalg           | 2606        | 750   | Lut     | Mathias Johansen                 | Moelv                  | 3,14       | 2021.02.14 |
    | Idrettslaget Skjalg           | 2607        | 748   | 1500    | Sebastian Veen                   | Oslo/Bi                | 4,01,25    | 2021.09.25 |
    | Idrettslaget Skjalg           | 2608        | 746   | 800     | Salim Bukari                     | Stavanger              | 1,57,12    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2609        | 731   | 200     | Sergejs Kononovs                 | Sandnes                | 23,17      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2610        | 730   | 400     | Daniel Pedersen                  | Sandnes                | 51,10      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2611        | 729   | 800     | Johannes Dalland                 | Trondheim              | 1,57,93    | 2021.09.28 |
    | Idrettslaget Skjalg           | 2612        | 725   | 200     | Daniel Pedersen                  | Sandnes                | 23,23      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2613        | 722   | 3000    | Sebastian Veen                   | Trondheim              | 8,51,46    | 2021.09.28 |
    | Idrettslaget Skjalg           | 2614        | 712   | Diskos  | Daniel Korhonen                  | Stavanger              | 41,48      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2615        | 706   | 5000    | Sebastian Veen                   | Ravnanger              | 15,30,47   | 2021.09.15 |
    | Idrettslaget Skjalg           | 2616        | 700   | 1500    | Vetle Farbu-Solbakken            | Oslo/Bi                | 4,06,59    | 2021.09.25 |
    | Idrettslaget Skjalg           | 2617        | 690   | 1500    | Salim Bukari                     | Stavanger              | 4,07,81    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2618        | 685   | 5000    | Nikolai Gundersen                | Ravnanger              | 15,40,35   | 2021.09.15 |
    | Idrettslaget Skjalg           | 2619        | 678   | 200     | Sebastian Knudsen                | Sandnes                | 23,69      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2620        | 675   | 800     | Vetle Farbu-Solbakken            | Stavanger              | 2,00,64    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2621        | 671   | 100     | Sebastian Knudsen                | Sandnes                | 11,72      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2622        | 670   | 1500    | Nikolai Gundersen                | Oslo/Bi                | 4,10,14    | 2021.09.25 |
    | Idrettslaget Skjalg           | 2623        | 668   | 200     | Andreas Nesse                    | Trondheim              | 23,79      | 2021.09.28 |
    | Idrettslaget Skjalg           | 2624        | 666   | 800     | Sebastian Veen                   | Stavanger              | 2,01,08    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2625        | 664   | 100     | Daniel Pedersen                  | Sandnes                | 11,75      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2626        | 660   | 5000    | Tom Dalsrud                      | Stavanger              | 15,52,68   | 2021.10.27 |
    | Idrettslaget Skjalg           | 2627        | 642   | 1500    | Johannes Tørlen                  | Stavanger              | 4,13,67    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2628        | 640   | 1500    | Marius Ingebrigtsen              | Stavanger              | 4,13,85    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2629        | 625   | 100     | Andreas Nesse                    | Trondheim              | 11,93      | 2021.09.28 |
    | Idrettslaget Skjalg           | 2630        | 607   | 1500    | Lars Malde                       | Stavanger              | 4,18,25    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2631        | 576   | 100     | Tobi Merkensteijn                | Sandnes                | 12,17      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2632        | 573   | 400     | Johannes Dalland                 | Stavanger              | 54,83      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2633        | 565   | 200     | Theodor Nessler                  | Haugesund              | 24,90      | 2021.09.12 |
    | Idrettslaget Skjalg           | 2634        | 560   | 5000    | Daniel Abicht                    | Stavanger              | 16,45,28   | 2021.10.27 |
    | Idrettslaget Skjalg           | 2635        | 555   | Lut     | Sergejs Kononovs                 | Stavanger              | 2,79       | 2021.10.27 |
    | Idrettslaget Skjalg           | 2636        | 550   | 1500    | Emil Harestad                    | Sandnes                | 4,26,26    | 2021.10.28 |
    | Idrettslaget Skjalg           | 2637        | 547   | 800     | Emil Harestad                    | Trondheim              | 2,08,34    | 2021.09.28 |
    | Idrettslaget Skjalg           | 2638        | 536   | 200     | Tobi Merkensteijn                | Trondheim              | 25,24      | 2021.09.28 |
    | Idrettslaget Skjalg           | 2639        | 530   | 200     | Philip Kauffmann                 | Haugesund              | 25,31      | 2021.09.12 |
    | Idrettslaget Skjalg           | 2640        | 513   | 1500    | Victor Hoff-Hansen               | Haugesund              | 4,31,83    | 2021.09.12 |
    | Idrettslaget Skjalg           | 2641        | 513   | 400     | Philip Kauffmann                 | Sandnes                | 56,56      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2642        | 509   | 100     | Philip Kauffmann                 | Sandnes                | 12,51      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2643        | 508   | 5000    | Dennis Jepsen                    | Stavanger              | 17,15,31   | 2021.10.27 |
    | Idrettslaget Skjalg           | 2644        | 508   | 200h    | Philip Kauffmann                 | Haugesund              | 29,72      | 2021.09.12 |
    | Idrettslaget Skjalg           | 2645        | 495   | 200     | Aleksander Aarestrup             | Ålgård                 | 25,74      | 2021.09.20 |
    | Idrettslaget Skjalg           | 2646        | 489   | 800     | Victor Hoff-Hansen               | Haugesund              | 2,12,62    | 2021.09.12 |
    | Idrettslaget Skjalg           | 2647        | 485   | 200     | Brage Østebø                     | Trondheim              | 25,87      | 2021.09.28 |
    | Idrettslaget Skjalg           | 2648        | 483   | 1500    | Børge Harestad                   | Sandnes                | 4,36,71    | 2021.10.28 |
    | Idrettslaget Skjalg           | 2649        | 477   | Diskos  | Oscar Harestad                   | Fana                   | 29,96      | 2021.09.28 |
    | Idrettslaget Skjalg           | 2650        | 469   | 200     | Thor Minsaas                     | Haugesund              | 26,08      | 2021.09.12 |
    | Idrettslaget Skjalg           | 2651        | 467   | 100     | Casper Clausen                   | Trondheim              | 12,74      | 2021.09.28 |
    | Idrettslaget Skjalg           | 2652        | 465   | 100     | Aleksander Aarestrup             | Frøyland               | 12,75      | 2021.09.07 |
    | Idrettslaget Skjalg           | 2653        | 456   | 400     | Thor Minsaas                     | Sandnes                | 58,40      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2654        | 456   | 100     | Brage Østebø                     | Sandnes                | 12,80      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2655        | 451   | 800     | Teo Eliassen                     | Stavanger              | 2,15,60    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2656        | 451   | 800     | Esteban Meza                     | Stavanger              | 2,15,63    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2657        | 448   | 1500    | Teo Eliassen                     | Sandnes                | 4,42,35    | 2021.10.28 |
    | Idrettslaget Skjalg           | 2658        | 444   | 800     | Børge Harestad                   | Stavanger              | 2,16,17    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2659        | 440   | Lut     | Daniel Pedersen                  | Stavanger              | 2,60       | 2021.10.27 |
    | Idrettslaget Skjalg           | 2660        | 436   | 200     | Samuel Runde                     | Sandnes                | 26,53      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2661        | 431   | 100     | Jonas Hope                       | Sandnes                | 12,94      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2662        | 427   | 100     | Thor Minsaas                     | Sandnes                | 12,96      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2663        | 424   | 200     | Sergey Adyasov                   | Stavanger              | 26,70      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2664        | 420   | 200     | Daniel Surdal                    | Ålgård                 | 26,76      | 2021.09.20 |
    | Idrettslaget Skjalg           | 2665        | 401   | 1500    | Mads Helland                     | Haugesund              | 4,50,60    | 2021.09.12 |
    | Idrettslaget Skjalg           | 2666        | 396   | Lengde  | Casper Clausen                   | Sandnes                | 5,10       | 2021.10.28 |
    | Idrettslaget Skjalg           | 2667        | 381   | Lengde  | Samuel Runde                     | Sandnes                | 5,04       | 2021.10.28 |
    | Idrettslaget Skjalg           | 2668        | 378   | 100     | Samuel Runde                     | Sandnes                | 13,25      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2669        | 374   | 1500    | Mio Steigen                      | Stavanger              | 4,55,78    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2670        | 369   | 800     | Mads Helland                     | Haugesund              | 2,22,83    | 2021.09.12 |
    | Idrettslaget Skjalg           | 2671        | 365   | 100     | Noah Kleppe                      | Sandnes                | 13,33      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2672        | 364   | 200     | Sander Stoltenberg               | Sandnes                | 27,57      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2673        | 364   | Lengde  | Brage Østebø                     | Sandnes                | 4,97       | 2021.10.28 |
    | Idrettslaget Skjalg           | 2674        | 359   | Lut     | Sergey Adyasov                   | Stavanger              | 2,49       | 2021.10.27 |
    | Idrettslaget Skjalg           | 2675        | 355   | 200     | Noah Kleppe                      | Sandnes                | 27,71      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2676        | 353   | Høyde   | Casper Clausen                   | Stavanger              | 1,50       | 2021.10.27 |
    | Idrettslaget Skjalg           | 2677        | 340   | Lengde  | Jonas Hope                       | Sandnes                | 4,87       | 2021.10.28 |
    | Idrettslaget Skjalg           | 2678        | 334   | 1500    | Atle Nordbotten                  | Sandnes                | 5,03,49    | 2021.10.28 |
    | Idrettslaget Skjalg           | 2679        | 330   | Kule    | Oscar Harestad                   | Fana                   | 8,46       | 2021.09.28 |
    | Idrettslaget Skjalg           | 2680        | 319   | 800     | Mio Steigen                      | Stavanger              | 2,27,66    | 2021.10.27 |
    | Idrettslaget Skjalg           | 2681        | 312   | 100     | Sander Stoltenberg               | Sandnes                | 13,66      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2682        | 301   | Spyd    | Kristian Rønneberg               | Stavanger              | 28,26      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2683        | 269   | 100     | Vincent Nordeide                 | Frøyland               | 13,95      | 2021.09.07 |
    | Idrettslaget Skjalg           | 2684        | 268   | Lengde  | Philip Kauffmann                 | Sandnes                | 4,58       | 2021.10.28 |
    | Idrettslaget Skjalg           | 2685        | 266   | 200     | Noel Viding-Øvrebø               | Stavanger              | 29,16      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2686        | 252   | Kule    | Kristian Rønneberg               | Stavanger              | 7,51       | 2021.10.27 |
    | Idrettslaget Skjalg           | 2687        | 252   | 200     | Gunnar Olsen-Hagen               | Nadderud               | 29,40      | 2021.10.16 |
    | Idrettslaget Skjalg           | 2688        | 244   | Spyd    | Oscar Harestad                   | Fana                   | 25,12      | 2021.09.28 |
    | Idrettslaget Skjalg           | 2689        | 242   | 100     | Otto Ramsland                    | Leikvang               | 14,13      | 2021.08.29 |
    | Idrettslaget Skjalg           | 2690        | 221   | 800     | Gunnar Olsen-Hagen               | Haugesund              | 2,37,93    | 2021.09.12 |
    | Idrettslaget Skjalg           | 2691        | 213   | 100     | Noel Viding-Øvrebø               | Sandnes                | 14,34      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2692        | 210   | Lut     | Andreas Nesse                    | Stavanger              | 2,33       | 2021.10.27 |
    | Idrettslaget Skjalg           | 2693        | 200   | 1500    | Anders Gjerstad                  | Haugesund              | 5,32,50    | 2021.09.12 |
    | Idrettslaget Skjalg           | 2694        | 195   | Diskos  | Terje Bredahl                    | Stavanger              | 19,33      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2695        | 169   | 200     | Milo Rudjord                     | Stavanger              | 30,92      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2696        | 167   | Høyde   | Milo Rudjord                     | Stavanger              | 1,35       | 2021.10.27 |
    | Idrettslaget Skjalg           | 2697        | 142   | 200     | Eskil Wedøe                      | Frakkagjerd            | 31,43      | 2021.08.22 |
    | Idrettslaget Skjalg           | 2698        | 131   | Spyd    | Terje Bredahl                    | Stavanger              | 19,58      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2699        | 123   | 200     | Temitope Olalemi                 | Stavanger              | 31,82      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2700        | 114   | 200     | Vetle Mikalsen                   | Ålgård                 | 32,00      | 2021.09.20 |
    | Idrettslaget Skjalg           | 2701        | 113   | 100     | Vetle Mikalsen                   | Sandnes                | 15,11      | 2021.10.28 |
    | Idrettslaget Skjalg           | 2702        | 103   | Lengde  | Felix Ørbeck                     | Nadderud               | 3,94       | 2021.10.16 |
    | Idrettslaget Skjalg           | 2703        | 102   | Kule    | Terje Bredahl                    | Stavanger              | 5,83       | 2021.10.27 |
    | Idrettslaget Skjalg           | 2704        | 101   | Lengde  | Sander Stoltenberg               | Sandnes                | 3,93       | 2021.10.28 |
    | Idrettslaget Skjalg           | 2705        | 59    | 200     | Patrick Osaland                  | Stavanger              | 33,12      | 2021.10.27 |
    | Idrettslaget Skjalg           | 2706        | 19    | Høyde   | Felix Ørbeck                     | Nadderud               | 1,25       | 2021.10.16 |
    | Ikornnes Idrettslag           | 2707        | 875   | Slegge  | Herman Aurdal                    | Molde                  | 59,69      | 2021.06.20 |
    | Ikornnes Idrettslag           | 2708        | 697   | Diskos  | Herman Aurdal                    | Fana                   | 40,64      | 2021.09.28 |
    | Ikornnes Idrettslag           | 2709        | 604   | Kule    | Herman Aurdal                    | Molde                  | 12,11      | 2021.06.20 |
    | Ikornnes Idrettslag           | 2710        | 500   | Slegge  | Thomas Sletvold                  | Ørsta                  | 32,42      | 2021.10.07 |
    | Ikornnes Idrettslag           | 2711        | 440   | Kule    | Thomas Sletvold                  | Ørsta                  | 9,87       | 2021.10.07 |
    | Ikornnes Idrettslag           | 2712        | 379   | 200     | Kristian Ullavik                 | Molde                  | 27,35      | 2021.06.20 |
    | Ikornnes Idrettslag           | 2713        | 377   | Diskos  | Thomas Sletvold                  | Førde                  | 25,93      | 2021.08.22 |
    | Ikornnes Idrettslag           | 2714        | 303   | 200h    | Kristian Ullavik                 | Måndalen               | 33,94      | 2021.09.12 |
    | Inderøy IL                    | 2715        | 417   | 1500    | Sindre Mjømen                    | Måndalen               | 4,47,89    | 2021.09.12 |
    | Inderøy IL                    | 2716        | 402   | 200     | Iver Kvistad                     | Måndalen               | 27,00      | 2021.09.12 |
    | Inderøy IL                    | 2717        | 386   | 100     | Iver Kvistad                     | Namsos                 | 13,20      | 2021.08.22 |
    | Inderøy IL                    | 2718        | 211   | 200     | Sindre Mjømen                    | Måndalen               | 30,14      | 2021.09.12 |
    | Innstranda IL                 | 2719        | 749   | 10000   | Vetle Knutsen                    | Bodø                   | 31,48,56   | 2021.09.21 |
    | Innstranda IL                 | 2720        | 461   | 5000    | David Leite                      | Bodø                   | 17,44,43   | 2021.09.21 |
    | Isfjorden IL                  | 2721        | 414   | 1500    | Kristian Unhjem                  | Måndalen               | 4,48,46    | 2021.09.12 |
    | Isfjorden IL                  | 2722        | 365   | 1500    | Bjørnar Unhjem                   | Måndalen               | 4,57,47    | 2021.09.12 |
    | Ivrig                         | 2723        | 507   | 1500    | Casper Rønning                   | Greveskogen            | 4,32,81    | 2021.10.30 |
    | Jardar IL                     | 2724        | 166   | 200     | Sebastian Brunsdon               | Nadderud               | 30,97      | 2021.10.16 |
    | Jardar IL                     | 2725        | 15    | 200     | Axel Aatlo                       | Drammen                | 34,08      | 2021.10.16 |
    | Josefvatn IL                  | 2726        | 56    | 3000    | Ingvar Stenvoll                  | Nordkjosbotn           | 13,35,9    | 2021.09.21 |
    | Jotun IL                      | 2727        | 794   | 3000    | August Sveen                     | Jessheim               | 8,34,29    | 2021.09.09 |
    | Jotun IL                      | 2728        | 787   | 5000    | August Sveen                     | Oslo/Bi                | 14,53,62   | 2021.09.25 |
    | Jotun IL                      | 2729        | 774   | 1500    | August Sveen                     | Oslo/Bi                | 3,58,62    | 2021.09.25 |
    | Jotun IL                      | 2730        | 753   | 100     | Knut Werge-Olsen                 | Lillehammer            | 11,36      | 2021.09.26 |
    | Jotun IL                      | 2731        | 732   | 800     | August Sveen                     | Trondheim              | 1,57,77    | 2021.09.28 |
    | Jotun IL                      | 2732        | 731   | 200     | Knut Werge-Olsen                 | Larvik                 | 23,17      | 2021.09.15 |
    | Jotun IL                      | 2733        | 594   | 400     | August Sveen                     | Øvre Årdal             | 54,24      | 2021.09.08 |
    | Jotun IL                      | 2734        | 549   | Lengde  | Knut Werge-Olsen                 | Øvre Årdal             | 5,75       | 2021.09.08 |
    | Jotun IL                      | 2735        | 543   | 800     | Christoffer Vamråk               | Øvre Årdal             | 2,08,60    | 2021.09.08 |
    | Jotun IL                      | 2736        | 518   | 1500    | Christoffer Vamråk               | Øvre Årdal             | 4,31,20    | 2021.09.08 |
    | Jotun IL                      | 2737        | 429   | Lengde  | Johannes Paulides                | Måndalen               | 5,24       | 2021.09.12 |
    | Jotun IL                      | 2738        | 421   | 200     | Johannes Paulides                | Måndalen               | 26,74      | 2021.09.12 |
    | Jotun IL                      | 2739        | 390   | Tresteg | Johannes Paulides                | Måndalen               | 10,51      | 2021.09.12 |
    | Jotun IL                      | 2740        | 340   | 100     | Johannes Paulides                | Øvre Årdal             | 13,48      | 2021.09.08 |
    | Jotun IL                      | 2741        | 81    | Stav    | William Saltnes                  | Måndalen               | 1,72       | 2021.09.12 |
    | Jægervatnet IL                | 2742        | 341   | Slegge  | Kjell Robertsen                  | Lenangen               | 23,36      | 2021.10.09 |
    | Jægervatnet IL                | 2743        | 266   | Stav    | Kjell Robertsen                  | Førde                  | 2,20       | 2021.08.22 |
    | Jægervatnet IL                | 2744        | 181   | Lengde  | Kjell Robertsen                  | Førde                  | 4,24       | 2021.08.22 |
    | Jægervatnet IL                | 2745        | 96    | Høyde   | Kjell Robertsen                  | Førde                  | 1,30       | 2021.08.22 |
    | Jægervatnet IL                | 2746        | 80    | Hut     | Kjell Robertsen                  | Hvam                   | 1,10       | 2021.10.23 |
    | Jølster IL                    | 2747        | 986   | 5000    | Eivind Øygard                    | Oslo/Bi                | 13,37,45   | 2021.09.25 |
    | Jølster IL                    | 2748        | 957   | 10000   | Eivind Øygard                    | Kristiansand           | 28,46,40   | 2021.10.06 |
    | Jølster IL                    | 2749        | 931   | 1500    | Eivind Øygard                    | Oslo/Bi                | 3,44,31    | 2021.09.25 |
    | Jølster IL                    | 2750        | 917   | 3000    | Eivind Øygard                    | Førde                  | 8,07,75    | 2021.08.22 |
    | Jølster IL                    | 2751        | 865   | 3000    | Matias Førde                     | Førde                  | 8,18,73    | 2021.08.22 |
    | Jølster IL                    | 2752        | 831   | 1500    | Matias Førde                     | Oslo/Bi                | 3,53,04    | 2021.09.25 |
    | Jølster IL                    | 2753        | 748   | 10000   | Knut Øygard                      | Oslo/Bi                | 31,50,46   | 2021.09.25 |
    | Jølster IL                    | 2754        | 732   | 3000    | Knut Øygard                      | Oslo/Bi                | 8,49,09    | 2021.09.25 |
    | Jølster IL                    | 2755        | 713   | 100     | Deividas Burkauskas              | Byrkjelo               | 11,53      | 2021.10.31 |
    | Jølster IL                    | 2756        | 709   | 3000    | Håvard Klakegg                   | Sogndal                | 8,54,57    | 2021.05.12 |
    | Jølster IL                    | 2757        | 689   | 5000    | Håvard Klakegg                   | Jølster                | 15,38,27   | 2021.09.25 |
    | Jølster IL                    | 2758        | 680   | 200     | Deividas Burkauskas              | Trondheim              | 23,67      | 2021.09.28 |
    | Jølster IL                    | 2759        | 673   | 100     | Jakob Slåtten                    | Ravnanger              | 11,71      | 2021.09.15 |
    | Jølster IL                    | 2760        | 644   | 800     | Åsmund Førde                     | Jølster                | 2,02,31    | 2021.09.25 |
    | Jølster IL                    | 2761        | 620   | 200     | Jakob Slåtten                    | Byrkjelo               | 24,29      | 2021.10.31 |
    | Jølster IL                    | 2762        | 613   | 1500    | Håvard Klakegg                   | Førde                  | 4,17,49    | 2021.08.22 |
    | Jølster IL                    | 2763        | 588   | 800     | Kristoffer Sandal                | Jølster                | 2,05,66    | 2021.09.25 |
    | Jølster IL                    | 2764        | 584   | 5000    | Øystein Støfring                 | Jølster                | 16,32,03   | 2021.09.25 |
    | Jølster IL                    | 2765        | 576   | 1500    | Åsmund Førde                     | Måndalen               | 4,22,49    | 2021.09.12 |
    | Jølster IL                    | 2766        | 560   | 5000    | Lars Øvrebø                      | Jølster                | 16,45,51   | 2021.09.25 |
    | Jølster IL                    | 2767        | 546   | 3000    | Kristoffer Sandal                | Førde                  | 9,41,15    | 2021.08.22 |
    | Jølster IL                    | 2768        | 528   | 400     | Åsmund Førde                     | Florø                  | 56,12      | 2021.06.05 |
    | Jølster IL                    | 2769        | 528   | 800     | Simen Sunde                      | Jølster                | 2,09,70    | 2021.09.25 |
    | Jølster IL                    | 2770        | 526   | 3000    | Anton Tveito                     | Sogndal                | 9,47,90    | 2021.05.12 |
    | Jølster IL                    | 2771        | 509   | 3000    | Åsmund Førde                     | Sogndal                | 9,53,45    | 2021.05.12 |
    | Jølster IL                    | 2772        | 502   | 1500    | Kristoffer Sandal                | Førde                  | 4,33,52    | 2021.08.22 |
    | Jølster IL                    | 2773        | 496   | 3000    | Arild Øygard                     | Trondheim              | 9,57,78    | 2021.09.28 |
    | Jølster IL                    | 2774        | 486   | 200h    | Åsmund Førde                     | Måndalen               | 30,16      | 2021.09.12 |
    | Jølster IL                    | 2775        | 479   | Lengde  | Deividas Burkauskas              | Jølster                | 5,45       | 2021.09.25 |
    | Jølster IL                    | 2776        | 474   | 5000    | Kristoffer Sandal                | Jølster                | 17,36,20   | 2021.09.25 |
    | Jølster IL                    | 2777        | 451   | 3000    | Lars Teigen                      | Sogndal                | 10,13,55   | 2021.05.12 |
    | Jølster IL                    | 2778        | 438   | 200     | Åsmund Førde                     | Jessheim               | 26,50      | 2021.09.09 |
    | Jølster IL                    | 2779        | 364   | 5000    | Magnus Reite-Bjellaas            | Jølster                | 18,50,75   | 2021.09.25 |
    | Jølster IL                    | 2780        | 337   | 5000    | Jens Årdal                       | Førde                  | 19,11,37   | 2021.08.22 |
    | Jølster IL                    | 2781        | 306   | Høyde   | Ard Sundal                       | Måndalen               | 1,46       | 2021.09.12 |
    | Jølster IL                    | 2782        | 258   | 400     | Kjell Førde                      | Førde                  | 1,06,12    | 2021.08.22 |
    | Jølster IL                    | 2783        | 245   | 100     | Kjell Førde                      | Førde                  | 14,11      | 2021.08.22 |
    | Jølster IL                    | 2784        | 212   | 1500    | Emanuel Aarseth                  | Førde                  | 5,29,62    | 2021.08.22 |
    | Jølster IL                    | 2785        | 63    | 200     | Emanuel Aarseth                  | Florø                  | 32,8       | 2021.06.05 |
    | KFUM-Kameratene               | 2786        | 211   | 200     | Frans Stenersen                  | Førde                  | 30,14      | 2021.08.22 |
    | KFUM-Kameratene               | 2787        | 129   | 400     | Frans Stenersen                  | Førde                  | 1,12,04    | 2021.08.22 |
    | KFUM-Kameratene               | 2788        | 49    | 800     | Frans Stenersen                  | Førde                  | 2,58,38    | 2021.08.22 |
    | Kamp/Vestheim IF              | 2789        | 830   | 5000    | Fredrik Schwencke                | Greveskogen            | 14,35,22   | 2021.10.30 |
    | Kamp/Vestheim IF              | 2790        | 787   | 5000    | Andreas Schwencke                | Kristiansand           | 14,53,40   | 2021.10.06 |
    | Kamp/Vestheim IF              | 2791        | 760   | 10000   | Andreas Schwencke                | Kristiansand           | 31,38,04   | 2021.10.06 |
    | Kamp/Vestheim IF              | 2792        | 728   | 10000   | Fredrik Schwencke                | Kristiansand           | 32,10,58   | 2021.10.06 |
    | Kaupanger IL                  | 2793        | 531   | 3000    | Stian Øvrebø                     | Førde                  | 9,46,19    | 2021.08.22 |
    | Kaupanger IL                  | 2794        | 289   | 1500    | Leon Tveito                      | Måndalen               | 5,12,57    | 2021.09.12 |
    | Kaupanger IL                  | 2795        | 285   | 3000    | Håkon Albretsen                  | Sogndal                | 11,21,86   | 2021.05.12 |
    | Kaupanger IL                  | 2796        | 250   | 200     | Leon Tveito                      | Måndalen               | 29,43      | 2021.09.12 |
    | Kjelsås IL                    | 2797        | 709   | 5000    | Iver Johansen                    | Oslo/Bi                | 15,28,75   | 2021.09.25 |
    | Kjelsås IL                    | 2798        | 682   | 10000   | Iver Johansen                    | Oslo/Bi                | 32,59,54   | 2021.09.25 |
    | Kjelsås IL                    | 2799        | 602   | 10000   | Anton Jensen                     | Oslo/Bi                | 34,28,63   | 2021.09.25 |
    | Kjelsås IL                    | 2800        | 367   | Lut     | Trond Sandberg                   | Hvam                   | 2,50       | 2021.10.23 |
    | Kleppestø IL                  | 2801        | 71    | 3000    | Rune Furevik                     | Osterøy                | 13,25,2    | 2021.10.24 |
    | Kolvereid IL                  | 2802        | 791   | 800     | John Stevik                      | Trondheim              | 1,55,07    | 2021.09.28 |
    | Kolvereid IL                  | 2803        | 768   | 1500    | John Stevik                      | Steinkjer              | 3.59,25    | 2021.09.30 |
    | Kolvereid IL                  | 2804        | 337   | Lengde  | William Johansen                 | Namsos                 | 4,86       | 2021.08.22 |
    | Kolvereid IL                  | 2805        | 167   | Høyde   | William Johansen                 | Kolvereid              | 1,35       | 2021.05.26 |
    | Kongsberg IF                  | 2806        | 718   | 100     | Thomas Skalstad-Aaker            | Oslo/St                | 11,51      | 2021.10.16 |
    | Kongsberg IF                  | 2807        | 681   | Lengde  | Thomas Skalstad-Aaker            | Oslo/St                | 6,33       | 2021.10.16 |
    | Kongsberg IF                  | 2808        | 643   | 200     | Thomas Skalstad-Aaker            | Sande                  | 23,8       | 2021.10.07 |
    | Kongsberg IF                  | 2809        | 248   | 200     | Mats Spiten                      | Lillehammer            | 29,48      | 2021.09.26 |
    | Kongsberg IF                  | 2810        | 196   | Stav    | Knut Skramstad                   | Førde                  | 2,00       | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2811        | 658   | Stav    | Sindre Nergaard                  | Trondheim              | 3,70       | 2021.09.28 |
    | Kongsvinger IL Friidrett      | 2812        | 493   | Lengde  | Simen Aasvestad                  | Førde                  | 5,51       | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2813        | 465   | 100     | Simen Aasvestad                  | Førde                  | 12,75      | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2814        | 451   | Høyde   | Simen Aasvestad                  | Førde                  | 1,59       | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2815        | 447   | Stav    | Simen Aasvestad                  | Førde                  | 2,80       | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2816        | 417   | 1500    | Martin Holtet                    | Kongsvinger            | 4,47,82    | 2021.09.08 |
    | Kongsvinger IL Friidrett      | 2817        | 385   | Diskos  | Simen Aasvestad                  | Førde                  | 26,24      | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2818        | 356   | Kule    | Simen Aasvestad                  | Kongsvinger            | 8,78       | 2021.09.08 |
    | Kongsvinger IL Friidrett      | 2819        | 336   | Spyd    | Simen Aasvestad                  | Kongsvinger            | 30,37      | 2021.09.08 |
    | Kongsvinger IL Friidrett      | 2820        | 295   | Høyde   | Dennis Ellingsrud                | Kongsvinger            | 1,45       | 2021.09.08 |
    | Kongsvinger IL Friidrett      | 2821        | 294   | 400h    | Simen Aasvestad                  | Førde                  | 1,18,86    | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2822        | 237   | 3000    | Jan Monsrud                      | Førde                  | 11,45,11   | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2823        | 229   | Tresteg | Simen Aasvestad                  | Førde                  | 9,16       | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2824        | 223   | 1500    | Jan Monsrud                      | Førde                  | 5,27,23    | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2825        | 220   | 5000    | Jan Monsrud                      | Førde                  | 20,50,32   | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2826        | 214   | 400     | Simen Aasvestad                  | Hamar                  | 1,08,05    | 2021.08.22 |
    | Kongsvinger IL Friidrett      | 2827        | 166   | 1500    | Pär Magnusson                    | Kongsvinger            | 5,40,80    | 2021.09.08 |
    | Kongsvinger IL Friidrett      | 2828        | 112   | 1500    | Simen Aasvestad                  | Hamar                  | 5,55,09    | 2021.08.22 |
    | Kragerø IF Friidrett          | 2829        | 651   | 10000   | Andreas Grøgaard                 | Kragerø                | 33,33,0    | 2021.10.30 |
    | Kragerø IF Friidrett          | 2830        | 615   | 10000   | Jørgen Hals                      | Kragerø                | 34,13,8    | 2021.10.30 |
    | Kragerø IF Friidrett          | 2831        | 573   | 10000   | Thomas Guste-Pedersen            | Kragerø                | 35,04,5    | 2021.10.30 |
    | Kragerø IF Friidrett          | 2832        | 572   | Lut     | Mikkel Nicolaysen                | Kragerø                | 2,82       | 2021.10.30 |
    | Kragerø IF Friidrett          | 2833        | 552   | 200     | Thorvald Tveitereid              | Kragerø                | 24,8       | 2021.10.30 |
    | Kragerø IF Friidrett          | 2834        | 532   | Lut     | Thorvald Tveitereid              | Kragerø                | 2,75       | 2021.10.30 |
    | Kragerø IF Friidrett          | 2835        | 396   | Lengde  | Mikkel Nicolaysen                | Kragerø                | 5,10       | 2021.10.30 |
    | Kragerø IF Friidrett          | 2836        | 362   | Spyd    | Petter Sørdalen                  | Rjukan                 | 31,95      | 2021.09.12 |
    | Kragerø IF Friidrett          | 2837        | 324   | 3000    | Peder Pedersen                   | Kragerø                | 11,04,3    | 2021.10.30 |
    | Kragerø IF Friidrett          | 2838        | 192   | 3000    | Kai Martens-Tangsrud             | Kragerø                | 12,09,0    | 2021.10.30 |
    | Kragerø IF Friidrett          | 2839        | 167   | 10000   | Kai Martens-Tangsrud             | Kragerø                | 46,41,5    | 2021.10.30 |
    | Kragerø IF Friidrett          | 2840        | 135   | 10000   | Tommy Kvilekval                  | Kragerø                | 48,05,3    | 2021.10.30 |
    | Kristiansand Løpeklubb        | 2841        | 766   | 5000    | Kristian Tjørnhom                | Kristiansand           | 15,02,70   | 2021.10.06 |
    | Kristiansand Løpeklubb        | 2842        | 756   | 3000    | Joakim Coward-Hanssen            | Lyngdal                | 8,43,22    | 2021.09.26 |
    | Kristiansand Løpeklubb        | 2843        | 744   | 5000    | Joakim Coward-Hanssen            | Oslo/Bi                | 15,12,71   | 2021.09.25 |
    | Kristiansand Løpeklubb        | 2844        | 742   | 10000   | Ola Sakshaug                     | Oslo/Bi                | 31,56,64   | 2021.09.25 |
    | Kristiansand Løpeklubb        | 2845        | 725   | 10000   | Ole Heggheim                     | Oslo/Bi                | 32,13,66   | 2021.09.25 |
    | Kristiansand Løpeklubb        | 2846        | 711   | 5000    | Ole Heggheim                     | Oslo/Bi                | 15,27,87   | 2021.09.25 |
    | Kristiansand Løpeklubb        | 2847        | 708   | 3000    | Ole Heggheim                     | Lyngdal                | 8,54,91    | 2021.09.26 |
    | Kristiansand Løpeklubb        | 2848        | 700   | 3000    | Lars Aanensen                    | Lyngdal                | 8,56,82    | 2021.09.26 |
    | Kristiansand Løpeklubb        | 2849        | 699   | 3000    | Kristian Frøyen                  | Jessheim               | 8,57,10    | 2021.09.09 |
    | Kristiansand Løpeklubb        | 2850        | 631   | 3000    | Johnny Stensvold                 | Lyngdal                | 9,15,63    | 2021.09.26 |
    | Kristiansands IF Friidrett    | 2851        | 964   | 800     | Sigurd Tveit                     | Fana                   | 1,48,30    | 2021.09.28 |
    | Kristiansands IF Friidrett    | 2852        | 942   | Spyd    | Myron Weinberg                   | Kristiansand           | 72,78      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2853        | 935   | Diskos  | Fabian Weinberg                  | Kristiansand           | 54,89      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2854        | 842   | Spyd    | Daniel Thrana                    | Ravnanger              | 66,00      | 2021.09.15 |
    | Kristiansands IF Friidrett    | 2855        | 816   | 100     | Johannes Lunde                   | Trondheim              | 11,10      | 2021.09.28 |
    | Kristiansands IF Friidrett    | 2856        | 775   | Lengde  | Johannes Lunde                   | Søgne                  | 6,76       | 2021.10.05 |
    | Kristiansands IF Friidrett    | 2857        | 747   | 200     | Johannes Lunde                   | Lillehammer            | 23,01      | 2021.09.26 |
    | Kristiansands IF Friidrett    | 2858        | 723   | Tresteg | Johannes Lunde                   | Kristiansand           | 13,50      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2859        | 693   | 800     | Tore Tøfte                       | Trondheim              | 1,59,71    | 2021.09.28 |
    | Kristiansands IF Friidrett    | 2860        | 641   | 800     | Sander Lindevik                  | Kristiansand           | 2,02,49    | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2861        | 616   | 3000    | Tore Tøfte                       | Nadderud               | 9,19,79    | 2021.10.16 |
    | Kristiansands IF Friidrett    | 2862        | 592   | 3000    | Bastian Bøgh-Tobiassen           | Kristiansand           | 9,27,02    | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2863        | 537   | 800     | Bastian Bøgh-Tobiassen           | Grimstad               | 2,09,07    | 2021.10.25 |
    | Kristiansands IF Friidrett    | 2864        | 528   | 400     | Johannes Lunde                   | Grimstad               | 56,11      | 2021.10.25 |
    | Kristiansands IF Friidrett    | 2865        | 424   | Spyd    | Lukas Haugvik                    | Kristiansand           | 35,81      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2866        | 408   | Stav    | Linus Sjølie                     | Kristiansand           | 2,66       | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2867        | 383   | 100     | Nikkolaj Gulbrandsen             | Kristiansand           | 13,22      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2868        | 367   | Hut     | Olai Graasvoll                   | Kristiansand           | 1,25       | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2869        | 364   | Høyde   | Olai Graasvoll                   | Kristiansand           | 1,51       | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2870        | 359   | Lengde  | Nikkolaj Gulbrandsen             | Søgne                  | 4,95       | 2021.10.05 |
    | Kristiansands IF Friidrett    | 2871        | 329   | 3000    | Peter Skog                       | Kristiansand           | 11,01,97   | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2872        | 326   | 100     | Daniel Sandnes                   | Kristiansand           | 13,57      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2873        | 324   | 200     | Daniel Sandnes                   | Kristiansand           | 28,21      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2874        | 303   | 200     | Nikkolaj Gulbrandsen             | Kristiansand           | 28,54      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2875        | 298   | 800     | Peter Skog                       | Grimstad               | 2,29,73    | 2021.10.25 |
    | Kristiansands IF Friidrett    | 2876        | 289   | 1500    | Peter Skog                       | Lyngdal                | 5,12,66    | 2021.09.26 |
    | Kristiansands IF Friidrett    | 2877        | 242   | 100     | Lukas Haugvik                    | Kristiansand           | 14,13      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2878        | 201   | 200     | Aron Mørkestøl                   | Kristiansand           | 30,31      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2879        | 195   | 100     | Aron Mørkestøl                   | Kristiansand           | 14,47      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2880        | 180   | Hut     | Kasper Elson                     | Kristiansand           | 1,15       | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2881        | 171   | Lengde  | Erling Ytrehus                   | Lyngdal                | 4,20       | 2021.09.26 |
    | Kristiansands IF Friidrett    | 2882        | 147   | 200     | Olai Graasvoll                   | Kristiansand           | 31,34      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2883        | 127   | 200     | Felix Underland                  | Kristiansand           | 31,74      | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2884        | 96    | Høyde   | Kasper Elson                     | Kristiansand           | 1,30       | 2021.10.06 |
    | Kristiansands IF Friidrett    | 2885        | 94    | 800     | Peter Loka                       | Kristiansand           | 2,52,79    | 2021.10.06 |
    | Krødsherad IL                 | 2886        | 246   | Høyde   | Wilhelm Svendsrud                | Rjukan                 | 1,41       | 2021.09.12 |
    | Krødsherad IL                 | 2887        | 154   | 200     | Johann Mjølstad-Skinnes          | Drammen                | 31,21      | 2021.10.16 |
    | Krødsherad IL                 | 2888        | 90    | 200     | Amund Bjerregaard                | Drammen                | 32,47      | 2021.10.16 |
    | Kvæfjord IL                   | 2889        | 710   | 800     | Tobias Frantzen                  | Trondheim              | 1,58,84    | 2021.09.28 |
    | Kvæfjord IL                   | 2890        | 634   | 3000    | Tobias Frantzen                  | Trondheim              | 9,14,77    | 2021.09.28 |
    | Kvæfjord IL                   | 2891        | 610   | 400     | Tobias Frantzen                  | Trondheim              | 53,84      | 2021.09.28 |
    | Kvæfjord IL                   | 2892        | 604   | 800     | Wulff Hunstad                    | Trondheim              | 2,04,62    | 2021.09.28 |
    | Kvæfjord IL                   | 2893        | 601   | 200     | Wulff Hunstad                    | Trondheim              | 24,49      | 2021.09.28 |
    | Kvæfjord IL                   | 2894        | 573   | 400     | Wulff Hunstad                    | Tromsø                 | 54,83      | 2021.09.15 |
    | Kyrksæterøra IL               | 2895        | 723   | 1500    | Håkon Berg                       | Trondheim              | 4,04,07    | 2021.09.28 |
    | Kyrksæterøra IL               | 2896        | 705   | 800     | Håkon Berg                       | Trondheim              | 1,59,09    | 2021.09.28 |
    | Kyrksæterøra IL               | 2897        | 683   | 3000    | Håkon Berg                       | Trondheim              | 9,01,35    | 2021.09.28 |
    | Kyrksæterøra IL               | 2898        | 647   | 10000   | Lars Hageskal                    | Trondheim              | 33,37,00   | 2021.09.28 |
    | Kyrksæterøra IL               | 2899        | 599   | 5000    | Lars Hageskal                    | Førde                  | 16,24,25   | 2021.08.22 |
    | Kyrksæterøra IL               | 2900        | 585   | 3000    | Lars Hageskal                    | Børsa                  | 9,29,03    | 2021.08.08 |
    | Kyrksæterøra IL               | 2901        | 577   | 1500    | Lars Hageskal                    | Førde                  | 4,22,37    | 2021.08.22 |
    | Kyrksæterøra IL               | 2902        | 556   | 800     | Lars Hageskal                    | Trondheim              | 2,07,76    | 2021.09.28 |
    | Kyrksæterøra IL               | 2903        | 429   | 400     | Simon Skjøstad                   | Trondheim              | 59,33      | 2021.09.28 |
    | Kyrksæterøra IL               | 2904        | 371   | 800     | Simon Skjøstad                   | Aure                   | 2,22,68    | 2021.06.12 |
    | Kyrksæterøra IL               | 2905        | 354   | 800     | Kristian Sødal                   | Aure                   | 2,24,23    | 2021.06.12 |
    | Kyrksæterøra IL               | 2906        | 329   | 3000    | Olav Sødal                       | Børsa                  | 11,02,16   | 2021.08.08 |
    | Kyrksæterøra IL               | 2907        | 297   | 1500    | Kristian Sødal                   | Trondheim              | 5,10,87    | 2021.09.28 |
    | Kyrksæterøra IL               | 2908        | 281   | 3000    | Simon Skjøstad                   | Trondheim              | 11,23,86   | 2021.09.28 |
    | Kyrksæterøra IL               | 2909        | 278   | 1500    | Olav Sødal                       | Trondheim              | 5,14,88    | 2021.09.28 |
    | Kyrksæterøra IL               | 2910        | 277   | 3000    | Kristian Sødal                   | Trondheim              | 11,25,67   | 2021.09.28 |
    | Kyrksæterøra IL               | 2911        | 197   | Lengde  | Ole Kjønsvik                     | Aure                   | 4,30       | 2021.06.12 |
    | Laksevåg TIL                  | 2912        | 923   | Slegge  | Håkon Litland                    | Kristiansand           | 63,61      | 2021.10.06 |
    | Laksevåg TIL                  | 2913        | 775   | 400h    | Christian Mæhlum                 | Kristiansand           | 55,02      | 2021.10.06 |
    | Laksevåg TIL                  | 2914        | 722   | 200     | Christian Mæhlum                 | Leikvang               | 23,25      | 2021.08.29 |
    | Laksevåg TIL                  | 2915        | 699   | 100     | Christian Mæhlum                 | Ravnanger              | 11,59      | 2021.09.15 |
    | Laksevåg TIL                  | 2916        | 669   | 200h    | Christian Mæhlum                 | Bergen/La              | 26,88      | 2021.09.29 |
    | Laksevåg TIL                  | 2917        | 657   | 100     | Andreas Mæhlum                   | Ravnanger              | 11,78      | 2021.09.15 |
    | Laksevåg TIL                  | 2918        | 644   | 100     | Øyvind Bu                        | Leikvang               | 11,84      | 2021.08.29 |
    | Laksevåg TIL                  | 2919        | 603   | Diskos  | Håkon Litland                    | Tulsa/OK/USA           | 35,72      | 2021.03.27 |
    | Laksevåg TIL                  | 2920        | 583   | Lut     | Martin Vikse                     | Bergen/La              | 2,84       | 2021.09.29 |
    | Laksevåg TIL                  | 2921        | 583   | Lut     | Håkon Litland                    | Bergen/La              | 2,84       | 2021.09.29 |
    | Laksevåg TIL                  | 2922        | 579   | 200     | Øyvind Bu                        | Bergen/La              | 24,74      | 2021.09.29 |
    | Laksevåg TIL                  | 2923        | 566   | 100     | Håkon Litland                    | Fana                   | 12,22      | 2021.09.28 |
    | Laksevåg TIL                  | 2924        | 550   | Hut     | Christian Mæhlum                 | Bergen/La              | 1,39       | 2021.09.29 |
    | Laksevåg TIL                  | 2925        | 536   | Kule    | Agnar Aadland                    | Bergen/La              | 11,17      | 2021.09.29 |
    | Laksevåg TIL                  | 2926        | 532   | Kule    | Håkon Litland                    | Bergen/La              | 11,11      | 2021.09.29 |
    | Laksevåg TIL                  | 2927        | 512   | Diskos  | Fredrik Milde                    | Bergen/La              | 31,48      | 2021.09.29 |
    | Laksevåg TIL                  | 2928        | 503   | Hut     | Martin Vikse                     | Bergen/La              | 1,35       | 2021.09.29 |
    | Laksevåg TIL                  | 2929        | 492   | Slegge  | Erik Johansson                   | Bergen/La              | 31,97      | 2021.09.29 |
    | Laksevåg TIL                  | 2930        | 491   | Lut     | Christian Mæhlum                 | Bergen/La              | 2,68       | 2021.09.29 |
    | Laksevåg TIL                  | 2931        | 481   | 3000    | Fredrik Madsen                   | Bergen/La              | 10,03,01   | 2021.09.29 |
    | Laksevåg TIL                  | 2932        | 478   | Hut     | Fredrik Milde                    | Bergen/La              | 1,33       | 2021.09.29 |
    | Laksevåg TIL                  | 2933        | 478   | Lut     | Erik Johansson                   | Bergen/La              | 2,66       | 2021.09.29 |
    | Laksevåg TIL                  | 2934        | 472   | Lut     | Øyvind Bu                        | Bergen/La              | 2,65       | 2021.09.29 |
    | Laksevåg TIL                  | 2935        | 463   | 200     | Christian Orbekk                 | Bergen/La              | 26,16      | 2021.09.29 |
    | Laksevåg TIL                  | 2936        | 447   | Lut     | Andreas Mæhlum                   | Bergen/La              | 2,61       | 2021.09.29 |
    | Laksevåg TIL                  | 2937        | 401   | Spyd    | Håkon Litland                    | Bergen/La              | 34,37      | 2021.09.29 |
    | Laksevåg TIL                  | 2938        | 386   | Høyde   | Ronny Haufe                      | Førde                  | 1,53       | 2021.08.22 |
    | Laksevåg TIL                  | 2939        | 367   | Lut     | Øyvind Litland                   | Bergen/La              | 2,50       | 2021.09.29 |
    | Laksevåg TIL                  | 2940        | 361   | Stav    | Ronny Haufe                      | Førde                  | 2,50       | 2021.08.22 |
    | Laksevåg TIL                  | 2941        | 353   | Høyde   | Tor Vikane                       | Førde                  | 1,50       | 2021.08.22 |
    | Laksevåg TIL                  | 2942        | 352   | Lengde  | Erik Johansson                   | Bergen/La              | 4,92       | 2021.09.29 |
    | Laksevåg TIL                  | 2943        | 344   | 200     | Henrik Iversen                   | Bergen/La              | 27,89      | 2021.09.29 |
    | Laksevåg TIL                  | 2944        | 336   | 100     | Tor Vikane                       | Hamar                  | 13,51      | 2021.08.22 |
    | Laksevåg TIL                  | 2945        | 334   | 200     | Tor Vikane                       | Førde                  | 28,05      | 2021.08.22 |
    | Laksevåg TIL                  | 2946        | 310   | 3000    | Marius Sylta                     | Bergen/La              | 11,10,26   | 2021.09.29 |
    | Laksevåg TIL                  | 2947        | 307   | Lut     | Fredrik Milde                    | Bergen/La              | 2,43       | 2021.09.29 |
    | Laksevåg TIL                  | 2948        | 300   | Stav    | Tor Vikane                       | Førde                  | 2,30       | 2021.08.22 |
    | Laksevåg TIL                  | 2949        | 298   | Hut     | Mikal Grey                       | Bergen/La              | 1,21       | 2021.09.29 |
    | Laksevåg TIL                  | 2950        | 291   | 400     | Tor Vikane                       | Hamar                  | 1,04,68    | 2021.08.22 |
    | Laksevåg TIL                  | 2951        | 290   | 800     | Ronny Haufe                      | Førde                  | 2,30,54    | 2021.08.22 |
    | Laksevåg TIL                  | 2952        | 282   | 3000    | Kristoffer Madsen                | Bergen/La              | 11,23,41   | 2021.09.29 |
    | Laksevåg TIL                  | 2953        | 262   | 200     | Mathias Bø                       | Bergen/La              | 29,23      | 2021.09.29 |
    | Laksevåg TIL                  | 2954        | 261   | 400     | Ronny Haufe                      | Førde                  | 1,05,96    | 2021.08.22 |
    | Laksevåg TIL                  | 2955        | 259   | Lut     | Arvid Grenar                     | Bergen/La              | 2,38       | 2021.09.29 |
    | Laksevåg TIL                  | 2956        | 252   | 3000    | Håvard Aarvik                    | Bergen/La              | 11,37,33   | 2021.09.29 |
    | Laksevåg TIL                  | 2957        | 242   | Spyd    | Øyvind Litland                   | Bergen/La              | 25,00      | 2021.09.29 |
    | Laksevåg TIL                  | 2958        | 233   | Høyde   | Fredrik Milde                    | Bergen/La              | 1,40       | 2021.09.29 |
    | Laksevåg TIL                  | 2959        | 223   | Slegge  | Øyvind Litland                   | Bergen/La              | 17,79      | 2021.09.29 |
    | Laksevåg TIL                  | 2960        | 221   | 200     | Mikal Grey                       | Bergen/La              | 29,95      | 2021.09.29 |
    | Laksevåg TIL                  | 2961        | 219   | Kule    | Øyvind Litland                   | Bergen/La              | 7,13       | 2021.09.29 |
    | Laksevåg TIL                  | 2962        | 207   | Lengde  | Tor Vikane                       | Hamar                  | 4,34       | 2021.08.22 |
    | Laksevåg TIL                  | 2963        | 199   | 100     | Ronny Haufe                      | Bergen/La              | 14,44      | 2021.09.29 |
    | Laksevåg TIL                  | 2964        | 196   | Stav    | Agnar Aadland                    | Hamar                  | 2,00       | 2021.08.22 |
    | Laksevåg TIL                  | 2965        | 175   | 200     | Ronny Haufe                      | Bergen/La              | 30,81      | 2021.09.29 |
    | Laksevåg TIL                  | 2966        | 171   | Diskos  | Øyvind Litland                   | Bergen/La              | 18,52      | 2021.09.29 |
    | Laksevåg TIL                  | 2967        | 158   | 3000H   | Ronny Haufe                      | Førde                  | 14,22,99   | 2021.08.22 |
    | Laksevåg TIL                  | 2968        | 130   | Lut     | Henrik Iversen                   | Bergen/La              | 2,25       | 2021.09.29 |
    | Laksevåg TIL                  | 2969        | 124   | 200     | Jonas Solaas                     | Bergen/La              | 31,79      | 2021.09.29 |
    | Laksevåg TIL                  | 2970        | 111   | Høyde   | Sebastian Dahlstrøm-Teigland     | Bergen/La              | 1,31       | 2021.09.29 |
    | Laksevåg TIL                  | 2971        | 100   | Lut     | Lars Rogne                       | Bergen/La              | 2,22       | 2021.09.29 |
    | Laksevåg TIL                  | 2972        | 96    | Høyde   | Leon Tveit                       | Os                     | 1,30       | 2021.09.26 |
    | Laksevåg TIL                  | 2973        | 96    | Høyde   | Agnar Aadland                    | Hamar                  | 1,30       | 2021.08.22 |
    | Laksevåg TIL                  | 2974        | 95    | 100     | Leon Tveit                       | Bergen/La              | 15,26      | 2021.09.29 |
    | Laksevåg TIL                  | 2975        | 80    | Lengde  | Ronny Haufe                      | Førde                  | 3,85       | 2021.08.22 |
    | Laksevåg TIL                  | 2976        | 61    | 1500    | Tor Vikane                       | Knarvik                | 6,09,33    | 2021.09.23 |
    | Laksevåg TIL                  | 2977        | 50    | Lut     | Mikal Grey                       | Bergen/La              | 2,17       | 2021.09.29 |
    | Laksevåg TIL                  | 2978        | 19    | Høyde   | Kristoffer Milde                 | Bergen/La              | 1,25       | 2021.09.29 |
    | Laksevåg TIL                  | 2979        | 13    | 200     | Christopher Kårbø                | Bergen/La              | 34,11      | 2021.09.29 |
    | Lambertseter IF               | 2980        | 781   | 200     | Emiliano Røgeberg-Ortiz          | Lillehammer            | 22,70      | 2021.09.26 |
    | Lambertseter IF               | 2981        | 767   | 100     | Emiliano Røgeberg-Ortiz          | Jessheim               | 11,30      | 2021.09.09 |
    | Lambertseter IF               | 2982        | 732   | 100     | Christopher Nordlie              | Oslo/St                | 11,45      | 2021.10.16 |
    | Lambertseter IF               | 2983        | 697   | 400     | Emiliano Røgeberg-Ortiz          | Oslo/Bi                | 51,80      | 2021.09.25 |
    | Lambertseter IF               | 2984        | 662   | 200     | Christopher Nordlie              | Oslo/St                | 23,85      | 2021.10.16 |
    | Lambertseter IF               | 2985        | 629   | 200     | William Moe                      | Oslo/St                | 24,19      | 2021.10.16 |
    | Lambertseter IF               | 2986        | 515   | 800     | Emiliano Røgeberg-Ortiz          | Moss                   | 2,10,69    | 2021.10.09 |
    | Lambertseter IF               | 2987        | 496   | 100     | William Moe                      | Oslo/St                | 12,58      | 2021.10.16 |
    | Lambertseter IF               | 2988        | 451   | 200h    | Christopher Nordlie              | Nittedal               | 30,85      | 2021.10.30 |
    | Lambertseter IF               | 2989        | 448   | Lengde  | Christopher Nordlie              | Oslo/St                | 5,32       | 2021.10.16 |
    | Lambertseter IF               | 2990        | 432   | Lengde  | William Moe                      | Oslo/Bi                | 5,25       | 2021.09.25 |
    | Lambertseter IF               | 2991        | 428   | 200     | Noah Ruben                       | Oslo/St                | 26,64      | 2021.10.16 |
    | Lambertseter IF               | 2992        | 427   | 100     | Noah Ruben                       | Oslo/St                | 12,96      | 2021.10.16 |
    | Lambertseter IF               | 2993        | 419   | Høyde   | Emiliano Røgeberg-Ortiz          | Oslo/NIH               | 1,56       | 2021.09.22 |
    | Lambertseter IF               | 2994        | 381   | 200     | Edvin Rooth                      | Oppegård               | 27,32      | 2021.08.22 |
    | Lambertseter IF               | 2995        | 360   | 200     | Sverre Munkvold                  | Nadderud               | 27,63      | 2021.10.16 |
    | Lambertseter IF               | 2996        | 353   | Høyde   | Christopher Nordlie              | Oslo/St                | 1,50       | 2021.10.16 |
    | Lambertseter IF               | 2997        | 300   | 100     | Edvin Rooth                      | Oppegård               | 13,74      | 2021.08.22 |
    | Lambertseter IF               | 2998        | 292   | 1500    | Sverre Munkvold                  | Nadderud               | 5,11,88    | 2021.10.16 |
    | Lambertseter IF               | 2999        | 275   | 100     | Sverre Munkvold                  | Oslo/St                | 13,91      | 2021.10.16 |
    | Lambertseter IF               | 3000        | 260   | 200     | Erlend Ege                       | Oslo/St                | 29,27      | 2021.10.16 |
    | Lambertseter IF               | 3001        | 234   | 800     | Sverre Munkvold                  | Nittedal               | 2,36,49    | 2021.10.30 |
    | Lambertseter IF               | 3002        | 209   | 200     | Eirik Furulund                   | Oslo/St                | 30,17      | 2021.10.16 |
    | Lambertseter IF               | 3003        | 180   | 1500    | Eirik Furulund                   | Oslo/St                | 5,37,39    | 2021.10.16 |
    | Lambertseter IF               | 3004        | 150   | 200     | Mats Klungland                   | Oslo/St                | 31,27      | 2021.10.16 |
    | Lambertseter IF               | 3005        | 96    | Høyde   | Alexander Jernberg               | Oslo/St                | 1,30       | 2021.10.16 |
    | Lambertseter IF               | 3006        | 78    | 200     | Michael Kronstad                 | Oslo/St                | 32,72      | 2021.10.16 |
    | Langesund Triathlonklubb      | 3007        | 586   | 10000   | Viktor Aanesen                   | Kragerø                | 34,48,5    | 2021.10.30 |
    | Langesund Triathlonklubb      | 3008        | 467   | 10000   | Kasper Hartikkala-Pettersen      | Kragerø                | 37,23,1    | 2021.10.30 |
    | Langesund Triathlonklubb      | 3009        | 466   | 10000   | Pål Winberg                      | Kragerø                | 37,25,4    | 2021.10.30 |
    | Langesund Triathlonklubb      | 3010        | 431   | 10000   | Ole Dahl                         | Kragerø                | 38,15,9    | 2021.10.30 |
    | Langesund Triathlonklubb      | 3011        | 215   | 5000    | Per Mustad                       | Kragerø                | 20,55,5    | 2021.10.30 |
    | Langesund Triathlonklubb      | 3012        | 215   | 5000    | Krister Sjøstrøm                 | Kragerø                | 20,55,0    | 2021.10.30 |
    | Langesund Triathlonklubb      | 3013        | 150   | 5000    | Kenneth Åsen                     | Kragerø                | 22,00,4    | 2021.10.30 |
    | Larvik Turn & IF              | 3014        | 943   | 200     | Andreas Kulseng                  | Oslo/Bi                | 21,32      | 2021.09.25 |
    | Larvik Turn & IF              | 3015        | 899   | 100     | Andreas Kulseng                  | Ravnanger              | 10,78      | 2021.09.15 |
    | Larvik Turn & IF              | 3016        | 898   | 400     | Andreas Kulseng                  | Lillehammer            | 47,89      | 2021.09.26 |
    | Larvik Turn & IF              | 3017        | 821   | 200h    | Alfred Hauane                    | Lambertseter           | 25,02      | 2021.10.17 |
    | Larvik Turn & IF              | 3018        | 795   | 400h    | Alfred Hauane                    | Ravnanger              | 54,49      | 2021.09.15 |
    | Larvik Turn & IF              | 3019        | 778   | 200h    | Andreas Kulseng                  | Larvik                 | 25,49      | 2021.09.15 |
    | Larvik Turn & IF              | 3020        | 738   | 400     | Alfred Hauane                    | Oslo/Bi                | 50,93      | 2021.09.25 |
    | Larvik Turn & IF              | 3021        | 734   | 400     | Kristian Steen                   | Ravnanger              | 51,01      | 2021.09.15 |
    | Larvik Turn & IF              | 3022        | 734   | 400h    | Kristian Steen                   | Larvik                 | 56,19      | 2021.09.15 |
    | Larvik Turn & IF              | 3023        | 729   | 200     | Alfred Hauane                    | Porsgrunn              | 23,19      | 2021.09.25 |
    | Larvik Turn & IF              | 3024        | 725   | 200h    | Kristian Steen                   | Larvik                 | 26,14      | 2021.09.15 |
    | Larvik Turn & IF              | 3025        | 720   | Lengde  | Henrik Kulseng                   | Larvik                 | 6,51       | 2021.09.15 |
    | Larvik Turn & IF              | 3026        | 715   | 100     | Henrik Kulseng                   | Jessheim               | 11,52      | 2021.09.09 |
    | Larvik Turn & IF              | 3027        | 710   | 200     | Henrik Kulseng                   | Trondheim              | 23,37      | 2021.09.28 |
    | Larvik Turn & IF              | 3028        | 699   | 100     | Alfred Hauane                    | Larvik                 | 11,59      | 2021.09.15 |
    | Larvik Turn & IF              | 3029        | 682   | 800     | Kristian Steen                   | Oslo/Bi                | 2,00,25    | 2021.09.25 |
    | Larvik Turn & IF              | 3030        | 669   | Lengde  | Kristian Steen                   | Larvik                 | 6,28       | 2021.09.15 |
    | Larvik Turn & IF              | 3031        | 615   | 400h    | Andreas Kulseng                  | Larvik                 | 1,00,28    | 2021.09.15 |
    | Larvik Turn & IF              | 3032        | 601   | 200     | Kristian Steen                   | Larvik                 | 24,49      | 2021.09.15 |
    | Larvik Turn & IF              | 3033        | 577   | 200h    | Henrik Kulseng                   | Larvik                 | 28,39      | 2021.09.15 |
    | Larvik Turn & IF              | 3034        | 576   | 100     | Håkon Sand                       | Larvik                 | 12,17      | 2021.09.15 |
    | Larvik Turn & IF              | 3035        | 574   | Lengde  | Andreas Kulseng                  | Larvik                 | 5,86       | 2021.09.15 |
    | Larvik Turn & IF              | 3036        | 547   | 200     | Håkon Sand                       | Larvik                 | 25,10      | 2021.09.15 |
    | Larvik Turn & IF              | 3037        | 542   | 400     | Håkon Sand                       | Larvik                 | 55,69      | 2021.09.15 |
    | Larvik Turn & IF              | 3038        | 539   | 200     | Ole Gjetrang                     | Larvik                 | 25,20      | 2021.09.15 |
    | Larvik Turn & IF              | 3039        | 523   | 400h    | Ole Gjetrang                     | Larvik                 | 1,04,40    | 2021.09.15 |
    | Larvik Turn & IF              | 3040        | 519   | Lengde  | Alfred Hauane                    | Larvik                 | 5,62       | 2021.09.15 |
    | Larvik Turn & IF              | 3041        | 479   | 400h    | Håkon Sand                       | Larvik                 | 1,06,66    | 2021.09.15 |
    | Larvik Turn & IF              | 3042        | 471   | 200     | Odin Stangvik                    | Larvik                 | 26,06      | 2021.09.15 |
    | Larvik Turn & IF              | 3043        | 444   | 800     | Ole Gjetrang                     | Larvik                 | 2,16,23    | 2021.09.15 |
    | Larvik Turn & IF              | 3044        | 440   | Hut     | Jan Bleivik                      | Hvam                   | 1,30       | 2021.10.23 |
    | Larvik Turn & IF              | 3045        | 426   | Lut     | Jørn Aass                        | Hvam                   | 2,58       | 2021.10.23 |
    | Larvik Turn & IF              | 3046        | 410   | Lengde  | Håkon Sand                       | Larvik                 | 5,16       | 2021.09.15 |
    | Larvik Turn & IF              | 3047        | 404   | 200h    | Ole Gjetrang                     | Larvik                 | 31,81      | 2021.09.15 |
    | Larvik Turn & IF              | 3048        | 397   | Høyde   | Håkon Sand                       | Larvik                 | 1,54       | 2021.09.15 |
    | Larvik Turn & IF              | 3049        | 356   | 1500    | Ole Gjetrang                     | Larvik                 | 4,59,07    | 2021.09.15 |
    | Larvik Turn & IF              | 3050        | 353   | Spyd    | Åge Pettersen                    | Larvik                 | 31,39      | 2021.09.15 |
    | Larvik Turn & IF              | 3051        | 345   | Slegge  | Jostein Myrvang                  | Sandefjord             | 23,56      | 2021.09.12 |
    | Larvik Turn & IF              | 3052        | 302   | Diskos  | Jostein Myrvang                  | Sandefjord             | 23,13      | 2021.09.12 |
    | Larvik Turn & IF              | 3053        | 222   | 200     | Håkon Holth                      | Greveskogen            | 29,94      | 2021.10.30 |
    | Larvik Turn & IF              | 3054        | 196   | Kule    | Jostein Myrvang                  | Sandefjord             | 6,86       | 2021.09.12 |
    | Larvik Turn & IF              | 3055        | 194   | 200     | Vetle Bye                        | Greveskogen            | 30,45      | 2021.10.30 |
    | Larvik Turn & IF              | 3056        | 173   | 1500    | Sigurd Sjulstad                  | Larvik                 | 5,39,25    | 2021.09.15 |
    | Larvik Turn & IF              | 3057        | 164   | 200     | Nikolai Nordby                   | Larvik                 | 31,01      | 2021.09.15 |
    | Larvik Turn & IF              | 3058        | 150   | Kule    | Håvard Wannebo                   | Larvik                 | 6,35       | 2021.09.15 |
    | Larvik Turn & IF              | 3059        | 141   | 800     | Sigurd Sjulstad                  | Larvik                 | 2,47,14    | 2021.09.15 |
    | Larvik Turn & IF              | 3060        | 125   | 400     | Vetle Bye                        | Larvik                 | 1,12,24    | 2021.09.15 |
    | Larvik Turn & IF              | 3061        | 125   | Høyde   | Håkon Holth                      | Larvik                 | 1,32       | 2021.09.15 |
    | Larvik Turn & IF              | 3062        | 82    | 200     | Sigurd Sjulstad                  | Greveskogen            | 32,65      | 2021.10.30 |
    | Larvik Turn & IF              | 3063        | 19    | Høyde   | Emilian Haugen                   | Larvik                 | 1,25       | 2021.09.15 |
    | Leinstrand IL                 | 3064        | 608   | 3000K   | Magnus Græsli                    | Steinkjer              | 13.29,24   | 2021.09.30 |
    | Leinstrand IL                 | 3065        | 579   | 10000K  | Magnus Græsli                    | Haugesund              | 48,45,34   | 2021.09.12 |
    | Leinstrand IL                 | 3066        | 561   | 5000K   | Magnus Græsli                    | Kristiansand           | 23,23,39   | 2021.10.06 |
    | Leinstrand IL                 | 3067        | 491   | Lut     | Ivar Njøs                        | Hvam                   | 2,68       | 2021.10.23 |
    | Lillehammer IF                | 3068        | 899   | 10000   | Petter Johansen                  | Kristiansand           | 29,31,54   | 2021.10.06 |
    | Lillehammer IF                | 3069        | 897   | 3000    | Elmer Skalle                     | Jessheim               | 8,11,86    | 2021.09.09 |
    | Lillehammer IF                | 3070        | 895   | 3000    | Petter Johansen                  | Jessheim               | 8,12,33    | 2021.09.09 |
    | Lillehammer IF                | 3071        | 876   | 5000    | Petter Johansen                  | Oslo/Bi                | 14,16,66   | 2021.09.25 |
    | Lillehammer IF                | 3072        | 870   | 100     | Tormod Larsen                    | Jessheim               | 10,89      | 2021.09.09 |
    | Lillehammer IF                | 3073        | 866   | 1500    | Elmer Skalle                     | Oslo/Bi                | 3,49,80    | 2021.09.25 |
    | Lillehammer IF                | 3074        | 844   | 3000    | Mikkel Thomassen                 | Trondheim              | 8,23,27    | 2021.09.28 |
    | Lillehammer IF                | 3075        | 841   | 800     | Elmer Skalle                     | Lillehammer            | 1,52,96    | 2021.09.26 |
    | Lillehammer IF                | 3076        | 838   | 200     | Tormod Larsen                    | Lillehammer            | 22,19      | 2021.09.26 |
    | Lillehammer IF                | 3077        | 810   | 5000    | Mikkel Thomassen                 | Oslo/Bi                | 14,43,48   | 2021.09.25 |
    | Lillehammer IF                | 3078        | 804   | 1500    | Petter Johansen                  | Oslo/Bi                | 3,55,62    | 2021.09.25 |
    | Lillehammer IF                | 3079        | 788   | 1500    | Mikkel Thomassen                 | Kristiansand           | 3,57,23    | 2021.10.06 |
    | Lillehammer IF                | 3080        | 740   | 3000    | Kristoffer Skonnord              | Jessheim               | 8,46,96    | 2021.09.09 |
    | Lillehammer IF                | 3081        | 726   | 5000    | Kristoffer Skonnord              | Lillehammer            | 15,21,18   | 2021.09.26 |
    | Lillehammer IF                | 3082        | 717   | 10000   | Kristoffer Skonnord              | Lillehammer            | 32,22,34   | 2021.09.26 |
    | Lillehammer IF                | 3083        | 707   | 800     | Mikkel Thomassen                 | Nittedal               | 1,58,97    | 2021.10.30 |
    | Lillehammer IF                | 3084        | 706   | 800     | Petter Johansen                  | Lillehammer            | 1,59,03    | 2021.09.26 |
    | Lillehammer IF                | 3085        | 705   | Hut     | Hallgeir Høgåsen                 | Lillehammer            | 1,53       | 2021.09.26 |
    | Lillehammer IF                | 3086        | 702   | 10000   | Simen Berge                      | Lillehammer            | 32,37,17   | 2021.09.26 |
    | Lillehammer IF                | 3087        | 695   | 10000   | Magnus Salberg                   | Oslo/Bi                | 32,44,91   | 2021.09.25 |
    | Lillehammer IF                | 3088        | 688   | Lut     | Michael Rosenberg                | Lillehammer            | 3,03       | 2021.09.26 |
    | Lillehammer IF                | 3089        | 665   | 5000    | Magnus Salberg                   | Oslo/Bi                | 15,50,07   | 2021.09.25 |
    | Lillehammer IF                | 3090        | 658   | 3000    | Magnus Salberg                   | Lillehammer            | 9,08,18    | 2021.09.26 |
    | Lillehammer IF                | 3091        | 657   | 5000    | Simen Berge                      | Lillehammer            | 15,53,94   | 2021.09.26 |
    | Lillehammer IF                | 3092        | 640   | 1500    | Lauritz Menkerud                 | Nadderud               | 4,13,84    | 2021.10.16 |
    | Lillehammer IF                | 3093        | 620   | 3000    | Simen Berge                      | Lillehammer            | 9,18,67    | 2021.09.26 |
    | Lillehammer IF                | 3094        | 617   | 3000    | Oliver Plassen-Brandvol          | Lillehammer            | 9,19,62    | 2021.09.26 |
    | Lillehammer IF                | 3095        | 588   | Lut     | Tormod Larsen                    | Lillehammer            | 2,85       | 2021.09.26 |
    | Lillehammer IF                | 3096        | 583   | 800     | Lauritz Menkerud                 | Lillehammer            | 2,05,99    | 2021.09.26 |
    | Lillehammer IF                | 3097        | 576   | 3000    | Marius Strandhaug                | Lillehammer            | 9,31,86    | 2021.09.26 |
    | Lillehammer IF                | 3098        | 566   | 1500    | Elyas Negassi                    | Lillehammer            | 4,23,93    | 2021.09.26 |
    | Lillehammer IF                | 3099        | 560   | Høyde   | Hallgeir Høgåsen                 | Lillehammer            | 1,70       | 2021.09.26 |
    | Lillehammer IF                | 3100        | 538   | 3000    | Truls Horten                     | Lillehammer            | 9,43,82    | 2021.09.26 |
    | Lillehammer IF                | 3101        | 531   | 10000   | Terje Gulbrandsen                | Lillehammer            | 35,57,16   | 2021.09.26 |
    | Lillehammer IF                | 3102        | 528   | 5000    | Marius Strandhaug                | Lillehammer            | 17,03,76   | 2021.09.26 |
    | Lillehammer IF                | 3103        | 527   | 5000    | Terje Gulbrandsen                | Førde                  | 17,04,61   | 2021.08.22 |
    | Lillehammer IF                | 3104        | 523   | 100     | Henrik Melbø-Hammershaug         | Lillehammer            | 12,44      | 2021.09.26 |
    | Lillehammer IF                | 3105        | 515   | 1500    | Oscar Opsann                     | Lillehammer            | 4,31,57    | 2021.09.26 |
    | Lillehammer IF                | 3106        | 509   | 800     | Truls Horten                     | Lillehammer            | 2,11,08    | 2021.09.26 |
    | Lillehammer IF                | 3107        | 509   | 3000    | Jacob Mollatt                    | Lillehammer            | 9,53,26    | 2021.09.26 |
    | Lillehammer IF                | 3108        | 504   | 400     | Lauritz Menkerud                 | Lillehammer            | 56,82      | 2021.09.26 |
    | Lillehammer IF                | 3109        | 499   | 1500    | Einar Rose                       | Lillehammer            | 4,33,99    | 2021.09.26 |
    | Lillehammer IF                | 3110        | 496   | 3000    | Vemund Lien                      | Lillehammer            | 9,57,70    | 2021.09.26 |
    | Lillehammer IF                | 3111        | 480   | 5000    | Frode Nybakken                   | Lillehammer            | 17,32,82   | 2021.09.26 |
    | Lillehammer IF                | 3112        | 466   | 400     | Henrik Melbø-Hammershaug         | Lillehammer            | 58,05      | 2021.09.26 |
    | Lillehammer IF                | 3113        | 464   | Kule    | Thomas Kjæreng                   | Lillehammer            | 10,20      | 2021.09.26 |
    | Lillehammer IF                | 3114        | 456   | 1500    | Vetle Brekmo                     | Lillehammer            | 4,41,18    | 2021.09.26 |
    | Lillehammer IF                | 3115        | 453   | 1500    | Vemund Lien                      | Lillehammer            | 4,41,53    | 2021.09.26 |
    | Lillehammer IF                | 3116        | 449   | 200     | Henrik Melbø-Hammershaug         | Rjukan                 | 26,34      | 2021.09.12 |
    | Lillehammer IF                | 3117        | 444   | 3000    | Morten Solbakken                 | Lillehammer            | 10,16,36   | 2021.09.26 |
    | Lillehammer IF                | 3118        | 428   | 1500    | Henrik Melbø-Hammershaug         | Lillehammer            | 4,45,99    | 2021.09.26 |
    | Lillehammer IF                | 3119        | 423   | 800     | Henrik Melbø-Hammershaug         | Lillehammer            | 2,18,00    | 2021.09.26 |
    | Lillehammer IF                | 3120        | 423   | 800     | Vemund Lien                      | Lillehammer            | 2,18,03    | 2021.09.26 |
    | Lillehammer IF                | 3121        | 420   | 3000    | Sander Stenseth                  | Lillehammer            | 10,25,05   | 2021.09.26 |
    | Lillehammer IF                | 3122        | 416   | 1500    | Benjamin Solbrekke               | Lillehammer            | 4,48,08    | 2021.09.26 |
    | Lillehammer IF                | 3123        | 413   | 800     | Vetle Brekmo                     | Lillehammer            | 2,18,86    | 2021.09.26 |
    | Lillehammer IF                | 3124        | 413   | 800     | Benjamin Solbrekke               | Lillehammer            | 2,18,89    | 2021.09.26 |
    | Lillehammer IF                | 3125        | 408   | Tresteg | Henrik Melbø-Hammershaug         | Rjukan                 | 10,66      | 2021.09.12 |
    | Lillehammer IF                | 3126        | 403   | 3000    | Einar Rose                       | Lillehammer            | 10,31,59   | 2021.09.26 |
    | Lillehammer IF                | 3127        | 374   | Lengde  | Henrik Melbø-Hammershaug         | Jessheim               | 5,01       | 2021.09.09 |
    | Lillehammer IF                | 3128        | 366   | 5000    | Erling Moe                       | Lillehammer            | 18,49,14   | 2021.09.26 |
    | Lillehammer IF                | 3129        | 361   | Diskos  | Thomas Kjæreng                   | Lillehammer            | 25,32      | 2021.09.26 |
    | Lillehammer IF                | 3130        | 327   | 3000    | Vetle Brekmo                     | Lillehammer            | 11,02,96   | 2021.09.26 |
    | Lillehammer IF                | 3131        | 272   | 100     | Ragnar Kristjansson              | Lillehammer            | 13,93      | 2021.09.26 |
    | Lillehammer IF                | 3132        | 263   | 200     | Ragnar Kristjansson              | Lillehammer            | 29,21      | 2021.09.26 |
    | Lillehammer IF                | 3133        | 260   | 200     | Benjamin Solbrekke               | Lillehammer            | 29,26      | 2021.09.26 |
    | Lillehammer IF                | 3134        | 257   | 200     | Jonathan Magnus                  | Lillehammer            | 29,32      | 2021.09.26 |
    | Lillehammer IF                | 3135        | 208   | Kule    | Halvard Finsrud                  | Brandbu                | 7,00       | 2021.09.25 |
    | Lillehammer IF                | 3136        | 208   | 1500    | Reinhard Kuhs                    | Lillehammer            | 5,30,62    | 2021.09.26 |
    | Lillehammer IF                | 3137        | 202   | 100     | Jonathan Magnus                  | Lillehammer            | 14,42      | 2021.09.26 |
    | Lillehammer IF                | 3138        | 193   | Spyd    | Halvard Finsrud                  | Lillehammer            | 22,48      | 2021.09.26 |
    | Lillehammer IF                | 3139        | 188   | Diskos  | Halvard Finsrud                  | Brandbu                | 19,12      | 2021.09.25 |
    | Lillehammer IF                | 3140        | 178   | Slegge  | Halvard Finsrud                  | Brandbu                | 15,90      | 2021.09.25 |
    | Lillehammer IF                | 3141        | 144   | 1500    | Eivind Nybakken                  | Førde                  | 5,46,34    | 2021.08.22 |
    | Lillehammer IF                | 3142        | 118   | 3000    | Eivind Nybakken                  | Førde                  | 12,53,35   | 2021.08.22 |
    | Lillehammer IF                | 3143        | 81    | 200     | Eirik Solbrekke                  | Lillehammer            | 32,66      | 2021.09.26 |
    | Lillehammer IF                | 3144        | 79    | 200     | Iver Moen                        | Lillehammer            | 32,71      | 2021.09.26 |
    | Lillehammer IF                | 3145        | 71    | 200     | Halvor Melbø                     | Lillehammer            | 32,88      | 2021.09.26 |
    | Lillehammer IF                | 3146        | 52    | 200     | Håkon Melbø                      | Lillehammer            | 33,27      | 2021.09.26 |
    | Lillesand IL                  | 3147        | 583   | Lut     | Jan Bjorvatn                     | Grimstad               | 2,84       | 2021.10.25 |
    | Loddefjord IL                 | 3148        | 353   | Høyde   | Bjørnar Haugen                   | Fana                   | 1,50       | 2021.09.28 |
    | Loddefjord IL                 | 3149        | 306   | 200     | Brage Kvinge                     | Fana                   | 28,49      | 2021.09.28 |
    | Loddefjord IL                 | 3150        | 273   | Lengde  | Brage Kvinge                     | Fana                   | 4,60       | 2021.09.28 |
    | Loddefjord IL                 | 3151        | 83    | 1500    | Leon Sandvik                     | Fana                   | 6,03,19    | 2021.09.28 |
    | Loddefjord IL                 | 3152        | 19    | Høyde   | Leon Espeli                      | Os                     | 1,25       | 2021.09.26 |
    | Loddefjord IL                 | 3153        | 19    | Høyde   | Leon Sandvik                     | Os                     | 1,25       | 2021.09.26 |
    | Lyn Ski                       | 3154        | 580   | 10000   | Nicolay Sevang                   | Oslo/Bi                | 34,55,96   | 2021.09.25 |
    | Lyn Ski                       | 3155        | 138   | 200     | Aksel Osnes-Ringen               | Jessheim               | 31,51      | 2021.09.09 |
    | Lyngdal IL                    | 3156        | 533   | Slegge  | Torrey Enoksen                   | Kristiansand           | 34,54      | 2021.10.06 |
    | Lyngdal IL                    | 3157        | 355   | 800     | Sindre Netland                   | Grimstad               | 2,24,11    | 2021.10.25 |
    | Lyngdal IL                    | 3158        | 347   | Lengde  | Petter Fleseland                 | Lyngdal                | 4,90       | 2021.09.26 |
    | Lyngdal IL                    | 3159        | 317   | 200     | Petter Fleseland                 | Lyngdal                | 28,32      | 2021.09.26 |
    | Lyngdal IL                    | 3160        | 317   | 100     | Jonah Flottorp                   | Lyngdal                | 13,63      | 2021.09.26 |
    | Lyngdal IL                    | 3161        | 311   | 100     | Petter Fleseland                 | Lyngdal                | 13,67      | 2021.09.26 |
    | Lyngdal IL                    | 3162        | 240   | Lengde  | Jonah Flottorp                   | Lyngdal                | 4,47       | 2021.09.26 |
    | Lyngdal IL                    | 3163        | 77    | Lengde  | Jesper Havaas                    | Lyngdal                | 3,84       | 2021.09.26 |
    | Lysekloster Idrettslag        | 3164        | 330   | Høyde   | Aksel Sørstrømmen                | Os                     | 1,48       | 2021.09.26 |
    | Lysekloster Idrettslag        | 3165        | 164   | 200     | Aksel Sørstrømmen                | Os                     | 31,01      | 2021.09.26 |
    | Lysekloster Idrettslag        | 3166        | 100   | 200     | Herman Onstad                    | Fana                   | 32,27      | 2021.09.28 |
    | Lånke IL Friidrett            | 3167        | 432   | 200     | Oddvar Rønning                   | Stjørdal               | 26,58      | 2021.10.23 |
    | Lånke IL Friidrett            | 3168        | 408   | 3000    | Arild Moen                       | Stjørdal               | 10,29,6    | 2021.10.23 |
    | Lånke IL Friidrett            | 3169        | 405   | 3000    | Oddvar Rønning                   | Stjørdal               | 10,30,7    | 2021.10.23 |
    | Lånke IL Friidrett            | 3170        | 397   | 3000    | Oddbjørn Fjæran                  | Stjørdal               | 10,34,0    | 2021.10.23 |
    | Lånke IL Friidrett            | 3171        | 385   | 5000    | Oddbjørn Fjæran                  | Stjørdal               | 18,35,83   | 2021.10.23 |
    | Lånke IL Friidrett            | 3172        | 379   | 1500    | Arild Moen                       | Stjørdal               | 4,54,8     | 2021.10.23 |
    | Lånke IL Friidrett            | 3173        | 377   | 1500    | Oddvar Rønning                   | Stjørdal               | 4,55,1     | 2021.10.23 |
    | Lånke IL Friidrett            | 3174        | 367   | Hut     | Ivar Stokkan                     | Stjørdal               | 1,25       | 2021.10.23 |
    | Lånke IL Friidrett            | 3175        | 366   | 3000    | Stian Rønning                    | Stjørdal               | 10,46,5    | 2021.10.23 |
    | Lånke IL Friidrett            | 3176        | 343   | 1500    | Oddbjørn Fjæran                  | Stjørdal               | 5,01,7     | 2021.10.23 |
    | Lånke IL Friidrett            | 3177        | 342   | 5000    | Oddvar Rønning                   | Stjørdal               | 19,07,51   | 2021.10.23 |
    | Lånke IL Friidrett            | 3178        | 296   | 1500    | Stian Rønning                    | Stjørdal               | 5,11,0     | 2021.10.23 |
    | Lånke IL Friidrett            | 3179        | 277   | 400     | Oddvar Rønning                   | Stjørdal               | 1,05,31    | 2021.10.23 |
    | Lånke IL Friidrett            | 3180        | 240   | Lut     | Edvard Sjåstad                   | Stjørdal               | 2,36       | 2021.10.23 |
    | Lånke IL Friidrett            | 3181        | 140   | Lut     | Ivar Stokkan                     | Stjørdal               | 2,26       | 2021.10.23 |
    | Lånke IL Friidrett            | 3182        | 110   | Lut     | Jan Sjåstad                      | Stjørdal               | 2,23       | 2021.10.23 |
    | Lånke IL Friidrett            | 3183        | 96    | Høyde   | Ivar Stokkan                     | Stjørdal               | 1,30       | 2021.10.23 |
    | Lånke IL Friidrett            | 3184        | 95    | Stav    | Ivar Nilssen                     | Stjørdal               | 1,75       | 2021.10.23 |
    | Lørenskog Friidrettslag       | 3185        | 718   | 100     | Daniel Debesay                   | Trondheim              | 11,51      | 2021.09.28 |
    | Lørenskog Friidrettslag       | 3186        | 693   | 200     | Daniel Debesay                   | Trondheim              | 23,54      | 2021.09.28 |
    | Lørenskog Friidrettslag       | 3187        | 689   | 200     | Zion Ramirez                     | Oslo/St                | 23,58      | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3188        | 642   | 100     | Zion Ramirez                     | Lillehammer            | 11,85      | 2021.09.26 |
    | Lørenskog Friidrettslag       | 3189        | 626   | 800     | Ahmed Heyabu                     | Lillehammer            | 2,03,36    | 2021.09.26 |
    | Lørenskog Friidrettslag       | 3190        | 625   | 400     | Zion Ramirez                     | Nittedal               | 53,46      | 2021.10.30 |
    | Lørenskog Friidrettslag       | 3191        | 623   | 200     | André Silva                      | Oslo/St                | 24,25      | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3192        | 613   | Lengde  | Daniel Debesay                   | Trondheim              | 6,03       | 2021.09.28 |
    | Lørenskog Friidrettslag       | 3193        | 607   | 400     | André Silva                      | Jessheim               | 53,91      | 2021.09.09 |
    | Lørenskog Friidrettslag       | 3194        | 594   | 100     | André Silva                      | Jessheim               | 12,08      | 2021.09.09 |
    | Lørenskog Friidrettslag       | 3195        | 586   | 100     | Elijah Ramirez                   | Lillehammer            | 12,12      | 2021.09.26 |
    | Lørenskog Friidrettslag       | 3196        | 582   | 200     | Elijah Ramirez                   | Lillehammer            | 24,70      | 2021.09.26 |
    | Lørenskog Friidrettslag       | 3197        | 569   | 200     | Sondre Lehmann                   | Lillestrøm             | 24,85      | 2021.08.29 |
    | Lørenskog Friidrettslag       | 3198        | 560   | Høyde   | André Silva                      | Oslo/St                | 1,70       | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3199        | 551   | 1500    | Ahmed Heyabu                     | Jessheim               | 4,26,09    | 2021.09.09 |
    | Lørenskog Friidrettslag       | 3200        | 500   | 400     | Ahmed Heyabu                     | Nittedal               | 56,96      | 2021.10.30 |
    | Lørenskog Friidrettslag       | 3201        | 493   | 200     | Ahmed Heyabu                     | Lillestrøm             | 25,77      | 2021.08.29 |
    | Lørenskog Friidrettslag       | 3202        | 461   | 200     | Casey Felde                      | Lillehammer            | 26,19      | 2021.09.26 |
    | Lørenskog Friidrettslag       | 3203        | 439   | 200     | David Torres                     | Jessheim               | 26,49      | 2021.09.09 |
    | Lørenskog Friidrettslag       | 3204        | 436   | Lengde  | André Silva                      | Oslo/St                | 5,27       | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3205        | 433   | Lut     | Michael Donoso                   | Hvam                   | 2,59       | 2021.10.23 |
    | Lørenskog Friidrettslag       | 3206        | 358   | 100     | David Torres                     | Nittedal               | 13,37      | 2021.10.30 |
    | Lørenskog Friidrettslag       | 3207        | 346   | Kule    | Michael Donoso                   | Oslo/St                | 8,66       | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3208        | 320   | 200     | Espen Hansen                     | Oslo/St                | 28,27      | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3209        | 307   | 200     | August Nordvang                  | Jessheim               | 28,47      | 2021.09.09 |
    | Lørenskog Friidrettslag       | 3210        | 300   | 200     | William Bowitz                   | Nittedal               | 28,59      | 2021.10.30 |
    | Lørenskog Friidrettslag       | 3211        | 280   | Lengde  | Anthon Tran                      | Lillestrøm             | 4,63       | 2021.08.29 |
    | Lørenskog Friidrettslag       | 3212        | 277   | 200     | Elias Pettersen                  | Lillehammer            | 28,98      | 2021.09.26 |
    | Lørenskog Friidrettslag       | 3213        | 273   | 200     | Michael Donoso                   | Oslo/St                | 28,8       | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3214        | 250   | Lengde  | Espen Hansen                     | Oslo/St                | 4,51       | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3215        | 211   | 200     | Espen Nygaard                    | Oslo/St                | 29,9       | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3216        | 205   | Diskos  | Michael Donoso                   | Oslo/St                | 19,69      | 2021.10.16 |
    | Lørenskog Friidrettslag       | 3217        | 180   | Lut     | Espen Nygaard                    | Hvam                   | 2,30       | 2021.10.23 |
    | Lørenskog Friidrettslag       | 3218        | 106   | 200     | Even Pettersen                   | Lillehammer            | 32,16      | 2021.09.26 |
    | Lørenskog Friidrettslag       | 3219        | 66    | Lengde  | Michael Donoso                   | Oslo/St                | 3,80       | 2021.10.16 |
    | Løten Friidrett               | 3220        | 804   | Slegge  | Marius Grinden                   | Løten                  | 54,01      | 2021.08.14 |
    | Løten Friidrett               | 3221        | 799   | Slegge  | Truls Olsen                      | Kristiansand           | 53,62      | 2021.10.06 |
    | Løten Friidrett               | 3222        | 630   | Slegge  | Kjetil Aasen                     | Løten                  | 41,11      | 2021.08.14 |
    | Løten Friidrett               | 3223        | 460   | Diskos  | Arild Busterud                   | Greveskogen            | 29,24      | 2021.10.30 |
    | Løten Friidrett               | 3224        | 351   | Diskos  | Kjetil Aasen                     | Løten                  | 24,92      | 2021.08.14 |
    | Mandal & Halse IL             | 3225        | 577   | 800     | Oddne Nørve                      | Kristiansand           | 2,06,37    | 2021.10.06 |
    | Mandal & Halse IL             | 3226        | 448   | 400     | Simon Håkonsen                   | Lyngdal                | 58,67      | 2021.09.26 |
    | Mandal & Halse IL             | 3227        | 431   | 1500    | Lauritz Dyrkolbotn               | Tvedestrand            | 4,45,49    | 2021.09.15 |
    | Mandal & Halse IL             | 3228        | 359   | Lengde  | Sondre Sætren                    | Mandal                 | 4,95       | 2021.08.18 |
    | Mandal & Halse IL             | 3229        | 327   | Tresteg | Sondre Sætren                    | Søgne                  | 9,97       | 2021.10.05 |
    | Mandal & Halse IL             | 3230        | 281   | 800     | Lauritz Dyrkolbotn               | Lyngdal                | 2,31,55    | 2021.09.26 |
    | Mandal & Halse IL             | 3231        | 215   | 100     | Elias Kvanvig                    | Tvedestrand            | 14,33      | 2021.09.15 |
    | Mandal & Halse IL             | 3232        | 119   | Lengde  | Elias Kvanvig                    | Mandal                 | 4,00       | 2021.08.18 |
    | Markabygda IL                 | 3233        | 429   | 3000    | Kjell Skaret                     | Stjørdal               | 10,22,0    | 2021.10.23 |
    | Markabygda IL                 | 3234        | 426   | 3000    | Mats Heggelund                   | Stjørdal               | 10,23,0    | 2021.10.23 |
    | Markabygda IL                 | 3235        | 389   | 1500    | Kjell Skaret                     | Stjørdal               | 4,52,9     | 2021.10.23 |
    | Markabygda IL                 | 3236        | 79    | 1500    | Anders Skjerve                   | Stjørdal               | 6,04,2     | 2021.10.23 |
    | Markane IL                    | 3237        | 543   | 5000    | Oskar Breivik                    | Byrkjelo               | 16,55,17   | 2021.10.31 |
    | Medkila Skilag                | 3238        | 313   | 1500    | Filip Klæboe-Solemdal            | Harstad                | 5,07,65    | 2021.09.25 |
    | Midsund IL                    | 3239        | 642   | 400     | Oliver Hole                      | Lillehammer            | 53,06      | 2021.09.26 |
    | Midsund IL                    | 3240        | 634   | 100     | Moritz Miltz                     | Molde                  | 11,89      | 2021.06.20 |
    | Midsund IL                    | 3241        | 633   | 200     | Moritz Miltz                     | Lillehammer            | 24,15      | 2021.09.26 |
    | Midsund IL                    | 3242        | 575   | 400     | Moritz Miltz                     | Lillehammer            | 54,77      | 2021.09.26 |
    | Midsund IL                    | 3243        | 534   | 800     | Oliver Hole                      | Lillehammer            | 2,09,26    | 2021.09.26 |
    | Midsund IL                    | 3244        | 379   | Lengde  | Moritz Miltz                     | Byrkjelo               | 5,03       | 2021.10.31 |
    | Midsund IL                    | 3245        | 139   | 200     | Ole Hole                         | Molde                  | 31,49      | 2021.06.20 |
    | Midsund IL                    | 3246        | 122   | 200     | Lars Lous                        | Ulsteinvik             | 31,84      | 2021.10.28 |
    | Midsund IL                    | 3247        | 24    | 200     | Ådne Søvde                       | Ulsteinvik             | 33,87      | 2021.10.28 |
    | Midtbygdens IL                | 3248        | 366   | 200     | Kristian Meyer                   | Ålgård                 | 27,55      | 2021.09.20 |
    | Midtbygdens IL                | 3249        | 295   | Høyde   | Kristian Meyer                   | Sandnes                | 1,45       | 2021.10.28 |
    | Midtbygdens IL                | 3250        | 283   | 100     | Kristian Meyer                   | Sandnes                | 13,85      | 2021.10.28 |
    | Midtbygdens IL                | 3251        | 233   | Høyde   | Stian Haukelid                   | Tau                    | 1,40       | 2021.06.10 |
    | Midtbygdens IL                | 3252        | 175   | 200     | Arnbjørn Næss                    | Stavanger              | 30,81      | 2021.10.27 |
    | Midtbygdens IL                | 3253        | 162   | 1500    | Stian Haukelid                   | Sandnes                | 5,41,93    | 2021.10.28 |
    | Midtbygdens IL                | 3254        | 147   | 100     | Stian Haukelid                   | Frøyland               | 14,84      | 2021.09.07 |
    | Midtbygdens IL                | 3255        | 129   | 200     | Stian Haukelid                   | Stavanger              | 31,70      | 2021.10.27 |
    | Midtbygdens IL                | 3256        | 119   | Lengde  | Stian Haukelid                   | Tau                    | 4,00       | 2021.06.10 |
    | Midtbygdens IL                | 3257        | 118   | 100     | Arnbjørn Næss                    | Frøyland               | 15,07      | 2021.09.07 |
    | Midtbygdens IL                | 3258        | 96    | Høyde   | Arnbjørn Næss                    | Sandnes                | 1,30       | 2021.10.28 |
    | Midtbygdens IL                | 3259        | 95    | 200     | Adrian Bolsøy                    | Stavanger              | 32,38      | 2021.10.27 |
    | Midtbygdens IL                | 3260        | 48    | 100     | Adrian Bolsøy                    | Frøyland               | 15,65      | 2021.09.07 |
    | Midtbygdens IL                | 3261        | 19    | Høyde   | Adrian Bolsøy                    | Tau                    | 1,25       | 2021.06.10 |
    | Mjøndalen IL                  | 3262        | 483   | 3000    | Sander Werket-Haug               | Sande                  | 10,02,5    | 2021.10.07 |
    | Mjøndalen IL                  | 3263        | 314   | 3000    | Håvard Stærkebye                 | Notodden               | 11,08,7    | 2021.10.06 |
    | Mjøsdalen IL                  | 3264        | 659   | 100     | Leon Kalleklev                   | Osterøy                | 11,77      | 2021.10.24 |
    | Mjøsdalen IL                  | 3265        | 629   | 200     | Leon Kalleklev                   | Arna                   | 24,19      | 2021.10.13 |
    | Mjøsdalen IL                  | 3266        | 629   | 100     | Martin Hanstvedt                 | Osterøy                | 11,91      | 2021.10.24 |
    | Mjøsdalen IL                  | 3267        | 605   | 800     | Brage Hanstveit                  | Fana                   | 2,04,56    | 2021.09.28 |
    | Mjøsdalen IL                  | 3268        | 602   | 100     | Tristan Ahmer                    | Osterøy                | 12,04      | 2021.10.24 |
    | Mjøsdalen IL                  | 3269        | 600   | Lut     | Martin Hanstvedt                 | Osterøy                | 2,87       | 2021.10.24 |
    | Mjøsdalen IL                  | 3270        | 588   | 3000    | Brage Hanstveit                  | Osterøy                | 9,28,31    | 2021.10.24 |
    | Mjøsdalen IL                  | 3271        | 557   | 200     | Martin Hanstvedt                 | Arna                   | 24,98      | 2021.10.13 |
    | Mjøsdalen IL                  | 3272        | 556   | 5000    | Jonas Skjerven                   | Arna                   | 16,47,85   | 2021.10.13 |
    | Mjøsdalen IL                  | 3273        | 552   | 200     | Tristan Ahmer                    | Osterøy                | 25,04      | 2021.10.24 |
    | Mjøsdalen IL                  | 3274        | 547   | 400     | Leon Kalleklev                   | Arna                   | 55,53      | 2021.10.13 |
    | Mjøsdalen IL                  | 3275        | 540   | 400     | Brage Hanstveit                  | Osterøy                | 55,6       | 2021.10.24 |
    | Mjøsdalen IL                  | 3276        | 534   | 3000    | Jonas Skjerven                   | Osterøy                | 9,44,99    | 2021.10.24 |
    | Mjøsdalen IL                  | 3277        | 495   | Lengde  | Tristan Ahmer                    | Arna                   | 5,52       | 2021.10.13 |
    | Mjøsdalen IL                  | 3278        | 488   | 200h    | Leon Kalleklev                   | Leikvang               | 30,12      | 2021.08.29 |
    | Mjøsdalen IL                  | 3279        | 461   | Høyde   | Leon Kalleklev                   | Arna                   | 1,60       | 2021.10.13 |
    | Mjøsdalen IL                  | 3280        | 459   | 1500    | Jonas Skjerven                   | Arna                   | 4,40,54    | 2021.10.13 |
    | Mjøsdalen IL                  | 3281        | 408   | Høyde   | Tristan Ahmer                    | Arna                   | 1,55       | 2021.10.13 |
    | Mjøsdalen IL                  | 3282        | 327   | Kule    | Bjørn Øvsthus                    | Mjøsdalen              | 8,42       | 2021.06.30 |
    | Mjøsdalen IL                  | 3283        | 310   | 5000    | Martin Kåstad                    | Osterøy                | 19,32,4    | 2021.10.24 |
    | Mjøsdalen IL                  | 3284        | 300   | Lengde  | Leon Kalleklev                   | Osterøy                | 4,71       | 2021.10.24 |
    | Mjøsdalen IL                  | 3285        | 296   | 3000    | Magne Espelid                    | Osterøy                | 11,16,7    | 2021.10.24 |
    | Mjøsdalen IL                  | 3286        | 288   | Lengde  | Finn Røsland                     | Mjøsdalen              | 4,66       | 2021.06.30 |
    | Mjøsdalen IL                  | 3287        | 285   | Kule    | Tom Mjøs                         | Mjøsdalen              | 7,91       | 2021.06.30 |
    | Mjøsdalen IL                  | 3288        | 285   | 5000    | Magne Espelid                    | Osterøy                | 19,52,83   | 2021.10.24 |
    | Mjøsdalen IL                  | 3289        | 280   | 3000    | Bjørn Kleppe                     | Osterøy                | 11,24,2    | 2021.10.24 |
    | Mjøsdalen IL                  | 3290        | 278   | Lut     | Ola Tveiten                      | Mjøsdalen              | 2,40       | 2021.06.30 |
    | Mjøsdalen IL                  | 3291        | 265   | Kule    | Kenneth Mjøs                     | Mjøsdalen              | 7,67       | 2021.06.30 |
    | Mjøsdalen IL                  | 3292        | 260   | Kule    | Oluf Røsland                     | Mjøsdalen              | 7,60       | 2021.06.30 |
    | Mjøsdalen IL                  | 3293        | 255   | Lengde  | Brage Hanstveit                  | Mjøsdalen              | 4,53       | 2021.06.30 |
    | Mjøsdalen IL                  | 3294        | 255   | 1500    | Øivind Bernes                    | Førde                  | 5,19,94    | 2021.08.22 |
    | Mjøsdalen IL                  | 3295        | 250   | 3000    | Vidar Yndesdal                   | Osterøy                | 11,38,33   | 2021.10.24 |
    | Mjøsdalen IL                  | 3296        | 200   | Lut     | Jan Hanstvedt                    | Mjøsdalen              | 2,32       | 2021.06.30 |
    | Mjøsdalen IL                  | 3297        | 197   | Kule    | Øystein Øvsthus                  | Mjøsdalen              | 6,87       | 2021.06.30 |
    | Mjøsdalen IL                  | 3298        | 187   | 3000    | Hans Birkeland                   | Osterøy                | 12,12,0    | 2021.10.24 |
    | Mjøsdalen IL                  | 3299        | 175   | 3000    | Jørn Fjellskålnes                | Osterøy                | 12,18,40   | 2021.10.24 |
    | Mjøsdalen IL                  | 3300        | 166   | Lengde  | Øivind Bernes                    | Knarvik                | 4,18       | 2021.09.23 |
    | Mjøsdalen IL                  | 3301        | 157   | 5000    | Øystein Hanstveit                | Osterøy                | 21,53,6    | 2021.10.24 |
    | Mjøsdalen IL                  | 3302        | 126   | 3000    | Stian Mjøs                       | Osterøy                | 12,47,81   | 2021.10.24 |
    | Mjøsdalen IL                  | 3303        | 111   | Kule    | Ola Tveiten                      | Mjøsdalen              | 5,92       | 2021.06.30 |
    | Mjøsdalen IL                  | 3304        | 92    | 5000    | Aksel Øvsthus                    | Osterøy                | 23,08,0    | 2021.10.24 |
    | Mjøsdalen IL                  | 3305        | 77    | Lengde  | Ola Tveiten                      | Mjøsdalen              | 3,84       | 2021.06.30 |
    | Mjøsdalen IL                  | 3306        | 62    | 3000    | Øyvind Litland                   | Osterøy                | 13,31,4    | 2021.10.24 |
    | Mjøsdalen IL                  | 3307        | 28    | 5000    | Oddvar Hanstveit                 | Osterøy                | 24,35,1    | 2021.10.24 |
    | Mjøsdalen IL                  | 3308        | 22    | Kule    | Bobson Jaru                      | Mjøsdalen              | 5,00       | 2021.06.30 |
    | Mjøsdalen IL                  | 3309        | 7     | Lengde  | Thor Bratli                      | Osterøy                | 3,58       | 2021.10.24 |
    | Modum FIK                     | 3310        | 616   | Høyde   | Kasper Molenaar                  | Geithus                | 1,76       | 2021.08.25 |
    | Modum FIK                     | 3311        | 615   | Stav    | Martin Kreken                    | Trondheim              | 3,50       | 2021.09.28 |
    | Modum FIK                     | 3312        | 591   | 200     | Kasper Molenaar                  | Nadderud               | 24,60      | 2021.10.16 |
    | Modum FIK                     | 3313        | 543   | Spyd    | Fredrik Grønvold                 | Geithus                | 43,97      | 2021.08.25 |
    | Modum FIK                     | 3314        | 542   | 100     | Kasper Molenaar                  | Geithus                | 12,1       | 2021.08.25 |
    | Modum FIK                     | 3315        | 523   | 100     | Martin Kreken                    | Geithus                | 12,2       | 2021.08.25 |
    | Modum FIK                     | 3316        | 509   | 200     | Kristoffer Molenaar              | Nadderud               | 25,57      | 2021.10.16 |
    | Modum FIK                     | 3317        | 467   | 100     | Erland Kristoffersen             | Geithus                | 12,5       | 2021.08.25 |
    | Modum FIK                     | 3318        | 461   | Høyde   | Martin Kreken                    | Geithus                | 1,60       | 2021.08.25 |
    | Modum FIK                     | 3319        | 454   | Spyd    | Snorre Sønju                     | Geithus                | 37,83      | 2021.08.25 |
    | Modum FIK                     | 3320        | 428   | Diskos  | Sondre Eriksen                   | Geithus                | 27,93      | 2021.08.25 |
    | Modum FIK                     | 3321        | 417   | Diskos  | Snorre Sønju                     | Geithus                | 27,50      | 2021.08.25 |
    | Modum FIK                     | 3322        | 408   | Høyde   | Kristoffer Molenaar              | Trondheim              | 1,55       | 2021.09.28 |
    | Modum FIK                     | 3323        | 385   | Slegge  | Sondre Eriksen                   | Geithus                | 25,71      | 2021.08.25 |
    | Modum FIK                     | 3324        | 316   | Kule    | Sondre Eriksen                   | Geithus                | 8,28       | 2021.08.25 |
    | Modum FIK                     | 3325        | 312   | Spyd    | Sondre Eriksen                   | Geithus                | 28,91      | 2021.08.25 |
    | Modum FIK                     | 3326        | 61    | 100     | Lars Engan                       | Geithus                | 15,3       | 2021.08.25 |
    | Moelven IL                    | 3327        | 1016  | 400     | Håvard Ingvaldsen                | Kristiansand           | 45,94      | 2021.10.06 |
    | Moelven IL                    | 3328        | 937   | 200     | Håvard Ingvaldsen                | Hamar                  | 21,37      | 2021.08.22 |
    | Moelven IL                    | 3329        | 921   | 400     | Andreas Grimerud                 | Lillehammer            | 47,49      | 2021.09.26 |
    | Moelven IL                    | 3330        | 881   | 400     | Mauritz Kåshagen                 | Oslo/Bi                | 48,18      | 2021.09.25 |
    | Moelven IL                    | 3331        | 870   | 100     | Håvard Ingvaldsen                | Oslo/St                | 10,89      | 2021.10.16 |
    | Moelven IL                    | 3332        | 866   | 200     | Andreas Grimerud                 | Lillehammer            | 21,95      | 2021.09.26 |
    | Moelven IL                    | 3333        | 847   | 200     | Carl Kåshagen                    | Kristiansand           | 22,11      | 2021.10.06 |
    | Moelven IL                    | 3334        | 846   | 200     | Sondre Rudi                      | Lillehammer            | 22,12      | 2021.09.26 |
    | Moelven IL                    | 3335        | 841   | 100     | Sondre Rudi                      | Lillehammer            | 11,00      | 2021.09.26 |
    | Moelven IL                    | 3336        | 809   | 100     | August Hemstad                   | Leikvang               | 11,13      | 2021.08.29 |
    | Moelven IL                    | 3337        | 773   | 200     | August Hemstad                   | Kristiansand           | 22,77      | 2021.10.06 |
    | Moelven IL                    | 3338        | 727   | Lut     | Mauritz Kåshagen                 | Moelv                  | 3,10       | 2021.02.14 |
    | Moelven IL                    | 3339        | 705   | Lut     | Andreas Grimerud                 | Moelv                  | 3,06       | 2021.02.14 |
    | Moelven IL                    | 3340        | 673   | 100     | Paul-Louis O'Rock                | Lillehammer            | 11,71      | 2021.09.26 |
    | Moelven IL                    | 3341        | 668   | 100     | Andreas Grimerud                 | Kristiansand           | 11,73      | 2021.10.06 |
    | Moelven IL                    | 3342        | 661   | Lut     | Håvard Ingvaldsen                | Moelv                  | 2,98       | 2021.02.14 |
    | Moelven IL                    | 3343        | 633   | Lut     | Magnus Ingvaldsen                | Moelv                  | 2,93       | 2021.02.14 |
    | Moelven IL                    | 3344        | 611   | 200     | Paul-Louis O'Rock                | Oslo/Bi                | 24,38      | 2021.09.25 |
    | Moelven IL                    | 3345        | 611   | Lengde  | Pål Jostad                       | Lillehammer            | 6,02       | 2021.09.26 |
    | Moelven IL                    | 3346        | 605   | Lut     | Carl Kåshagen                    | Moelv                  | 2,88       | 2021.02.14 |
    | Moelven IL                    | 3347        | 578   | 100     | Magnus Ingvaldsen                | Kristiansand           | 12,16      | 2021.10.06 |
    | Moelven IL                    | 3348        | 461   | 10000   | Geir Holum-Jakobsen              | Lillehammer            | 37,31,51   | 2021.09.26 |
    | Moelven IL                    | 3349        | 460   | Lut     | Sondre Rudi                      | Moelv                  | 2,63       | 2021.02.14 |
    | Moelven IL                    | 3350        | 439   | 1500    | Skjalg Kongssund                 | Kristiansand           | 4,44,00    | 2021.10.06 |
    | Moelven IL                    | 3351        | 427   | Kule    | Pål Jostad                       | Lillehammer            | 9,70       | 2021.09.26 |
    | Moelven IL                    | 3352        | 392   | 800     | Skjalg Kongssund                 | Lillehammer            | 2,20,74    | 2021.09.26 |
    | Moelven IL                    | 3353        | 327   | 400     | Skjalg Kongssund                 | Bydgoszcz/POL          | 1,03,21    | 2021.06.02 |
    | Moelven IL                    | 3354        | 273   | 100     | Dag Kåshagen                     | Raufoss                | 13,92      | 2021.06.20 |
    | Moelven IL                    | 3355        | 216   | 200     | Skjalg Kongssund                 | Moss                   | 30,04      | 2021.10.09 |
    | Moelven IL                    | 3356        | 215   | 100     | Tore Nesset                      | Raufoss                | 14,33      | 2021.06.20 |
    | Moelven IL                    | 3357        | 95    | 100     | Skjalg Kongssund                 | Moss                   | 15,26      | 2021.10.09 |
    | Molde og Omegn IF             | 3358        | 391   | 1500    | Brage Bjerkeli                   | Molde                  | 4,52,46    | 2021.06.20 |
    | Molde og Omegn IF             | 3359        | 352   | 800     | Mads Gjethammer                  | Molde                  | 2,24,46    | 2021.06.20 |
    | Molde og Omegn IF             | 3360        | 348   | 800     | Emil Røed                        | Molde                  | 2,24,79    | 2021.06.20 |
    | Moltustranda IL               | 3361        | 415   | 200     | Runar Ervik                      | Måndalen               | 26,82      | 2021.09.12 |
    | Mosjøen Friidrettsklubb       | 3362        | 728   | 3000    | Johannes Øvereng                 | Mosjøen                | 8,49,85    | 2021.08.28 |
    | Mosjøen Friidrettsklubb       | 3363        | 722   | 5000    | Johannes Øvereng                 | Mosjøen                | 15,22,60   | 2021.08.28 |
    | Mosjøen Friidrettsklubb       | 3364        | 702   | 10000   | Johannes Øvereng                 | Oslo/Bi                | 32,37,61   | 2021.09.25 |
    | Mosjøen Friidrettsklubb       | 3365        | 651   | 800     | Johannes Øvereng                 | Trondheim              | 2,01,88    | 2021.09.28 |
    | Mosjøen Friidrettsklubb       | 3366        | 573   | 5000    | Erik Nordstoga                   | Mosjøen                | 16,38,36   | 2021.08.28 |
    | Mosjøen Friidrettsklubb       | 3367        | 532   | 5000    | Kristoffer Aakvik                | Mosjøen                | 17,01,65   | 2021.08.28 |
    | Mosjøen Friidrettsklubb       | 3368        | 519   | 3000    | Erik Nordstoga                   | Mosjøen                | 9,50,21    | 2021.08.28 |
    | Mosjøen Friidrettsklubb       | 3369        | 447   | 3000    | Tommy Thrana                     | Vik                    | 10,15,00   | 2021.10.02 |
    | Mosjøen Friidrettsklubb       | 3370        | 90    | 1500    | Lukas Kaspersen                  | Mosjøen                | 6,00,95    | 2021.08.28 |
    | Mosjøen Friidrettsklubb       | 3371        | 19    | Høyde   | Morten Hjartland                 | Hattfjelldal           | 1,25       | 2021.05.22 |
    | Moss IL                       | 3372        | 804   | 100     | Oliver Tollefsen                 | Trondheim              | 11,15      | 2021.09.28 |
    | Moss IL                       | 3373        | 788   | Lut     | Atcha Prommetta                  | Moss                   | 3,21       | 2021.10.09 |
    | Moss IL                       | 3374        | 782   | 200     | Oliver Tollefsen                 | Trondheim              | 22,69      | 2021.09.28 |
    | Moss IL                       | 3375        | 759   | Stav    | Atcha Prommetta                  | Moss                   | 4,20       | 2021.10.09 |
    | Moss IL                       | 3376        | 686   | 100     | Marcus Stålby                    | Lillehammer            | 11,65      | 2021.09.26 |
    | Moss IL                       | 3377        | 672   | Lengde  | Atcha Prommetta                  | Moss                   | 6,29       | 2021.10.09 |
    | Moss IL                       | 3378        | 672   | Hut     | Atcha Prommetta                  | Moss                   | 1,50       | 2021.10.09 |
    | Moss IL                       | 3379        | 669   | 200     | Marcus Stålby                    | Lillehammer            | 23,78      | 2021.09.26 |
    | Moss IL                       | 3380        | 644   | 100     | Jesper Bjerk                     | Jessheim               | 11,84      | 2021.09.09 |
    | Moss IL                       | 3381        | 633   | Kule    | Torstein Eliassen                | Moss                   | 12,51      | 2021.10.09 |
    | Moss IL                       | 3382        | 629   | 100     | Eirik-André Kristiansen          | Lillehammer            | 11,91      | 2021.09.26 |
    | Moss IL                       | 3383        | 625   | Slegge  | René Olsen                       | Moss                   | 40,74      | 2021.10.09 |
    | Moss IL                       | 3384        | 622   | Diskos  | Torstein Eliassen                | Moss                   | 36,69      | 2021.10.09 |
    | Moss IL                       | 3385        | 613   | 3000    | Ottar Grønvold                   | Oslo/Bi                | 9,20,67    | 2021.09.25 |
    | Moss IL                       | 3386        | 612   | Tresteg | Jesper Bjerk                     | Trondheim              | 12,47      | 2021.09.28 |
    | Moss IL                       | 3387        | 579   | Lengde  | Marcus Stålby                    | Rjukan                 | 5,88       | 2021.09.12 |
    | Moss IL                       | 3388        | 578   | 200     | Jesper Bjerk                     | Moss                   | 24,75      | 2021.10.09 |
    | Moss IL                       | 3389        | 553   | 200     | Eirik-André Kristiansen          | Lillehammer            | 25,03      | 2021.09.26 |
    | Moss IL                       | 3390        | 541   | 800     | Tobias Utaker                    | Trondheim              | 2,08,80    | 2021.09.28 |
    | Moss IL                       | 3391        | 535   | 3000    | Marius Askautrud                 | Moss                   | 9,44,87    | 2021.10.09 |
    | Moss IL                       | 3392        | 533   | Spyd    | Nathaniel Trobe                  | Moss                   | 43,21      | 2021.10.09 |
    | Moss IL                       | 3393        | 511   | Stav    | Melvin Tollefsen                 | Moss                   | 3,05       | 2021.10.09 |
    | Moss IL                       | 3394        | 488   | 3000    | Tormod Aune                      | Moss                   | 10,00,73   | 2021.10.09 |
    | Moss IL                       | 3395        | 472   | 800     | Tormod Aune                      | Oslo/St                | 2,13,97    | 2021.10.16 |
    | Moss IL                       | 3396        | 461   | Høyde   | Melvin Tollefsen                 | Moss                   | 1,60       | 2021.10.09 |
    | Moss IL                       | 3397        | 458   | Diskos  | Atcha Prommetta                  | Moss                   | 29,16      | 2021.10.09 |
    | Moss IL                       | 3398        | 451   | 1500    | Tormod Aune                      | Moss                   | 4,41,86    | 2021.10.09 |
    | Moss IL                       | 3399        | 450   | 1500    | Tobias Utaker                    | Moss                   | 4,42,10    | 2021.10.09 |
    | Moss IL                       | 3400        | 440   | 3000    | Øyvind Espelund                  | Moss                   | 10,17,66   | 2021.10.09 |
    | Moss IL                       | 3401        | 427   | Lengde  | Jesper Bjerk                     | Oslo/St                | 5,23       | 2021.10.16 |
    | Moss IL                       | 3402        | 424   | Lengde  | Melvin Tollefsen                 | Moss                   | 5,22       | 2021.10.09 |
    | Moss IL                       | 3403        | 423   | Kule    | Atcha Prommetta                  | Moss                   | 9,65       | 2021.10.09 |
    | Moss IL                       | 3404        | 373   | 200h    | Marcus Stålby                    | Rjukan                 | 32,46      | 2021.09.12 |
    | Moss IL                       | 3405        | 320   | 100     | Savez Omed                       | Moss                   | 13,61      | 2021.10.09 |
    | Moss IL                       | 3406        | 320   | 200     | Theodor Eriksen                  | Nadderud               | 28,27      | 2021.10.16 |
    | Moss IL                       | 3407        | 303   | 100     | Leander Skjærstad                | Moss                   | 13,72      | 2021.10.09 |
    | Moss IL                       | 3408        | 300   | Stav    | Jesper Bjerk                     | Moss                   | 2,30       | 2021.10.09 |
    | Moss IL                       | 3409        | 298   | Kule    | Ståle Karlsen                    | Moss                   | 8,06       | 2021.10.09 |
    | Moss IL                       | 3410        | 297   | 100     | Tormod Aune                      | Moss                   | 13,76      | 2021.10.09 |
    | Moss IL                       | 3411        | 291   | 100     | Theodor Eriksen                  | Moss                   | 13,80      | 2021.10.09 |
    | Moss IL                       | 3412        | 277   | Spyd    | Ståle Karlsen                    | Moss                   | 26,93      | 2021.10.09 |
    | Moss IL                       | 3413        | 264   | 1500    | Peder Kjerkreit                  | Nadderud               | 5,17,88    | 2021.10.16 |
    | Moss IL                       | 3414        | 233   | Høyde   | Savez Omed                       | Moss                   | 1,40       | 2021.10.09 |
    | Moss IL                       | 3415        | 205   | Lengde  | Savez Omed                       | Moss                   | 4,33       | 2021.10.09 |
    | Moss IL                       | 3416        | 196   | Stav    | Ståle Karlsen                    | Moss                   | 2,00       | 2021.10.09 |
    | Moss IL                       | 3417        | 174   | 800     | Leander Skjærstad                | Moss                   | 2,43,34    | 2021.10.09 |
    | Moss IL                       | 3418        | 142   | 3000    | Anders Schmelck                  | Moss                   | 12,38,10   | 2021.10.09 |
    | Moss IL                       | 3419        | 132   | Lengde  | Eirik-André Kristiansen          | Moss                   | 4,05       | 2021.10.09 |
    | Moss IL                       | 3420        | 126   | 100     | Filip Nåvik                      | Moss                   | 15,01      | 2021.10.09 |
    | Moss IL                       | 3421        | 126   | 800     | Filip Nåvik                      | Moss                   | 2,49,00    | 2021.10.09 |
    | Moss IL                       | 3422        | 117   | 100     | Sander Eimo                      | Moss                   | 15,08      | 2021.10.09 |
    | Moss IL                       | 3423        | 107   | 100     | Ståle Karlsen                    | Moss                   | 15,16      | 2021.10.09 |
    | Moss IL                       | 3424        | 80    | Hut     | Ståle Karlsen                    | Moss                   | 1,10       | 2021.10.09 |
    | Moss IL                       | 3425        | 80    | Lut     | Ståle Karlsen                    | Moss                   | 2,20       | 2021.10.09 |
    | Moss IL                       | 3426        | 45    | Lengde  | Ståle Karlsen                    | Moss                   | 3,72       | 2021.10.09 |
    | Mosvik IL                     | 3427        | 558   | 3000    | Hallvard Dahle                   | Trondheim              | 9,37,47    | 2021.09.28 |
    | Mosvik IL                     | 3428        | 493   | 3000    | Jan Næss                         | Trondheim              | 9,58,83    | 2021.09.28 |
    | Målselv IL                    | 3429        | 373   | 3000    | Vidar Bjørnås                    | Finnsnes               | 10,43,55   | 2021.07.11 |
    | Målselv IL                    | 3430        | 372   | 1500    | Vidar Bjørnås                    | Måndalen               | 4,56,16    | 2021.09.12 |
    | Målselv IL                    | 3431        | 186   | 800     | Vidar Bjørnås                    | Harstad                | 2,41,95    | 2021.09.25 |
    | Målselv IL                    | 3432        | 108   | 200     | Sverre Prestø                    | Harstad                | 32,11      | 2021.09.25 |
    | Målselv IL                    | 3433        | 106   | 200     | Vidar Bjørnås                    | Tromsø                 | 32,16      | 2021.09.15 |
    | Målselv IL                    | 3434        | 85    | 200     | Martin Prestø                    | Harstad                | 32,58      | 2021.09.25 |
    | NTNUI                         | 3435        | 817   | 3000    | Sigurd Vie                       | Trondheim              | 8,29,23    | 2021.09.28 |
    | NTNUI                         | 3436        | 756   | 10000   | Sivert Laukli                    | Kristiansand           | 31,42,39   | 2021.10.06 |
    | NTNUI                         | 3437        | 748   | 10000   | Andreas Huse                     | Jessheim               | 31,50,36   | 2021.09.09 |
    | NTNUI                         | 3438        | 704   | 3000    | Håvard Tømmerdal                 | Trondheim              | 8,56,02    | 2021.09.28 |
    | NTNUI                         | 3439        | 700   | 3000    | Sivert Laukli                    | Trondheim              | 8,56,88    | 2021.09.28 |
    | NTNUI                         | 3440        | 676   | 3000    | Hans Mathisen                    | Trondheim              | 9,03,27    | 2021.09.28 |
    | NTNUI                         | 3441        | 673   | 3000    | Oscar Ovanger                    | Trondheim              | 9,04,15    | 2021.09.28 |
    | NTNUI                         | 3442        | 654   | 10000   | Håvard Tømmerdal                 | Trondheim              | 33,29,34   | 2021.09.28 |
    | NTNUI                         | 3443        | 543   | 3000    | Eskil Frøisland                  | Trondheim              | 9,42,28    | 2021.09.28 |
    | NTNUI                         | 3444        | 536   | 5000    | Sivert Laukli                    | Oslo/Bi                | 16,59,13   | 2021.09.25 |
    | NTNUI                         | 3445        | 529   | 3000    | Martijn Langeweg                 | Trondheim              | 9,46,94    | 2021.09.28 |
    | NTNUI                         | 3446        | 524   | 800     | Martijn Langeweg                 | Trondheim              | 2,09,99    | 2021.09.28 |
    | NTNUI                         | 3447        | 458   | 3000    | Leonhard Spidsø                  | Trondheim              | 10,11,29   | 2021.09.28 |
    | NTNUI                         | 3448        | 447   | Stav    | Roland Tillaar                   | Stjørdal               | 2,80       | 2021.10.23 |
    | NTNUI                         | 3449        | 414   | Diskos  | Roland Tillaar                   | Stjørdal               | 27,38      | 2021.10.23 |
    | NTNUI                         | 3450        | 357   | 3000    | Hans-Petter Madsen               | Trondheim              | 10,50,22   | 2021.09.28 |
    | NTNUI                         | 3451        | 260   | 3000    | Simon Risanger                   | Trondheim              | 11,33,50   | 2021.09.28 |
    | Namdal Løpeklubb              | 3452        | 835   | 10000   | Alexander Kirkeberg              | Kristiansand           | 30,27,21   | 2021.10.06 |
    | Namdal Løpeklubb              | 3453        | 824   | 5000    | Alexander Kirkeberg              | Trondheim              | 14,37,69   | 2021.09.28 |
    | Namdal Løpeklubb              | 3454        | 525   | 800     | Are Fossheim                     | Namsos                 | 2,09,91    | 2021.08.22 |
    | Namdal Løpeklubb              | 3455        | 507   | 1500    | Jacob Løvold                     | Trondheim              | 4,32,80    | 2021.09.28 |
    | Namdal Løpeklubb              | 3456        | 411   | 800     | Tobias Bergslid                  | Namsos                 | 2,19,03    | 2021.08.22 |
    | Namdal Løpeklubb              | 3457        | 410   | 800     | Arne Fjeldseth                   | Namsos                 | 2,19,12    | 2021.08.22 |
    | Namdal Løpeklubb              | 3458        | 384   | 800     | Sondre Lande                     | Namsos                 | 2,21,47    | 2021.08.22 |
    | Namdal Løpeklubb              | 3459        | 355   | 800     | Ole Danielsen                    | Namsos                 | 2,24,10    | 2021.08.22 |
    | Namdal Løpeklubb              | 3460        | 344   | 800     | Isak Vatne                       | Namsos                 | 2,25,19    | 2021.08.22 |
    | Namdal Løpeklubb              | 3461        | 342   | 800     | Isak Mortensen                   | Namsos                 | 2,25,40    | 2021.08.22 |
    | Namdal Løpeklubb              | 3462        | 341   | 800     | Alf Wågan                        | Namsos                 | 2,25,48    | 2021.08.22 |
    | Namdal Løpeklubb              | 3463        | 267   | 800     | Ole Leirvik                      | Namsos                 | 2,33,00    | 2021.08.22 |
    | Namdal Løpeklubb              | 3464        | 128   | 800     | Andreas Vannebo                  | Namsos                 | 2,48,75    | 2021.08.22 |
    | Namdal Løpeklubb              | 3465        | 41    | 800     | Olav Selnes                      | Namsos                 | 2,59,46    | 2021.08.22 |
    | Namdalseid                    | 3466        | 140   | Høyde   | Morgan Sæther                    | Namdalseid             | 1,33       | 2021.06.08 |
    | Namdalseid                    | 3467        | 19    | Høyde   | Christopher Bratberg             | Namdalseid             | 1,25       | 2021.06.08 |
    | Namsen Friidrettsforening     | 3468        | 820   | Lut     | Stig Selnes                      | Namsos                 | 3,27       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3469        | 808   | Kule    | Stig Selnes                      | Overhalla              | 15,19      | 2021.06.30 |
    | Namsen Friidrettsforening     | 3470        | 742   | Diskos  | Stig Selnes                      | Kristiansand           | 43,20      | 2021.10.06 |
    | Namsen Friidrettsforening     | 3471        | 727   | Hut     | Stig Selnes                      | Namsos                 | 1,55       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3472        | 588   | Lut     | Håvard Landsem                   | Hvam                   | 2,85       | 2021.10.23 |
    | Namsen Friidrettsforening     | 3473        | 491   | Lut     | Julian Guldvik                   | Namsos                 | 2,68       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3474        | 448   | 100     | Julian Guldvik                   | Fosnes                 | 12,6       | 2021.05.08 |
    | Namsen Friidrettsforening     | 3475        | 439   | Lengde  | Julian Guldvik                   | Fosnes                 | 5,28       | 2021.05.08 |
    | Namsen Friidrettsforening     | 3476        | 408   | Høyde   | Kasper Johnsen                   | Namsos                 | 1,55       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3477        | 333   | Lut     | Martin Aakvik                    | Namsos                 | 2,46       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3478        | 313   | 800     | Martin Aakvik                    | Namsos                 | 2,28,27    | 2021.08.22 |
    | Namsen Friidrettsforening     | 3479        | 304   | 800     | Lars Smevik                      | Namsos                 | 2,29,13    | 2021.08.22 |
    | Namsen Friidrettsforening     | 3480        | 280   | 100     | Kasper Johnsen                   | Overhalla              | 13,87      | 2021.06.30 |
    | Namsen Friidrettsforening     | 3481        | 272   | 100     | Martin Aakvik                    | Overhalla              | 13,93      | 2021.06.30 |
    | Namsen Friidrettsforening     | 3482        | 255   | Lengde  | Martin Aakvik                    | Namsos                 | 4,53       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3483        | 230   | Lut     | Kasper Johnsen                   | Namsos                 | 2,35       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3484        | 180   | Hut     | Kasper Johnsen                   | Namsos                 | 1,15       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3485        | 133   | 800     | Marcus Sørensen                  | Namsos                 | 2,48,12    | 2021.08.22 |
    | Namsen Friidrettsforening     | 3486        | 80    | Hut     | Lars Smevik                      | Namsos                 | 1,10       | 2021.08.22 |
    | Namsen Friidrettsforening     | 3487        | 58    | 800     | Emil Angen                       | Namsos                 | 2,57,30    | 2021.08.22 |
    | Narvik IL                     | 3488        | 709   | 100     | Odin Widsteen                    | Ravnanger              | 11,55      | 2021.09.15 |
    | Narvik IL                     | 3489        | 688   | Tresteg | Henrik Borgen                    | Ravnanger              | 13,17      | 2021.09.15 |
    | Narvik IL                     | 3490        | 668   | Stav    | Ludvik Johnsen                   | Ravnanger              | 3,75       | 2021.09.15 |
    | Narvik IL                     | 3491        | 645   | 200     | Odin Widsteen                    | Narvik                 | 24,02      | 2021.06.13 |
    | Narvik IL                     | 3492        | 607   | Høyde   | Henrik Borgen                    | Tromsø                 | 1,75       | 2021.09.15 |
    | Narvik IL                     | 3493        | 588   | Lengde  | Henrik Borgen                    | Tromsø                 | 5,92       | 2021.09.15 |
    | Narvik IL                     | 3494        | 578   | 3000    | Robin Amundsen                   | Narvik                 | 9,31,28    | 2021.06.13 |
    | Narvik IL                     | 3495        | 558   | 100     | Henrik Borgen                    | Tromsø                 | 12,26      | 2021.09.15 |
    | Narvik IL                     | 3496        | 530   | 400     | Ludvik Johnsen                   | Narvik                 | 56,06      | 2021.06.13 |
    | Narvik IL                     | 3497        | 530   | 100     | Ludvik Johnsen                   | Ravnanger              | 12,40      | 2021.09.15 |
    | Narvik IL                     | 3498        | 504   | 200     | Ludvik Johnsen                   | Tromsø                 | 25,63      | 2021.09.15 |
    | Narvik IL                     | 3499        | 19    | Høyde   | Albert Jakobsen                  | Narvik                 | 1,25       | 2021.06.13 |
    | Nesbyen IL                    | 3500        | 431   | 100     | William Høva                     | Nesbyen                | 12,7       | 2021.06.09 |
    | Nesbyen IL                    | 3501        | 336   | 1500    | Even Opheim                      | Lillehammer            | 5,03,05    | 2021.09.26 |
    | Nesbyen IL                    | 3502        | 323   | 800     | Even Opheim                      | Lillehammer            | 2,27,28    | 2021.09.26 |
    | Nesbyen IL                    | 3503        | 227   | 100     | Amund Simensen                   | Nesbyen                | 14,0       | 2021.06.09 |
    | Nesbyen IL                    | 3504        | 97    | 100     | Ole Ryen                         | Nesbyen                | 15,0       | 2021.06.09 |
    | Nesodden IF                   | 3505        | 617   | 400     | Eirik Haugstad                   | Nesodden               | 53,67      | 2021.09.14 |
    | Nesodden IF                   | 3506        | 570   | 10000   | Habtom Negash                    | Oslo/Bi                | 35,07,69   | 2021.09.25 |
    | Nesodden IF                   | 3507        | 467   | 800     | Fredrik Rose                     | Oslo/Bi                | 2,14,39    | 2021.09.25 |
    | Nesodden IF                   | 3508        | 424   | 1500    | Fredrik Rose                     | Oslo/Bi                | 4,46,64    | 2021.09.25 |
    | Nesodden IF                   | 3509        | 412   | 200     | Fredrik Rose                     | Nesodden               | 26,86      | 2021.09.14 |
    | Nesodden IF                   | 3510        | 390   | Spyd    | Markus Naue                      | Nesodden               | 33,66      | 2021.09.14 |
    | Nesodden IF                   | 3511        | 339   | 400     | Fredrik Rose                     | Nesodden               | 1,02,72    | 2021.09.14 |
    | Nesodden IF                   | 3512        | 328   | 100     | Fredrik Rose                     | Nesodden               | 13,56      | 2021.09.14 |
    | Nesodden IF                   | 3513        | 311   | 100     | Markus Naue                      | Nesodden               | 13,67      | 2021.09.14 |
    | Nesodden IF                   | 3514        | 172   | 200     | Jesper Kristensveen              | Nesodden               | 30,86      | 2021.09.14 |
    | Nesodden IF                   | 3515        | 106   | 200     | Adam Kronstad                    | Nesodden               | 32,15      | 2021.09.14 |
    | Nesodden IF                   | 3516        | 102   | 200     | Ola Heggdal                      | Nesodden               | 32,0       | 2021.09.14 |
    | Nesodden IF                   | 3517        | 96    | Høyde   | Ola Heggdal                      | Nesodden               | 1,30       | 2021.09.14 |
    | Nesodden IF                   | 3518        | 14    | 200     | Bernhard Grennes                 | Nesodden               | 34,10      | 2021.09.14 |
    | Nesseby Idrettsforening       | 3519        | 169   | 200     | Isak Wikstad                     | Måndalen               | 30,92      | 2021.09.12 |
    | Nesøya IL                     | 3520        | 534   | 100     | Axel Mjør                        | Nadderud               | 12,38      | 2021.10.16 |
    | Nesøya IL                     | 3521        | 521   | 200     | Axel Mjør                        | Nadderud               | 25,42      | 2021.10.16 |
    | Nesøya IL                     | 3522        | 479   | Lengde  | Axel Mjør                        | Nadderud               | 5,45       | 2021.10.16 |
    | Nittedal IL                   | 3523        | 883   | 3000    | Simen Stensrud                   | Jessheim               | 8,14,86    | 2021.09.09 |
    | Nittedal IL                   | 3524        | 817   | 1500    | Simen Stensrud                   | Oslo/Bi                | 3,54,37    | 2021.09.25 |
    | Nittedal IL                   | 3525        | 799   | 3000    | Trym Fjøsne-Hexeberg             | Trondheim              | 8,33,17    | 2021.09.28 |
    | Nittedal IL                   | 3526        | 795   | 400     | Sebastian Plows                  | Oslo/Bi                | 49,79      | 2021.09.25 |
    | Nittedal IL                   | 3527        | 761   | 800     | Trym Fjøsne-Hexeberg             | Oslo/Bi                | 1,56,42    | 2021.09.25 |
    | Nittedal IL                   | 3528        | 760   | 1500    | Trym Fjøsne-Hexeberg             | Oslo/Bi                | 4,00,10    | 2021.09.25 |
    | Nittedal IL                   | 3529        | 755   | 3000    | Didrik Jensen                    | Jessheim               | 8,43,47    | 2021.09.09 |
    | Nittedal IL                   | 3530        | 736   | 100     | Sebastian Plows                  | Oslo/Bi                | 11,43      | 2021.09.25 |
    | Nittedal IL                   | 3531        | 733   | Lut     | Torbjørn Moldestad               | Nittedal               | 3,11       | 2021.10.30 |
    | Nittedal IL                   | 3532        | 727   | Hut     | Paul Redford                     | Nittedal               | 1,55       | 2021.10.30 |
    | Nittedal IL                   | 3533        | 723   | 800     | Simen Stensrud                   | Trondheim              | 1,58,23    | 2021.09.28 |
    | Nittedal IL                   | 3534        | 721   | Kule    | Michal Rozporski                 | Nittedal               | 13,80      | 2021.10.30 |
    | Nittedal IL                   | 3535        | 713   | 800     | Didrik Jensen                    | Nittedal               | 1,58,70    | 2021.10.30 |
    | Nittedal IL                   | 3536        | 698   | Diskos  | Michal Rozporski                 | Nittedal               | 40,70      | 2021.10.30 |
    | Nittedal IL                   | 3537        | 691   | 3000    | Odin Fjøsne-Hexeberg             | Nadderud               | 8,59,41    | 2021.10.16 |
    | Nittedal IL                   | 3538        | 683   | Lengde  | Ola Gullikstad                   | Ravnanger              | 6,34       | 2021.09.15 |
    | Nittedal IL                   | 3539        | 658   | Lengde  | Torbjørn Moldestad               | Nittedal               | 6,23       | 2021.10.30 |
    | Nittedal IL                   | 3540        | 650   | 1500    | Odin Fjøsne-Hexeberg             | Oslo/Bi                | 4,12,62    | 2021.09.25 |
    | Nittedal IL                   | 3541        | 650   | Tresteg | Ola Gullikstad                   | Ravnanger              | 12,82      | 2021.09.15 |
    | Nittedal IL                   | 3542        | 650   | Lut     | Håkon Henriksen                  | Nittedal               | 2,96       | 2021.10.30 |
    | Nittedal IL                   | 3543        | 636   | 3000    | Filip Skari                      | Nittedal               | 9,14,05    | 2021.10.30 |
    | Nittedal IL                   | 3544        | 635   | 1500    | Storm Veitsle                    | Oslo/Bi                | 4,14,54    | 2021.09.25 |
    | Nittedal IL                   | 3545        | 627   | 800     | Filip Skari                      | Oslo/St                | 2,03,26    | 2021.10.16 |
    | Nittedal IL                   | 3546        | 627   | 1500    | Filip Skari                      | Oslo/Bi                | 4,15,57    | 2021.09.25 |
    | Nittedal IL                   | 3547        | 622   | Kule    | Torbjørn Moldestad               | Nittedal               | 12,36      | 2021.10.30 |
    | Nittedal IL                   | 3548        | 617   | Slegge  | Paul Redford                     | Nittedal               | 40,16      | 2021.10.30 |
    | Nittedal IL                   | 3549        | 605   | 3000    | Storm Veitsle                    | Nittedal               | 9,22,95    | 2021.10.30 |
    | Nittedal IL                   | 3550        | 603   | Diskos  | Torbjørn Moldestad               | Nittedal               | 35,71      | 2021.10.30 |
    | Nittedal IL                   | 3551        | 588   | 3000    | Tobias Mandt                     | Nadderud               | 9,28,31    | 2021.10.16 |
    | Nittedal IL                   | 3552        | 588   | Høyde   | Ola Gullikstad                   | Nittedal               | 1,73       | 2021.10.30 |
    | Nittedal IL                   | 3553        | 572   | Spyd    | Paul Redford                     | Nittedal               | 46,04      | 2021.10.30 |
    | Nittedal IL                   | 3554        | 572   | Lut     | Sebastian Plows                  | Nittedal               | 2,82       | 2021.10.30 |
    | Nittedal IL                   | 3555        | 556   | 110h    | Torbjørn Moldestad               | Nittedal               | 17,4       | 2021.10.30 |
    | Nittedal IL                   | 3556        | 553   | 1500    | Martin Tjelle                    | Oslo/St                | 4,25,81    | 2021.10.16 |
    | Nittedal IL                   | 3557        | 543   | 800     | Odin Fjøsne-Hexeberg             | Nittedal               | 2,08,65    | 2021.10.30 |
    | Nittedal IL                   | 3558        | 541   | 800     | Storm Veitsle                    | Oslo/St                | 2,08,80    | 2021.10.16 |
    | Nittedal IL                   | 3559        | 529   | 3000    | Benjamin Jensen                  | Nittedal               | 9,46,89    | 2021.10.30 |
    | Nittedal IL                   | 3560        | 518   | 800     | Tobias Mandt                     | Oslo/St                | 2,10,44    | 2021.10.16 |
    | Nittedal IL                   | 3561        | 516   | 3000    | Erlend Stensrud                  | Jessheim               | 9,50,99    | 2021.09.09 |
    | Nittedal IL                   | 3562        | 505   | 1500    | Benjamin Jensen                  | Nittedal               | 4,33,18    | 2021.10.30 |
    | Nittedal IL                   | 3563        | 503   | 1500    | Tobias Mandt                     | Oslo/Bi                | 4,33,46    | 2021.09.25 |
    | Nittedal IL                   | 3564        | 495   | 3000    | Henrik Omland                    | Nittedal               | 9,58,00    | 2021.10.30 |
    | Nittedal IL                   | 3565        | 495   | 3000    | Mats Daviknes-Andreassen         | Nittedal               | 9,58,00    | 2021.10.30 |
    | Nittedal IL                   | 3566        | 489   | 3000    | Pelle Sunde                      | Nittedal               | 10,00,07   | 2021.10.30 |
    | Nittedal IL                   | 3567        | 489   | 3000    | Anders Bærheim                   | Nittedal               | 10,00,18   | 2021.10.30 |
    | Nittedal IL                   | 3568        | 485   | 3000    | Ola Hovdhaugen                   | Nittedal               | 10,01,54   | 2021.10.30 |
    | Nittedal IL                   | 3569        | 476   | 1500    | Ola Skaar                        | Nittedal               | 4,37,82    | 2021.10.30 |
    | Nittedal IL                   | 3570        | 473   | Stav    | Torbjørn Moldestad               | Nittedal               | 2,90       | 2021.10.30 |
    | Nittedal IL                   | 3571        | 464   | 800     | Martin Tjelle                    | Nittedal               | 2,14,62    | 2021.10.30 |
    | Nittedal IL                   | 3572        | 457   | 3000    | Elias Stangvik                   | Nittedal               | 10,11,40   | 2021.10.30 |
    | Nittedal IL                   | 3573        | 450   | 3000    | Anders Daviknes-Andreassen       | Nittedal               | 10,13,96   | 2021.10.30 |
    | Nittedal IL                   | 3574        | 440   | 1500    | Elias Stangvik                   | Nittedal               | 4,43,89    | 2021.10.30 |
    | Nittedal IL                   | 3575        | 436   | 800     | Sigurd Brattlien                 | Nittedal               | 2,16,92    | 2021.10.30 |
    | Nittedal IL                   | 3576        | 434   | 1500    | Ola Hovdhaugen                   | Nittedal               | 4,44,86    | 2021.10.30 |
    | Nittedal IL                   | 3577        | 434   | 3000    | Ola Skaar                        | Nittedal               | 10,20,04   | 2021.10.30 |
    | Nittedal IL                   | 3578        | 426   | 3000    | Sigmund Stangvik                 | Nittedal               | 10,23,0    | 2021.10.30 |
    | Nittedal IL                   | 3579        | 417   | 3000    | Erik Ødegård                     | Nittedal               | 10,26,43   | 2021.10.30 |
    | Nittedal IL                   | 3580        | 415   | 3000    | Fredrik Nilssen                  | Nittedal               | 10,27,0    | 2021.10.30 |
    | Nittedal IL                   | 3581        | 414   | 400     | Sigurd Brattlien                 | Nittedal               | 59,86      | 2021.10.30 |
    | Nittedal IL                   | 3582        | 412   | 1500    | Sigmund Stangvik                 | Nittedal               | 4,48,83    | 2021.10.30 |
    | Nittedal IL                   | 3583        | 405   | Lut     | Ola Gullikstad                   | Nittedal               | 2,55       | 2021.10.30 |
    | Nittedal IL                   | 3584        | 399   | 3000    | Iver Sundnes                     | Nittedal               | 10,33,0    | 2021.10.30 |
    | Nittedal IL                   | 3585        | 392   | 800     | Mats Rein-Heggebakken            | Nittedal               | 2,20,68    | 2021.10.30 |
    | Nittedal IL                   | 3586        | 392   | 800     | Ola Hovdhaugen                   | Nittedal               | 2,20,69    | 2021.10.30 |
    | Nittedal IL                   | 3587        | 392   | 3000    | Per Rønning                      | Nittedal               | 10,36,0    | 2021.10.30 |
    | Nittedal IL                   | 3588        | 369   | 3000    | Mats Rein-Heggebakken            | Nittedal               | 10,45,42   | 2021.10.30 |
    | Nittedal IL                   | 3589        | 357   | 5000    | Helge Olsen                      | Nittedal               | 18,55,7    | 2021.10.30 |
    | Nittedal IL                   | 3590        | 357   | 5000    | Ulf Dobloug                      | Nittedal               | 18,55,8    | 2021.10.30 |
    | Nittedal IL                   | 3591        | 353   | 3000    | Marcus Næss                      | Nittedal               | 10,51,7    | 2021.10.30 |
    | Nittedal IL                   | 3592        | 350   | 1500    | Ask Fjøsne-Hexeberg              | Nadderud               | 5,00,30    | 2021.10.16 |
    | Nittedal IL                   | 3593        | 327   | 1500    | Jacob Weldingh                   | Oslo/St                | 5,04,81    | 2021.10.16 |
    | Nittedal IL                   | 3594        | 320   | 3000    | Markus Hannestad                 | Nittedal               | 11,06,2    | 2021.10.30 |
    | Nittedal IL                   | 3595        | 318   | 3000    | Fredrik Øfstaas                  | Nittedal               | 11,06,7    | 2021.10.30 |
    | Nittedal IL                   | 3596        | 291   | 800     | Fredrik Øfstaas                  | Nittedal               | 2,30,45    | 2021.10.30 |
    | Nittedal IL                   | 3597        | 272   | 200     | Filip Reshane                    | Nittedal               | 29,07      | 2021.10.30 |
    | Nittedal IL                   | 3598        | 269   | Lut     | Espen Gullikstad                 | Nittedal               | 2,39       | 2021.10.30 |
    | Nittedal IL                   | 3599        | 258   | 800     | Eric Grønvold                    | Nittedal               | 2,33,99    | 2021.10.30 |
    | Nittedal IL                   | 3600        | 253   | 800     | Eik Jøsendal                     | Nittedal               | 2,34,50    | 2021.10.30 |
    | Nittedal IL                   | 3601        | 235   | 800     | Linus Ørjansen                   | Nittedal               | 2,36,45    | 2021.10.30 |
    | Nittedal IL                   | 3602        | 233   | Høyde   | Jacob Weldingh                   | Oslo/St                | 1,40       | 2021.10.16 |
    | Nittedal IL                   | 3603        | 213   | 100     | Filip Reshane                    | Nittedal               | 14,34      | 2021.10.30 |
    | Nittedal IL                   | 3604        | 207   | 400     | Linus Ørjansen                   | Nittedal               | 1,08,38    | 2021.10.30 |
    | Nittedal IL                   | 3605        | 176   | 800     | Embrik Nordset                   | Nittedal               | 2,43,02    | 2021.10.30 |
    | Nittedal IL                   | 3606        | 168   | 200     | Håkon Roset-Aag                  | Oslo/St                | 30,93      | 2021.10.16 |
    | Nittedal IL                   | 3607        | 158   | 1500    | Embrik Nordset                   | Oslo/St                | 5,42,73    | 2021.10.16 |
    | Nittedal IL                   | 3608        | 149   | 800     | Håkon Roset-Aag                  | Nittedal               | 2,46,16    | 2021.10.30 |
    | Nittedal IL                   | 3609        | 96    | 100     | Sigurd Gausemel                  | Nittedal               | 15,25      | 2021.10.30 |
    | Nittedal IL                   | 3610        | 19    | Høyde   | Sigurd Gausemel                  | Nittedal               | 1,25       | 2021.10.30 |
    | Nordfjorden IL                | 3611        | 719   | 10000   | Erling Eggesvik                  | Bodø                   | 32,19,60   | 2021.09.21 |
    | Nordfjorden IL                | 3612        | 515   | 5000    | Erling Eggesvik                  | Bodø                   | 17,11,61   | 2021.09.21 |
    | Nordkjosbotn IL               | 3613        | 420   | 3000    | Audun Løvland                    | Nordkjosbotn           | 10,25,1    | 2021.09.21 |
    | Nordre Eidsvoll IL            | 3614        | 615   | 100     | Martin Brustad                   | Lillehammer            | 11,98      | 2021.09.26 |
    | Nordre Eidsvoll IL            | 3615        | 601   | 200     | Martin Brustad                   | Lillehammer            | 24,49      | 2021.09.26 |
    | Nordre Land friidrett         | 3616        | 487   | 1500    | Jens Lunde                       | Rjukan                 | 4,36,04    | 2021.09.12 |
    | Nordre Land friidrett         | 3617        | 476   | 3000    | Abdullahi Abdulle                | Lillehammer            | 10,04,65   | 2021.09.26 |
    | Nordre Land friidrett         | 3618        | 401   | 800     | Vebjørn Jakobsen                 | Jessheim               | 2,19,88    | 2021.09.09 |
    | Nordre Land friidrett         | 3619        | 382   | 800     | Jens Lunde                       | Lillehammer            | 2,21,64    | 2021.09.26 |
    | Nordre Land friidrett         | 3620        | 164   | 200     | Martin Sandaker                  | Rjukan                 | 31,01      | 2021.09.12 |
    | Nordre Land friidrett         | 3621        | 108   | 200     | Isak Bondlid                     | Rjukan                 | 32,11      | 2021.09.12 |
    | Nordre Land friidrett         | 3622        | 64    | 1500    | Isak Bondlid                     | Rjukan                 | 6,08,73    | 2021.09.12 |
    | Nordøy IL                     | 3623        | 373   | Spyd    | Øystein Bergheim                 | Førde                  | 32,61      | 2021.08.22 |
    | Nordøy IL                     | 3624        | 310   | Kule    | Øystein Bergheim                 | Førde                  | 8,21       | 2021.08.22 |
    | Nordøy IL                     | 3625        | 215   | Slegge  | Øystein Bergheim                 | Førde                  | 17,45      | 2021.08.22 |
    | Nordøy IL                     | 3626        | 211   | Diskos  | Øystein Bergheim                 | Førde                  | 19,91      | 2021.08.22 |
    | Norna-Salhus IL               | 3627        | 1052  | Diskos  | Sven Skagestad                   | Randvere/EST           | 62,99      | 2021.06.12 |
    | Norna-Salhus IL               | 3628        | 1011  | Slegge  | Jon Nerdal                       | Baton Rouge/LA/USA     | 70,92      | 2021.04.03 |
    | Norna-Salhus IL               | 3629        | 997   | 100     | Salum Kashafali                  | Tokyo/JPN              | 10,43      | 2021.08.29 |
    | Norna-Salhus IL               | 3630        | 931   | 200     | Filip Bøe                        | Ravnanger              | 21,42      | 2021.09.15 |
    | Norna-Salhus IL               | 3631        | 926   | 100     | Filip Bøe                        | Oslo/Bi                | 10,68      | 2021.09.25 |
    | Norna-Salhus IL               | 3632        | 923   | Kule    | Sven Skagestad                   | Leikvang               | 17,22      | 2021.08.29 |
    | Norna-Salhus IL               | 3633        | 898   | Tresteg | Viljar Gjerde                    | Fana                   | 15,19      | 2021.09.28 |
    | Norna-Salhus IL               | 3634        | 867   | 100     | Tobias Myhr                      | Trondheim              | 10,90      | 2021.09.28 |
    | Norna-Salhus IL               | 3635        | 852   | 100     | Vegard Sverd                     | Fana                   | 10,96      | 2021.09.28 |
    | Norna-Salhus IL               | 3636        | 840   | 800     | Phillip Morken                   | Ravnanger              | 1,53,03    | 2021.09.15 |
    | Norna-Salhus IL               | 3637        | 819   | 100     | Muhammed Jatta                   | Drammen                | 11,09      | 2021.10.16 |
    | Norna-Salhus IL               | 3638        | 814   | Lengde  | Viljar Gjerde                    | Fana                   | 6,94       | 2021.09.28 |
    | Norna-Salhus IL               | 3639        | 780   | 1500    | Phillip Morken                   | Oslo/Bi                | 3,58,07    | 2021.09.25 |
    | Norna-Salhus IL               | 3640        | 771   | Lengde  | Vegard Sverd                     | Oslo/Bi                | 6,74       | 2021.09.25 |
    | Norna-Salhus IL               | 3641        | 770   | Stav    | Kasper Fjeldstad                 | Fana                   | 4,26       | 2021.09.28 |
    | Norna-Salhus IL               | 3642        | 761   | 200     | Vegard Sverd                     | Lillehammer            | 22,88      | 2021.09.26 |
    | Norna-Salhus IL               | 3643        | 720   | 800     | Kristoffer Hopland               | Fana                   | 1,58,38    | 2021.09.28 |
    | Norna-Salhus IL               | 3644        | 716   | 400     | Phillip Morken                   | Trondheim              | 51,39      | 2021.09.28 |
    | Norna-Salhus IL               | 3645        | 705   | 800     | Johannes Hopland                 | Fana                   | 1,59,09    | 2021.09.28 |
    | Norna-Salhus IL               | 3646        | 704   | 200     | Luka Bergheim                    | Trondheim              | 23,43      | 2021.09.28 |
    | Norna-Salhus IL               | 3647        | 695   | 100     | Samuel Gyedu                     | Oslo/Bi                | 11,61      | 2021.09.25 |
    | Norna-Salhus IL               | 3648        | 685   | 3000    | Henrik Eliassen                  | Fana                   | 9,00,87    | 2021.09.28 |
    | Norna-Salhus IL               | 3649        | 684   | 100     | Gaute Mælen                      | Leikvang               | 11,66      | 2021.08.29 |
    | Norna-Salhus IL               | 3650        | 672   | Lut     | Vegard Sverd                     | Leikvang               | 3,00       | 2021.08.29 |
    | Norna-Salhus IL               | 3651        | 665   | Lengde  | Salum Kashafali                  | Bydgoszcz/POL          | 6,26       | 2021.06.02 |
    | Norna-Salhus IL               | 3652        | 657   | 400     | Johannes Hopland                 | Fana                   | 52,69      | 2021.09.28 |
    | Norna-Salhus IL               | 3653        | 657   | 200     | Samuel Gyedu                     | Oslo/Bi                | 23,90      | 2021.09.25 |
    | Norna-Salhus IL               | 3654        | 656   | 400     | Kristoffer Hopland               | Fana                   | 52,71      | 2021.09.28 |
    | Norna-Salhus IL               | 3655        | 650   | Lut     | Kasper Fjeldstad                 | Leikvang               | 2,96       | 2021.08.29 |
    | Norna-Salhus IL               | 3656        | 638   | Lut     | Filip Bøe                        | Leikvang               | 2,94       | 2021.08.29 |
    | Norna-Salhus IL               | 3657        | 636   | 100     | Luka Bergheim                    | Trondheim              | 11,88      | 2021.09.28 |
    | Norna-Salhus IL               | 3658        | 632   | 200     | Kristoffer Hopland               | Arna                   | 24,16      | 2021.10.13 |
    | Norna-Salhus IL               | 3659        | 632   | 100     | Emil Helgesen                    | Leikvang               | 11,90      | 2021.08.29 |
    | Norna-Salhus IL               | 3660        | 630   | 200     | Phillip Morken                   | Leikvang               | 24,18      | 2021.08.29 |
    | Norna-Salhus IL               | 3661        | 627   | Lengde  | Trym Bakke                       | Fana                   | 6,09       | 2021.09.28 |
    | Norna-Salhus IL               | 3662        | 599   | 200     | Athish Ganeshalingam             | Trondheim              | 24,51      | 2021.09.28 |
    | Norna-Salhus IL               | 3663        | 592   | 200     | Emil Helgesen                    | Leikvang               | 24,59      | 2021.08.29 |
    | Norna-Salhus IL               | 3664        | 588   | 100     | Athish Ganeshalingam             | Leikvang               | 12,11      | 2021.08.29 |
    | Norna-Salhus IL               | 3665        | 587   | 1500    | Johannes Hopland                 | Fana                   | 4,20,94    | 2021.09.28 |
    | Norna-Salhus IL               | 3666        | 572   | Lut     | Salum Kashafali                  | Leikvang               | 2,82       | 2021.08.29 |
    | Norna-Salhus IL               | 3667        | 560   | Høyde   | Trym Bakke                       | Fana                   | 1,70       | 2021.09.28 |
    | Norna-Salhus IL               | 3668        | 536   | 800     | Eivind Langøy                    | Knarvik                | 2,09,17    | 2021.09.23 |
    | Norna-Salhus IL               | 3669        | 527   | 3000    | Eivind Langøy                    | Fana                   | 9,47,40    | 2021.09.28 |
    | Norna-Salhus IL               | 3670        | 523   | Lengde  | Athish Ganeshalingam             | Trondheim              | 5,64       | 2021.09.28 |
    | Norna-Salhus IL               | 3671        | 523   | 1500    | Eivind Langøy                    | Arna                   | 4,30,44    | 2021.10.13 |
    | Norna-Salhus IL               | 3672        | 515   | 3000    | Leander Warncke-Wang             | Fana                   | 9,51,36    | 2021.09.28 |
    | Norna-Salhus IL               | 3673        | 509   | 200     | Jakob Holmelid                   | Haugesund              | 25,56      | 2021.09.12 |
    | Norna-Salhus IL               | 3674        | 498   | 100     | Jakob Holmelid                   | Leikvang               | 12,57      | 2021.08.29 |
    | Norna-Salhus IL               | 3675        | 479   | 100     | Theodor With                     | Leikvang               | 12,67      | 2021.08.29 |
    | Norna-Salhus IL               | 3676        | 475   | 400     | Eirik Leknessund                 | Fana                   | 57,76      | 2021.09.28 |
    | Norna-Salhus IL               | 3677        | 444   | 3000    | Christian Hitland                | Leikvang               | 10,16,2    | 2021.08.29 |
    | Norna-Salhus IL               | 3678        | 441   | Lengde  | Jakob Holmelid                   | Fana                   | 5,29       | 2021.09.28 |
    | Norna-Salhus IL               | 3679        | 432   | 1500    | Christian Hitland                | Leikvang               | 4,45,16    | 2021.08.29 |
    | Norna-Salhus IL               | 3680        | 382   | 3000    | Mads Raknes                      | Leikvang               | 10,39,9    | 2021.08.29 |
    | Norna-Salhus IL               | 3681        | 374   | 800     | Eirik Leknessund                 | Fana                   | 2,22,43    | 2021.09.28 |
    | Norna-Salhus IL               | 3682        | 371   | Lengde  | Håkon Lund                       | Leikvang               | 5,00       | 2021.08.29 |
    | Norna-Salhus IL               | 3683        | 362   | 3000    | Alexander Helland                | Fana                   | 10,47,95   | 2021.09.28 |
    | Norna-Salhus IL               | 3684        | 352   | 800     | Christian Hitland                | Fana                   | 2,24,40    | 2021.09.28 |
    | Norna-Salhus IL               | 3685        | 265   | Lengde  | Sadalla Swerki                   | Leikvang               | 4,57       | 2021.08.29 |
    | Norna-Salhus IL               | 3686        | 235   | 1500    | Matias Refvik                    | Fana                   | 5,24,49    | 2021.09.28 |
    | Norna-Salhus IL               | 3687        | 232   | 200     | Christian Hitland                | Leikvang               | 29,76      | 2021.08.29 |
    | Norna-Salhus IL               | 3688        | 230   | Lengde  | Yabets Yaya                      | Leikvang               | 4,43       | 2021.08.29 |
    | Norna-Salhus IL               | 3689        | 176   | Lengde  | Henrik Bjørndal                  | Leikvang               | 4,22       | 2021.08.29 |
    | Norna-Salhus IL               | 3690        | 140   | Lengde  | Heine Johannessen                | Leikvang               | 4,08       | 2021.08.29 |
    | Norna-Salhus IL               | 3691        | 137   | Lengde  | Nicholas Kalvenes                | Bergen                 | 4,07       | 2021.10.30 |
    | Norna-Salhus IL               | 3692        | 124   | Lengde  | Adrian Nystad                    | Leikvang               | 4,02       | 2021.08.29 |
    | Norna-Salhus IL               | 3693        | 124   | Lengde  | Andreas Hagen                    | Leikvang               | 4,02       | 2021.08.29 |
    | Norna-Salhus IL               | 3694        | 117   | Lengde  | Theo Johannessen                 | Leikvang               | 3,99       | 2021.08.29 |
    | Norna-Salhus IL               | 3695        | 96    | Høyde   | Mathias Kongshaug                | Fana                   | 1,30       | 2021.09.28 |
    | Norna-Salhus IL               | 3696        | 69    | Lengde  | Sander Seljelid                  | Leikvang               | 3,81       | 2021.08.29 |
    | Norna-Salhus IL               | 3697        | 48    | 5000    | Are Flekke                       | Ostereidet             | 24,05,1    | 2021.09.26 |
    | Norna-Salhus IL               | 3698        | 48    | Lengde  | Oliver Brudvik                   | Leikvang               | 3,73       | 2021.08.29 |
    | Nøtterøy Idrettsforening      | 3699        | 381   | 800     | Bo-Kristian Bisgaard-Hansen      | Greveskogen            | 2,21,76    | 2021.10.30 |
    | Nøtterøy Idrettsforening      | 3700        | 380   | 200     | Bo-Kristian Bisgaard-Hansen      | Greveskogen            | 27,33      | 2021.10.30 |
    | Nøtterøy Idrettsforening      | 3701        | 332   | 1500    | Bo-Kristian Bisgaard-Hansen      | Rjukan                 | 5,03,84    | 2021.09.12 |
    | Nøtterøy Idrettsforening      | 3702        | 277   | 100     | Bo-Kristian Bisgaard-Hansen      | Greveskogen            | 13,89      | 2021.10.30 |
    | Oksskolten IL                 | 3703        | 562   | 5000    | Birk Fjellheim                   | Mosjøen                | 16,44,16   | 2021.08.28 |
    | Olden IL                      | 3704        | 861   | Diskos  | Steffen Melheim                  | Kristiansand           | 50,24      | 2021.10.06 |
    | Olden IL                      | 3705        | 704   | 10000   | Lars-Martin Melheim              | Byrkjelo               | 32,35,45   | 2021.10.31 |
    | Olden IL                      | 3706        | 698   | 5000    | Lars-Martin Melheim              | Byrkjelo               | 15,33,92   | 2021.10.31 |
    | Olden IL                      | 3707        | 670   | 3000    | Lars-Martin Melheim              | Førde                  | 9,04,76    | 2021.08.22 |
    | Olden IL                      | 3708        | 660   | Lengde  | Ruben Gjerde                     | Byrkjelo               | 6,24       | 2021.10.31 |
    | Olden IL                      | 3709        | 653   | 100     | Ruben Gjerde                     | Førde                  | 11,80      | 2021.08.22 |
    | Olden IL                      | 3710        | 613   | 800     | Lars-Martin Melheim              | Jølster                | 2,04,10    | 2021.09.25 |
    | Oppegård Idrettslag           | 3711        | 496   | 400     | Jonas Rosholt                    | Nittedal               | 57,07      | 2021.10.30 |
    | Oppegård Idrettslag           | 3712        | 485   | 200     | Jonas Rosholt                    | Nadderud               | 25,87      | 2021.10.16 |
    | Oppegård Idrettslag           | 3713        | 461   | Høyde   | Jonas Rosholt                    | Moss                   | 1,60       | 2021.10.09 |
    | Oppegård Idrettslag           | 3714        | 456   | 800     | Jonas Rosholt                    | Lillehammer            | 2,15,20    | 2021.09.26 |
    | Oppegård Idrettslag           | 3715        | 394   | 1500    | Amund Nybakke                    | Rjukan                 | 4,51,95    | 2021.09.12 |
    | Oppegård Idrettslag           | 3716        | 363   | 100     | Jonas Rosholt                    | Oppegård               | 13,34      | 2021.08.22 |
    | Oppegård Idrettslag           | 3717        | 340   | 800     | Amund Nybakke                    | Oppegård               | 2,25,61    | 2021.08.22 |
    | Oppegård Idrettslag           | 3718        | 325   | Lengde  | Jonas Rosholt                    | Moss                   | 4,81       | 2021.10.09 |
    | Oppegård Idrettslag           | 3719        | 312   | 1500    | Eirik Mundal                     | Oppegård               | 5,07,9     | 2021.08.22 |
    | Oppegård Idrettslag           | 3720        | 291   | 200     | Amund Nybakke                    | Oppegård               | 28,5       | 2021.08.22 |
    | Oppegård Idrettslag           | 3721        | 291   | 200     | Eirik Mundal                     | Oppegård               | 28,5       | 2021.08.22 |
    | Oppegård Idrettslag           | 3722        | 249   | 5000    | Steinar Lien                     | Ås                     | 20,23,41   | 2021.10.13 |
    | Oppegård Idrettslag           | 3723        | 235   | 100     | Marius Spilde                    | Oppegård               | 14,18      | 2021.08.22 |
    | Oppegård Idrettslag           | 3724        | 232   | 1500    | Melvin Beyer                     | Oppegård               | 5,25,2     | 2021.08.22 |
    | Oppegård Idrettslag           | 3725        | 227   | 200     | Melvin Beyer                     | Oppegård               | 29,6       | 2021.08.22 |
    | Oppegård Idrettslag           | 3726        | 226   | 200     | Marius Spilde                    | Oppegård               | 29,87      | 2021.08.22 |
    | Oppegård Idrettslag           | 3727        | 224   | 100     | Simen Borgen                     | Oppegård               | 14,26      | 2021.08.22 |
    | Oppegård Idrettslag           | 3728        | 219   | 100     | Eirik Mundal                     | Oppegård               | 14,30      | 2021.08.22 |
    | Oppegård Idrettslag           | 3729        | 215   | Lengde  | Simen Borgen                     | Oppegård               | 4,37       | 2021.08.22 |
    | Oppegård Idrettslag           | 3730        | 203   | 200     | Daniel Tagge                     | Oppegård               | 30,28      | 2021.08.22 |
    | Oppegård Idrettslag           | 3731        | 202   | 800     | Melvin Beyer                     | Oppegård               | 2,40,04    | 2021.08.22 |
    | Oppegård Idrettslag           | 3732        | 103   | 100     | Melvin Beyer                     | Oppegård               | 15,19      | 2021.08.22 |
    | Oppegård Idrettslag           | 3733        | 97    | 200     | Simen Borgen                     | Oppegård               | 32,1       | 2021.08.22 |
    | Oppegård Idrettslag           | 3734        | 74    | Lengde  | Daniel Tagge                     | Oppegård               | 3,83       | 2021.08.22 |
    | Oppegård Idrettslag           | 3735        | 73    | 200     | Didrik Sanne                     | Oppegård               | 32,6       | 2021.08.22 |
    | Oppegård Idrettslag           | 3736        | 46    | 100     | Daniel Tagge                     | Oppegård               | 15,67      | 2021.08.22 |
    | Oppegård Idrettslag           | 3737        | 28    | 100     | Didrik Sanne                     | Oppegård               | 15,83      | 2021.08.22 |
    | Oppstad IL                    | 3738        | 523   | 1500    | Karsten Ellevold                 | Rjukan                 | 4,30,30    | 2021.09.12 |
    | Oppstad IL                    | 3739        | 522   | 1500    | Ole Ellevold                     | Rjukan                 | 4,30,55    | 2021.09.12 |
    | Opptur Motbakkeklubb          | 3740        | 452   | 3000    | Daniel Botnevik                  | Os                     | 10,13,33   | 2021.09.26 |
    | Opptur Motbakkeklubb          | 3741        | 271   | 5000    | Erik Werner                      | Os                     | 20,04,45   | 2021.09.26 |
    | Opptur Motbakkeklubb          | 3742        | 223   | 400     | Torkjell Brandseth               | Os                     | 1,07,68    | 2021.09.26 |
    | Opptur Motbakkeklubb          | 3743        | 176   | 400     | Erik Werner                      | Os                     | 1,09,80    | 2021.09.26 |
    | Os Turnforening               | 3744        | 705   | Høyde   | Martin Hjertaker                 | Os                     | 1,86       | 2021.09.26 |
    | Os Turnforening               | 3745        | 608   | Tresteg | Martin Hjertaker                 | Os                     | 12,44      | 2021.09.26 |
    | Os Turnforening               | 3746        | 596   | 100     | Sondre Kleppe                    | Os                     | 12,07      | 2021.09.26 |
    | Os Turnforening               | 3747        | 507   | Lengde  | Martin Hjertaker                 | Os                     | 5,57       | 2021.09.26 |
    | Os Turnforening               | 3748        | 504   | 200     | Kristian Brandseth               | Os                     | 25,63      | 2021.09.26 |
    | Os Turnforening               | 3749        | 498   | 100     | Oskar Gulbrandsøy                | Fana                   | 12,57      | 2021.09.28 |
    | Os Turnforening               | 3750        | 492   | 100     | Håvard Skeie                     | Os                     | 12,60      | 2021.09.26 |
    | Os Turnforening               | 3751        | 488   | 200     | Martin Hjertaker                 | Os                     | 25,83      | 2021.09.26 |
    | Os Turnforening               | 3752        | 449   | Spyd    | Oskar Gulbrandsøy                | Os                     | 37,47      | 2021.09.26 |
    | Os Turnforening               | 3753        | 400   | 200     | Sondre Matre                     | Fana                   | 27,03      | 2021.09.28 |
    | Os Turnforening               | 3754        | 323   | 1500    | Olav Monstad                     | Os                     | 5,05,58    | 2021.09.26 |
    | Os Turnforening               | 3755        | 320   | 100     | Kristian Brandseth               | Os                     | 13,61      | 2021.09.26 |
    | Os Turnforening               | 3756        | 303   | Diskos  | Svein Hausberg                   | Os                     | 23,15      | 2021.09.26 |
    | Os Turnforening               | 3757        | 301   | 1500    | Håvard Lunde                     | Fana                   | 5,10,01    | 2021.09.28 |
    | Os Turnforening               | 3758        | 55    | 200     | Jacob Maltun                     | Os                     | 33,20      | 2021.09.26 |
    | Oslo Politis IL               | 3759        | 390   | Lut     | Ole Henriksen                    | Oslo/St                | 2,53       | 2021.10.16 |
    | Oslo Politis IL               | 3760        | 240   | Hut     | Ole Henriksen                    | Fet                    | 1,18       | 2021.09.21 |
    | Oslo Politis IL               | 3761        | 97    | 100     | Ole Henriksen                    | Oslo/St                | 15,0       | 2021.10.16 |
    | Oslostudentenes IK Friidrett  | 3762        | 846   | 5000    | Mathias Moen                     | Oslo/Bi                | 14,28,31   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3763        | 830   | 3000    | Mathias Moen                     | Jessheim               | 8,26,42    | 2021.09.09 |
    | Oslostudentenes IK Friidrett  | 3764        | 826   | 5000    | Rune Solli                       | Kristiansand           | 14,36,63   | 2021.10.06 |
    | Oslostudentenes IK Friidrett  | 3765        | 818   | 10000   | Rune Solli                       | Kristiansand           | 30,43,05   | 2021.10.06 |
    | Oslostudentenes IK Friidrett  | 3766        | 814   | 3000    | Rune Solli                       | Nadderud               | 8,29,78    | 2021.10.16 |
    | Oslostudentenes IK Friidrett  | 3767        | 810   | 10000   | Mathias Moen                     | Kristiansand           | 30,50,35   | 2021.10.06 |
    | Oslostudentenes IK Friidrett  | 3768        | 797   | 10000   | Magnus Hjellum                   | Kristiansand           | 31,02,00   | 2021.10.06 |
    | Oslostudentenes IK Friidrett  | 3769        | 777   | 10000   | Magnus Højen                     | Oslo/Bi                | 31,21,79   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3770        | 770   | 5000    | Fredrik Sætran                   | Oslo/Bi                | 15,00,94   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3771        | 768   | 1500    | Mathias Moen                     | Oslo/Bi                | 3,59,24    | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3772        | 765   | 5000    | Eivind Klokkehaug                | Oslo/Bi                | 15,03,32   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3773        | 762   | 10000   | Mathias Oppegaard                | Kristiansand           | 31,36,01   | 2021.10.06 |
    | Oslostudentenes IK Friidrett  | 3774        | 751   | 10000   | Ulrik Ødegård                    | Jessheim               | 31,47,12   | 2021.09.09 |
    | Oslostudentenes IK Friidrett  | 3775        | 748   | 10000   | Halvard Bech                     | Oslo/Bi                | 31,50,17   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3776        | 746   | 10000   | Fredrik Lund                     | Kristiansand           | 31,52,38   | 2021.10.06 |
    | Oslostudentenes IK Friidrett  | 3777        | 746   | 5000    | Magnus Hjellum                   | Oslo/Bi                | 15,11,56   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3778        | 744   | 10000   | Ola Matre                        | Kristiansand           | 31,54,68   | 2021.10.06 |
    | Oslostudentenes IK Friidrett  | 3779        | 739   | 3000    | Mathias Oppegaard                | Oslo/Bi                | 8,47,27    | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3780        | 734   | 10000   | Knut Hjertvik                    | Oslo/Bi                | 32,04,23   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3781        | 734   | 5000    | Jørgen Korum                     | Oslo/Bi                | 15,17,14   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3782        | 731   | 5000    | Mathias Oppegaard                | Oslo/Bi                | 15,18,46   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3783        | 716   | 5000    | Asbjørn Fjellvåg                 | Ås                     | 15,25,55   | 2021.10.13 |
    | Oslostudentenes IK Friidrett  | 3784        | 715   | 5000    | Halvard Bech                     | Oslo/Bi                | 15,26,02   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3785        | 643   | 5000    | Ole Ravna                        | Oslo/Bi                | 16,01,10   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3786        | 643   | 3000    | Erlend Berger                    | Oslo/Bi                | 9,12,29    | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3787        | 639   | 3000    | Axel Wollan                      | Arna                   | 9,13,27    | 2021.10.13 |
    | Oslostudentenes IK Friidrett  | 3788        | 636   | 800     | Axel Wollan                      | Osterøy                | 2,02,73    | 2021.10.24 |
    | Oslostudentenes IK Friidrett  | 3789        | 634   | 5000    | Gustav Vasdal                    | Oslo/Bi                | 16,05,87   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3790        | 629   | 10000   | Petter Skrove                    | Oslo/Bi                | 33,58,12   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3791        | 616   | 3000    | Anders Jerpstad                  | Oslo/Bi                | 9,19,97    | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3792        | 611   | 5000    | Axel Wollan                      | Arna                   | 16,17,74   | 2021.10.13 |
    | Oslostudentenes IK Friidrett  | 3793        | 585   | 5000    | Ole Schmedling                   | Oslo/Bi                | 16,31,58   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3794        | 582   | 3000    | Ole Schmedling                   | Oslo/Bi                | 9,29,98    | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3795        | 562   | 800     | Hauk Fjeld                       | Oslo/Bi                | 2,07,32    | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3796        | 513   | 5000    | Bakr Ettayebi                    | Oslo/Bi                | 17,12,36   | 2021.09.25 |
    | Oslostudentenes IK Friidrett  | 3797        | 497   | 5000    | Jan Schneider                    | Oslo/Bi                | 17,21,79   | 2021.09.25 |
    | Osterøy IL                    | 3798        | 898   | 1500    | Trygve Mjelde                    | Oslo/Bi                | 3,46,98    | 2021.09.25 |
    | Osterøy IL                    | 3799        | 882   | 3000    | Trygve Mjelde                    | Førde                  | 8,15,12    | 2021.08.22 |
    | Osterøy IL                    | 3800        | 867   | 3000    | Markus Loftås                    | Førde                  | 8,18,32    | 2021.08.22 |
    | Osterøy IL                    | 3801        | 861   | 1500    | Markus Loftås                    | Oslo/Bi                | 3,50,30    | 2021.09.25 |
    | Osterøy IL                    | 3802        | 857   | Lengde  | Magnus Reigstad                  | Trondheim              | 7,14       | 2021.09.28 |
    | Osterøy IL                    | 3803        | 850   | 5000    | Trygve Mjelde                    | Greveskogen            | 14,26,85   | 2021.10.30 |
    | Osterøy IL                    | 3804        | 846   | 10000   | Magnus Gjerstad                  | Kristiansand           | 30,17,18   | 2021.10.06 |
    | Osterøy IL                    | 3805        | 821   | 800     | Trygve Mjelde                    | Fana                   | 1,53,81    | 2021.09.28 |
    | Osterøy IL                    | 3806        | 811   | 200     | Magnus Reigstad                  | Fana                   | 22,43      | 2021.09.28 |
    | Osterøy IL                    | 3807        | 807   | 800     | Markus Loftås                    | Osterøy                | 1,54,38    | 2021.10.24 |
    | Osterøy IL                    | 3808        | 805   | 5000    | Markus Loftås                    | Greveskogen            | 14,45,50   | 2021.10.30 |
    | Osterøy IL                    | 3809        | 745   | 400     | Magnus Reigstad                  | Lillehammer            | 50,79      | 2021.09.26 |
    | Osterøy IL                    | 3810        | 712   | 800     | Vegard Trefall                   | Fana                   | 1,58,76    | 2021.09.28 |
    | Osterøy IL                    | 3811        | 711   | 100     | Magnus Reigstad                  | Knarvik                | 11,54      | 2021.09.23 |
    | Osterøy IL                    | 3812        | 689   | 3000    | Dagfinn Gjerstad                 | Osterøy                | 8,59,81    | 2021.10.24 |
    | Osterøy IL                    | 3813        | 684   | 10000   | Jonas Lillejord                  | Arna                   | 32,56,47   | 2021.10.13 |
    | Osterøy IL                    | 3814        | 683   | 1500    | Dagfinn Gjerstad                 | Arna                   | 4,08,60    | 2021.10.13 |
    | Osterøy IL                    | 3815        | 673   | 5000    | Dagfinn Gjerstad                 | Ravnanger              | 15,46,08   | 2021.09.15 |
    | Osterøy IL                    | 3816        | 671   | 400     | Vegard Trefall                   | Arna                   | 52,39      | 2021.10.13 |
    | Osterøy IL                    | 3817        | 668   | 3000    | Jonas Lillejord                  | Fana                   | 9,05,38    | 2021.09.28 |
    | Osterøy IL                    | 3818        | 652   | Høyde   | Tobias Kallekleiv                | Osterøy                | 1,80       | 2021.10.24 |
    | Osterøy IL                    | 3819        | 647   | 1500    | Vegard Trefall                   | Fana                   | 4,12,98    | 2021.09.28 |
    | Osterøy IL                    | 3820        | 634   | Spyd    | Kjetil Stokke                    | Osterøy                | 50,55      | 2021.10.24 |
    | Osterøy IL                    | 3821        | 627   | 800     | Dagfinn Gjerstad                 | Trondheim              | 2,03,31    | 2021.09.28 |
    | Osterøy IL                    | 3822        | 587   | 3000    | Vegard Trefall                   | Osterøy                | 9,28,39    | 2021.10.24 |
    | Osterøy IL                    | 3823        | 582   | Tresteg | Magnus Reigstad                  | Osterøy                | 12,20      | 2021.10.24 |
    | Osterøy IL                    | 3824        | 572   | 10000   | Noah Raknes                      | Osterøy                | 35,05,30   | 2021.10.24 |
    | Osterøy IL                    | 3825        | 570   | 100     | Torbjørn Liabø                   | Osterøy                | 12,20      | 2021.10.24 |
    | Osterøy IL                    | 3826        | 558   | 3000    | Noah Raknes                      | Trondheim              | 9,37,28    | 2021.09.28 |
    | Osterøy IL                    | 3827        | 558   | 100     | Joe Tepnuan                      | Osterøy                | 12,26      | 2021.10.24 |
    | Osterøy IL                    | 3828        | 557   | 5000    | Noah Raknes                      | Arna                   | 16,47,30   | 2021.10.13 |
    | Osterøy IL                    | 3829        | 554   | 3000    | Sigbjørn Reigstad                | Arna                   | 9,38,79    | 2021.10.13 |
    | Osterøy IL                    | 3830        | 542   | 100     | Vegard Trefall                   | Osterøy                | 12,34      | 2021.10.24 |
    | Osterøy IL                    | 3831        | 542   | 200h    | Vegard Trefall                   | Osterøy                | 29,05      | 2021.10.24 |
    | Osterøy IL                    | 3832        | 520   | Lut     | Magnus Reigstad                  | Osterøy                | 2,73       | 2021.10.24 |
    | Osterøy IL                    | 3833        | 518   | 3000    | Henrik Horsås                    | Osterøy                | 9,50,5     | 2021.10.24 |
    | Osterøy IL                    | 3834        | 503   | 10000   | Inge Hauståker                   | Osterøy                | 36,33,09   | 2021.10.24 |
    | Osterøy IL                    | 3835        | 500   | 5000    | Inge Hauståker                   | Arna                   | 17,20,09   | 2021.10.13 |
    | Osterøy IL                    | 3836        | 499   | 3000    | Martin Mjøs                      | Osterøy                | 9,56,64    | 2021.10.24 |
    | Osterøy IL                    | 3837        | 498   | 5000    | Øystein Horsås                   | Arna                   | 17,21,52   | 2021.10.13 |
    | Osterøy IL                    | 3838        | 495   | 5000    | Martin Mjøs                      | Arna                   | 17,23,24   | 2021.10.13 |
    | Osterøy IL                    | 3839        | 482   | 10000   | Martin Mjøs                      | Arna                   | 37,02,30   | 2021.10.13 |
    | Osterøy IL                    | 3840        | 481   | 10000   | Jan Solberg                      | Osterøy                | 37,03,24   | 2021.10.24 |
    | Osterøy IL                    | 3841        | 476   | 3000    | Øystein Horsås                   | Osterøy                | 10,04,73   | 2021.10.24 |
    | Osterøy IL                    | 3842        | 473   | Diskos  | Kjetil Stokke                    | Os                     | 29,79      | 2021.09.26 |
    | Osterøy IL                    | 3843        | 472   | 800     | Noah Raknes                      | Trondheim              | 2,13,98    | 2021.09.28 |
    | Osterøy IL                    | 3844        | 467   | 5000    | Heine Solberg                    | Arna                   | 17,40,65   | 2021.10.13 |
    | Osterøy IL                    | 3845        | 466   | Lut     | Andreas Markmanrud               | Osterøy                | 2,64       | 2021.10.24 |
    | Osterøy IL                    | 3846        | 456   | Spyd    | Mats Elvik                       | Osterøy                | 37,96      | 2021.10.24 |
    | Osterøy IL                    | 3847        | 453   | 3000    | Inge Hauståker                   | Osterøy                | 10,12,99   | 2021.10.24 |
    | Osterøy IL                    | 3848        | 445   | 5000    | Jan Solberg                      | Osterøy                | 17,54,90   | 2021.10.24 |
    | Osterøy IL                    | 3849        | 433   | Tresteg | Aslak Monstad                    | Osterøy                | 10,88      | 2021.10.24 |
    | Osterøy IL                    | 3850        | 432   | 3000    | Eirik Mjelde                     | Osterøy                | 10,20,6    | 2021.10.24 |
    | Osterøy IL                    | 3851        | 428   | 3000    | Magnus Gjerstad                  | Osterøy                | 10,22,4    | 2021.10.24 |
    | Osterøy IL                    | 3852        | 414   | 5000    | Baard Raknes                     | Osterøy                | 18,15,67   | 2021.10.24 |
    | Osterøy IL                    | 3853        | 398   | Lut     | Kjetil Stokke                    | Osterøy                | 2,54       | 2021.10.24 |
    | Osterøy IL                    | 3854        | 397   | 10000   | Baard Raknes                     | Osterøy                | 39,06,63   | 2021.10.24 |
    | Osterøy IL                    | 3855        | 395   | 10000   | Bjarte Vik                       | Osterøy                | 39,09,99   | 2021.10.24 |
    | Osterøy IL                    | 3856        | 391   | Kule    | Mats Elvik                       | Osterøy                | 9,23       | 2021.10.24 |
    | Osterøy IL                    | 3857        | 389   | Kule    | Kjetil Stokke                    | Osterøy                | 9,21       | 2021.10.24 |
    | Osterøy IL                    | 3858        | 388   | 400     | Aslak Monstad                    | Arna                   | 1,00,83    | 2021.10.13 |
    | Osterøy IL                    | 3859        | 385   | 3000    | Aslak Monstad                    | Fana                   | 10,38,71   | 2021.09.28 |
    | Osterøy IL                    | 3860        | 385   | 10000   | Gisle Raknes                     | Arna                   | 39,25,31   | 2021.10.13 |
    | Osterøy IL                    | 3861        | 382   | 3000    | Kim Solberg                      | Osterøy                | 10,40,14   | 2021.10.24 |
    | Osterøy IL                    | 3862        | 377   | 200     | Aslak Monstad                    | Lillehammer            | 27,38      | 2021.09.26 |
    | Osterøy IL                    | 3863        | 370   | 100     | Aslak Monstad                    | Osterøy                | 13,30      | 2021.10.24 |
    | Osterøy IL                    | 3864        | 360   | 3000    | Jan Solberg                      | Osterøy                | 10,49,01   | 2021.10.24 |
    | Osterøy IL                    | 3865        | 355   | 5000    | Øyvind Bjordal                   | Arna                   | 18,57,27   | 2021.10.13 |
    | Osterøy IL                    | 3866        | 355   | 5000    | Gisle Raknes                     | Arna                   | 18,57,60   | 2021.10.13 |
    | Osterøy IL                    | 3867        | 344   | 3000    | Gisle Raknes                     | Osterøy                | 10,55,67   | 2021.10.24 |
    | Osterøy IL                    | 3868        | 339   | Spyd    | Andreas Markmanrud               | Osterøy                | 30,51      | 2021.10.24 |
    | Osterøy IL                    | 3869        | 339   | 3000    | Lars Brattabø                    | Osterøy                | 10,57,72   | 2021.10.24 |
    | Osterøy IL                    | 3870        | 338   | Spyd    | Magnus Reigstad                  | Osterøy                | 30,50      | 2021.10.24 |
    | Osterøy IL                    | 3871        | 335   | 200h    | Aslak Monstad                    | Osterøy                | 33,25      | 2021.10.24 |
    | Osterøy IL                    | 3872        | 333   | 1500    | Noah Raknes                      | Arna                   | 5,03,69+   | 2021.10.13 |
    | Osterøy IL                    | 3873        | 330   | 1500    | Aslak Monstad                    | Arna                   | 5,04,15    | 2021.10.13 |
    | Osterøy IL                    | 3874        | 320   | 3000    | Torbjørn Småland                 | Osterøy                | 11,06,2    | 2021.10.24 |
    | Osterøy IL                    | 3875        | 308   | 200h    | Kjetil Stokke                    | Osterøy                | 33,82      | 2021.10.24 |
    | Osterøy IL                    | 3876        | 306   | 1500    | Tore Hannisdal                   | Osterøy                | 5,09,10    | 2021.10.24 |
    | Osterøy IL                    | 3877        | 293   | 3000    | Lars Reigstad                    | Osterøy                | 11,17,9    | 2021.10.24 |
    | Osterøy IL                    | 3878        | 290   | 800     | Aslak Monstad                    | Osterøy                | 2,30,57    | 2021.10.24 |
    | Osterøy IL                    | 3879        | 288   | 100     | Eirik Reigstad                   | Leikvang               | 13,82      | 2021.08.29 |
    | Osterøy IL                    | 3880        | 276   | 3000    | Olav Småland                     | Osterøy                | 11,25,86   | 2021.10.24 |
    | Osterøy IL                    | 3881        | 274   | 3000    | Tore Hannisdal                   | Osterøy                | 11,27,02   | 2021.10.24 |
    | Osterøy IL                    | 3882        | 270   | 800     | Tore Hannisdal                   | Osterøy                | 2,32,65    | 2021.10.24 |
    | Osterøy IL                    | 3883        | 268   | Lengde  | Eirik Reigstad                   | Haugesund              | 4,58       | 2021.09.12 |
    | Osterøy IL                    | 3884        | 257   | 200     | Eirik Reigstad                   | Arna                   | 29,32      | 2021.10.13 |
    | Osterøy IL                    | 3885        | 246   | Høyde   | Eirik Reigstad                   | Haugesund              | 1,41       | 2021.09.12 |
    | Osterøy IL                    | 3886        | 235   | 200h    | Eirik Reigstad                   | Osterøy                | 35,44      | 2021.10.24 |
    | Osterøy IL                    | 3887        | 230   | 1500    | Bjarte Vik                       | Arna                   | 5,25,48    | 2021.10.13 |
    | Osterøy IL                    | 3888        | 207   | Spyd    | Joe Tepnuan                      | Osterøy                | 23,21      | 2021.10.24 |
    | Osterøy IL                    | 3889        | 203   | 3000    | Ståle Daltveit                   | Osterøy                | 12,02,58   | 2021.10.24 |
    | Osterøy IL                    | 3890        | 201   | Diskos  | Joe Tepnuan                      | Osterøy                | 19,55      | 2021.10.24 |
    | Osterøy IL                    | 3891        | 186   | 3000    | Tore Vevle                       | Osterøy                | 12,12,42   | 2021.10.24 |
    | Osterøy IL                    | 3892        | 161   | 3000    | Espen Mjøs                       | Osterøy                | 12,26,42   | 2021.10.24 |
    | Osterøy IL                    | 3893        | 159   | 3000    | Roald Martinsen                  | Osterøy                | 12,27,76   | 2021.10.24 |
    | Osterøy IL                    | 3894        | 147   | 3000    | Arne Reigstad                    | Osterøy                | 12,34,68   | 2021.10.24 |
    | Osterøy IL                    | 3895        | 142   | 3000    | Kheireddine Fakheerineddine      | Osterøy                | 12,38,0    | 2021.10.24 |
    | Osterøy IL                    | 3896        | 140   | Lut     | Aslak Monstad                    | Osterøy                | 2,26       | 2021.10.24 |
    | Osterøy IL                    | 3897        | 131   | 3000    | Jørn Jacobsen                    | Osterøy                | 12,45,18   | 2021.10.24 |
    | Osterøy IL                    | 3898        | 115   | 1500    | John Bernes                      | Førde                  | 5,54,29    | 2021.08.22 |
    | Osterøy IL                    | 3899        | 108   | 1500    | Helge Tysse                      | Osterøy                | 5,56,1     | 2021.10.24 |
    | Osterøy IL                    | 3900        | 69    | 3000    | Helge Tysse                      | Osterøy                | 13,26,7    | 2021.10.24 |
    | Osterøy IL                    | 3901        | 62    | 100     | Ulvar Hidle                      | Osterøy                | 15,53      | 2021.10.24 |
    | Osterøy IL                    | 3902        | 62    | 3000    | Arnbjørn Vevle                   | Osterøy                | 13,31,42   | 2021.10.24 |
    | Osterøy IL                    | 3903        | 48    | Tresteg | John Bernes                      | Osterøy                | 7,72       | 2021.10.24 |
    | Osterøy IL                    | 3904        | 35    | 3000    | John Bernes                      | Førde                  | 13,51,70   | 2021.08.22 |
    | Osterøy IL                    | 3905        | 26    | 800     | John Bernes                      | Førde                  | 3,01,31    | 2021.08.22 |
    | Otra IL                       | 3906        | 936   | Lengde  | Aanund Tveitå                    | Kristiansand           | 7,52       | 2021.10.06 |
    | Otra IL                       | 3907        | 718   | 100     | Mathias Bredesen                 | Ravnanger              | 11,51      | 2021.09.15 |
    | Otra IL                       | 3908        | 715   | 100     | Sindre Andersen                  | Ravnanger              | 11,52      | 2021.09.15 |
    | Otra IL                       | 3909        | 711   | Kule    | Aanund Tveitå                    | Hornnes                | 13,65      | 2021.05.30 |
    | Otra IL                       | 3910        | 684   | 200     | Sindre Andersen                  | Grimstad               | 23,63      | 2021.10.25 |
    | Otra IL                       | 3911        | 616   | Hut     | Aanund Tveitå                    | Evje                   | 1,45       | 2021.02.19 |
    | Otra IL                       | 3912        | 499   | 3000    | Harald Robstad                   | Kristiansand           | 9,56,77    | 2021.10.06 |
    | Otra IL                       | 3913        | 440   | Hut     | Sindre Andersen                  | Evje                   | 1,30       | 2021.02.19 |
    | Otra IL                       | 3914        | 440   | Hut     | Mathias Bredesen                 | Evje                   | 1,30       | 2021.02.19 |
    | Overhalla IL                  | 3915        | 933   | 400     | Fredrik Øvereng                  | Lillestrøm             | 47,28      | 2021.08.29 |
    | Overhalla IL                  | 3916        | 875   | 200     | Fredrik Øvereng                  | Nerja/ESP              | 21,88      | 2021.06.08 |
    | Overhalla IL                  | 3917        | 834   | 100     | Jørgen Homstad                   | Oslo/Bi                | 11,03      | 2021.09.25 |
    | Overhalla IL                  | 3918        | 786   | 100     | Fredrik Øvereng                  | Nerja/ESP              | 11,22      | 2021.06.08 |
    | Overhalla IL                  | 3919        | 734   | 100     | Sebastian Selnes                 | Steinkjer              | 11,44      | 2021.09.30 |
    | Overhalla IL                  | 3920        | 727   | Lut     | Jørgen Homstad                   | Overhalla              | 3,10       | 2021.06.30 |
    | Overhalla IL                  | 3921        | 687   | 200     | Sebastian Selnes                 | Namsos                 | 23,60      | 2021.08.22 |
    | Overhalla IL                  | 3922        | 684   | 200     | Even Pedersen                    | Stjørdal               | 23,63      | 2021.10.23 |
    | Overhalla IL                  | 3923        | 670   | 400     | Even Pedersen                    | Steinkjer              | 52,41      | 2021.09.30 |
    | Overhalla IL                  | 3924        | 644   | 100     | Even Pedersen                    | Namsos                 | 11,84      | 2021.08.22 |
    | Overhalla IL                  | 3925        | 597   | Lengde  | Even Pedersen                    | Stjørdal               | 5,96       | 2021.10.23 |
    | Overhalla IL                  | 3926        | 588   | Lut     | Sebastian Selnes                 | Overhalla              | 2,85       | 2021.06.30 |
    | Overhalla IL                  | 3927        | 572   | Lut     | Even Pedersen                    | Overhalla              | 2,82       | 2021.06.30 |
    | Overhalla IL                  | 3928        | 544   | 800     | Ørjan Sagmo                      | Namsos                 | 2,08,56    | 2021.08.22 |
    | Overhalla IL                  | 3929        | 488   | 1500    | Ørjan Sagmo                      | Overhalla              | 4,35,81    | 2021.06.30 |
    | Overhalla IL                  | 3930        | 367   | Lut     | Musamil Dahir                    | Overhalla              | 2,50       | 2021.06.30 |
    | Overhalla IL                  | 3931        | 318   | Høyde   | Didrik Bråten                    | Overhalla              | 1,47       | 2021.06.30 |
    | Overhalla IL                  | 3932        | 298   | Lut     | Johannes Skistad                 | Overhalla              | 2,42       | 2021.06.30 |
    | Overhalla IL                  | 3933        | 297   | 100     | Musamil Dahir                    | Overhalla              | 13,76      | 2021.06.30 |
    | Overhalla IL                  | 3934        | 258   | Lengde  | Musamil Dahir                    | Overhalla              | 4,54       | 2021.06.30 |
    | Overhalla IL                  | 3935        | 251   | 100     | Lucas Ranum                      | Overhalla              | 14,07      | 2021.06.30 |
    | Overhalla IL                  | 3936        | 240   | Lengde  | Lucas Ranum                      | Namsos                 | 4,47       | 2021.08.22 |
    | Overhalla IL                  | 3937        | 226   | 3000    | Jon Kalnes                       | Trondheim              | 11,51,01   | 2021.09.28 |
    | Overhalla IL                  | 3938        | 226   | 100     | Adrian Hojem                     | Namsos                 | 14,25      | 2021.08.22 |
    | Overhalla IL                  | 3939        | 222   | 100     | Didrik Bråten                    | Namsos                 | 14,28      | 2021.08.22 |
    | Overhalla IL                  | 3940        | 192   | Lengde  | Peter Raabakken                  | Overhalla              | 4,28       | 2021.06.30 |
    | Overhalla IL                  | 3941        | 190   | Lut     | Lucas Ranum                      | Overhalla              | 2,31       | 2021.06.30 |
    | Overhalla IL                  | 3942        | 184   | Lengde  | Didrik Bråten                    | Steinkjer              | 4,25       | 2021.09.30 |
    | Overhalla IL                  | 3943        | 170   | 100     | Espen Pedersen                   | Namsos                 | 14,66      | 2021.08.22 |
    | Overhalla IL                  | 3944        | 147   | 100     | Peter Raabakken                  | Fosnes                 | 14,6       | 2021.05.08 |
    | Overhalla IL                  | 3945        | 140   | Lut     | Didrik Bråten                    | Overhalla              | 2,26       | 2021.06.30 |
    | Overhalla IL                  | 3946        | 140   | Lut     | Peter Raabakken                  | Overhalla              | 2,26       | 2021.06.30 |
    | Overhalla IL                  | 3947        | 60    | Lut     | Dennis Bjørgum                   | Overhalla              | 2,18       | 2021.06.30 |
    | Overhalla IL                  | 3948        | 35    | Stav    | Martin Aunet                     | Måndalen               | 1,62       | 2021.09.12 |
    | Rana FIK                      | 3949        | 706   | 3000    | Sigurd Nilsen                    | Trondheim              | 8,55,38    | 2021.09.28 |
    | Rana FIK                      | 3950        | 623   | 800     | Sigurd Nilsen                    | Bodø                   | 2,03,52    | 2021.09.21 |
    | Rana FIK                      | 3951        | 529   | 1500    | Mario Bjørhusdal                 | Måndalen               | 4,29,51    | 2021.09.12 |
    | Rana FIK                      | 3952        | 492   | 100     | Simon Limstrand                  | Bodø                   | 12,60      | 2021.09.21 |
    | Rana FIK                      | 3953        | 462   | Lengde  | Simon Limstrand                  | Bodø                   | 5,38       | 2021.09.21 |
    | Rana FIK                      | 3954        | 451   | 200     | Mario Bjørhusdal                 | Måndalen               | 26,32      | 2021.09.12 |
    | Rana FIK                      | 3955        | 443   | 200h    | Mario Bjørhusdal                 | Måndalen               | 31,02      | 2021.09.12 |
    | Rana FIK                      | 3956        | 403   | 100     | Mario Bjørhusdal                 | Bodø                   | 13,10      | 2021.09.21 |
    | Rana FIK                      | 3957        | 402   | 200     | Simon Limstrand                  | Bodø                   | 27,00      | 2021.09.21 |
    | Rana FIK                      | 3958        | 358   | 400     | Thor Henriksen                   | Bodø                   | 1,01,97    | 2021.09.21 |
    | Rana FIK                      | 3959        | 306   | 800     | Simon Limstrand                  | Bodø                   | 2,28,94    | 2021.09.21 |
    | Rana FIK                      | 3960        | 297   | 200     | Petter Bjørklund                 | Måndalen               | 28,64      | 2021.09.12 |
    | Rana FIK                      | 3961        | 268   | 1500    | Julian Fagerli                   | Måndalen               | 5,17,17    | 2021.09.12 |
    | Ranheim IL                    | 3962        | 816   | 800     | Ole Røyrhus                      | Trondheim              | 1,54,03    | 2021.09.28 |
    | Ranheim IL                    | 3963        | 790   | 400h    | Olav Gissinger                   | Kristiansand           | 54,61      | 2021.10.06 |
    | Ranheim IL                    | 3964        | 786   | 400     | Olav Gissinger                   | Trondheim              | 49,96      | 2021.09.28 |
    | Ranheim IL                    | 3965        | 763   | Høyde   | Inge Johnsen                     | Trondheim              | 1,93       | 2021.09.28 |
    | Ranheim IL                    | 3966        | 748   | 3000    | Trygve Tegnander                 | Trondheim              | 8,44,99    | 2021.09.28 |
    | Ranheim IL                    | 3967        | 742   | 200     | Marius Eidsli                    | Trondheim              | 23,06      | 2021.09.28 |
    | Ranheim IL                    | 3968        | 731   | 800     | Trygve Tegnander                 | Trondheim              | 1,57,86    | 2021.09.28 |
    | Ranheim IL                    | 3969        | 725   | 100     | Marius Eidsli                    | Lillehammer            | 11,48      | 2021.09.26 |
    | Ranheim IL                    | 3970        | 720   | 200     | Martin Skårild                   | Lillehammer            | 23,27      | 2021.09.26 |
    | Ranheim IL                    | 3971        | 720   | 400     | Martin Skårild                   | Trondheim              | 51,31      | 2021.09.28 |
    | Ranheim IL                    | 3972        | 713   | 100     | Olav Gissinger                   | Oslo/Bi                | 11,53      | 2021.09.25 |
    | Ranheim IL                    | 3973        | 713   | 100     | Martin Skårild                   | Jessheim               | 11,53      | 2021.09.09 |
    | Ranheim IL                    | 3974        | 708   | 400     | Ole Røyrhus                      | Trondheim              | 51,56      | 2021.09.28 |
    | Ranheim IL                    | 3975        | 707   | 800     | Martin Skårild                   | Trondheim              | 1,59,00    | 2021.09.28 |
    | Ranheim IL                    | 3976        | 700   | Stav    | Olav Gissinger                   | Trondheim              | 3,90       | 2021.09.28 |
    | Ranheim IL                    | 3977        | 687   | 800     | Torjus Ingdal                    | Trondheim              | 1,59,98    | 2021.09.28 |
    | Ranheim IL                    | 3978        | 687   | 1500    | Trygve Tegnander                 | Trondheim              | 4,08,17    | 2021.09.28 |
    | Ranheim IL                    | 3979        | 682   | 200     | Magnus Ulseth                    | Trondheim              | 23,65      | 2021.09.28 |
    | Ranheim IL                    | 3980        | 681   | 400     | Marius Eidsli                    | Stjørdal               | 52,16      | 2021.10.23 |
    | Ranheim IL                    | 3981        | 671   | 100     | Magnus Ulseth                    | Trondheim              | 11,72      | 2021.09.28 |
    | Ranheim IL                    | 3982        | 660   | Lengde  | Olav Gissinger                   | Kristiansand           | 6,24       | 2021.10.06 |
    | Ranheim IL                    | 3983        | 657   | 200     | Sander Fenes                     | Trondheim              | 23,90      | 2021.09.28 |
    | Ranheim IL                    | 3984        | 655   | 100     | Sander Fenes                     | Trondheim              | 11,79      | 2021.09.28 |
    | Ranheim IL                    | 3985        | 645   | 200     | Emil Vestre                      | Lillehammer            | 24,02      | 2021.09.26 |
    | Ranheim IL                    | 3986        | 644   | 100     | Emil Vestre                      | Lillehammer            | 11,84      | 2021.09.26 |
    | Ranheim IL                    | 3987        | 636   | 400     | Torjus Ingdal                    | Trondheim              | 53,20      | 2021.09.28 |
    | Ranheim IL                    | 3988        | 634   | 400     | Øystein Evjen                    | Ravnanger              | 53,24      | 2021.09.15 |
    | Ranheim IL                    | 3989        | 632   | 1500    | Oliver Sund                      | Trondheim              | 4,14,96    | 2021.09.28 |
    | Ranheim IL                    | 3990        | 628   | 110h    | Olav Gissinger                   | Oslo/Bi                | 16,76      | 2021.09.25 |
    | Ranheim IL                    | 3991        | 624   | 400     | Emil Vestre                      | Lillehammer            | 53,50      | 2021.09.26 |
    | Ranheim IL                    | 3992        | 620   | Tresteg | Aksel Wormdahl                   | Trondheim              | 12,55      | 2021.09.28 |
    | Ranheim IL                    | 3993        | 619   | 400h    | Øystein Evjen                    | Harstad                | 1,00,14    | 2021.09.25 |
    | Ranheim IL                    | 3994        | 609   | 3000    | Oliver Sund                      | Trondheim              | 9,21,98    | 2021.09.28 |
    | Ranheim IL                    | 3995        | 607   | Høyde   | Erik Lønskog                     | Stjørdal               | 1,75       | 2021.10.23 |
    | Ranheim IL                    | 3996        | 605   | 800     | Oliver Sund                      | Trondheim              | 2,04,58    | 2021.09.28 |
    | Ranheim IL                    | 3997        | 596   | 100     | Oliver Walvåg                    | Trondheim              | 12,07      | 2021.09.28 |
    | Ranheim IL                    | 3998        | 593   | Lengde  | Aksel Wormdahl                   | Trondheim              | 5,94       | 2021.09.28 |
    | Ranheim IL                    | 3999        | 588   | Høyde   | Aksel Wormdahl                   | Stadsbygd              | 1,73       | 2021.05.09 |
    | Ranheim IL                    | 4000        | 586   | 100     | Øystein Evjen                    | Overhalla              | 12,12      | 2021.06.30 |
    | Ranheim IL                    | 4001        | 574   | 800     | Jonathan Tønne-Johansen          | Trondheim              | 2,06,54    | 2021.09.28 |
    | Ranheim IL                    | 4002        | 565   | 400     | Jonathan Tønne-Johansen          | Steinkjer              | 55,04      | 2021.09.30 |
    | Ranheim IL                    | 4003        | 561   | Tresteg | Aroran Philip                    | Trondheim              | 12,01      | 2021.09.28 |
    | Ranheim IL                    | 4004        | 552   | 100     | Bjørn Kjønstad-Prestvik          | Trondheim              | 12,29      | 2021.09.28 |
    | Ranheim IL                    | 4005        | 530   | Lengde  | Aroran Philip                    | Trondheim              | 5,67       | 2021.09.28 |
    | Ranheim IL                    | 4006        | 511   | Høyde   | Olav Gissinger                   | Trondheim              | 1,65       | 2021.09.28 |
    | Ranheim IL                    | 4007        | 511   | Høyde   | Bjørn Kjønstad-Prestvik          | Steinkjer              | 1,65       | 2021.09.30 |
    | Ranheim IL                    | 4008        | 506   | Diskos  | Jon Bjørhusdal                   | Trondheim              | 31,21      | 2021.09.28 |
    | Ranheim IL                    | 4009        | 503   | 200     | Aksel Wormdahl                   | Trondheim              | 25,64      | 2021.09.28 |
    | Ranheim IL                    | 4010        | 502   | 3000    | Martin Skårild                   | Trondheim              | 9,55,56    | 2021.09.28 |
    | Ranheim IL                    | 4011        | 497   | 400     | Sander Fenes                     | Jessheim               | 57,03      | 2021.09.09 |
    | Ranheim IL                    | 4012        | 479   | 800     | Sander Fenes                     | Trondheim              | 2,13,43    | 2021.09.28 |
    | Ranheim IL                    | 4013        | 479   | 1500    | Olav Gissinger                   | Oslo/Bi                | 4,37,36    | 2021.09.25 |
    | Ranheim IL                    | 4014        | 467   | Lengde  | Bjørn Kjønstad-Prestvik          | Trondheim              | 5,40       | 2021.09.28 |
    | Ranheim IL                    | 4015        | 452   | Slegge  | Jon Bjørhusdal                   | Trondheim              | 29,52      | 2021.09.28 |
    | Ranheim IL                    | 4016        | 448   | 3000    | Jan Valstad                      | Trondheim              | 10,14,64   | 2021.09.28 |
    | Ranheim IL                    | 4017        | 441   | 100     | Aksel Wormdahl                   | Trondheim              | 12,88      | 2021.09.28 |
    | Ranheim IL                    | 4018        | 434   | Tresteg | Bjørn Kjønstad-Prestvik          | Trondheim              | 10,89      | 2021.09.28 |
    | Ranheim IL                    | 4019        | 397   | 200     | Linus Strupstad                  | Trondheim              | 27,08      | 2021.09.28 |
    | Ranheim IL                    | 4020        | 384   | Spyd    | Olav Gissinger                   | Oslo/Bi                | 33,27      | 2021.09.25 |
    | Ranheim IL                    | 4021        | 375   | 100     | Linus Strupstad                  | Trondheim              | 13,27      | 2021.09.28 |
    | Ranheim IL                    | 4022        | 368   | 200h    | Lukas Arstad                     | Trondheim              | 32,57      | 2021.09.28 |
    | Ranheim IL                    | 4023        | 337   | Kule    | Olav Gissinger                   | Oslo/Bi                | 8,55       | 2021.09.25 |
    | Ranheim IL                    | 4024        | 326   | Diskos  | Olav Gissinger                   | Oslo/Bi                | 24,01      | 2021.09.25 |
    | Ranheim IL                    | 4025        | 297   | 200     | Magnus Lien                      | Trondheim              | 28,63      | 2021.09.28 |
    | Ranheim IL                    | 4026        | 161   | Lengde  | Lukas Arstad                     | Stjørdal               | 4,16       | 2021.10.23 |
    | Ranheim IL                    | 4027        | 96    | Høyde   | Lukas Arstad                     | Stjørdal               | 1,30       | 2021.10.23 |
    | Ranheim IL                    | 4028        | 96    | 200     | Edvard Jensås                    | Trondheim              | 32,36      | 2021.09.28 |
    | Ranheim IL                    | 4029        | 92    | 200     | Petter Krogstad                  | Trondheim              | 32,44      | 2021.09.28 |
    | Ranheim IL                    | 4030        | 81    | Høyde   | Magnus Lien                      | Trondheim              | 1,29       | 2021.09.28 |
    | Raufoss Idrettslag Friidrett  | 4031        | 837   | 200     | Jørgen Lund                      | Lillehammer            | 22,20      | 2021.09.26 |
    | Raufoss Idrettslag Friidrett  | 4032        | 811   | 100     | Jørgen Lund                      | Lillehammer            | 11,12      | 2021.09.26 |
    | Raufoss Idrettslag Friidrett  | 4033        | 796   | 100     | Erik Artelius                    | Lillehammer            | 11,18      | 2021.09.26 |
    | Raufoss Idrettslag Friidrett  | 4034        | 772   | 200     | Erik Artelius                    | Lillehammer            | 22,78      | 2021.09.26 |
    | Raufoss Idrettslag Friidrett  | 4035        | 768   | 200     | Markus Kristiansen               | Lillehammer            | 22,82      | 2021.09.26 |
    | Raufoss Idrettslag Friidrett  | 4036        | 746   | 100     | Didrik Bråten                    | Trondheim              | 11,39      | 2021.09.28 |
    | Raufoss Idrettslag Friidrett  | 4037        | 743   | 200     | Didrik Bråten                    | Jessheim               | 23,05      | 2021.09.09 |
    | Raufoss Idrettslag Friidrett  | 4038        | 741   | 100     | Markus Kristiansen               | Trondheim              | 11,41      | 2021.09.28 |
    | Raufoss Idrettslag Friidrett  | 4039        | 706   | 400     | Didrik Bråten                    | Lillehammer            | 51,61      | 2021.09.26 |
    | Raufoss Idrettslag Friidrett  | 4040        | 582   | 1500    | Mathias Hoelsveen                | Gjøvik                 | 4,21,76    | 2021.05.29 |
    | Raufoss Idrettslag Friidrett  | 4041        | 572   | 3000    | Mathias Hoelsveen                | Lillehammer            | 9,32,99    | 2021.09.26 |
    | Raufoss Idrettslag Friidrett  | 4042        | 441   | 800     | Mathias Hoelsveen                | Lillehammer            | 2,16,43    | 2021.09.26 |
    | Raumnes & Årnes IL            | 4043        | 738   | Høyde   | Michael Reklev                   | Jessheim               | 1,90       | 2021.09.09 |
    | Raumnes & Årnes IL            | 4044        | 646   | 200     | Michael Reklev                   | Oslo/St                | 24,01      | 2021.10.16 |
    | Raumnes & Årnes IL            | 4045        | 642   | 100     | Michael Reklev                   | Oslo/St                | 11,85      | 2021.10.16 |
    | Raumnes & Årnes IL            | 4046        | 629   | Lengde  | Michael Reklev                   | Trondheim              | 6,10       | 2021.09.28 |
    | Raumnes & Årnes IL            | 4047        | 560   | Høyde   | Joachim Lauritsen                | Oslo/St                | 1,70       | 2021.10.16 |
    | Rennebu IL                    | 4048        | 374   | 10000   | Øystein Langseth                 | Bodø                   | 39,43,49   | 2021.09.21 |
    | Rennebu IL                    | 4049        | 313   | 5000    | Øystein Langseth                 | Bodø                   | 19,29,73   | 2021.09.21 |
    | Rennebu IL                    | 4050        | 305   | 3000    | Øystein Langseth                 | Bodø                   | 11,12,51   | 2021.09.21 |
    | Rindal IL                     | 4051        | 738   | 1500    | Helge Langen                     | Oslo/Bi                | 4,02,34    | 2021.09.25 |
    | Rindal IL                     | 4052        | 736   | 3000    | Helge Langen                     | Oslo/Bi                | 8,47,90    | 2021.09.25 |
    | Rindal IL                     | 4053        | 717   | 3000    | Erik Løfald                      | Trondheim              | 8,52,68    | 2021.09.28 |
    | Rindal IL                     | 4054        | 681   | 1500    | Erik Løfald                      | Trondheim              | 4,08,79    | 2021.09.28 |
    | Rindal IL                     | 4055        | 653   | 3000    | Markus Hauge-Espelien            | Børsa                  | 9,09,42    | 2021.08.08 |
    | Rindal IL                     | 4056        | 645   | 5000    | Helge Langen                     | Greveskogen            | 15,59,97   | 2021.10.30 |
    | Rindal IL                     | 4057        | 634   | 3000    | Tølløv Lyngstad                  | Trondheim              | 9,14,77    | 2021.09.28 |
    | Rindal IL                     | 4058        | 628   | 1500    | Magnus Øyen                      | Måndalen               | 4,15,40    | 2021.09.12 |
    | Rindal IL                     | 4059        | 626   | 3000    | Erik Kårvatn                     | Trondheim              | 9,17,08    | 2021.09.28 |
    | Rindal IL                     | 4060        | 620   | 800     | Magnus Øyen                      | Trondheim              | 2,03,71    | 2021.09.28 |
    | Rindal IL                     | 4061        | 554   | 3000    | Olav Fugelsøy                    | Trondheim              | 9,38,70    | 2021.09.28 |
    | Rindal IL                     | 4062        | 551   | 3000    | Ola Balestrand                   | Trondheim              | 9,39,42    | 2021.09.28 |
    | Rindal IL                     | 4063        | 540   | 3000    | Jo Bævre                         | Trondheim              | 9,43,23    | 2021.09.28 |
    | Rindal IL                     | 4064        | 537   | 800     | Olav Fugelsøy                    | Trondheim              | 2,09,03    | 2021.09.28 |
    | Rindal IL                     | 4065        | 520   | 3000    | Olaf Bentzen                     | Trondheim              | 9,49,86    | 2021.09.28 |
    | Rindal IL                     | 4066        | 451   | 200     | Magnus Øyen                      | Trondheim              | 26,32      | 2021.09.28 |
    | Rindal IL                     | 4067        | 412   | 1500    | Sebastian Børset                 | Trondheim              | 4,48,79    | 2021.09.28 |
    | Rindal IL                     | 4068        | 320   | 3000    | Stein Erikstad                   | Trondheim              | 11,06,14   | 2021.09.28 |
    | Ringerike Friidrettsklubb     | 4069        | 739   | 5000    | Mads Olsen                       | Oslo/Bi                | 15,14,74   | 2021.09.25 |
    | Ringerike Friidrettsklubb     | 4070        | 720   | 3000    | Mads Olsen                       | Jessheim               | 8,52,06    | 2021.09.09 |
    | Ringerike Friidrettsklubb     | 4071        | 688   | 100     | Valentin Jensen                  | Hønefoss               | 11,64      | 2021.07.18 |
    | Ringerike Friidrettsklubb     | 4072        | 660   | 3000    | Andreas Tonning                  | Nadderud               | 9,07,54    | 2021.10.16 |
    | Ringerike Friidrettsklubb     | 4073        | 655   | 1500    | Mads Olsen                       | Nadderud               | 4,11,92    | 2021.10.16 |
    | Ringerike Friidrettsklubb     | 4074        | 441   | 200     | Iver Andreassen-Holm             | Sande                  | 26,46      | 2021.10.07 |
    | Ringerike Friidrettsklubb     | 4075        | 438   | 100     | Joseph-Justus Monteiro           | Hønefoss               | 12,90      | 2021.07.18 |
    | Ringerike Friidrettsklubb     | 4076        | 428   | 800     | Iver Andreassen-Holm             | Hønefoss               | 2,17,60    | 2021.07.18 |
    | Ringerike Friidrettsklubb     | 4077        | 425   | 800     | Oliver Kjos                      | Sande                  | 2,17,8     | 2021.10.07 |
    | Ringerike Friidrettsklubb     | 4078        | 390   | 400     | Oliver Kjos                      | Sande                  | 1,00,75    | 2021.10.07 |
    | Ringerike Friidrettsklubb     | 4079        | 388   | 100     | Marcus Nysveen                   | Hønefoss               | 13,19      | 2021.07.18 |
    | Ringerike Friidrettsklubb     | 4080        | 353   | Høyde   | Oliver Kjos                      | Sande                  | 1,50       | 2021.10.07 |
    | Ringerike Friidrettsklubb     | 4081        | 353   | Høyde   | Nickolass Jensen                 | Brandbu                | 1,50       | 2021.09.25 |
    | Ringerike Friidrettsklubb     | 4082        | 286   | 100     | Oliver Kjos                      | Hønefoss               | 13,83      | 2021.07.18 |
    | Ringerike Friidrettsklubb     | 4083        | 273   | Tresteg | Linus Nes                        | Rjukan                 | 9,52       | 2021.09.12 |
    | Ringerike Friidrettsklubb     | 4084        | 265   | 200     | Linus Nes                        | Sande                  | 29,19      | 2021.10.07 |
    | Ringerike Friidrettsklubb     | 4085        | 263   | 800     | Linus Nes                        | Hønefoss               | 2,33,39    | 2021.07.18 |
    | Ringerike Friidrettsklubb     | 4086        | 258   | Lengde  | Linus Nes                        | Sande                  | 4,54       | 2021.10.07 |
    | Risør IL                      | 4087        | 397   | 5000    | Thomas Axelsen                   | Tvedestrand            | 18,26,8    | 2021.09.15 |
    | Risør IL                      | 4088        | 347   | 5000    | Øyvind Nilsen                    | Tvedestrand            | 19,02,9    | 2021.09.15 |
    | Risør IL                      | 4089        | 327   | 5000    | Jan Olsen                        | Tvedestrand            | 19,19,1    | 2021.09.15 |
    | Risør IL                      | 4090        | 199   | 5000    | Geir Enersen                     | Tvedestrand            | 21,10,4    | 2021.09.15 |
    | Risør IL                      | 4091        | 109   | 5000    | Roy Johannessen                  | Tvedestrand            | 22,47,5    | 2021.09.15 |
    | Risør IL                      | 4092        | 93    | 5000    | Halvor Halvorsen                 | Tvedestrand            | 23,06,3    | 2021.09.15 |
    | Rjukan Idrettslag             | 4093        | 591   | 3000    | Jens Samuelsen                   | Jessheim               | 9,27,32    | 2021.09.09 |
    | Rjukan Idrettslag             | 4094        | 584   | 5000    | Jens Samuelsen                   | Rjukan                 | 16,32,04   | 2021.09.12 |
    | Rjukan Idrettslag             | 4095        | 576   | 1500    | Jens Samuelsen                   | Oslo/Bi                | 4,22,57    | 2021.09.25 |
    | Rjukan Idrettslag             | 4096        | 513   | 800     | Jens Samuelsen                   | Rjukan                 | 2,10,82    | 2021.09.12 |
    | Rjukan Idrettslag             | 4097        | 408   | Høyde   | Torolf Grimstad                  | Greveskogen            | 1,55       | 2021.10.30 |
    | Rjukan Idrettslag             | 4098        | 394   | Tresteg | Torolf Grimstad                  | Greveskogen            | 10,54      | 2021.10.30 |
    | Rjukan Idrettslag             | 4099        | 391   | 200     | Torolf Grimstad                  | Rjukan                 | 27,17      | 2021.09.12 |
    | Rjukan Idrettslag             | 4100        | 376   | Lengde  | Torolf Grimstad                  | Greveskogen            | 5,02       | 2021.10.30 |
    | Rjukan Idrettslag             | 4101        | 364   | Høyde   | Bastian Ringsevjen               | Notodden               | 1,51       | 2021.10.06 |
    | Rjukan Idrettslag             | 4102        | 353   | Høyde   | Sebastian Forberg                | Rjukan                 | 1,50       | 2021.09.12 |
    | Rjukan Idrettslag             | 4103        | 348   | 3000    | Tov Røysland                     | Rjukan                 | 10,53,93   | 2021.09.12 |
    | Rjukan Idrettslag             | 4104        | 347   | 200     | Håvard Sætre                     | Greveskogen            | 27,84      | 2021.10.30 |
    | Rjukan Idrettslag             | 4105        | 344   | 400     | Ibrahim Hussein                  | Greveskogen            | 1,02,51    | 2021.10.30 |
    | Rjukan Idrettslag             | 4106        | 337   | 200     | Ibrahim Hussein                  | Porsgrunn              | 27,99      | 2021.09.25 |
    | Rjukan Idrettslag             | 4107        | 331   | Tresteg | Ibrahim Hussein                  | Skien                  | 10,01      | 2021.08.11 |
    | Rjukan Idrettslag             | 4108        | 327   | 3000    | Mathias Danielsen                | Rjukan                 | 11,03,10   | 2021.09.12 |
    | Rjukan Idrettslag             | 4109        | 326   | 200     | Brede Styrvold                   | Rjukan                 | 28,17      | 2021.09.12 |
    | Rjukan Idrettslag             | 4110        | 320   | 100     | Torolf Grimstad                  | Rjukan                 | 13,61      | 2021.09.12 |
    | Rjukan Idrettslag             | 4111        | 306   | Høyde   | Håvard Sætre                     | Notodden               | 1,46       | 2021.10.06 |
    | Rjukan Idrettslag             | 4112        | 306   | Høyde   | Ibrahim Hussein                  | Rjukan                 | 1,46       | 2021.09.12 |
    | Rjukan Idrettslag             | 4113        | 289   | 200     | Sebastian Forberg                | Porsgrunn              | 28,78      | 2021.09.25 |
    | Rjukan Idrettslag             | 4114        | 281   | 3000    | Trym Toreid                      | Rjukan                 | 11,23,75   | 2021.09.12 |
    | Rjukan Idrettslag             | 4115        | 278   | Hut     | Torolf Grimstad                  | Rjukan                 | 1,20       | 2021.09.12 |
    | Rjukan Idrettslag             | 4116        | 274   | 3000    | Kjetil Fusche                    | Rjukan                 | 11,27,16   | 2021.09.12 |
    | Rjukan Idrettslag             | 4117        | 270   | 800     | Ibrahim Hussein                  | Rjukan                 | 2,32,66    | 2021.09.12 |
    | Rjukan Idrettslag             | 4118        | 269   | Spyd    | Tommy Storøygard                 | Rjukan                 | 26,49      | 2021.09.12 |
    | Rjukan Idrettslag             | 4119        | 268   | 1500    | Ibrahim Hussein                  | Greveskogen            | 5,17,07    | 2021.10.30 |
    | Rjukan Idrettslag             | 4120        | 267   | 3000    | André Styrvold                   | Rjukan                 | 11,30,49   | 2021.09.12 |
    | Rjukan Idrettslag             | 4121        | 267   | 100     | Ibrahim Hussein                  | Rjukan                 | 13,96      | 2021.09.12 |
    | Rjukan Idrettslag             | 4122        | 262   | 3000    | Sebastian Smørvik                | Rjukan                 | 11,32,70   | 2021.09.12 |
    | Rjukan Idrettslag             | 4123        | 260   | Lengde  | Ibrahim Hussein                  | Rjukan                 | 4,55       | 2021.09.12 |
    | Rjukan Idrettslag             | 4124        | 258   | 3000    | Fredrik Forfang                  | Rjukan                 | 11,34,46   | 2021.09.12 |
    | Rjukan Idrettslag             | 4125        | 240   | Lut     | Ibrahim Hussein                  | Rjukan                 | 2,36       | 2021.09.12 |
    | Rjukan Idrettslag             | 4126        | 236   | 5000    | Ibrahim Hussein                  | Rjukan                 | 20,35,69   | 2021.09.12 |
    | Rjukan Idrettslag             | 4127        | 232   | Stav    | Sebastian Forberg                | Porsgrunn              | 2,10       | 2021.09.25 |
    | Rjukan Idrettslag             | 4128        | 225   | 5000    | Johnny Myhra                     | Rjukan                 | 20,46,09   | 2021.09.12 |
    | Rjukan Idrettslag             | 4129        | 222   | 100     | Bastian Ringsevjen               | Notodden               | 14,28      | 2021.10.06 |
    | Rjukan Idrettslag             | 4130        | 221   | 5000    | Bjørn Gaustad                    | Rjukan                 | 20,49,67   | 2021.09.12 |
    | Rjukan Idrettslag             | 4131        | 220   | Lut     | Torolf Grimstad                  | Rjukan                 | 2,34       | 2021.09.12 |
    | Rjukan Idrettslag             | 4132        | 217   | 3000    | Johnny Myhra                     | Rjukan                 | 11,55,60   | 2021.09.12 |
    | Rjukan Idrettslag             | 4133        | 208   | Tresteg | Bastian Ringsevjen               | Rjukan                 | 8,99       | 2021.09.12 |
    | Rjukan Idrettslag             | 4134        | 197   | 3000    | Ibrahim Hussein                  | Rjukan                 | 12,05,86   | 2021.09.12 |
    | Rjukan Idrettslag             | 4135        | 187   | 100     | Sebastian Forberg                | Notodden               | 14,53      | 2021.10.06 |
    | Rjukan Idrettslag             | 4136        | 181   | Lengde  | Sebastian Forberg                | Rjukan                 | 4,24       | 2021.09.12 |
    | Rjukan Idrettslag             | 4137        | 181   | 5000    | Rune Hagaeie                     | Rjukan                 | 21,29,29   | 2021.09.12 |
    | Rjukan Idrettslag             | 4138        | 171   | Lengde  | Bastian Ringsevjen               | Rjukan                 | 4,20       | 2021.09.12 |
    | Rjukan Idrettslag             | 4139        | 158   | 5000    | Brede Styrvold                   | Rjukan                 | 21,52,78   | 2021.09.12 |
    | Rjukan Idrettslag             | 4140        | 143   | 5000    | Mahmoud Dib                      | Rjukan                 | 22,08,28   | 2021.09.12 |
    | Rjukan Idrettslag             | 4141        | 142   | Tresteg | Sebastian Forberg                | Notodden               | 8,46       | 2021.10.06 |
    | Rjukan Idrettslag             | 4142        | 140   | Hut     | Sebastian Forberg                | Rjukan                 | 1,13       | 2021.09.12 |
    | Rjukan Idrettslag             | 4143        | 135   | 3000    | Mahmoud Dib                      | Rjukan                 | 12,42,16   | 2021.09.12 |
    | Rjukan Idrettslag             | 4144        | 132   | 3000    | Rune Hagaeie                     | Rjukan                 | 12,43,99   | 2021.09.12 |
    | Rjukan Idrettslag             | 4145        | 113   | 200     | Stein Lurås                      | Greveskogen            | 32,01      | 2021.10.30 |
    | Rjukan Idrettslag             | 4146        | 94    | 1500    | Håvard Sætre                     | Porsgrunn              | 5,59,88    | 2021.09.25 |
    | Rjukan Idrettslag             | 4147        | 89    | 5000    | Christian Sør-Reime              | Rjukan                 | 23,11,45   | 2021.09.12 |
    | Rjukan Idrettslag             | 4148        | 88    | 5000    | Håvard Kleven                    | Rjukan                 | 23,13,10   | 2021.09.12 |
    | Rjukan Idrettslag             | 4149        | 47    | 3000    | Kenneth Are                      | Rjukan                 | 13,42,22   | 2021.09.12 |
    | Rjukan Idrettslag             | 4150        | 30    | Lut     | Sebastian Forberg                | Rjukan                 | 2,15       | 2021.09.12 |
    | Romerike Friidrett            | 4151        | 870   | 100     | Simen Berg                       | Oslo/Bi                | 10,89      | 2021.09.25 |
    | Romerike Friidrett            | 4152        | 830   | 200     | Simen Berg                       | Lillehammer            | 22,26      | 2021.09.26 |
    | Romerike Friidrett            | 4153        | 556   | 100     | Jon-Magnus Restad                | Lillestrøm             | 12,27      | 2021.08.29 |
    | Romerike Friidrett            | 4154        | 531   | 200     | Benjamin Reyes                   | Oslo/St                | 25,30      | 2021.10.16 |
    | Romerike Friidrett            | 4155        | 426   | Lut     | Eirik Hanssen                    | Hvam                   | 2,58       | 2021.10.23 |
    | Romerike Friidrett            | 4156        | 413   | 100     | Ottman Bouhali                   | Nittedal               | 13,04      | 2021.10.30 |
    | Romerike Friidrett            | 4157        | 408   | Høyde   | Benjamin Reyes                   | Oslo/St                | 1,55       | 2021.10.16 |
    | Romerike Friidrett            | 4158        | 348   | 100     | Lars Skogvold                    | Raufoss                | 13,43      | 2021.06.20 |
    | Romerike Friidrett            | 4159        | 310   | Lengde  | Ottman Bouhali                   | Oslo/St                | 4,75       | 2021.10.16 |
    | Romerike Friidrett            | 4160        | 187   | 1500    | Ottman Bouhali                   | Oslo/Bi                | 5,35,71    | 2021.09.25 |
    | Romerike Friidrett            | 4161        | 164   | 200     | Scott Lloyd                      | Lillestrøm             | 31,01      | 2021.08.29 |
    | Romerike Friidrett            | 4162        | 113   | 200     | Gabriel Wennerström              | Lillestrøm             | 32,02      | 2021.08.29 |
    | Romerike Friidrett            | 4163        | 102   | 200     | Nicolai Olsen                    | Lillestrøm             | 32,23      | 2021.08.29 |
    | Romerike Friidrett            | 4164        | 72    | 200     | Sebastian Kverneggen             | Lillestrøm             | 32,85      | 2021.08.29 |
    | Romerike Friidrett            | 4165        | 33    | 200     | Markus Woll                      | Lillestrøm             | 33,68      | 2021.08.29 |
    | Romerike Friidrett            | 4166        | 4     | 200     | Even Wahlberg                    | Lillestrøm             | 34,31      | 2021.08.29 |
    | Ros IL                        | 4167        | 1005  | 10000   | Sondre Moen                      | Oslo/Bi                | 28,11,71   | 2021.09.25 |
    | Ros IL                        | 4168        | 761   | 3000    | Kristian Ulriksen                | Trondheim              | 8,42,02    | 2021.09.28 |
    | Ros IL                        | 4169        | 746   | 10000   | Kristian Ulriksen                | Oslo/Bi                | 31,51,71   | 2021.09.25 |
    | Ros IL                        | 4170        | 720   | 5000    | Kristian Ulriksen                | Kristiansand           | 15,23,94   | 2021.10.06 |
    | Ros IL                        | 4171        | 571   | Diskos  | Per Hole                         | Røyken                 | 34,19      | 2021.10.02 |
    | Ros IL                        | 4172        | 281   | 200     | Leon Washington                  | Nadderud               | 28,91      | 2021.10.16 |
    | Ros IL                        | 4173        | 159   | 1500    | Martin Egerborg                  | Nadderud               | 5,42,50    | 2021.10.16 |
    | Ros IL                        | 4174        | 158   | 200     | Artin Aga                        | Sande                  | 31,13      | 2021.10.07 |
    | Ros IL                        | 4175        | 68    | 200     | Ask Lavoll                       | Oslo/St                | 32,93      | 2021.10.16 |
    | Ros IL                        | 4176        | 19    | Høyde   | Edvin Sundbäck                   | Nadderud               | 1,25       | 2021.10.16 |
    | Rosendal Turnlag              | 4177        | 513   | 3000    | Haakon Skjelnes                  | Fana                   | 9,52,15    | 2021.09.28 |
    | Rosendal Turnlag              | 4178        | 475   | 1500    | Amund Berge-Soldal               | Fana                   | 4,38,01    | 2021.09.28 |
    | Rosendal Turnlag              | 4179        | 475   | 5000    | Haakon Skjelnes                  | Husnes                 | 17,35,9    | 2021.09.08 |
    | Rosendal Turnlag              | 4180        | 370   | 3000    | Magnus Haugse                    | Husnes                 | 10,45,0    | 2021.09.08 |
    | Rosendal Turnlag              | 4181        | 365   | 5000    | Magnus Haugse                    | Husnes                 | 18,50,1    | 2021.09.08 |
    | Rosendal Turnlag              | 4182        | 318   | Høyde   | Amund Berge-Soldal               | Fana                   | 1,47       | 2021.09.28 |
    | Rosendal Turnlag              | 4183        | 267   | Diskos  | Mats Olsen                       | Husnes                 | 21,86      | 2021.09.08 |
    | Rosendal Turnlag              | 4184        | 135   | Kule    | Mats Olsen                       | Husnes                 | 6,18       | 2021.09.08 |
    | Rygge IL                      | 4185        | 816   | 5000    | Ulrik Lolland                    | Kristiansand           | 14,40,91   | 2021.10.06 |
    | Rygge IL                      | 4186        | 482   | 3000    | Tobias Andersen                  | Fredrikstad            | 10,02,86   | 2021.09.29 |
    | Rygge IL                      | 4187        | 473   | 1500    | Tobias Andersen                  | Oppegård               | 4,38,27    | 2021.08.22 |
    | Røros IL                      | 4188        | 496   | 3000    | Ola Aas                          | Trondheim              | 9,57,80    | 2021.09.28 |
    | Røyken UIL                    | 4189        | 120   | 3000    | Halvor Lunde                     | Nordkjosbotn           | 12,51,9    | 2021.09.21 |
    | SK Freidig                    | 4190        | 875   | 3000    | Håvard Eidsmo                    | Trondheim              | 8,16,57    | 2021.09.28 |
    | SK Freidig                    | 4191        | 810   | 1500    | Håvard Eidsmo                    | Uddevalla/SWE          | 3,55,09    | 2021.06.15 |
    | SK Freidig                    | 4192        | 704   | 5000    | Simen Storhov                    | Trondheim              | 15,31,33   | 2021.09.28 |
    | SK Freidig                    | 4193        | 655   | 10000   | Iver Thun                        | Trondheim              | 33,28,03   | 2021.09.28 |
    | SMIL Engavågen                | 4194        | 318   | Høyde   | Sigve Mjølkarlid                 | Meløy                  | 1,47       | 2021.06.10 |
    | SMIL Engavågen                | 4195        | 221   | 200     | Sigve Mjølkarlid                 | Bodø                   | 29,96      | 2021.09.21 |
    | SMIL Engavågen                | 4196        | 19    | Høyde   | Mathias Setvik                   | Bodø                   | 1,25       | 2021.09.21 |
    | Salangen Friidrett            | 4197        | 871   | 5000    | Erik Lomås                       | Greveskogen            | 14,18,65   | 2021.10.30 |
    | Salangen Friidrett            | 4198        | 849   | 3000    | Erik Lomås                       | Fana                   | 8,22,15    | 2021.09.28 |
    | Sandane Turn og Idrettslag    | 4199        | 89    | 400     | Nils Tystad                      | Florø                  | 1,13,93    | 2021.06.05 |
    | Sandefjord Turn & IF          | 4200        | 691   | 3000    | Eirik Aabrekk                    | Lillehammer            | 8,59,32    | 2021.09.26 |
    | Sandefjord Turn & IF          | 4201        | 675   | 100     | Sivert Liverød                   | Trondheim              | 11,70      | 2021.09.28 |
    | Sandefjord Turn & IF          | 4202        | 645   | 200     | Sivert Liverød                   | Trondheim              | 24,02      | 2021.09.28 |
    | Sandefjord Turn & IF          | 4203        | 624   | Lengde  | Sivert Liverød                   | Nadderud               | 6,08       | 2021.10.16 |
    | Sandefjord Turn & IF          | 4204        | 617   | 200     | Josh Bjerke                      | Greveskogen            | 24,32      | 2021.10.30 |
    | Sandefjord Turn & IF          | 4205        | 580   | 100     | Josh Bjerke                      | Larvik                 | 12,15      | 2021.09.15 |
    | Sandefjord Turn & IF          | 4206        | 541   | Tresteg | Sivert Liverød                   | Greveskogen            | 11,83      | 2021.10.30 |
    | Sandefjord Turn & IF          | 4207        | 531   | 200     | Fredrik Altberg-Abelsen          | Larvik                 | 25,29      | 2021.09.15 |
    | Sandefjord Turn & IF          | 4208        | 461   | Høyde   | Sivert Liverød                   | Greveskogen            | 1,60       | 2021.10.30 |
    | Sandefjord Turn & IF          | 4209        | 429   | Spyd    | Sivert Liverød                   | Greveskogen            | 36,17      | 2021.10.30 |
    | Sandefjord Turn & IF          | 4210        | 309   | 1500    | John Kvernmo                     | Nadderud               | 5,08,51    | 2021.10.16 |
    | Sandefjord Turn & IF          | 4211        | 253   | 200     | Aedan Herron                     | Greveskogen            | 29,38      | 2021.10.30 |
    | Sandefjord Turn & IF          | 4212        | 193   | 100     | Linus Madsen                     | Larvik                 | 14,49      | 2021.09.15 |
    | Sandefjord Turn & IF          | 4213        | 188   | 200     | Linus Madsen                     | Jessheim               | 30,56      | 2021.09.09 |
    | Sandefjord Turn & IF          | 4214        | 143   | 800     | Sindre Furland                   | Larvik                 | 2,46,88    | 2021.09.15 |
    | Sandefjord Turn & IF          | 4215        | 111   | Høyde   | Sindre Furland                   | Rjukan                 | 1,31       | 2021.09.12 |
    | Sandefjord Turn & IF          | 4216        | 66    | 200     | Jennard Bjerke                   | Greveskogen            | 32,97      | 2021.10.30 |
    | Sandefjord Turn & IF          | 4217        | 19    | Høyde   | Linus Madsen                     | Greveskogen            | 1,25       | 2021.10.30 |
    | Sandnes IL                    | 4218        | 1165  | 5000    | Jakob Ingebrigtsen               | Firenze/ITA            | 12,48,45   | 2021.06.10 |
    | Sandnes IL                    | 4219        | 1164  | 1500    | Jakob Ingebrigtsen               | Tokyo/JPN              | 3,28,32    | 2021.08.29 |
    | Sandnes IL                    | 4220        | 1108  | 3000    | Jakob Ingebrigtsen               | Lausanne/SUI           | 7,33,06    | 2021.08.26 |
    | Sandnes IL                    | 4221        | 1101  | 3000    | Filip Ingebrigtsen               | Oslo/Bi                | 7,34,00    | 2021.09.25 |
    | Sandnes IL                    | 4222        | 1099  | 1500    | Filip Ingebrigtsen               | Monaco/MON             | 3,32,23    | 2021.07.09 |
    | Sandnes IL                    | 4223        | 1055  | 3000    | Narve Nordås                     | Lahti/FIN              | 7,41,31    | 2021.08.19 |
    | Sandnes IL                    | 4224        | 1054  | 5000    | Henrik Ingebrigtsen              | Oslo/Bi                | 13,16,80   | 2021.09.25 |
    | Sandnes IL                    | 4225        | 1054  | 5000    | Narve Nordås                     | Oslo/Bi                | 13,16,82   | 2021.09.25 |
    | Sandnes IL                    | 4226        | 956   | 10000   | Narve Nordås                     | Kristiansand           | 28,47,19   | 2021.10.06 |
    | Sandnes IL                    | 4227        | 929   | 100     | Jonas Skåden                     | Trondheim              | 10,67      | 2021.09.28 |
    | Sandnes IL                    | 4228        | 911   | 200     | Jonas Skåden                     | Trondheim              | 21,58      | 2021.09.28 |
    | Sandnes IL                    | 4229        | 894   | 100     | Soban Inayat                     | Haugesund              | 10,80      | 2021.09.12 |
    | Sandnes IL                    | 4230        | 871   | 3000    | Benjamin Rettore                 | Trondheim              | 8,17,38    | 2021.09.28 |
    | Sandnes IL                    | 4231        | 861   | 10000   | Frew Brkineh                     | Kristiansand           | 30,03,98   | 2021.10.06 |
    | Sandnes IL                    | 4232        | 854   | 100     | Alexander Skrede                 | Kristiansand           | 10,95      | 2021.10.06 |
    | Sandnes IL                    | 4233        | 838   | 200     | Alexander Skrede                 | Trondheim              | 22,19      | 2021.09.28 |
    | Sandnes IL                    | 4234        | 816   | 5000    | Frew Brkineh                     | Fana                   | 14,40,91   | 2021.09.28 |
    | Sandnes IL                    | 4235        | 808   | 400     | Jonas Skåden                     | Sandnes                | 49,53      | 2021.10.28 |
    | Sandnes IL                    | 4236        | 797   | 200     | Soban Inayat                     | Kristiansand           | 22,55      | 2021.10.06 |
    | Sandnes IL                    | 4237        | 789   | 1500    | Benjamin Rettore                 | Oslo/Bi                | 3,57,09    | 2021.09.25 |
    | Sandnes IL                    | 4238        | 741   | 100     | Jonas Fjordholm                  | Sandnes                | 11,41      | 2021.10.28 |
    | Sandnes IL                    | 4239        | 729   | 200     | Eskild Hillesund                 | Lillehammer            | 23,19      | 2021.09.26 |
    | Sandnes IL                    | 4240        | 726   | 200     | Erlend Rødsmoen                  | Lillehammer            | 23,22      | 2021.09.26 |
    | Sandnes IL                    | 4241        | 722   | Lut     | Soban Inayat                     | Sandnes                | 3,09       | 2021.10.28 |
    | Sandnes IL                    | 4242        | 715   | 200     | Jonas Fjordholm                  | Trondheim              | 23,32      | 2021.09.28 |
    | Sandnes IL                    | 4243        | 713   | 200     | Håvard Haugen                    | Lillehammer            | 23,34      | 2021.09.26 |
    | Sandnes IL                    | 4244        | 713   | 3000    | Erik Vadla                       | Fana                   | 8,53,76    | 2021.09.28 |
    | Sandnes IL                    | 4245        | 709   | 400     | Håvard Haugen                    | Ravnanger              | 51,53      | 2021.09.15 |
    | Sandnes IL                    | 4246        | 697   | 100     | Erlend Rødsmoen                  | Lillehammer            | 11,60      | 2021.09.26 |
    | Sandnes IL                    | 4247        | 695   | 100     | Eskild Hillesund                 | Trondheim              | 11,61      | 2021.09.28 |
    | Sandnes IL                    | 4248        | 690   | 200     | Øystein Paulsen                  | Haugesund              | 23,57      | 2021.09.12 |
    | Sandnes IL                    | 4249        | 687   | 800     | Benjamin Rettore                 | Stavanger              | 2,00,00    | 2021.10.27 |
    | Sandnes IL                    | 4250        | 685   | 200     | Gaute Aasmo                      | Sandnes                | 23,62      | 2021.10.28 |
    | Sandnes IL                    | 4251        | 679   | 100     | Håvard Haugen                    | Hamar                  | 11,68      | 2021.08.22 |
    | Sandnes IL                    | 4252        | 664   | 100     | Sondre Aasmo                     | Lillehammer            | 11,75      | 2021.09.26 |
    | Sandnes IL                    | 4253        | 661   | 400     | Gaute Aasmo                      | Lillehammer            | 52,61      | 2021.09.26 |
    | Sandnes IL                    | 4254        | 661   | Hut     | Ove Lindekleiv                   | Sandnes                | 1,49       | 2021.10.28 |
    | Sandnes IL                    | 4255        | 659   | 100     | Øystein Paulsen                  | Sandnes                | 11,77      | 2021.10.28 |
    | Sandnes IL                    | 4256        | 658   | Diskos  | Ove Lindekleiv                   | Sandnes                | 38,55      | 2021.10.28 |
    | Sandnes IL                    | 4257        | 653   | Diskos  | Jonas Skåden                     | Sandnes                | 38,28      | 2021.10.28 |
    | Sandnes IL                    | 4258        | 651   | Tresteg | Gaute Aasmo                      | Trondheim              | 12,83      | 2021.09.28 |
    | Sandnes IL                    | 4259        | 648   | 100     | Gaute Aasmo                      | Hamar                  | 11,82      | 2021.08.22 |
    | Sandnes IL                    | 4260        | 644   | 800     | Mathias Sandvik                  | Sandnes                | 2,02,28    | 2021.10.28 |
    | Sandnes IL                    | 4261        | 633   | Lut     | Rein Torsvik                     | Sandnes                | 2,93       | 2021.10.28 |
    | Sandnes IL                    | 4262        | 632   | 100     | Fredrik Selliken                 | Stavanger              | 11,90      | 2021.10.27 |
    | Sandnes IL                    | 4263        | 631   | 400     | Erlend Rødsmoen                  | Sandnes                | 53,32      | 2021.10.28 |
    | Sandnes IL                    | 4264        | 629   | 100     | Imran Mahmood                    | Oslo/St                | 11,91      | 2021.10.16 |
    | Sandnes IL                    | 4265        | 627   | Spyd    | Jonas Skåden                     | Sandnes                | 50,00      | 2021.10.28 |
    | Sandnes IL                    | 4266        | 627   | 200     | Sondre Aasmo                     | Sandnes                | 24,21      | 2021.10.28 |
    | Sandnes IL                    | 4267        | 619   | 200     | Lucas Nilsen                     | Haugesund              | 24,30      | 2021.09.12 |
    | Sandnes IL                    | 4268        | 611   | Lut     | Alexander Skrede                 | Sandnes                | 2,89       | 2021.10.28 |
    | Sandnes IL                    | 4269        | 611   | Lut     | Jonas Fjordholm                  | Sandnes                | 2,89       | 2021.10.28 |
    | Sandnes IL                    | 4270        | 609   | Lengde  | Erlend Rødsmoen                  | Ravnanger              | 6,01       | 2021.09.15 |
    | Sandnes IL                    | 4271        | 607   | Høyde   | Sondre Aasmo                     | Trondheim              | 1,75       | 2021.09.28 |
    | Sandnes IL                    | 4272        | 607   | Høyde   | Gaute Aasmo                      | Sandnes                | 1,75       | 2021.10.28 |
    | Sandnes IL                    | 4273        | 605   | 200     | Imran Mahmood                    | Lillehammer            | 24,45      | 2021.09.26 |
    | Sandnes IL                    | 4274        | 605   | Hut     | Jonas Fjordholm                  | Sandnes                | 1,44       | 2021.10.28 |
    | Sandnes IL                    | 4275        | 604   | Lengde  | Håvard Haugen                    | Hamar                  | 5,99       | 2021.08.22 |
    | Sandnes IL                    | 4276        | 604   | 200     | Ove Lindekleiv                   | Sandnes                | 24,46      | 2021.10.28 |
    | Sandnes IL                    | 4277        | 604   | 400     | Alexander Skrede                 | Sandnes                | 54,00      | 2021.10.28 |
    | Sandnes IL                    | 4278        | 602   | Kule    | Ove Lindekleiv                   | Sandnes                | 12,07      | 2021.10.28 |
    | Sandnes IL                    | 4279        | 598   | Høyde   | Håvard Haugen                    | Hamar                  | 1,74       | 2021.08.22 |
    | Sandnes IL                    | 4280        | 596   | 800     | Martin Eia                       | Sandnes                | 2,05,09    | 2021.10.28 |
    | Sandnes IL                    | 4281        | 595   | Lengde  | Gaute Aasmo                      | Hamar                  | 5,95       | 2021.08.22 |
    | Sandnes IL                    | 4282        | 589   | 1500    | Bryan Sebastian                  | Sandnes                | 4,20,73    | 2021.10.28 |
    | Sandnes IL                    | 4283        | 588   | Lengde  | Rein Torsvik                     | Sandnes                | 5,92       | 2021.10.28 |
    | Sandnes IL                    | 4284        | 586   | 800     | Einar Johnsen                    | Sandnes                | 2,05,80    | 2021.10.28 |
    | Sandnes IL                    | 4285        | 585   | 800     | Håvard Haugen                    | Haugesund              | 2,05,81    | 2021.09.12 |
    | Sandnes IL                    | 4286        | 584   | 1500    | Einar Johnsen                    | Sandnes                | 4,21,39    | 2021.10.28 |
    | Sandnes IL                    | 4287        | 583   | 400     | Sondre Aasmo                     | Sandnes                | 54,56      | 2021.10.28 |
    | Sandnes IL                    | 4288        | 573   | 200     | Ludvig Hansen                    | Haugesund              | 24,80      | 2021.09.12 |
    | Sandnes IL                    | 4289        | 569   | 800     | Bryan Sebastian                  | Sandnes                | 2,06,91    | 2021.10.28 |
    | Sandnes IL                    | 4290        | 566   | Lut     | Jonas Skåden                     | Sandnes                | 2,81       | 2021.10.28 |
    | Sandnes IL                    | 4291        | 560   | Høyde   | Ove Lindekleiv                   | Sandnes                | 1,70       | 2021.10.28 |
    | Sandnes IL                    | 4292        | 553   | 1500    | Martin Eia                       | Sandnes                | 4,25,84    | 2021.10.28 |
    | Sandnes IL                    | 4293        | 552   | 400     | Ludvig Hansen                    | Sandnes                | 55,39      | 2021.10.28 |
    | Sandnes IL                    | 4294        | 552   | 400     | Christopher Fardan               | Sandnes                | 55,40      | 2021.10.28 |
    | Sandnes IL                    | 4295        | 550   | 100     | Ludvig Hansen                    | Sandnes                | 12,30      | 2021.10.28 |
    | Sandnes IL                    | 4296        | 550   | 800     | Christopher Fardan               | Stavanger              | 2,08,15    | 2021.10.27 |
    | Sandnes IL                    | 4297        | 548   | 400     | Øystein Paulsen                  | Sandnes                | 55,51      | 2021.10.28 |
    | Sandnes IL                    | 4298        | 547   | Stav    | Sondre Aasmo                     | Hamar                  | 3,20       | 2021.08.22 |
    | Sandnes IL                    | 4299        | 547   | Stav    | Gaute Aasmo                      | Hamar                  | 3,20       | 2021.08.22 |
    | Sandnes IL                    | 4300        | 547   | Stav    | Håvard Haugen                    | Hamar                  | 3,20       | 2021.08.22 |
    | Sandnes IL                    | 4301        | 535   | Lengde  | Sondre Aasmo                     | Trondheim              | 5,69       | 2021.09.28 |
    | Sandnes IL                    | 4302        | 533   | 800     | Jan Wergeland                    | Stavanger              | 2,09,36    | 2021.10.27 |
    | Sandnes IL                    | 4303        | 529   | Spyd    | Ove Lindekleiv                   | Sandnes                | 42,96      | 2021.10.28 |
    | Sandnes IL                    | 4304        | 525   | Slegge  | Håvard Haugen                    | Sandnes                | 34,06      | 2021.10.28 |
    | Sandnes IL                    | 4305        | 520   | Lut     | Sondre Aasmo                     | Sandnes                | 2,73       | 2021.10.28 |
    | Sandnes IL                    | 4306        | 519   | 200     | Rein Torsvik                     | Sandnes                | 25,44      | 2021.10.28 |
    | Sandnes IL                    | 4307        | 514   | Lengde  | Alexander Skrede                 | Sandnes                | 5,60       | 2021.10.28 |
    | Sandnes IL                    | 4308        | 509   | 100     | Memarthaen Nalliah               | Sandnes                | 12,51      | 2021.10.28 |
    | Sandnes IL                    | 4309        | 505   | 400     | Øystein Wergeland                | Sandnes                | 56,80      | 2021.10.28 |
    | Sandnes IL                    | 4310        | 498   | 100     | Torleiv Hølland                  | Larvik                 | 12,57      | 2021.09.15 |
    | Sandnes IL                    | 4311        | 490   | 200     | Memarthaen Nalliah               | Sandnes                | 25,81      | 2021.10.28 |
    | Sandnes IL                    | 4312        | 489   | 3000    | Bryan Sebastian                  | Sandnes                | 10,00,34   | 2021.10.28 |
    | Sandnes IL                    | 4313        | 484   | 800     | Øystein Wergeland                | Stavanger              | 2,12,99    | 2021.10.27 |
    | Sandnes IL                    | 4314        | 481   | Høyde   | Oscar Weaver                     | Haugesund              | 1,62       | 2021.09.12 |
    | Sandnes IL                    | 4315        | 478   | 200     | Einar Kinn                       | Sandnes                | 25,96      | 2021.10.28 |
    | Sandnes IL                    | 4316        | 452   | 200     | Torleiv Hølland                  | Førde                  | 26,31      | 2021.08.22 |
    | Sandnes IL                    | 4317        | 451   | 3000    | Bjørnar Nedrebø                  | Sandnes                | 10,13,62   | 2021.10.28 |
    | Sandnes IL                    | 4318        | 450   | 400     | Eskild Hillesund                 | Sandnes                | 58,58      | 2021.10.28 |
    | Sandnes IL                    | 4319        | 445   | Kule    | Soban Inayat                     | Sandnes                | 9,94       | 2021.10.28 |
    | Sandnes IL                    | 4320        | 429   | Lengde  | Einar Kinn                       | Sandnes                | 5,24       | 2021.10.28 |
    | Sandnes IL                    | 4321        | 429   | 200     | Hrafnkell Bjarkason              | Sandnes                | 26,63      | 2021.10.28 |
    | Sandnes IL                    | 4322        | 426   | Hut     | Alexander Skrede                 | Sandnes                | 1.29       | 2021.10.28 |
    | Sandnes IL                    | 4323        | 419   | Lut     | Trond Lindanger                  | Sandnes                | 2,57       | 2021.10.28 |
    | Sandnes IL                    | 4324        | 413   | 100     | Hrafnkell Bjarkason              | Sandnes                | 13,04      | 2021.10.28 |
    | Sandnes IL                    | 4325        | 403   | 1500    | Håvard Haugen                    | Hamar                  | 4,50,37    | 2021.08.22 |
    | Sandnes IL                    | 4326        | 400   | 400     | Rein Torsvik                     | Sandnes                | 1,00,36    | 2021.10.28 |
    | Sandnes IL                    | 4327        | 391   | Stav    | Are Torsvik                      | Hamar                  | 2,60       | 2021.08.22 |
    | Sandnes IL                    | 4328        | 390   | Lut     | Ludvig Hansen                    | Sandnes                | 2,53       | 2021.10.28 |
    | Sandnes IL                    | 4329        | 388   | Lengde  | Imran Mahmood                    | Oslo/St                | 5,07       | 2021.10.16 |
    | Sandnes IL                    | 4330        | 387   | 200h    | Imran Mahmood                    | Sandnes                | 32,17      | 2021.10.28 |
    | Sandnes IL                    | 4331        | 375   | Lut     | Øystein Paulsen                  | Sandnes                | 2,51       | 2021.10.28 |
    | Sandnes IL                    | 4332        | 374   | Slegge  | Jonas Skåden                     | Sandnes                | 25,13      | 2021.10.28 |
    | Sandnes IL                    | 4333        | 372   | 400     | Imran Mahmood                    | Sandnes                | 1,01,42    | 2021.10.28 |
    | Sandnes IL                    | 4334        | 365   | 3000    | Bjørnar Bjåstad                  | Sandnes                | 10,47,06   | 2021.10.28 |
    | Sandnes IL                    | 4335        | 359   | Lut     | Geir Eikeland                    | Sandnes                | 2,49       | 2021.10.28 |
    | Sandnes IL                    | 4336        | 359   | Lut     | Imran Mahmood                    | Sandnes                | 2,49       | 2021.10.28 |
    | Sandnes IL                    | 4337        | 354   | 1500    | Gaute Aasmo                      | Hamar                  | 4,59,45    | 2021.08.22 |
    | Sandnes IL                    | 4338        | 342   | Lut     | Einar Kinn                       | Sandnes                | 2,47       | 2021.10.28 |
    | Sandnes IL                    | 4339        | 326   | 1500    | Stefan Rajkovic                  | Sandnes                | 5,05,11    | 2021.10.28 |
    | Sandnes IL                    | 4340        | 322   | 100     | Are Torsvik                      | Hamar                  | 13,60      | 2021.08.22 |
    | Sandnes IL                    | 4341        | 317   | 1500    | Sondre Aasmo                     | Hamar                  | 5,06,86    | 2021.08.22 |
    | Sandnes IL                    | 4342        | 312   | 200     | Osvald Vik                       | Stavanger              | 28,40      | 2021.10.27 |
    | Sandnes IL                    | 4343        | 294   | 100     | Osvald Vik                       | Sandnes                | 13,78      | 2021.10.28 |
    | Sandnes IL                    | 4344        | 291   | Slegge  | Lars Espedal                     | Sandnes                | 20,86      | 2021.10.28 |
    | Sandnes IL                    | 4345        | 291   | 200     | Are Torsvik                      | Sandnes                | 28,74      | 2021.10.28 |
    | Sandnes IL                    | 4346        | 285   | Lengde  | Are Torsvik                      | Sandnes                | 4,65       | 2021.10.28 |
    | Sandnes IL                    | 4347        | 278   | 200h    | Osvald Vik                       | Sandnes                | 34,48      | 2021.10.28 |
    | Sandnes IL                    | 4348        | 276   | 1500    | Bjørnar Flesjå                   | Ålgård                 | 5,15,46    | 2021.09.20 |
    | Sandnes IL                    | 4349        | 273   | 400     | Are Torsvik                      | Sandnes                | 1,05,46    | 2021.10.28 |
    | Sandnes IL                    | 4350        | 272   | 100     | Vegard Mørch                     | Vik                    | 13,93      | 2021.10.02 |
    | Sandnes IL                    | 4351        | 260   | 3000    | Kenneth Bergsagel                | Sandnes                | 11,33,46   | 2021.10.28 |
    | Sandnes IL                    | 4352        | 259   | Hut     | Trond Lindanger                  | Sandnes                | 1,19       | 2021.10.28 |
    | Sandnes IL                    | 4353        | 259   | Hut     | Are Torsvik                      | Sandnes                | 1,19       | 2021.10.28 |
    | Sandnes IL                    | 4354        | 257   | Diskos  | Are Torsvik                      | Sandnes                | 21,50      | 2021.10.28 |
    | Sandnes IL                    | 4355        | 244   | 200h    | Oscar Weaver                     | Sandnes                | 35,24      | 2021.10.28 |
    | Sandnes IL                    | 4356        | 243   | 200     | Oscar Weaver                     | Sandnes                | 29,57      | 2021.10.28 |
    | Sandnes IL                    | 4357        | 240   | Lut     | Rune Ims                         | Sandnes                | 2,36       | 2021.10.28 |
    | Sandnes IL                    | 4358        | 227   | 100     | Håvard Bjerkli                   | Sandnes                | 14,24      | 2021.10.28 |
    | Sandnes IL                    | 4359        | 206   | 100     | William Wiggins                  | Sandnes                | 14,39      | 2021.10.28 |
    | Sandnes IL                    | 4360        | 198   | 3000    | Arild Eikeland                   | Sandnes                | 12,05,61   | 2021.10.28 |
    | Sandnes IL                    | 4361        | 194   | 200     | Håvard Bjerkli                   | Haugesund              | 30,44      | 2021.09.12 |
    | Sandnes IL                    | 4362        | 191   | 3000    | Tommy Byberg                     | Sandnes                | 12,09,64   | 2021.10.28 |
    | Sandnes IL                    | 4363        | 191   | 1500    | Elliot Etnan                     | Sandnes                | 5,34,76    | 2021.10.28 |
    | Sandnes IL                    | 4364        | 186   | 5000    | Vegard Mørch                     | Vik                    | 21,24,11   | 2021.10.02 |
    | Sandnes IL                    | 4365        | 185   | 3000    | Harald Haga                      | Sandnes                | 12,12,98   | 2021.10.28 |
    | Sandnes IL                    | 4366        | 166   | Lengde  | William Wiggins                  | Sandnes                | 4,18       | 2021.10.28 |
    | Sandnes IL                    | 4367        | 164   | 100     | Mathias Skrede                   | Frøyland               | 14,71      | 2021.09.07 |
    | Sandnes IL                    | 4368        | 161   | 100     | Magnus Svendsen                  | Sandnes                | 14,73      | 2021.10.28 |
    | Sandnes IL                    | 4369        | 155   | 3000    | Christian Brandtzæg              | Sandnes                | 12,30,03   | 2021.10.28 |
    | Sandnes IL                    | 4370        | 152   | 3000    | Egil Qvale                       | Sandnes                | 12,31,65   | 2021.10.28 |
    | Sandnes IL                    | 4371        | 150   | Lut     | Are Torsvik                      | Sandnes                | 2,27       | 2021.10.28 |
    | Sandnes IL                    | 4372        | 150   | 3000    | Joakim Haugen                    | Sandnes                | 12,33,04   | 2021.10.28 |
    | Sandnes IL                    | 4373        | 125   | 3000    | Knut Kvalbein                    | Sandnes                | 12,48,44   | 2021.10.28 |
    | Sandnes IL                    | 4374        | 120   | Lut     | Hrafnkell Bjarkason              | Sandnes                | 2,24       | 2021.10.28 |
    | Sandnes IL                    | 4375        | 112   | 200     | Sindre Liebich                   | Stavanger              | 32,04      | 2021.10.27 |
    | Sandnes IL                    | 4376        | 112   | 200     | Mathias Henriksen                | Stavanger              | 32,04      | 2021.10.27 |
    | Sandnes IL                    | 4377        | 107   | 1500    | Are Torsvik                      | Hamar                  | 5,56,38    | 2021.08.22 |
    | Sandnes IL                    | 4378        | 96    | Høyde   | Sofian Nilsen                    | Haugesund              | 1,30       | 2021.09.12 |
    | Sandnes IL                    | 4379        | 85    | 200     | Torjus Lund-Vivoll               | Stavanger              | 32,58      | 2021.10.27 |
    | Sandnes IL                    | 4380        | 80    | Hut     | Geir Eikeland                    | Sandnes                | 1,10       | 2021.10.28 |
    | Sandnes IL                    | 4381        | 73    | 200     | Ole Lobekk                       | Stavanger              | 32,84      | 2021.10.27 |
    | Sandnes IL                    | 4382        | 60    | Lut     | Harald Nybru                     | Sandnes                | 2,18       | 2021.10.28 |
    | Sandnes IL                    | 4383        | 60    | Lut     | Memarthaen Nalliah               | Sandnes                | 2,18       | 2021.10.28 |
    | Sandnes IL                    | 4384        | 48    | 200     | Axel Østbø                       | Stavanger              | 33,36      | 2021.10.27 |
    | Sandnes IL                    | 4385        | 35    | 3000    | Kjell Eide                       | Sandnes                | 13,51,60   | 2021.10.28 |
    | Sandnes IL                    | 4386        | 19    | Høyde   | Are Torsvik                      | Sandnes                | 1,25       | 2021.10.28 |
    | Sandnes IL                    | 4387        | 8     | 1500    | Magnus Svendsen                  | Sandnes                | 6,25,95    | 2021.10.28 |
    | Sandnes IL                    | 4388        | 3     | Høyde   | Sindre Liebich                   | Stavanger              | 1,24       | 2021.10.27 |
    | Sandnessjøen IL               | 4389        | 528   | 3000    | Christian Kynsveen               | Mosjøen                | 9,47,01    | 2021.08.28 |
    | Sandnessjøen IL               | 4390        | 298   | 100     | Erling Føsker                    | Mosjøen                | 13,75      | 2021.08.28 |
    | Sandnessjøen IL               | 4391        | 202   | 800     | Erling Føsker                    | Mosjøen                | 2,40,07    | 2021.08.28 |
    | Sandnessjøen IL               | 4392        | 193   | 100     | Mathias Henningsen               | Mosjøen                | 14,49      | 2021.08.28 |
    | Sandnessjøen IL               | 4393        | 140   | Høyde   | Jonathan Almås                   | Bodø                   | 1,33       | 2021.09.21 |
    | Sandnessjøen IL               | 4394        | 105   | 800     | Mathias Henningsen               | Mosjøen                | 2,51,43    | 2021.08.28 |
    | Sarpsborg IL                  | 4395        | 903   | 800     | Benjamin Olsen                   | Jessheim               | 1,50,52    | 2021.09.09 |
    | Sarpsborg IL                  | 4396        | 883   | 1500    | Benjamin Olsen                   | Oslo/Bi                | 3,48,37    | 2021.09.25 |
    | Sarpsborg IL                  | 4397        | 843   | 3000    | Benjamin Olsen                   | Nadderud               | 8,23,51    | 2021.10.16 |
    | Sarpsborg IL                  | 4398        | 835   | Spyd    | Benjamin Gressløs                | Ravnanger              | 65,50      | 2021.09.15 |
    | Sarpsborg IL                  | 4399        | 735   | 800     | Sindre Fredriksen                | Trondheim              | 1,57,64    | 2021.09.28 |
    | Sarpsborg IL                  | 4400        | 683   | 10000   | Magnus Andersen                  | Jessheim               | 32,58,38   | 2021.09.09 |
    | Sarpsborg IL                  | 4401        | 670   | 1500    | Sindre Fredriksen                | Oslo/Bi                | 4,10,18    | 2021.09.25 |
    | Sarpsborg IL                  | 4402        | 661   | 800     | Emil Kullerud                    | Jessheim               | 2,01,39    | 2021.09.09 |
    | Sarpsborg IL                  | 4403        | 631   | 5000    | Magnus Andersen                  | Sarpsborg              | 16,07,47   | 2021.08.21 |
    | Sarpsborg IL                  | 4404        | 603   | 1500    | Emil Kullerud                    | Oslo/Bi                | 4,18,73    | 2021.09.25 |
    | Sarpsborg IL                  | 4405        | 597   | 3000    | Sindre Fredriksen                | Trondheim              | 9,25,39    | 2021.09.28 |
    | Sarpsborg IL                  | 4406        | 530   | 200     | Henrik Schrøder                  | Rjukan                 | 25,31      | 2021.09.12 |
    | Sarpsborg IL                  | 4407        | 467   | 1500    | Henrik Schrøder                  | Nadderud               | 4,39,23    | 2021.10.16 |
    | Sarpsborg IL                  | 4408        | 460   | 800     | Henrik Schrøder                  | Sarpsborg              | 2,14,87    | 2021.08.21 |
    | Sarpsborg IL                  | 4409        | 434   | 100     | Henrik Schrøder                  | Moss                   | 12,92      | 2021.10.09 |
    | Sarpsborg IL                  | 4410        | 355   | 1500    | Kristoffer Kottum                | Rjukan                 | 4,59,30    | 2021.09.12 |
    | Sarpsborg IL                  | 4411        | 336   | 800     | Fredrik Bjercke-Johansen         | Sarpsborg              | 2,26,03    | 2021.08.21 |
    | Sarpsborg IL                  | 4412        | 317   | 1500    | Fredrik Bjercke-Johansen         | Lillehammer            | 5,06,84    | 2021.09.26 |
    | Sarpsborg IL                  | 4413        | 306   | Stav    | Fredrik Bjercke-Johansen         | Rjukan                 | 2,32       | 2021.09.12 |
    | Sarpsborg IL                  | 4414        | 289   | Tresteg | Fredrik Bjercke-Johansen         | Rjukan                 | 9,65       | 2021.09.12 |
    | Sarpsborg IL                  | 4415        | 288   | Lengde  | Henrik Schrøder                  | Sarpsborg              | 4,66       | 2021.08.21 |
    | Sarpsborg IL                  | 4416        | 282   | 200     | Fredrik Bjercke-Johansen         | Moss                   | 28,89      | 2021.10.09 |
    | Sarpsborg IL                  | 4417        | 265   | Lengde  | Fredrik Bjercke-Johansen         | Jessheim               | 4,57       | 2021.09.09 |
    | Sarpsborg IL                  | 4418        | 233   | Høyde   | Morten Granli                    | Nadderud               | 1,40       | 2021.10.16 |
    | Sarpsborg IL                  | 4419        | 226   | 100     | Fredrik Bjercke-Johansen         | Moss                   | 14,25      | 2021.10.09 |
    | Sarpsborg IL                  | 4420        | 170   | 200     | Wilmer Bjor                      | Nadderud               | 30,90      | 2021.10.16 |
    | Sarpsborg IL                  | 4421        | 167   | Høyde   | Mats Bäckstrøm                   | Nadderud               | 1,35       | 2021.10.16 |
    | Sarpsborg IL                  | 4422        | 137   | Lengde  | Arnt Nilsen                      | Sarpsborg              | 4,07       | 2021.08.21 |
    | Sarpsborg IL                  | 4423        | 123   | 800     | Mats Bäckstrøm                   | Sarpsborg              | 2,49,35    | 2021.08.21 |
    | Sarpsborg IL                  | 4424        | 72    | Stav    | Daniel Aasbrenn                  | Sarpsborg              | 1,70       | 2021.08.21 |
    | Sauda IL                      | 4425        | 533   | 1500    | Elias Dybing                     | Nadderud               | 4,28,83    | 2021.10.16 |
    | Sauda IL                      | 4426        | 471   | 800     | Olav Bakka                       | Frakkagjerd            | 2,14,03    | 2021.08.22 |
    | Sauda IL                      | 4427        | 465   | 800     | Elias Dybing                     | Stavanger              | 2,14,54    | 2021.10.27 |
    | Sauda IL                      | 4428        | 386   | 1500    | Torben Søfting                   | Sandnes                | 4,53,50    | 2021.10.28 |
    | Sauda IL                      | 4429        | 354   | 800     | Torben Søfting                   | Øvre Årdal             | 2,24,28    | 2021.09.08 |
    | Sauda IL                      | 4430        | 319   | 1500    | Iver Bastlien                    | Nadderud               | 5,06,45    | 2021.10.16 |
    | Sauda IL                      | 4431        | 210   | 800     | Iver Bastlien                    | Stavanger              | 2,39,22    | 2021.10.27 |
    | Sauda IL                      | 4432        | 169   | 1500    | Jonar Søfting                    | Leirvik                | 5,40,12    | 2021.09.13 |
    | Selbu IL                      | 4433        | 90    | 100     | Heine Sørensen                   | Selbu                  | 15,30      | 2021.05.31 |
    | Selbu IL                      | 4434        | 5     | 100     | Jonatan Winum                    | Selbu                  | 16,03      | 2021.05.31 |
    | Seljord IL                    | 4435        | 804   | 100     | Herman Sveinsson                 | Trondheim              | 11,15      | 2021.09.28 |
    | Seljord IL                    | 4436        | 787   | 200     | Herman Sveinsson                 | Lillehammer            | 22,65      | 2021.09.26 |
    | Seljord IL                    | 4437        | 716   | Lengde  | Herman Sveinsson                 | Trondheim              | 6,49       | 2021.09.28 |
    | Seljord IL                    | 4438        | 655   | 100     | Håkon Aaberg                     | Trondheim              | 11,79      | 2021.09.28 |
    | Seljord IL                    | 4439        | 548   | 800     | Kristian Berntzen                | Trondheim              | 2,08,26    | 2021.09.28 |
    | Seljord IL                    | 4440        | 498   | 1500    | Kristian Berntzen                | Porsgrunn              | 4,34,17    | 2021.09.25 |
    | Seljord IL                    | 4441        | 480   | 200     | Håkon Aaberg                     | Seljord                | 25,93      | 2021.03.13 |
    | Seljord IL                    | 4442        | 437   | 3000    | Kristian Berntzen                | Notodden               | 10,18,69   | 2021.10.06 |
    | Seljord IL                    | 4443        | 167   | Høyde   | Edvard Telnes                    | Skien                  | 1,35       | 2021.08.11 |
    | Selsbakk IF                   | 4444        | 899   | 800     | Sondre Rishøi                    | Jessheim               | 1,50,66    | 2021.09.09 |
    | Selsbakk IF                   | 4445        | 873   | 1500    | Sondre Rishøi                    | Oslo/Bi                | 3,49,23    | 2021.09.25 |
    | Selsbakk IF                   | 4446        | 867   | 10000   | Tord Ulset                       | Kristiansand           | 29,59,20   | 2021.10.06 |
    | Selsbakk IF                   | 4447        | 846   | 5000    | Tord Ulset                       | Greveskogen            | 14,28,51   | 2021.10.30 |
    | Selsbakk IF                   | 4448        | 833   | 3000    | Tord Ulset                       | Trondheim              | 8,25,63    | 2021.09.28 |
    | Selsbakk IF                   | 4449        | 751   | 400     | Sondre Rishøi                    | Trondheim              | 50,66      | 2021.09.28 |
    | Selsbakk IF                   | 4450        | 743   | 3000    | Sondre Rishøi                    | Trondheim              | 8,46,23    | 2021.09.28 |
    | Selsbakk IF                   | 4451        | 740   | 1500    | Tord Ulset                       | Trondheim              | 4,02,15    | 2021.09.28 |
    | Selsbakk IF                   | 4452        | 674   | 200     | Sondre Rishøi                    | Trondheim              | 23,73      | 2021.09.28 |
    | Selsbakk IF                   | 4453        | 649   | 800     | Tord Ulset                       | Stadsbygd              | 2,02,0     | 2021.05.09 |
    | Sem IF                        | 4454        | 911   | 1500    | Moa Bollerød                     | Oslo/Bi                | 3,45,96    | 2021.09.25 |
    | Sem IF                        | 4455        | 895   | 800     | Moa Bollerød                     | Greveskogen            | 1,50,81    | 2021.10.30 |
    | Sem IF                        | 4456        | 646   | 800     | Brage Nybakk                     | Nadderud               | 2,02,16    | 2021.10.16 |
    | Sem IF                        | 4457        | 598   | 800     | Andreas Rivenes                  | Lillehammer            | 2,04,97    | 2021.09.26 |
    | Sem IF                        | 4458        | 577   | 1500    | Andreas Rivenes                  | Greveskogen            | 4,22,35    | 2021.10.30 |
    | Sem IF                        | 4459        | 576   | 1500    | Vetle Mathisen                   | Greveskogen            | 4,22,54    | 2021.10.30 |
    | Sem IF                        | 4460        | 566   | 3000    | Vetle Mathisen                   | Sem                    | 9,34,97    | 2021.05.12 |
    | Sem IF                        | 4461        | 551   | 1500    | Brage Nybakk                     | Jessheim               | 4,26,09    | 2021.09.09 |
    | Sem IF                        | 4462        | 544   | 800     | Sander Sælid                     | Greveskogen            | 2,08,55    | 2021.10.30 |
    | Sem IF                        | 4463        | 521   | 1500    | Sander Sælid                     | Nadderud               | 4,30,66    | 2021.10.16 |
    | Sem IF                        | 4464        | 498   | 400     | Sander Sælid                     | Greveskogen            | 57,00      | 2021.10.30 |
    | Sem IF                        | 4465        | 496   | 200     | Sander Sælid                     | Rjukan                 | 25,72      | 2021.09.12 |
    | Sem IF                        | 4466        | 97    | 200     | Aksel Olsen                      | Greveskogen            | 32,33      | 2021.10.30 |
    | Sem IF                        | 4467        | 19    | Høyde   | Aksel Olsen                      | Greveskogen            | 1,25       | 2021.10.30 |
    | Sigdal FIK                    | 4468        | 529   | 5000    | Marius Wiersdalen                | Sigdal                 | 17,03,0    | 2021.09.29 |
    | Sigdal FIK                    | 4469        | 475   | 3000    | Marius Wiersdalen                | Sande                  | 10,05,0    | 2021.10.07 |
    | Sigdal FIK                    | 4470        | 448   | 100     | Sivert Jokerud                   | Sigdal                 | 12,6       | 2021.09.29 |
    | Sigdal FIK                    | 4471        | 360   | 5000    | Kristoffer Aaby                  | Sigdal                 | 18,54,0    | 2021.09.29 |
    | Sigdal FIK                    | 4472        | 317   | 5000    | Mathias Strand                   | Sigdal                 | 19,27,0    | 2021.09.29 |
    | Sigdal FIK                    | 4473        | 294   | Kule    | Øystein Wiersdalen               | Sigdal                 | 8,01       | 2021.09.29 |
    | Sigdal FIK                    | 4474        | 290   | Kule    | Sivert Jokerud                   | Sigdal                 | 7,96       | 2021.09.29 |
    | Sigdal FIK                    | 4475        | 190   | 5000    | Kristen Aaby                     | Sigdal                 | 21,20,0    | 2021.09.29 |
    | Sigdal FIK                    | 4476        | 22    | 5000    | Kristian Wiersdalen              | Sigdal                 | 24,44,0    | 2021.09.29 |
    | Sjetne IL                     | 4477        | 80    | Hut     | Arne Jensen                      | Hvam                   | 1,10       | 2021.10.23 |
    | Skarphedin IL                 | 4478        | 707   | 5000    | Matias Sunde                     | Oslo/Bi                | 15,29,88   | 2021.09.25 |
    | Skarphedin IL                 | 4479        | 700   | 3000    | Matias Sunde                     | Jessheim               | 8,56,93    | 2021.09.09 |
    | Skarphedin IL                 | 4480        | 695   | 5000    | Anders Hekkli                    | Notodden               | 15,35,75   | 2021.10.06 |
    | Skarphedin IL                 | 4481        | 625   | 1500    | Matias Sunde                     | Bø                     | 4,15,9     | 2021.09.21 |
    | Skarphedin IL                 | 4482        | 597   | 3000    | Gjermund Erikstein-Midtbø        | Lyngdal                | 9,25,30    | 2021.09.26 |
    | Skarphedin IL                 | 4483        | 583   | 1500    | Daniel Næss                      | Bø                     | 4,21,6     | 2021.09.21 |
    | Skarphedin IL                 | 4484        | 528   | 1500    | Sondre Rinde                     | Nadderud               | 4,29,67    | 2021.10.16 |
    | Skarphedin IL                 | 4485        | 524   | 3000    | Sondre Rinde                     | Notodden               | 9,48,53    | 2021.10.06 |
    | Skarphedin IL                 | 4486        | 516   | 800     | Sondre Rinde                     | Rjukan                 | 2,10,56    | 2021.09.12 |
    | Skarphedin IL                 | 4487        | 357   | 1500    | Tobias Rinde                     | Nadderud               | 4,58,88    | 2021.10.16 |
    | Skarphedin IL                 | 4488        | 101   | 1500    | Henrik Romnes                    | Bø                     | 5,57,9     | 2021.09.21 |
    | Skarphedin IL                 | 4489        | 62    | 1500    | Lars Mølstre                     | Bø                     | 6,09,3     | 2021.09.21 |
    | Skaun IL                      | 4490        | 19    | Høyde   | Erik Husby                       | Børsa                  | 1,25       | 2021.08.08 |
    | Skaun IL                      | 4491        | 1     | 3000    | Arvid Syrstad                    | Førde                  | 14,18,98   | 2021.08.22 |
    | Ski IL Friidrett              | 4492        | 720   | Stav    | Tobias Rian                      | Oslo/NIH               | 4,00       | 2021.09.22 |
    | Ski IL Friidrett              | 4493        | 679   | Stav    | Elias Aaslid                     | Oslo/NIH               | 3,80       | 2021.09.22 |
    | Ski IL Friidrett              | 4494        | 519   | 200     | Benjamin Opuama                  | Nittedal               | 25,44      | 2021.10.30 |
    | Ski IL Friidrett              | 4495        | 503   | Lengde  | Tobias Rian                      | Hamar                  | 5,55       | 2021.08.22 |
    | Ski IL Friidrett              | 4496        | 500   | 200     | Bruno Nardocci                   | Asker                  | 25,67      | 2021.09.26 |
    | Ski IL Friidrett              | 4497        | 468   | 100     | Bruno Nardocci                   | Oslo/St                | 12,73      | 2021.10.16 |
    | Ski IL Friidrett              | 4498        | 461   | Høyde   | Tobias Rian                      | Oslo/Bi                | 1,60       | 2021.09.25 |
    | Ski IL Friidrett              | 4499        | 432   | Lengde  | Bruno Nardocci                   | Oslo/St                | 5,25       | 2021.10.16 |
    | Ski IL Friidrett              | 4500        | 408   | Høyde   | Jacob Lund                       | Ski                    | 1,55       | 2021.09.25 |
    | Ski IL Friidrett              | 4501        | 408   | 100     | Tobias Rian                      | Hamar                  | 13,07      | 2021.08.22 |
    | Ski IL Friidrett              | 4502        | 382   | Kule    | Frank Andersen                   | Stavanger              | 9,11       | 2021.10.27 |
    | Ski IL Friidrett              | 4503        | 362   | Spyd    | Reidar Dahl                      | Ski                    | 31,90      | 2021.09.25 |
    | Ski IL Friidrett              | 4504        | 359   | 200     | Tobias Rian                      | Oslo/St                | 27,65      | 2021.10.16 |
    | Ski IL Friidrett              | 4505        | 356   | 400     | Tobias Rian                      | Hamar                  | 1,02,04    | 2021.08.22 |
    | Ski IL Friidrett              | 4506        | 308   | Lengde  | Hallvard Langen                  | Ski                    | 4,74       | 2021.09.25 |
    | Ski IL Friidrett              | 4507        | 299   | 1500    | Tobias Rian                      | Hamar                  | 5,10,37    | 2021.08.22 |
    | Ski IL Friidrett              | 4508        | 273   | 1500    | Magnus Nørbech                   | Rjukan                 | 5,16,09    | 2021.09.12 |
    | Ski IL Friidrett              | 4509        | 239   | Stav    | Elias Rian                       | Rjukan                 | 2,12       | 2021.09.12 |
    | Ski IL Friidrett              | 4510        | 236   | Kule    | Reidar Dahl                      | Heggedal               | 7,32       | 2021.09.26 |
    | Ski IL Friidrett              | 4511        | 220   | 200     | Tarun Verma                      | Nittedal               | 29,97      | 2021.10.30 |
    | Ski IL Friidrett              | 4512        | 167   | Høyde   | Benjamin Opuama                  | Moss                   | 1,35       | 2021.10.09 |
    | Ski IL Friidrett              | 4513        | 165   | Stav    | Magnus Nørbech                   | Rjukan                 | 1,92       | 2021.09.12 |
    | Ski IL Friidrett              | 4514        | 117   | 100     | Tarun Verma                      | Nittedal               | 15,08      | 2021.10.30 |
    | Ski IL Friidrett              | 4515        | 19    | Høyde   | Per Aaraas                       | Ski                    | 1,25       | 2021.09.25 |
    | Skogn IL                      | 4516        | 507   | 800     | Matteus Fossum                   | Trondheim              | 2,11,27    | 2021.09.28 |
    | Skogn IL                      | 4517        | 494   | 400     | Matteus Fossum                   | Steinkjer              | 57,14      | 2021.09.30 |
    | Skogn IL                      | 4518        | 465   | 1500    | Matteus Fossum                   | Steinkjer              | 4,39,60    | 2021.09.30 |
    | Skogn IL                      | 4519        | 425   | 200     | Matteus Fossum                   | Steinkjer              | 26,68      | 2021.09.30 |
    | Skogn IL                      | 4520        | 337   | 100     | Matteus Fossum                   | Trondheim              | 13,50      | 2021.09.28 |
    | Snåsa IL                      | 4521        | 434   | 3000    | Ole Strand                       | Bodø                   | 10,20,05   | 2021.09.21 |
    | Snøgg Friidrett               | 4522        | 875   | 3000    | Vebjørn Hovdejord                | Jessheim               | 8,16,58    | 2021.09.09 |
    | Snøgg Friidrett               | 4523        | 862   | 5000    | Vebjørn Hovdejord                | Ravnanger              | 14,22,26   | 2021.09.15 |
    | Snøgg Friidrett               | 4524        | 860   | 3000H   | Vebjørn Hovdejord                | Kristiansand           | 9,01,34    | 2021.10.06 |
    | Snøgg Friidrett               | 4525        | 823   | 10000   | Vebjørn Hovdejord                | Kristiansand           | 30,38,53   | 2021.10.06 |
    | Snøgg Friidrett               | 4526        | 750   | Lut     | Sondre Kasin                     | Notodden               | 3,14       | 2021.10.06 |
    | Snøgg Friidrett               | 4527        | 672   | 10000   | Kjetil Brårud                    | Oslo/Bi                | 33,10,19   | 2021.09.25 |
    | Snøgg Friidrett               | 4528        | 656   | 5000    | Kjetil Brårud                    | Notodden               | 15,54,45   | 2021.10.06 |
    | Snøgg Friidrett               | 4529        | 614   | 1500    | Christian Bredesen               | Oslo/Bi                | 4,17,33    | 2021.09.25 |
    | Snøgg Friidrett               | 4530        | 585   | 800     | Christian Bredesen               | Lillehammer            | 2,05,87    | 2021.09.26 |
    | Snøgg Friidrett               | 4531        | 585   | 3000    | Christian Bredesen               | Notodden               | 9,29,08    | 2021.10.06 |
    | Snøgg Friidrett               | 4532        | 577   | 10000   | Christian Bredesen               | Oslo/Bi                | 34,59,02   | 2021.09.25 |
    | Snøgg Friidrett               | 4533        | 563   | 5000    | Christian Bredesen               | Oslo/Bi                | 16,43,52   | 2021.09.25 |
    | Snøgg Friidrett               | 4534        | 551   | 800     | Markus Nesholen                  | Rjukan                 | 2,08,07    | 2021.09.12 |
    | Snøgg Friidrett               | 4535        | 539   | Kule    | Roar Uglem                       | Notodden               | 11,21      | 2021.10.06 |
    | Snøgg Friidrett               | 4536        | 525   | 5000    | Lars Arud                        | Notodden               | 17,05,31   | 2021.10.06 |
    | Snøgg Friidrett               | 4537        | 523   | 3000    | Lars Arud                        | Notodden               | 9,48,8     | 2021.10.06 |
    | Snøgg Friidrett               | 4538        | 517   | 10000   | Lars Arud                        | Oslo/Bi                | 36,14,83   | 2021.09.25 |
    | Snøgg Friidrett               | 4539        | 512   | Diskos  | Roar Uglem                       | Notodden               | 31,48      | 2021.10.06 |
    | Snøgg Friidrett               | 4540        | 509   | Lut     | Jesper Karlberg                  | Notodden               | 2,71       | 2021.10.06 |
    | Snøgg Friidrett               | 4541        | 508   | Diskos  | Arnold Boer                      | Notodden               | 31,27      | 2021.10.06 |
    | Snøgg Friidrett               | 4542        | 485   | 400     | Christian Bredesen               | Lillehammer            | 57,45      | 2021.09.26 |
    | Snøgg Friidrett               | 4543        | 474   | 200     | Markus Nesholen                  | Notodden               | 26,01      | 2021.10.06 |
    | Snøgg Friidrett               | 4544        | 474   | 800     | Lars Arud                        | Notodden               | 2,13,82    | 2021.10.06 |
    | Snøgg Friidrett               | 4545        | 454   | 5000    | Steinar Nymoen                   | Notodden               | 17,49,03   | 2021.10.06 |
    | Snøgg Friidrett               | 4546        | 446   | Spyd    | Arnold Boer                      | Notodden               | 37,26      | 2021.10.06 |
    | Snøgg Friidrett               | 4547        | 443   | 100     | Adrian Svendsen                  | Notodden               | 12,87      | 2021.10.06 |
    | Snøgg Friidrett               | 4548        | 439   | 400     | Markus Nesholen                  | Notodden               | 58,98      | 2021.10.06 |
    | Snøgg Friidrett               | 4549        | 436   | 200     | Adrian Svendsen                  | Notodden               | 26,53      | 2021.10.06 |
    | Snøgg Friidrett               | 4550        | 427   | 1500    | Markus Nesholen                  | Nittedal               | 4,46,07    | 2021.10.30 |
    | Snøgg Friidrett               | 4551        | 395   | Spyd    | Vebjørn Bredesen                 | Notodden               | 33,99      | 2021.10.06 |
    | Snøgg Friidrett               | 4552        | 389   | Kule    | Arnold Boer                      | Notodden               | 9,21       | 2021.10.06 |
    | Snøgg Friidrett               | 4553        | 389   | 5000    | Ivan Randbye                     | Notodden               | 18,33,09   | 2021.10.06 |
    | Snøgg Friidrett               | 4554        | 380   | 400     | Adrian Svendsen                  | Skien                  | 1,01,13    | 2021.08.11 |
    | Snøgg Friidrett               | 4555        | 379   | 200     | Christian Bredesen               | Larvik                 | 27,35      | 2021.09.15 |
    | Snøgg Friidrett               | 4556        | 377   | 3000    | Jonas Lid                        | Rjukan                 | 10,42,00   | 2021.09.12 |
    | Snøgg Friidrett               | 4557        | 359   | 800     | Adrian Svendsen                  | Rjukan                 | 2,23,79    | 2021.09.12 |
    | Snøgg Friidrett               | 4558        | 355   | 10000   | Bård Sundsli                     | Notodden               | 40,15,13   | 2021.10.06 |
    | Snøgg Friidrett               | 4559        | 353   | Høyde   | Knut-Olai Helgesen               | Rjukan                 | 1,50       | 2021.09.12 |
    | Snøgg Friidrett               | 4560        | 340   | 3000    | Ivan Randbye                     | Notodden               | 10,57,2    | 2021.10.06 |
    | Snøgg Friidrett               | 4561        | 339   | 200     | Knut-Olai Helgesen               | Notodden               | 27,97      | 2021.10.06 |
    | Snøgg Friidrett               | 4562        | 338   | 5000    | Torfinn Rjukan                   | Notodden               | 19,10,26   | 2021.10.06 |
    | Snøgg Friidrett               | 4563        | 336   | 3000    | Tom-André Haugen                 | Notodden               | 10,59,1    | 2021.10.06 |
    | Snøgg Friidrett               | 4564        | 336   | 3000    | Bård Sundsli                     | Notodden               | 10,58,82   | 2021.10.06 |
    | Snøgg Friidrett               | 4565        | 334   | Slegge  | Roar Uglem                       | Notodden               | 23,00      | 2021.10.06 |
    | Snøgg Friidrett               | 4566        | 332   | 1500    | Jonas Lid                        | Rjukan                 | 5,03,84    | 2021.09.12 |
    | Snøgg Friidrett               | 4567        | 330   | 10000   | Kim Lia                          | Notodden               | 40,56,96   | 2021.10.06 |
    | Snøgg Friidrett               | 4568        | 298   | 1500    | Adrian Svendsen                  | Notodden               | 5,10,58    | 2021.10.06 |
    | Snøgg Friidrett               | 4569        | 291   | 3000    | Kim Lia                          | Notodden               | 11,18,8    | 2021.10.06 |
    | Snøgg Friidrett               | 4570        | 288   | Lut     | Markus Nesholen                  | Notodden               | 2,41       | 2021.10.06 |
    | Snøgg Friidrett               | 4571        | 282   | 100     | Knut-Olai Helgesen               | Notodden               | 13,86      | 2021.10.06 |
    | Snøgg Friidrett               | 4572        | 264   | 200h    | Markus Nesholen                  | Rjukan                 | 34,78      | 2021.09.12 |
    | Snøgg Friidrett               | 4573        | 217   | Kule    | Tore Bredesen                    | Notodden               | 7,10       | 2021.10.06 |
    | Snøgg Friidrett               | 4574        | 214   | 5000    | Ole Lien                         | Rjukan                 | 20,55,98   | 2021.09.12 |
    | Snøgg Friidrett               | 4575        | 178   | Diskos  | Tore Bredesen                    | Notodden               | 18,77      | 2021.10.06 |
    | Snøgg Friidrett               | 4576        | 139   | 3000    | Jonas Tunsberg                   | Notodden               | 12,40,07   | 2021.10.06 |
    | Snøgg Friidrett               | 4577        | 120   | Lut     | Christian Bredesen               | Notodden               | 2,24       | 2021.10.06 |
    | Snøgg Friidrett               | 4578        | 108   | 3000    | Arne Steen                       | Notodden               | 12,59,71   | 2021.10.06 |
    | Snøgg Friidrett               | 4579        | 100   | Lut     | Roar Uglem                       | Notodden               | 2,22       | 2021.10.06 |
    | Snøgg Friidrett               | 4580        | 89    | 5000    | Tore Bredesen                    | Rjukan                 | 23,11,84   | 2021.09.12 |
    | Snøgg Friidrett               | 4581        | 75    | 100     | Emrik Søndergaard                | Notodden               | 15,42      | 2021.10.06 |
    | Snøgg Friidrett               | 4582        | 50    | 200     | Emrik Søndergaard                | Notodden               | 33,32      | 2021.10.06 |
    | Sogndal IL                    | 4583        | 327   | 3000    | Olaus Mundal                     | Sogndal                | 11,03,04   | 2021.05.12 |
    | Sogndal IL                    | 4584        | 316   | 3000    | Simen Longva                     | Sogndal                | 11,07,70   | 2021.05.12 |
    | Sortland Friidrettsklubb      | 4585        | 730   | 3000    | Tobias Skog                      | Trondheim              | 8,49,58    | 2021.09.28 |
    | Sortland Friidrettsklubb      | 4586        | 707   | 1500    | Tobias Skog                      | Oslo/Bi                | 4,05,78    | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4587        | 687   | 800     | Tobias Skog                      | Nadderud               | 2,00,03    | 2021.10.16 |
    | Sortland Friidrettsklubb      | 4588        | 645   | 400h    | Øystein Evjen                    | Sortland               | 59,12      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4589        | 627   | 100     | Ervin Berg                       | Sortland               | 11,92      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4590        | 622   | 200     | Ervin Berg                       | Trondheim              | 24,27      | 2021.09.28 |
    | Sortland Friidrettsklubb      | 4591        | 618   | 200     | Øystein Evjen                    | Harstad                | 24,31      | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4592        | 608   | 100     | Øystein Evjen                    | Sortland               | 12,01      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4593        | 604   | 400     | Øystein Evjen                    | Harstad                | 53,99      | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4594        | 582   | Tresteg | Eilif Solberg                    | Trondheim              | 12,20      | 2021.09.28 |
    | Sortland Friidrettsklubb      | 4595        | 579   | 200     | Eilif Solberg                    | Trondheim              | 24,74      | 2021.09.28 |
    | Sortland Friidrettsklubb      | 4596        | 576   | 100     | Eilif Solberg                    | Trondheim              | 12,17      | 2021.09.28 |
    | Sortland Friidrettsklubb      | 4597        | 530   | 100     | Runar Evjen                      | Sortland               | 12,40      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4598        | 521   | Lengde  | Eilif Solberg                    | Sortland               | 5,63       | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4599        | 508   | 400     | Ervin Berg                       | Harstad                | 56,70      | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4600        | 489   | 200     | Runar Evjen                      | Sortland               | 25,82      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4601        | 477   | Lengde  | Ervin Berg                       | Sortland               | 5,44       | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4602        | 459   | 400     | Runar Evjen                      | Harstad                | 58,30      | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4603        | 446   | 200     | Emil Nielsen                     | Sortland               | 26,39      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4604        | 441   | 400     | Emil Nielsen                     | Sortland               | 58,89      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4605        | 412   | Tresteg | Ervin Berg                       | Trondheim              | 10,70      | 2021.09.28 |
    | Sortland Friidrettsklubb      | 4606        | 408   | Høyde   | Eilif Solberg                    | Sortland               | 1,55       | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4607        | 379   | 3000    | Bjarne Martinsen                 | Narvik                 | 10,41,19   | 2021.06.13 |
    | Sortland Friidrettsklubb      | 4608        | 322   | 200     | Benjamin Knudsen                 | Sortland               | 28,23      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4609        | 318   | Høyde   | Amandus Undeberget               | Sortland               | 1,47       | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4610        | 317   | 200     | Jakob Jensen                     | Harstad                | 28,32      | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4611        | 291   | 100     | Benjamin Knudsen                 | Sortland               | 13,80      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4612        | 290   | Lengde  | Jakob Jensen                     | Sortland               | 4,67       | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4613        | 264   | 3000    | John Nyland                      | Sortland               | 11,31,73   | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4614        | 258   | 200h    | Benjamin Knudsen                 | Sortland               | 34,92      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4615        | 255   | 100     | Jakob Jensen                     | Bodø                   | 14,04      | 2021.09.21 |
    | Sortland Friidrettsklubb      | 4616        | 233   | Høyde   | Benjamin Knudsen                 | Sortland               | 1,40       | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4617        | 233   | Høyde   | Petter Undeberget                | Harstad                | 1,40       | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4618        | 223   | Tresteg | Jakob Jensen                     | Måndalen               | 9,11       | 2021.09.12 |
    | Sortland Friidrettsklubb      | 4619        | 192   | Lengde  | Benjamin Knudsen                 | Sortland               | 4,28       | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4620        | 167   | 200h    | Jakob Jensen                     | Måndalen               | 37,08      | 2021.09.12 |
    | Sortland Friidrettsklubb      | 4621        | 137   | Spyd    | Runar Evjen                      | Sortland               | 19,87      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4622        | 123   | Tresteg | Benjamin Knudsen                 | Måndalen               | 8,31       | 2021.09.12 |
    | Sortland Friidrettsklubb      | 4623        | 113   | 3000    | Cato Hansen                      | Sortland               | 12,56,04   | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4624        | 96    | Høyde   | Amund Bech                       | Harstad                | 1,30       | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4625        | 85    | Spyd    | Øystein Evjen                    | Sortland               | 17,62      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4626        | 81    | 200     | Gabriel Lagesen                  | Harstad                | 32,66      | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4627        | 75    | 200     | Iver Hanssen                     | Sortland               | 32,79      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4628        | 62    | 100     | Amandus Undeberget               | Sortland               | 15,53      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4629        | 43    | 200     | Amund Bech                       | Sortland               | 33,47      | 2021.08.22 |
    | Sortland Friidrettsklubb      | 4630        | 35    | Stav    | Jakob Jensen                     | Måndalen               | 1,62       | 2021.09.12 |
    | Sortland Friidrettsklubb      | 4631        | 19    | Høyde   | Sean Baumgartner                 | Harstad                | 1,25       | 2021.09.25 |
    | Sortland Friidrettsklubb      | 4632        | 18    | 800     | Ask Røkenes                      | Sortland               | 3,02,30    | 2021.08.22 |
    | Spillum IL                    | 4633        | 203   | 100     | Didrik Pettersen                 | Vik                    | 14,41      | 2021.10.02 |
    | Spirit Friidrettsklubb        | 4634        | 1027  | 10000   | Zerei Mezngi                     | Manchester/GBR         | 27,57,63   | 2021.06.25 |
    | Spirit Friidrettsklubb        | 4635        | 1021  | 3000    | Zerei Mezngi                     | Oslo/Bi                | 7,47,16    | 2021.09.25 |
    | Spirit Friidrettsklubb        | 4636        | 924   | 5000    | Zerei Mezngi                     | Kristiansand           | 13,58,47   | 2021.10.06 |
    | Spirit Friidrettsklubb        | 4637        | 751   | 5000    | Alf Tornensis                    | Stavanger              | 15,09,25   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4638        | 739   | 3000    | Alf Tornensis                    | Ålgård                 | 8,47,27    | 2021.09.20 |
    | Spirit Friidrettsklubb        | 4639        | 715   | 1500    | Alf Tornensis                    | Sandnes                | 4,04,92    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4640        | 709   | 5000    | Filip Oanes                      | Stavanger              | 15,28,74   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4641        | 693   | 3000    | Thomas Asgautsen                 | Oslo/Bi                | 8,58,89    | 2021.09.25 |
    | Spirit Friidrettsklubb        | 4642        | 684   | 10000   | Thomas Asgautsen                 | Oslo/Bi                | 32,57,18   | 2021.09.25 |
    | Spirit Friidrettsklubb        | 4643        | 653   | 10000   | Rune Eie                         | Tau                    | 33,30,1    | 2021.06.10 |
    | Spirit Friidrettsklubb        | 4644        | 652   | 5000    | Rune Eie                         | Stavanger              | 15,56,48   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4645        | 638   | 3000    | Svein Krakstad                   | Ålgård                 | 9,13,70    | 2021.09.20 |
    | Spirit Friidrettsklubb        | 4646        | 634   | 5000    | Svein Krakstad                   | Stavanger              | 16,05,61   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4647        | 630   | 1500    | Svein Krakstad                   | Sandnes                | 4,15,23    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4648        | 596   | 5000    | Håvard Barkved                   | Stavanger              | 16,25,39   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4649        | 572   | 1500    | Magnus Hope                      | Sandnes                | 4,23,16    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4650        | 564   | 1500    | Dennis Ravndal                   | Nadderud               | 4,24,24    | 2021.10.16 |
    | Spirit Friidrettsklubb        | 4651        | 561   | 800     | Svein Krakstad                   | Sandnes                | 2,07,43    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4652        | 538   | 1500    | Hans Aakre                       | Stavanger              | 4,28,05    | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4653        | 538   | 5000    | Sindre Jørgensen                 | Stavanger              | 16,57,67   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4654        | 514   | 5000    | Steven Acarregui                 | Stavanger              | 17,12,02   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4655        | 511   | 1500    | Laimutis Verbliugevicius         | Stavanger              | 4,32,26    | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4656        | 507   | 5000    | Preben Bolsøy                    | Stavanger              | 17,15,89   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4657        | 506   | 1500    | Fredrik Nordhaug                 | Stavanger              | 4,32,97    | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4658        | 494   | 800     | Magnus Hope                      | Sandnes                | 2,12,20    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4659        | 494   | 5000    | Hans Aakre                       | Stavanger              | 17,23,81   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4660        | 493   | 5000    | Leif Omland                      | Stavanger              | 17,24,31   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4661        | 486   | 1500    | Leif Omland                      | Sandnes                | 4,36,23    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4662        | 475   | 5000    | Arne Vetrhus                     | Stavanger              | 17,35,85   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4663        | 474   | 3000    | Preben Bolsøy                    | Ålgård                 | 10,05,44   | 2021.09.20 |
    | Spirit Friidrettsklubb        | 4664        | 472   | 5000    | Tor Aakre                        | Stavanger              | 17,37,51   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4665        | 466   | 3000    | Laimutis Verbliugevicius         | Ålgård                 | 10,08,15   | 2021.09.20 |
    | Spirit Friidrettsklubb        | 4666        | 465   | 5000    | Laimutis Verbliugevicius         | Stavanger              | 17,42,31   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4667        | 462   | 800     | Leif Omland                      | Sandnes                | 2,14,76    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4668        | 460   | 800     | Dennis Ravndal                   | Stavanger              | 2,14,91    | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4669        | 448   | 1500    | Steven Acarregui                 | Stavanger              | 4,42,36    | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4670        | 424   | 10000   | Preben Bolsøy                    | Tau                    | 38,25,4    | 2021.06.10 |
    | Spirit Friidrettsklubb        | 4671        | 424   | 10000   | Harald Bjørkhaug                 | Tau                    | 38,26,6    | 2021.06.10 |
    | Spirit Friidrettsklubb        | 4672        | 413   | 10000   | Simon Bjørheim                   | Tau                    | 38,41,8    | 2021.06.10 |
    | Spirit Friidrettsklubb        | 4673        | 413   | 800     | Preben Bolsøy                    | Sandnes                | 2,18,85    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4674        | 382   | 800     | Espen Swan-Rørvik                | Sandnes                | 2,21,67    | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4675        | 377   | 5000    | Simon Bjørheim                   | Stavanger              | 18,41,36   | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4676        | 376   | 1500    | Espen Swan-Rørvik                | Stavanger              | 4,55,29    | 2021.10.27 |
    | Spirit Friidrettsklubb        | 4677        | 237   | 1500    | Lucas Bøen-Hope                  | Ålgård                 | 5,23,85    | 2021.09.20 |
    | Spirit Friidrettsklubb        | 4678        | 192   | 3000    | Steffen Thorsen                  | Sandnes                | 12,08,83   | 2021.10.28 |
    | Spirit Friidrettsklubb        | 4679        | 30    | Lut     | Svein Krakstad                   | Hvam                   | 2,15       | 2021.10.23 |
    | Spirit Friidrettsklubb        | 4680        | 10    | Lut     | Leif Omland                      | Hvam                   | 2,13       | 2021.10.23 |
    | Spjelkavik og Omegn Friidrett | 4681        | 516   | 10000   | Kristian Nedregård               | Førde                  | 36,16,08   | 2021.08.22 |
    | Spjelkavik og Omegn Friidrett | 4682        | 512   | 1500    | Kristian Nedregård               | Førde                  | 4,32,04    | 2021.08.22 |
    | Spjelkavik og Omegn Friidrett | 4683        | 510   | 3000    | Kristian Nedregård               | Førde                  | 9,52,99    | 2021.08.22 |
    | Spjelkavik og Omegn Friidrett | 4684        | 455   | 800     | Kristian Nedregård               | Førde                  | 2,15,29    | 2021.08.22 |
    | Spjelkavik og Omegn Friidrett | 4685        | 383   | 800     | Svein Nedregård                  | Førde                  | 2,21,57    | 2021.08.22 |
    | Spjelkavik og Omegn Friidrett | 4686        | 325   | 400     | Svein Nedregård                  | Førde                  | 1,03,27    | 2021.08.22 |
    | Spjelkavik og Omegn Friidrett | 4687        | 145   | Kule    | Svein Nedregård                  | Tingvoll               | 6,29       | 2021.09.18 |
    | Spjelkavik og Omegn Friidrett | 4688        | 128   | 100     | Svein Nedregård                  | Tingvoll               | 14,99      | 2021.09.18 |
    | Spjelkavik og Omegn Friidrett | 4689        | 112   | Kule    | Anders Nedregård                 | Tingvoll               | 5,94       | 2021.09.18 |
    | Spjelkavik og Omegn Friidrett | 4690        | 104   | Diskos  | Anders Nedregård                 | Tingvoll               | 16,27      | 2021.09.18 |
    | Spjelkavik og Omegn Friidrett | 4691        | 31    | Lengde  | Svein Nedregård                  | Tingvoll               | 3,67       | 2021.09.18 |
    | Spjelkavik og Omegn Friidrett | 4692        | 13    | Diskos  | Svein Nedregård                  | Tingvoll               | 13,28      | 2021.09.18 |
    | Spjelkavik og Omegn Friidrett | 4693        | 3     | Høyde   | Svein Nedregård                  | Tingvoll               | 1,24       | 2021.09.18 |
    | Sportsklubben Vidar           | 4694        | 1092  | Stav    | Sondre Guttormsen                | Chula Vista/CA/USA     | 5,81       | 2021.05.30 |
    | Sportsklubben Vidar           | 4695        | 1074  | 110h    | Vladimir Vukicevic               | La Chaux-de-Fonds/SUI  | 13,42      | 2021.08.14 |
    | Sportsklubben Vidar           | 4696        | 1042  | Stav    | Simen Guttormsen                 | Zagreb/CRO             | 5,62       | 2021.09.14 |
    | Sportsklubben Vidar           | 4697        | 1009  | Lengde  | Ingar Bratseth-Kiplesund         | Karlsruhe/GER          | 7,89       | 2021.09.04 |
    | Sportsklubben Vidar           | 4698        | 929   | Tresteg | Ingar Bratseth-Kiplesund         | Kristiansand           | 15,51      | 2021.10.06 |
    | Sportsklubben Vidar           | 4699        | 893   | 3000    | Andreas Halvorsen                | Jessheim               | 8,12,82    | 2021.09.09 |
    | Sportsklubben Vidar           | 4700        | 882   | 1500    | Andreas Halvorsen                | Oslo/Bi                | 3,48,39    | 2021.09.25 |
    | Sportsklubben Vidar           | 4701        | 857   | 10000   | Eirik Gramstad                   | Kristiansand           | 30,07,12   | 2021.10.06 |
    | Sportsklubben Vidar           | 4702        | 852   | 1500    | Sander Mathiesen                 | Oslo/Bi                | 3,51,08    | 2021.09.25 |
    | Sportsklubben Vidar           | 4703        | 838   | 3000    | Sander Mathiesen                 | Trondheim              | 8,24,56    | 2021.09.28 |
    | Sportsklubben Vidar           | 4704        | 837   | 3000    | Ulrik Hovig                      | Trondheim              | 8,24,71    | 2021.09.28 |
    | Sportsklubben Vidar           | 4705        | 830   | 800     | Andreas Halvorsen                | Oslo/Bi                | 1,53,41    | 2021.09.25 |
    | Sportsklubben Vidar           | 4706        | 806   | 800     | Sander Mathiesen                 | Trondheim              | 1,54,42    | 2021.09.28 |
    | Sportsklubben Vidar           | 4707        | 789   | 1500    | Ulrik Hovig                      | Kristiansand           | 3,57,08    | 2021.10.06 |
    | Sportsklubben Vidar           | 4708        | 781   | 3000    | Theodor Jacobsen                 | Oslo/Bi                | 8,37,24    | 2021.09.25 |
    | Sportsklubben Vidar           | 4709        | 781   | 3000    | Nikolai Solum                    | Trondheim              | 8,37,32    | 2021.09.28 |
    | Sportsklubben Vidar           | 4710        | 753   | 1500    | Theodor Jacobsen                 | Oslo/Bi                | 4,00,72    | 2021.09.25 |
    | Sportsklubben Vidar           | 4711        | 745   | 10000   | Johan-Jørgen Lindgaard-Strømberg | Jessheim               | 31,52,91   | 2021.09.09 |
    | Sportsklubben Vidar           | 4712        | 744   | 800     | Nikolai Solum                    | Lillestrøm             | 1,57,22    | 2021.08.29 |
    | Sportsklubben Vidar           | 4713        | 738   | 5000    | Henning Mæhle                    | Oslo/Bi                | 15,15,29   | 2021.09.25 |
    | Sportsklubben Vidar           | 4714        | 696   | 1500    | Sondre Omland                    | Lillehammer            | 4,07,03    | 2021.09.26 |
    | Sportsklubben Vidar           | 4715        | 692   | 10000   | Henning Mæhle                    | Kristiansand           | 32,48,12   | 2021.10.06 |
    | Sportsklubben Vidar           | 4716        | 683   | 1500    | Gard Tørum                       | Oslo/Bi                | 4,08,62    | 2021.09.25 |
    | Sportsklubben Vidar           | 4717        | 676   | 800     | Sondre Omland                    | Nittedal               | 2,00,57    | 2021.10.30 |
    | Sportsklubben Vidar           | 4718        | 671   | 10000   | Martin Kjäll-Ohlsson             | Oslo/Bi                | 33,11,40   | 2021.09.25 |
    | Sportsklubben Vidar           | 4719        | 650   | 1500    | Petter Brennhovd                 | Oslo/Bi                | 4,12,64    | 2021.09.25 |
    | Sportsklubben Vidar           | 4720        | 636   | 800     | Iver Hjelbak-Eriksen             | Jessheim               | 2,02,77    | 2021.09.09 |
    | Sportsklubben Vidar           | 4721        | 629   | 3000    | Carl Jensehaugen                 | Oslo/Bi                | 9,16,20    | 2021.09.25 |
    | Sportsklubben Vidar           | 4722        | 616   | 800     | Gard Tørum                       | Oslo/Bi                | 2,03,95    | 2021.09.25 |
    | Sportsklubben Vidar           | 4723        | 599   | 1500    | Iver Hjelbak-Eriksen             | Oslo/Bi                | 4,19,33    | 2021.09.25 |
    | Sportsklubben Vidar           | 4724        | 589   | 800     | Petter Brennhovd                 | Bækkelaget             | 2,05,55    | 2021.10.04 |
    | Sportsklubben Vidar           | 4725        | 584   | 200     | Teodor Miller                    | Lillehammer            | 24,68      | 2021.09.26 |
    | Sportsklubben Vidar           | 4726        | 579   | 1500    | Filip Osnes-Ringen               | Oslo/Bi                | 4,22,07    | 2021.09.25 |
    | Sportsklubben Vidar           | 4727        | 572   | 800     | Kristian Børve                   | Bækkelaget             | 2,06,70    | 2021.10.04 |
    | Sportsklubben Vidar           | 4728        | 563   | 800     | Filip Osnes-Ringen               | Nittedal               | 2,07,28    | 2021.10.30 |
    | Sportsklubben Vidar           | 4729        | 558   | 800     | Jens Aas                         | Nittedal               | 2,07,60    | 2021.10.30 |
    | Sportsklubben Vidar           | 4730        | 554   | 1500    | Lars Hauge                       | Oslo/St                | 4,25,63    | 2021.10.16 |
    | Sportsklubben Vidar           | 4731        | 554   | 1500    | Sten Wedum                       | Oslo/Bi                | 4,25,67    | 2021.09.25 |
    | Sportsklubben Vidar           | 4732        | 552   | 100     | Teodor Miller                    | Nadderud               | 12,29      | 2021.10.16 |
    | Sportsklubben Vidar           | 4733        | 550   | 400     | Sondre Omland                    | Nittedal               | 55,46      | 2021.10.30 |
    | Sportsklubben Vidar           | 4734        | 528   | 1500    | Jens Aas                         | Oslo/Bi                | 4,29,59    | 2021.09.25 |
    | Sportsklubben Vidar           | 4735        | 494   | 1500    | Jonas Kveen                      | Oslo/Bi                | 4,34,89    | 2021.09.25 |
    | Sportsklubben Vidar           | 4736        | 492   | 400     | Teodor Miller                    | Nittedal               | 57,21      | 2021.10.30 |
    | Sportsklubben Vidar           | 4737        | 487   | 800     | Sten Wedum                       | Bækkelaget             | 2,12,74    | 2021.10.04 |
    | Sportsklubben Vidar           | 4738        | 458   | 3000    | Jonas Kveen                      | Oslo/Bi                | 10,11,30   | 2021.09.25 |
    | Sportsklubben Vidar           | 4739        | 450   | 1500    | Fredrik Halsbog                  | Jessheim               | 4,42,17    | 2021.09.09 |
    | Sportsklubben Vidar           | 4740        | 444   | 800     | Lars Hauge                       | Nittedal               | 2,16,20    | 2021.10.30 |
    | Sportsklubben Vidar           | 4741        | 431   | 800     | Emil Longva                      | Oslo/NIH               | 2,17,3     | 2021.09.22 |
    | Sportsklubben Vidar           | 4742        | 428   | 1500    | Elias Torjussen                  | Oslo/Bi                | 4,45,92    | 2021.09.25 |
    | Sportsklubben Vidar           | 4743        | 417   | 1500    | Frederick Høyerholt              | Nadderud               | 4,47,90    | 2021.10.16 |
    | Sportsklubben Vidar           | 4744        | 411   | 1500    | Herman Eide                      | Nadderud               | 4,48,86    | 2021.10.16 |
    | Sportsklubben Vidar           | 4745        | 408   | 800     | Jonas Kveen                      | Brandbu                | 2,19,31    | 2021.09.25 |
    | Sportsklubben Vidar           | 4746        | 392   | 1500    | Håkon Johnsen                    | Oslo/Bi                | 4,52,26    | 2021.09.25 |
    | Sportsklubben Vidar           | 4747        | 370   | 1500    | Henrik Lund                      | Rjukan                 | 4,56,39    | 2021.09.12 |
    | Sportsklubben Vidar           | 4748        | 364   | 200     | Kenneth Heggdal                  | Oslo/St                | 27,58      | 2021.10.16 |
    | Sportsklubben Vidar           | 4749        | 355   | 800     | Håkon Johnsen                    | Lillehammer            | 2,24,15    | 2021.09.26 |
    | Sportsklubben Vidar           | 4750        | 331   | 100     | Kenneth Heggdal                  | Kristiansand           | 13,54      | 2021.10.06 |
    | Sportsklubben Vidar           | 4751        | 319   | 200     | Henrik Lund                      | Rjukan                 | 28,29      | 2021.09.12 |
    | Sportsklubben Vidar           | 4752        | 242   | 100     | Sander Hegni                     | Oslo/Bi                | 14,13      | 2021.09.25 |
    | Sportsklubben Vidar           | 4753        | 210   | 200     | Sander Hegni                     | Oslo/St                | 30,15      | 2021.10.16 |
    | Sportsklubben Vidar           | 4754        | 104   | 1500    | Sander Hegni                     | Kristiansand           | 5,57,14    | 2021.10.06 |
    | Sportsklubben Vidar           | 4755        | 85    | 1500    | Kenneth Heggdal                  | Oslo/Bi                | 6,02,43    | 2021.09.25 |
    | Spydeberg IL                  | 4756        | 554   | 1500    | Fredrik Hesjedal-Tronstad        | Nittedal               | 4,25,73    | 2021.10.30 |
    | Spydeberg IL                  | 4757        | 360   | 100     | Henrik Holm                      | Moss                   | 13,36      | 2021.10.09 |
    | Stadsbygd IL                  | 4758        | 865   | 5000    | Ørjan Kjeldsli                   | Trondheim              | 14,21,03   | 2021.09.28 |
    | Stadsbygd IL                  | 4759        | 730   | 800     | Ørjan Kjeldsli                   | Stadsbygd              | 1,57,9     | 2021.05.09 |
    | Stadsbygd IL                  | 4760        | 699   | 200     | Iver Solli                       | Trondheim              | 23,48      | 2021.09.28 |
    | Stadsbygd IL                  | 4761        | 682   | 800     | Sondre Svarholt                  | Trondheim              | 2,00,27    | 2021.09.28 |
    | Stadsbygd IL                  | 4762        | 677   | 100     | Iver Solli                       | Trondheim              | 11,69      | 2021.09.28 |
    | Stadsbygd IL                  | 4763        | 644   | 100     | Marius Ersøybakk                 | Steinkjer              | 11,84      | 2021.09.30 |
    | Stadsbygd IL                  | 4764        | 637   | 400     | Sondre Svarholt                  | Trondheim              | 53,17      | 2021.09.28 |
    | Stadsbygd IL                  | 4765        | 630   | 200     | Marius Ersøybakk                 | Steinkjer              | 24,18      | 2021.09.30 |
    | Stadsbygd IL                  | 4766        | 587   | 200     | Erlend Skraastad                 | Trondheim              | 24,64      | 2021.09.28 |
    | Stadsbygd IL                  | 4767        | 587   | 400     | Erlend Skraastad                 | Trondheim              | 54,45      | 2021.09.28 |
    | Stadsbygd IL                  | 4768        | 581   | 200     | Sondre Svarholt                  | Jessheim               | 24,71      | 2021.09.09 |
    | Stadsbygd IL                  | 4769        | 576   | 3000    | Stian Darell                     | Stadsbygd              | 9,31,9     | 2021.05.09 |
    | Stadsbygd IL                  | 4770        | 546   | 100     | Erlend Skraastad                 | Trondheim              | 12,32      | 2021.09.28 |
    | Stadsbygd IL                  | 4771        | 526   | 100     | Sondre Svarholt                  | Jessheim               | 12,42      | 2021.09.09 |
    | Stadsbygd IL                  | 4772        | 518   | 800     | Erlend Skraastad                 | Trondheim              | 2,10,41    | 2021.09.28 |
    | Stadsbygd IL                  | 4773        | 515   | 3000    | Ståle Fenstad                    | Stadsbygd              | 9,51,3     | 2021.05.09 |
    | Stadsbygd IL                  | 4774        | 505   | 3000    | Sondre Svarholt                  | Trondheim              | 9,54,86    | 2021.09.28 |
    | Stadsbygd IL                  | 4775        | 505   | 100     | Aksel Kvithyll-Haugen            | Trondheim              | 12,53      | 2021.09.28 |
    | Stadsbygd IL                  | 4776        | 476   | 200     | Aksel Kvithyll-Haugen            | Trondheim              | 25,99      | 2021.09.28 |
    | Stadsbygd IL                  | 4777        | 470   | 100     | Aleksander Berg                  | Trondheim              | 12,72      | 2021.09.28 |
    | Stadsbygd IL                  | 4778        | 449   | 800     | Aleksander Berg                  | Stadsbygd              | 2,15,8     | 2021.05.09 |
    | Stadsbygd IL                  | 4779        | 447   | 400     | Marius Ersøybakk                 | Jessheim               | 58,69      | 2021.09.09 |
    | Stadsbygd IL                  | 4780        | 441   | Lengde  | Iver Solli                       | Trondheim              | 5,29       | 2021.09.28 |
    | Stadsbygd IL                  | 4781        | 413   | 100     | Thomas Haarberg                  | Stadsbygd              | 12,8       | 2021.05.09 |
    | Stadsbygd IL                  | 4782        | 350   | Lengde  | Erlend Skraastad                 | Trondheim              | 4,91       | 2021.09.28 |
    | Stadsbygd IL                  | 4783        | 340   | 200     | Stig Wemundstad                  | Førde                  | 27,95      | 2021.08.22 |
    | Stadsbygd IL                  | 4784        | 334   | 800     | Thomas Haarberg                  | Stadsbygd              | 2,26,2     | 2021.05.09 |
    | Stadsbygd IL                  | 4785        | 315   | 400     | Stig Wemundstad                  | Førde                  | 1,03,69    | 2021.08.22 |
    | Stadsbygd IL                  | 4786        | 297   | 1500    | Andreas Ekerhovd                 | Trondheim              | 5,10,82    | 2021.09.28 |
    | Stadsbygd IL                  | 4787        | 292   | 200     | Andreas Ekerhovd                 | Måndalen               | 28,72      | 2021.09.12 |
    | Stadsbygd IL                  | 4788        | 273   | 100     | Stig Wemundstad                  | Førde                  | 13,92      | 2021.08.22 |
    | Stadsbygd IL                  | 4789        | 255   | 800     | Andreas Ekerhovd                 | Stadsbygd              | 2,34,3     | 2021.05.09 |
    | Stegaberg IL                  | 4790        | 148   | 100     | Brage Rokstad                    | Frakkagjerd            | 14,83      | 2021.08.22 |
    | Stegaberg IL                  | 4791        | 19    | Høyde   | Marius Lilleskog                 | Haugesund              | 1,25       | 2021.09.12 |
    | Steinkjer Friidrettsklubb     | 4792        | 940   | 400     | Bastian Aurstad                  | Kristiansand           | 47,17      | 2021.10.06 |
    | Steinkjer Friidrettsklubb     | 4793        | 924   | 5000    | Mathias Flak                     | Oslo/Bi                | 13,58,55   | 2021.09.25 |
    | Steinkjer Friidrettsklubb     | 4794        | 908   | 400h    | Bastian Aurstad                  | Kristiansand           | 51,83      | 2021.10.06 |
    | Steinkjer Friidrettsklubb     | 4795        | 905   | 3000    | Mathias Flak                     | Fana                   | 8,10,29    | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4796        | 882   | 200     | Bastian Aurstad                  | Trondheim              | 21,82      | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4797        | 864   | 3000    | Mathias Aas                      | Førde                  | 8,18,98    | 2021.08.22 |
    | Steinkjer Friidrettsklubb     | 4798        | 845   | 5000    | Simen Ellingsdalen               | Greveskogen            | 14,28,87   | 2021.10.30 |
    | Steinkjer Friidrettsklubb     | 4799        | 833   | 1500    | Mathias Aas                      | Oslo/Bi                | 3,52,90    | 2021.09.25 |
    | Steinkjer Friidrettsklubb     | 4800        | 831   | 10000   | Simen Ellingsdalen               | Kristiansand           | 30,30,57   | 2021.10.06 |
    | Steinkjer Friidrettsklubb     | 4801        | 824   | 5000    | Mathias Aas                      | Trondheim              | 14,37,76   | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4802        | 823   | 3000    | Simen Ellingsdalen               | Trondheim              | 8,27,95    | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4803        | 808   | 3000H   | Mathias Aas                      | Stavanger              | 9,14,92    | 2021.10.27 |
    | Steinkjer Friidrettsklubb     | 4804        | 806   | 100     | Bastian Aurstad                  | Steinkjer              | 11,14      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4805        | 799   | 100     | Adrian Kinnunen                  | Trondheim              | 11,17      | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4806        | 790   | Lengde  | Bastian Aurstad                  | Ravnanger              | 6,83       | 2021.09.15 |
    | Steinkjer Friidrettsklubb     | 4807        | 787   | 1500    | Mathias Flak                     | Trondheim              | 3,57,31    | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4808        | 783   | 200     | Sigve Hårberg                    | Lillehammer            | 22,68      | 2021.09.26 |
    | Steinkjer Friidrettsklubb     | 4809        | 765   | 10000   | Jon Gaundal                      | Trondheim              | 31,33,89   | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4810        | 758   | 800     | Mathias Aas                      | Steinkjer              | 1,56,57    | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4811        | 751   | 1500    | Simen Ellingsdalen               | Steinkjer              | 4.00,92    | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4812        | 750   | 400     | Sigve Hårberg                    | Lillehammer            | 50,68      | 2021.09.26 |
    | Steinkjer Friidrettsklubb     | 4813        | 750   | 200     | Sivert Moen                      | Trondheim              | 22,99      | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4814        | 744   | 200     | Adrian Kinnunen                  | Steinkjer              | 23,04      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4815        | 743   | 10000   | Henrik Nordtug                   | Trondheim              | 31,55,03   | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4816        | 741   | 100     | Sander Dalbu                     | Ravnanger              | 11,41      | 2021.09.15 |
    | Steinkjer Friidrettsklubb     | 4817        | 740   | 3000    | Jon Gaundal                      | Trondheim              | 8,47,00    | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4818        | 732   | 100     | Sigve Hårberg                    | Trondheim              | 11,45      | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4819        | 732   | 200     | Sander Dalbu                     | Trondheim              | 23,16      | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4820        | 727   | 200     | Obaidullah Obaidi                | Jessheim               | 23,21      | 2021.09.09 |
    | Steinkjer Friidrettsklubb     | 4821        | 724   | 5000    | Jon Gaundal                      | Mosjøen                | 15,21,70   | 2021.08.28 |
    | Steinkjer Friidrettsklubb     | 4822        | 718   | 100     | Obaidullah Obaidi                | Steinkjer              | 11,51      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4823        | 711   | 400     | Obaidullah Obaidi                | Steinkjer              | 51,49      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4824        | 679   | 100     | Sivert Moen                      | Steinkjer              | 11,68      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4825        | 675   | 400     | Sivert Moen                      | Stjørdal               | 52,29      | 2021.10.23 |
    | Steinkjer Friidrettsklubb     | 4826        | 673   | 5000    | Simen Holen                      | Oslo/Bi                | 15,46,52   | 2021.09.25 |
    | Steinkjer Friidrettsklubb     | 4827        | 657   | 400h    | Sivert Moen                      | Steinkjer              | 58,67      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4828        | 653   | 3000    | Simen Holen                      | Trondheim              | 9,09,39    | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4829        | 581   | 3000    | Even Hansen                      | Trondheim              | 9,30,46    | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4830        | 571   | 1500    | Simen Holen                      | Steinkjer              | 4.23,32    | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4831        | 569   | 1500    | André Navjord                    | Steinkjer              | 4.23,50    | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4832        | 561   | 1500    | Even Hansen                      | Trondheim              | 4,24,67    | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4833        | 511   | Høyde   | Petter Fuglestrand               | Stjørdal               | 1,65       | 2021.10.23 |
    | Steinkjer Friidrettsklubb     | 4834        | 507   | Lengde  | Petter Fuglestrand               | Stjørdal               | 5,57       | 2021.10.23 |
    | Steinkjer Friidrettsklubb     | 4835        | 393   | 3000    | Jostein Steffensen               | Trondheim              | 10,35,69   | 2021.09.28 |
    | Steinkjer Friidrettsklubb     | 4836        | 391   | Spyd    | Petter Fuglestrand               | Steinkjer              | 33,72      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4837        | 366   | Diskos  | Trond Skevik                     | Steinkjer              | 25,52      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4838        | 344   | 5000    | Kristoffer Buvarp                | Steinkjer              | 19,05,60   | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4839        | 336   | Tresteg | Trond Skevik                     | Steinkjer              | 10,05      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4840        | 326   | Spyd    | Trond Skevik                     | Steinkjer              | 29,75      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4841        | 319   | Kule    | Trond Skevik                     | Steinkjer              | 8,32       | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4842        | 314   | 1500    | Elias Pigott                     | Steinkjer              | 5,07,41    | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4843        | 268   | 200     | Jonas Lagestad                   | Steinkjer              | 29,13      | 2021.09.30 |
    | Steinkjer Friidrettsklubb     | 4844        | 116   | Stav    | Kjell Jønnum                     | Hamar                  | 1,80       | 2021.08.22 |
    | Steinkjer Friidrettsklubb     | 4845        | 19    | Høyde   | Mateo Henderson                  | Steinkjer              | 1,25       | 2021.09.30 |
    | Stjørdal Friidrettsklubb      | 4846        | 604   | Lengde  | Jacob Hoff                       | Trondheim              | 5,99       | 2021.09.28 |
    | Stjørdal Friidrettsklubb      | 4847        | 595   | Stav    | Thomas Reitan                    | Stjørdal               | 3,41       | 2021.10.23 |
    | Stjørdal Friidrettsklubb      | 4848        | 588   | Høyde   | Thomas Reitan                    | Hommelvik              | 1,73       | 2021.06.26 |
    | Stjørdal Friidrettsklubb      | 4849        | 582   | 100     | Jacob Hoff                       | Stadsbygd              | 11,9       | 2021.05.09 |
    | Stjørdal Friidrettsklubb      | 4850        | 511   | Høyde   | Nikolai Berre                    | Steinkjer              | 1,65       | 2021.09.30 |
    | Stjørdal Friidrettsklubb      | 4851        | 450   | Tresteg | Nikolai Berre                    | Måndalen               | 11,03      | 2021.09.12 |
    | Stjørdal Friidrettsklubb      | 4852        | 445   | 100     | Thomas Reitan                    | Hamar                  | 12,86      | 2021.08.22 |
    | Stjørdal Friidrettsklubb      | 4853        | 429   | Lengde  | Nikolai Berre                    | Stjørdal               | 5,24       | 2021.10.23 |
    | Stjørdal Friidrettsklubb      | 4854        | 429   | Lengde  | Thomas Reitan                    | Hamar                  | 5,24       | 2021.08.22 |
    | Stjørdal Friidrettsklubb      | 4855        | 422   | 100     | Nikolai Berre                    | Trondheim              | 12,99      | 2021.09.28 |
    | Stjørdal Friidrettsklubb      | 4856        | 408   | Høyde   | Jacob Hoff                       | Trondheim              | 1,55       | 2021.09.28 |
    | Stjørdal Friidrettsklubb      | 4857        | 396   | 200     | Nikolai Berre                    | Måndalen               | 27,09      | 2021.09.12 |
    | Stjørdal Friidrettsklubb      | 4858        | 374   | Lengde  | Eirik Lindø                      | Hommelvik              | 5,01       | 2021.06.26 |
    | Stjørdal Friidrettsklubb      | 4859        | 369   | 200     | Eirik Lindø                      | Steinkjer              | 27,50      | 2021.09.30 |
    | Stjørdal Friidrettsklubb      | 4860        | 356   | Tresteg | Thomas Reitan                    | Stjørdal               | 10,22      | 2021.10.23 |
    | Stjørdal Friidrettsklubb      | 4861        | 356   | 400     | Eirik Lindø                      | Steinkjer              | 1,02,05    | 2021.09.30 |
    | Stjørdal Friidrettsklubb      | 4862        | 339   | 100     | Eirik Lindø                      | Steinkjer              | 13,49      | 2021.09.30 |
    | Stjørdal Friidrettsklubb      | 4863        | 327   | 3000    | Johan Vikan                      | Stjørdal               | 11,03,0    | 2021.10.23 |
    | Stjørdal Friidrettsklubb      | 4864        | 122   | Lengde  | Einar Bjørnevik                  | Stjørdal               | 4,01       | 2021.10.23 |
    | Stjørdal Friidrettsklubb      | 4865        | 60    | 100     | Kåre Vikan                       | Stjørdal               | 15,55      | 2021.10.23 |
    | Stokmarknes IL                | 4866        | 483   | 3000    | Ingebrikt Hovik                  | Sortland               | 10,02,21   | 2021.08.22 |
    | Stord Idrettslag              | 4867        | 995   | 3000H   | Tom Kårbø                        | Zagreb/CRO             | 8,28,26    | 2021.09.14 |
    | Stord Idrettslag              | 4868        | 962   | 3000    | Tom Kårbø                        | Fana                   | 7,58,48    | 2021.09.28 |
    | Stord Idrettslag              | 4869        | 816   | 5000    | Lars Lunde                       | Kristiansand           | 14,41,18   | 2021.10.06 |
    | Stord Idrettslag              | 4870        | 789   | 200     | Julian Aasheim                   | Fana                   | 22,63      | 2021.09.28 |
    | Stord Idrettslag              | 4871        | 786   | 3000    | Erlend Kringeland                | Trondheim              | 8,36,05    | 2021.09.28 |
    | Stord Idrettslag              | 4872        | 768   | 1500    | Erlend Kringeland                | Fana                   | 3,59,28    | 2021.09.28 |
    | Stord Idrettslag              | 4873        | 739   | 100     | Julian Aasheim                   | Ravnanger              | 11,42      | 2021.09.15 |
    | Stord Idrettslag              | 4874        | 718   | 400h    | Julian Aasheim                   | Fana                   | 56,66      | 2021.09.28 |
    | Stord Idrettslag              | 4875        | 714   | 5000    | Johannes Thomsen                 | Fana                   | 15,26,58   | 2021.09.28 |
    | Stord Idrettslag              | 4876        | 713   | 800     | Johannes Bø                      | Leirvik                | 1,58,71    | 2021.09.13 |
    | Stord Idrettslag              | 4877        | 712   | 1500    | Johannes Bø                      | Fana                   | 4,05,20    | 2021.09.28 |
    | Stord Idrettslag              | 4878        | 711   | 10000   | Johannes Thomsen                 | Fana                   | 32,28,64   | 2021.09.28 |
    | Stord Idrettslag              | 4879        | 708   | 800     | Erlend Kringeland                | Leirvik                | 1,58,92    | 2021.09.13 |
    | Stord Idrettslag              | 4880        | 687   | 10000   | Martin Schei                     | Oslo/Bi                | 32,53,61   | 2021.09.25 |
    | Stord Idrettslag              | 4881        | 678   | Høyde   | Marius Torbjørnsen               | Leirvik                | 1,83       | 2021.09.13 |
    | Stord Idrettslag              | 4882        | 672   | Hut     | Julian Aasheim                   | Leirvik                | 1,50       | 2021.09.13 |
    | Stord Idrettslag              | 4883        | 653   | 100     | Eirik Natvik                     | Leirvik                | 11,80      | 2021.09.13 |
    | Stord Idrettslag              | 4884        | 645   | 1500    | Johannes Thomsen                 | Leirvik                | 4,13,17    | 2021.09.13 |
    | Stord Idrettslag              | 4885        | 625   | 3000    | Vegard Havn                      | Fana                   | 9,17,21    | 2021.09.28 |
    | Stord Idrettslag              | 4886        | 622   | 200     | Eirik Natvik                     | Fana                   | 24,27      | 2021.09.28 |
    | Stord Idrettslag              | 4887        | 617   | 1500    | Martin Schei                     | Leirvik                | 4,16,93    | 2021.09.13 |
    | Stord Idrettslag              | 4888        | 616   | Høyde   | Sander Turøy                     | Trondheim              | 1,76       | 2021.09.28 |
    | Stord Idrettslag              | 4889        | 606   | 100     | John Torkelsen                   | Fana                   | 12,02      | 2021.09.28 |
    | Stord Idrettslag              | 4890        | 604   | Stav    | Per Gregersen                    | Leirvik                | 3,45       | 2021.09.13 |
    | Stord Idrettslag              | 4891        | 590   | 200     | Marius Torbjørnsen               | Bømlo                  | 24,61      | 2021.09.30 |
    | Stord Idrettslag              | 4892        | 588   | 100     | Marius Torbjørnsen               | Leirvik                | 12,11      | 2021.09.13 |
    | Stord Idrettslag              | 4893        | 577   | Lut     | Sander Turøy                     | Bømlo                  | 2,83       | 2021.09.30 |
    | Stord Idrettslag              | 4894        | 574   | 1500    | Vegard Havn                      | Fana                   | 4,22,82    | 2021.09.28 |
    | Stord Idrettslag              | 4895        | 568   | 100     | Sander Turøy                     | Leirvik                | 12,21      | 2021.09.13 |
    | Stord Idrettslag              | 4896        | 566   | Lut     | John Torkelsen                   | Bømlo                  | 2,81       | 2021.09.30 |
    | Stord Idrettslag              | 4897        | 562   | 400     | Johannes Bø                      | Leirvik                | 55,11      | 2021.09.13 |
    | Stord Idrettslag              | 4898        | 559   | Tresteg | Marius Torbjørnsen               | Leirvik                | 11,99      | 2021.09.13 |
    | Stord Idrettslag              | 4899        | 557   | 5000    | Andreas Polden                   | Oslo/Bi                | 16,46,98   | 2021.09.25 |
    | Stord Idrettslag              | 4900        | 552   | 200     | Johannes Bø                      | Leirvik                | 25,04      | 2021.09.13 |
    | Stord Idrettslag              | 4901        | 542   | 100     | Steffen Hollund                  | Leirvik                | 12,34      | 2021.09.13 |
    | Stord Idrettslag              | 4902        | 539   | 200     | Steffen Hollund                  | Bømlo                  | 25,20      | 2021.09.30 |
    | Stord Idrettslag              | 4903        | 532   | Diskos  | Oddvar Hårde                     | Leirvik                | 32,34      | 2021.09.13 |
    | Stord Idrettslag              | 4904        | 529   | 200     | Sander Turøy                     | Bømlo                  | 25,32      | 2021.09.30 |
    | Stord Idrettslag              | 4905        | 521   | Lengde  | Marius Torbjørnsen               | Leirvik                | 5,63       | 2021.09.13 |
    | Stord Idrettslag              | 4906        | 481   | Diskos  | Per Gregersen                    | Leirvik                | 30,12      | 2021.09.13 |
    | Stord Idrettslag              | 4907        | 476   | 800     | Eirik Nitter                     | Bømlo                  | 2,13,67    | 2021.09.30 |
    | Stord Idrettslag              | 4908        | 470   | Lengde  | Steffen Hollund                  | Leirvik                | 5,41       | 2021.09.13 |
    | Stord Idrettslag              | 4909        | 466   | Hut     | Sander Turøy                     | Bømlo                  | 1,32       | 2021.09.30 |
    | Stord Idrettslag              | 4910        | 453   | Spyd    | Espen Nordfonn                   | Leirvik                | 37,71      | 2021.09.13 |
    | Stord Idrettslag              | 4911        | 430   | Spyd    | Oddvar Hårde                     | Leirvik                | 36,23      | 2021.09.13 |
    | Stord Idrettslag              | 4912        | 426   | Lut     | Eirik Natvik                     | Leirvik                | 2,58       | 2021.09.13 |
    | Stord Idrettslag              | 4913        | 424   | 100     | Johannes Bø                      | Leirvik                | 12,98      | 2021.09.13 |
    | Stord Idrettslag              | 4914        | 390   | Lut     | Steffen Hollund                  | Bømlo                  | 2,53       | 2021.09.30 |
    | Stord Idrettslag              | 4915        | 374   | 200     | Eirik Nitter                     | Bømlo                  | 27,42      | 2021.09.30 |
    | Stord Idrettslag              | 4916        | 366   | Lengde  | Oddvar Hårde                     | Hamar                  | 4,98       | 2021.08.22 |
    | Stord Idrettslag              | 4917        | 364   | Høyde   | Johannes Bø                      | Leirvik                | 1,51       | 2021.09.13 |
    | Stord Idrettslag              | 4918        | 358   | 100     | Mats Rissmann-Bredesen           | Leirvik                | 13,37      | 2021.09.13 |
    | Stord Idrettslag              | 4919        | 355   | 100     | Thomas Sæverud                   | Bømlo                  | 13,39      | 2021.09.30 |
    | Stord Idrettslag              | 4920        | 351   | Hut     | Eirik Natvik                     | Leirvik                | 1,24       | 2021.09.13 |
    | Stord Idrettslag              | 4921        | 345   | 100     | Oddvar Hårde                     | Hamar                  | 13,45      | 2021.08.22 |
    | Stord Idrettslag              | 4922        | 337   | Lengde  | Sander Turøy                     | Bømlo                  | 4,86       | 2021.09.30 |
    | Stord Idrettslag              | 4923        | 335   | 1500    | Eirik Nitter                     | Bømlo                  | 5,03,17    | 2021.09.30 |
    | Stord Idrettslag              | 4924        | 330   | Høyde   | Oddvar Hårde                     | Hamar                  | 1,48       | 2021.08.22 |
    | Stord Idrettslag              | 4925        | 330   | Høyde   | Per Gregersen                    | Hamar                  | 1,48       | 2021.08.22 |
    | Stord Idrettslag              | 4926        | 327   | 400     | Per Gregersen                    | Hamar                  | 1,03,21    | 2021.08.22 |
    | Stord Idrettslag              | 4927        | 325   | Lut     | Oliver Selle                     | Bømlo                  | 2,45       | 2021.09.30 |
    | Stord Idrettslag              | 4928        | 322   | 5000    | Jørgen Almås                     | Leirvik                | 19,22,4    | 2021.09.13 |
    | Stord Idrettslag              | 4929        | 318   | 100     | Eirik Nitter                     | Leirvik                | 13,62      | 2021.09.13 |
    | Stord Idrettslag              | 4930        | 316   | Hut     | Oliver Selle                     | Bømlo                  | 1,22       | 2021.09.30 |
    | Stord Idrettslag              | 4931        | 309   | 200     | Miller Nesse                     | Bømlo                  | 28,45      | 2021.09.30 |
    | Stord Idrettslag              | 4932        | 307   | 400     | Oddvar Hårde                     | Hamar                  | 1,04,03    | 2021.08.22 |
    | Stord Idrettslag              | 4933        | 284   | 200     | Thomas Sæverud                   | Bømlo                  | 28,86      | 2021.09.30 |
    | Stord Idrettslag              | 4934        | 279   | 100     | Per Gregersen                    | Hamar                  | 13,88      | 2021.08.22 |
    | Stord Idrettslag              | 4935        | 266   | Stav    | Oddvar Hårde                     | Hamar                  | 2,20       | 2021.08.22 |
    | Stord Idrettslag              | 4936        | 259   | Lut     | Mats Rissmann-Bredesen           | Bømlo                  | 2,38       | 2021.09.30 |
    | Stord Idrettslag              | 4937        | 255   | 100     | Miller Nesse                     | Bømlo                  | 14,04      | 2021.09.30 |
    | Stord Idrettslag              | 4938        | 238   | Lengde  | Johannes Bø                      | Bømlo                  | 4,46       | 2021.09.30 |
    | Stord Idrettslag              | 4939        | 222   | Lengde  | Thomas Sæverud                   | Bømlo                  | 4,40       | 2021.09.30 |
    | Stord Idrettslag              | 4940        | 201   | 200     | Ask Rosland                      | Leirvik                | 30,31      | 2021.09.13 |
    | Stord Idrettslag              | 4941        | 189   | 1500    | Mats Rissmann-Bredesen           | Bømlo                  | 5,35,16    | 2021.09.30 |
    | Stord Idrettslag              | 4942        | 172   | 200     | Andreas Kringeland               | Leirvik                | 30,86      | 2021.09.13 |
    | Stord Idrettslag              | 4943        | 138   | 1500    | Per Gregersen                    | Hamar                  | 5,48,06    | 2021.08.22 |
    | Stord Idrettslag              | 4944        | 128   | 800     | Simen Thorbjørnsen               | Leirvik                | 2,48,69    | 2021.09.13 |
    | Stord Idrettslag              | 4945        | 125   | 800     | Ask Rosland                      | Leirvik                | 2,49,07    | 2021.09.13 |
    | Stord Idrettslag              | 4946        | 122   | Lengde  | Per Gregersen                    | Hamar                  | 4,01       | 2021.08.22 |
    | Stord Idrettslag              | 4947        | 120   | Hut     | Mats Rissmann-Bredesen           | Bømlo                  | 1,12       | 2021.09.30 |
    | Stord Idrettslag              | 4948        | 111   | Høyde   | Andreas Kringeland               | Leirvik                | 1,31       | 2021.09.13 |
    | Stord Idrettslag              | 4949        | 96    | Høyde   | Ask Rosland                      | Leirvik                | 1,30       | 2021.09.13 |
    | Stord Idrettslag              | 4950        | 72    | Lengde  | Theodor Raunholm                 | Leirvik                | 3,82       | 2021.09.13 |
    | Stord Idrettslag              | 4951        | 67    | 100     | Andreas Kringeland               | Leirvik                | 15,49      | 2021.09.13 |
    | Stord Idrettslag              | 4952        | 67    | 1500    | Oddvar Hårde                     | Hamar                  | 6,07,84    | 2021.08.22 |
    | Stord Idrettslag              | 4953        | 55    | 5000    | Eirik Spjeld                     | Leirvik                | 23,55,4    | 2021.09.13 |
    | Stord Idrettslag              | 4954        | 23    | Lengde  | Kristoffer Eggøy                 | Leirvik                | 3,64       | 2021.09.13 |
    | Stord Idrettslag              | 4955        | 7     | Lengde  | Theodor Hollund                  | Leirvik                | 3,58       | 2021.09.13 |
    | Stovnerkameratene             | 4956        | 443   | Slegge  | Bjørn Olstad                     | Oslo/St                | 28,97      | 2021.10.16 |
    | Stovnerkameratene             | 4957        | 407   | 800     | Geir Holmsen                     | Jessheim               | 2,19,37    | 2021.09.09 |
    | Stovnerkameratene             | 4958        | 282   | 200     | Sturla Henriksen                 | Førde                  | 28,89      | 2021.08.22 |
    | Stovnerkameratene             | 4959        | 217   | 400     | Sturla Henriksen                 | Førde                  | 1,07,94    | 2021.08.22 |
    | Stovnerkameratene             | 4960        | 198   | Spyd    | Torbjørn Moe                     | Oslo/St                | 22,73      | 2021.10.16 |
    | Stovnerkameratene             | 4961        | 152   | Slegge  | Torbjørn Moe                     | Oslo/St                | 14,90      | 2021.10.16 |
    | Stovnerkameratene             | 4962        | 129   | 5000    | Bjørn Lauglo                     | Lambertseter           | 22,24,9    | 2021.10.17 |
    | Stovnerkameratene             | 4963        | 125   | Kule    | Torbjørn Moe                     | Fet                    | 6,08       | 2021.09.21 |
    | Stovnerkameratene             | 4964        | 122   | 3000    | Bjørn Lauglo                     | Oslo/St                | 12,50,9    | 2021.10.16 |
    | Stovnerkameratene             | 4965        | 93    | Tresteg | Torbjørn Moe                     | Førde                  | 8,07       | 2021.08.22 |
    | Stovnerkameratene             | 4966        | 85    | 100     | Torbjørn Moe                     | Oslo/St                | 15,1       | 2021.10.16 |
    | Stovnerkameratene             | 4967        | 75    | Diskos  | Torbjørn Moe                     | Oslo/St                | 15,33      | 2021.10.16 |
    | Stovnerkameratene             | 4968        | 54    | 1500    | Bjørn Lauglo                     | Oslo/St                | 6,11,5     | 2021.10.16 |
    | Stovnerkameratene             | 4969        | 37    | Lengde  | Torbjørn Moe                     | Førde                  | 3,69       | 2021.08.22 |
    | Stovnerkameratene             | 4970        | 29    | 5000    | Arne Ingelsrud                   | Lambertseter           | 24,32,9    | 2021.10.17 |
    | Strindheim IL                 | 4971        | 882   | 5000    | Trond Pedersli                   | Trondheim              | 14,14,43   | 2021.09.28 |
    | Strindheim IL                 | 4972        | 849   | 10000   | Ebrahim Abdulaziz                | Trondheim              | 30,14,66   | 2021.09.28 |
    | Strindheim IL                 | 4973        | 808   | 3000    | Mads Waaler                      | Jessheim               | 8,31,07    | 2021.09.09 |
    | Strindheim IL                 | 4974        | 790   | 3000    | Henrik Laukli                    | Trondheim              | 8,35,31    | 2021.09.28 |
    | Strindheim IL                 | 4975        | 790   | 5000    | Henrik Laukli                    | Trondheim              | 14,52,21   | 2021.09.28 |
    | Strindheim IL                 | 4976        | 786   | 5000    | Ulrik Arnesen                    | Oslo/Bi                | 14,53,94   | 2021.09.25 |
    | Strindheim IL                 | 4977        | 779   | 800     | Peder Talsnes                    | Trondheim              | 1,55,65    | 2021.09.28 |
    | Strindheim IL                 | 4978        | 779   | 5000    | Markus Kjærner-Semb              | Oslo/Bi                | 14,56,92   | 2021.09.25 |
    | Strindheim IL                 | 4979        | 773   | 5000    | Mads Waaler                      | Oslo/Bi                | 14,59,72   | 2021.09.25 |
    | Strindheim IL                 | 4980        | 766   | 1500    | Dag Blandkjenn                   | Uddevalla/SWE          | 3,59,43    | 2021.06.15 |
    | Strindheim IL                 | 4981        | 745   | 10000   | Mads Waaler                      | Kristiansand           | 31,53,27   | 2021.10.06 |
    | Strindheim IL                 | 4982        | 739   | Spyd    | Bendik Espenes                   | Oslo/Bi                | 58,48      | 2021.09.25 |
    | Strindheim IL                 | 4983        | 722   | 3000    | August Lunde                     | Trondheim              | 8,51,35    | 2021.09.28 |
    | Strindheim IL                 | 4984        | 718   | 3000    | Ebrahim Abdulaziz                | Trondheim              | 8,52,36    | 2021.09.28 |
    | Strindheim IL                 | 4985        | 713   | 5000    | Øystein Østerbø                  | Trondheim              | 15,27,21   | 2021.09.28 |
    | Strindheim IL                 | 4986        | 673   | 1500    | August Lunde                     | Oslo/Bi                | 4,09,83    | 2021.09.25 |
    | Strindheim IL                 | 4987        | 654   | 5000    | August Lunde                     | Ravnanger              | 15,55,51   | 2021.09.15 |
    | Strindheim IL                 | 4988        | 621   | 100     | Arne Røstad                      | Trondheim              | 11,95      | 2021.09.28 |
    | Strindheim IL                 | 4989        | 609   | 200     | Arne Røstad                      | Trondheim              | 24,40      | 2021.09.28 |
    | Strindheim IL                 | 4990        | 602   | 10000   | Ulrik Arnesen                    | Oslo/Bi                | 34,28,69   | 2021.09.25 |
    | Strindheim IL                 | 4991        | 575   | 800     | Lars Bonesmo                     | Trondheim              | 2,06,49    | 2021.09.28 |
    | Strindheim IL                 | 4992        | 571   | 1500    | Sven Nevin                       | Måndalen               | 4,23,28    | 2021.09.12 |
    | Strindheim IL                 | 4993        | 564   | 800     | Alf Stensø                       | Trondheim              | 2,07,19    | 2021.09.28 |
    | Strindheim IL                 | 4994        | 555   | 200     | Petter Irgens                    | Grimstad               | 25,01      | 2021.10.25 |
    | Strindheim IL                 | 4995        | 547   | 10000   | Terje Olsen                      | Trondheim              | 35,35,73   | 2021.09.28 |
    | Strindheim IL                 | 4996        | 544   | 400h    | Petter Irgens                    | Lillehammer            | 1,03,36    | 2021.09.26 |
    | Strindheim IL                 | 4997        | 532   | 100     | Petter Irgens                    | Trondheim              | 12,39      | 2021.09.28 |
    | Strindheim IL                 | 4998        | 520   | 3000    | Alf Stensø                       | Trondheim              | 9,49,68    | 2021.09.28 |
    | Strindheim IL                 | 4999        | 515   | 800     | Sven Nevin                       | Trondheim              | 2,10,69    | 2021.09.28 |
    | Strindheim IL                 | 5000        | 509   | 400     | Petter Irgens                    | Steinkjer              | 56,69      | 2021.09.30 |
    | Strindheim IL                 | 5001        | 480   | 400     | Alf Stensø                       | Trondheim              | 57,60      | 2021.09.28 |
    | Strindheim IL                 | 5002        | 480   | 3000    | Michael Watts                    | Trondheim              | 10,03,52   | 2021.09.28 |
    | Strindheim IL                 | 5003        | 453   | 800     | Petter Irgens                    | Trondheim              | 2,15,43    | 2021.09.28 |
    | Strindheim IL                 | 5004        | 453   | 3000    | Lars Blikra                      | Førde                  | 10,12,78   | 2021.08.22 |
    | Strindheim IL                 | 5005        | 450   | 5000    | Lars Blikra                      | Førde                  | 17,51,25   | 2021.08.22 |
    | Strindheim IL                 | 5006        | 447   | Stav    | Petter Irgens                    | Stjørdal               | 2,80       | 2021.10.23 |
    | Strindheim IL                 | 5007        | 431   | 200     | Alf Stensø                       | Trondheim              | 26,60      | 2021.09.28 |
    | Strindheim IL                 | 5008        | 422   | 3000    | Martin Dorber                    | Trondheim              | 10,24,36   | 2021.09.28 |
    | Strindheim IL                 | 5009        | 390   | 1500    | Mathias Leroyer                  | Måndalen               | 4,52,78    | 2021.09.12 |
    | Strindheim IL                 | 5010        | 382   | Lut     | Christian Stranger-Johannessen   | Hvam                   | 2,52       | 2021.10.23 |
    | Strindheim IL                 | 5011        | 374   | 800     | Carl Svanholm                    | Stjørdal               | 2,22,39    | 2021.10.23 |
    | Strindheim IL                 | 5012        | 357   | 1500    | Alf Stensø                       | Trondheim              | 4,58,84    | 2021.09.28 |
    | Strindheim IL                 | 5013        | 331   | 800     | Mathias Leroyer                  | Trondheim              | 2,26,46    | 2021.09.28 |
    | Strindheim IL                 | 5014        | 312   | 100     | Christian Stranger-Johannessen   | Førde                  | 13,66      | 2021.08.22 |
    | Strindheim IL                 | 5015        | 295   | Høyde   | Petter Irgens                    | Stjørdal               | 1,45       | 2021.10.23 |
    | Strindheim IL                 | 5016        | 289   | 3000    | Carl Svanholm                    | Trondheim              | 11,19,78   | 2021.09.28 |
    | Strindheim IL                 | 5017        | 268   | 200     | Christian Stranger-Johannessen   | Førde                  | 29,13      | 2021.08.22 |
    | Strindheim IL                 | 5018        | 246   | 200     | Morten Warankov                  | Førde                  | 29,50      | 2021.08.22 |
    | Strindheim IL                 | 5019        | 233   | 3000    | Even Løkken                      | Førde                  | 11,47,03   | 2021.08.22 |
    | Strindheim IL                 | 5020        | 232   | 400     | Morten Warankov                  | Førde                  | 1,07,27    | 2021.08.22 |
    | Strindheim IL                 | 5021        | 207   | 1500    | Even Løkken                      | Førde                  | 5,30,73    | 2021.08.22 |
    | Strindheim IL                 | 5022        | 206   | 100     | Morten Warankov                  | Førde                  | 14,39      | 2021.08.22 |
    | Strindheim IL                 | 5023        | 166   | 200     | Sondre Thorstensen               | Trondheim              | 30,98      | 2021.09.28 |
    | Strindheim IL                 | 5024        | 86    | 200     | Nils Gaasvik                     | Førde                  | 32,56      | 2021.08.22 |
    | Strindheim IL                 | 5025        | 35    | Stav    | Sven Nevin                       | Måndalen               | 1,62       | 2021.09.12 |
    | Strindheim IL                 | 5026        | 6     | 200     | Frithjof Lyng-Nielsen            | Førde                  | 34,27      | 2021.08.22 |
    | Stålkameratene IL             | 5027        | 266   | Stav    | Trond Furuly                     | Hamar                  | 2,20       | 2021.08.22 |
    | Stålkameratene IL             | 5028        | 140   | Hut     | Trond Furuly                     | Hvam                   | 1,13       | 2021.10.23 |
    | Stålkameratene IL             | 5029        | 136   | 200     | Trond Furuly                     | Førde                  | 31,56      | 2021.08.22 |
    | Stålkameratene IL             | 5030        | 120   | Lut     | Trond Furuly                     | Hvam                   | 2,24       | 2021.10.23 |
    | Stålkameratene IL             | 5031        | 103   | Tresteg | Trond Furuly                     | Førde                  | 8,15       | 2021.08.22 |
    | Stålkameratene IL             | 5032        | 91    | 100     | Trond Furuly                     | Hamar                  | 15,29      | 2021.08.22 |
    | Stålkameratene IL             | 5033        | 42    | 400     | Trond Furuly                     | Hamar                  | 1,16,26    | 2021.08.22 |
    | Stålkameratene IL             | 5034        | 23    | Lengde  | Trond Furuly                     | Førde                  | 3,64       | 2021.08.22 |
    | Stålkameratene IL             | 5035        | 3     | Høyde   | Trond Furuly                     | Førde                  | 1,24       | 2021.08.22 |
    | Stårheim IL                   | 5036        | 611   | Lengde  | Ole Ytrehus                      | Florø                  | 6,02       | 2021.06.05 |
    | Stårheim IL                   | 5037        | 568   | 100     | Ole Ytrehus                      | Florø                  | 12,21      | 2021.06.05 |
    | Sunndal IL Friidrett          | 5038        | 316   | 800     | Vegard Hammer                    | Tingvoll               | 2,27,94    | 2021.09.18 |
    | Sunndal IL Friidrett          | 5039        | 283   | 200     | Johan Stokke                     | Molde                  | 28,88      | 2021.06.20 |
    | Sunndal IL Friidrett          | 5040        | 90    | Lengde  | Johan Stokke                     | Molde                  | 3,89       | 2021.06.20 |
    | Surnadal IL                   | 5041        | 507   | 100     | Sondre Andersen                  | Molde                  | 12,52      | 2021.06.20 |
    | Surnadal IL                   | 5042        | 501   | Høyde   | Sondre Andersen                  | Molde                  | 1,64       | 2021.06.20 |
    | Surnadal IL                   | 5043        | 498   | Lengde  | Sondre Andersen                  | Tingvoll               | 5,53       | 2021.09.18 |
    | Surnadal IL                   | 5044        | 449   | 200     | Sondre Andersen                  | Molde                  | 26,34      | 2021.06.20 |
    | Surnadal IL                   | 5045        | 330   | Høyde   | Jo Bøe                           | Børsa                  | 1,48       | 2021.08.08 |
    | Surnadal IL                   | 5046        | 323   | 100     | Jo Bøe                           | Trondheim              | 13,59      | 2021.09.28 |
    | Svarstad IL                   | 5047        | 835   | 3000    | Robert Bergstå                   | Jessheim               | 8,25,30    | 2021.09.09 |
    | Svarstad IL                   | 5048        | 807   | 5000    | Robert Bergstå                   | Greveskogen            | 14,44,95   | 2021.10.30 |
    | Svarstad IL                   | 5049        | 787   | 1500    | Robert Bergstå                   | Oslo/Bi                | 3,57,32    | 2021.09.25 |
    | Svarstad IL                   | 5050        | 774   | 10000   | Robert Bergstå                   | Kristiansand           | 31,24,32   | 2021.10.06 |
    | Svarstad IL                   | 5051        | 709   | 5000    | Stian Bergstå                    | Oslo/Bi                | 15,28,96   | 2021.09.25 |
    | Svarstad IL                   | 5052        | 668   | 10000   | Stian Bergstå                    | Kristiansand           | 33,14,41   | 2021.10.06 |
    | Svelgen T & IF                | 5053        | 126   | 400     | Tidemann Hamre                   | Florø                  | 1,12,17    | 2021.06.05 |
    | Svint IL                      | 5054        | 400   | 800     | Sigurd Vårdal                    | Førde                  | 2,19,98    | 2021.08.22 |
    | Svint IL                      | 5055        | 328   | 800     | Haldor Vårdal                    | Byrkjelo               | 2,26,75    | 2021.10.31 |
    | Svint IL                      | 5056        | 326   | 200     | Haldor Vårdal                    | Måndalen               | 28,17      | 2021.09.12 |
    | Svint IL                      | 5057        | 279   | 1500    | Haldor Vårdal                    | Førde                  | 5,14,67    | 2021.08.22 |
    | Svint IL                      | 5058        | 246   | Høyde   | Haldor Vårdal                    | Måndalen               | 1,41       | 2021.09.12 |
    | Svint IL                      | 5059        | 240   | Tresteg | Haldor Vårdal                    | Måndalen               | 9,25       | 2021.09.12 |
    | Svint IL                      | 5060        | 215   | Lengde  | Haldor Vårdal                    | Måndalen               | 4,37       | 2021.09.12 |
    | Svorkmo N.O.I.                | 5061        | 894   | 3000    | Trond Eide                       | Trondheim              | 8,12,66    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5062        | 862   | 5000    | Trond Eide                       | Trondheim              | 14,21,99   | 2021.09.28 |
    | Svorkmo N.O.I.                | 5063        | 842   | 10000   | Trond Eide                       | Kristiansand           | 30,20,76   | 2021.10.06 |
    | Svorkmo N.O.I.                | 5064        | 821   | 3000    | Sverre Solligård                 | Trondheim              | 8,28,32    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5065        | 805   | 3000H   | Vegard Warnes                    | Kristiansand           | 9,15,74    | 2021.10.06 |
    | Svorkmo N.O.I.                | 5066        | 805   | 10000   | Sverre Solligård                 | Kristiansand           | 30,54,41   | 2021.10.06 |
    | Svorkmo N.O.I.                | 5067        | 799   | 3000    | Lars Svorkdal                    | Trondheim              | 8,33,24    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5068        | 798   | 3000    | Vegard Warnes                    | Børsa                  | 8,33,30    | 2021.08.08 |
    | Svorkmo N.O.I.                | 5069        | 783   | 5000    | Sverre Solligård                 | Steinkjer              | 14,55,28   | 2021.09.30 |
    | Svorkmo N.O.I.                | 5070        | 749   | 10000   | Lars Svorkdal                    | Trondheim              | 31,48,66   | 2021.09.28 |
    | Svorkmo N.O.I.                | 5071        | 735   | 3000    | Kristian Hammer                  | Trondheim              | 8,48,31    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5072        | 730   | 3000    | Jo-Inge Sandvik                  | Trondheim              | 8,49,43    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5073        | 723   | 1500    | Trond Eide                       | Trondheim              | 4,03,99    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5074        | 718   | 5000    | Lars Svorkdal                    | Trondheim              | 15,24,88   | 2021.09.28 |
    | Svorkmo N.O.I.                | 5075        | 718   | 5000    | Vegard Warnes                    | Trondheim              | 15,24,52   | 2021.09.28 |
    | Svorkmo N.O.I.                | 5076        | 700   | 5000    | Jo-Inge Sandvik                  | Steinkjer              | 15,32,94   | 2021.09.30 |
    | Svorkmo N.O.I.                | 5077        | 675   | 1500    | Lars Svorkdal                    | Stjørdal               | 4,09,51    | 2021.10.23 |
    | Svorkmo N.O.I.                | 5078        | 617   | 800     | Vegard Warnes                    | Trondheim              | 2,03,86    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5079        | 610   | 3000    | Jo Sande                         | Trondheim              | 9,21,49    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5080        | 567   | 3000    | Olve Løseth                      | Trondheim              | 9,34,74    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5081        | 563   | 3000    | Ola Skjølberg                    | Trondheim              | 9,36,01    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5082        | 549   | 800     | Lars Svorkdal                    | Trondheim              | 2,08,18    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5083        | 537   | 3000    | Magnus Løseth                    | Trondheim              | 9,44,01    | 2021.09.28 |
    | Svorkmo N.O.I.                | 5084        | 463   | 3000    | Martin Strømøy                   | Trondheim              | 10,09,51   | 2021.09.28 |
    | Søfteland TIL                 | 5085        | 145   | 3000K   | Erling Andersen                  | Os                     | 18,47,27   | 2021.09.26 |
    | Søfteland TIL                 | 5086        | 107   | 5000K   | Erling Andersen                  | Førde                  | 32,54,85   | 2021.08.22 |
    | Søgne IL                      | 5087        | 675   | 100     | Christian Øydne                  | Nadderud               | 11,70      | 2021.10.16 |
    | Søgne IL                      | 5088        | 337   | 200h    | Adrian Johansen                  | Søgne                  | 33,21      | 2021.10.05 |
    | Søgne IL                      | 5089        | 333   | 3000    | Steffen Skogbrot                 | Søgne                  | 11,00,38   | 2021.10.05 |
    | Søgne IL                      | 5090        | 315   | 3000    | Vidar Innselset                  | Søgne                  | 11,08,24   | 2021.10.05 |
    | Søgne IL                      | 5091        | 301   | 3000    | Reinert Solhøi                   | Søgne                  | 11,14,4    | 2021.10.05 |
    | Søgne IL                      | 5092        | 278   | 800     | Adrian Johansen                  | Søgne                  | 2,31,85    | 2021.10.05 |
    | Søgne IL                      | 5093        | 268   | Lengde  | Adrian Johansen                  | Kristiansand           | 4,58       | 2021.10.06 |
    | Søgne IL                      | 5094        | 216   | 400     | Adrian Johansen                  | Søgne                  | 1,07,97    | 2021.10.05 |
    | Søgne IL                      | 5095        | 112   | 100     | Adrian Johansen                  | Søgne                  | 15,12      | 2021.10.05 |
    | Søgne IL                      | 5096        | 15    | 3000    | Thomas Dønnestad                 | Søgne                  | 14,08,00   | 2021.10.05 |
    | Sømna IL                      | 5097        | 721   | 10000   | Lasse Blom                       | Oslo/Bi                | 32,17,70   | 2021.09.25 |
    | Sømna IL                      | 5098        | 691   | 5000    | Lasse Blom                       | Oslo/Bi                | 15,37,35   | 2021.09.25 |
    | Sømna IL                      | 5099        | 644   | 100     | Espen Olsen                      | Vik                    | 11,84      | 2021.10.02 |
    | Sømna IL                      | 5100        | 623   | 200     | Espen Olsen                      | Vik                    | 24,25      | 2021.10.02 |
    | Sømna IL                      | 5101        | 609   | Diskos  | Tommy Dale                       | Vik                    | 36,04      | 2021.10.02 |
    | Sømna IL                      | 5102        | 607   | Høyde   | Waldemar Knygh-Rossdal           | Namsos                 | 1,75       | 2021.08.22 |
    | Sømna IL                      | 5103        | 587   | 800     | Waldemar Knygh-Rossdal           | Trondheim              | 2,05,70    | 2021.09.28 |
    | Sømna IL                      | 5104        | 587   | 1500    | Waldemar Knygh-Rossdal           | Vik                    | 4,21,0     | 2021.10.02 |
    | Sømna IL                      | 5105        | 573   | 3000    | Lasse Blom                       | Vik                    | 9,32,93    | 2021.10.02 |
    | Sømna IL                      | 5106        | 544   | Lut     | Waldemar Knygh-Rossdal           | Berg                   | 2,77       | 2021.03.24 |
    | Sømna IL                      | 5107        | 534   | 400     | Waldemar Knygh-Rossdal           | Steinkjer              | 55,92      | 2021.09.30 |
    | Sømna IL                      | 5108        | 532   | 5000    | Kristian Arnøy                   | Vik                    | 17,01,53   | 2021.10.02 |
    | Sømna IL                      | 5109        | 528   | Spyd    | Tommy Dale                       | Vik                    | 42,92      | 2021.10.02 |
    | Sømna IL                      | 5110        | 526   | Kule    | Tommy Dale                       | Vik                    | 11,03      | 2021.10.02 |
    | Sømna IL                      | 5111        | 523   | Lengde  | Waldemar Knygh-Rossdal           | Vik                    | 5,64       | 2021.10.02 |
    | Sømna IL                      | 5112        | 520   | Tresteg | Waldemar Knygh-Rossdal           | Namsos                 | 11,64      | 2021.08.22 |
    | Sømna IL                      | 5113        | 519   | 200     | Waldemar Knygh-Rossdal           | Vik                    | 25,44      | 2021.10.02 |
    | Sømna IL                      | 5114        | 493   | Spyd    | Einar Bjøru                      | Vik                    | 40,45      | 2021.10.02 |
    | Sømna IL                      | 5115        | 492   | 400     | Espen Olsen                      | Vik                    | 57,21      | 2021.10.02 |
    | Sømna IL                      | 5116        | 481   | 100     | Waldemar Knygh-Rossdal           | Vik                    | 12,66      | 2021.10.02 |
    | Sømna IL                      | 5117        | 458   | 400     | Andreas Olsen                    | Steinkjer              | 58,31      | 2021.09.30 |
    | Sømna IL                      | 5118        | 453   | Hut     | Waldemar Knygh-Rossdal           | Berg                   | 1,31       | 2021.03.24 |
    | Sømna IL                      | 5119        | 432   | 10000   | Steinar Westerberg               | Vik                    | 38,13.44   | 2021.10.02 |
    | Sømna IL                      | 5120        | 431   | 5000    | Nils Reinfjord                   | Vik                    | 18,03,90   | 2021.10.02 |
    | Sømna IL                      | 5121        | 426   | 5000    | Rolv-Jørgen Bredesen             | Vik                    | 18,07,51   | 2021.10.02 |
    | Sømna IL                      | 5122        | 425   | 10000   | Rolv-Jørgen Bredesen             | Vik                    | 38,23,75   | 2021.10.02 |
    | Sømna IL                      | 5123        | 423   | 800     | Andreas Olsen                    | Vik                    | 2,18,05    | 2021.10.02 |
    | Sømna IL                      | 5124        | 419   | 5000    | Martin Kvalø                     | Arna                   | 18,11,92   | 2021.10.13 |
    | Sømna IL                      | 5125        | 417   | 3000    | Nils Reinfjord                   | Vik                    | 10,26,40   | 2021.10.02 |
    | Sømna IL                      | 5126        | 417   | Slegge  | Bertil Storvik                   | Vik                    | 27,52      | 2021.10.02 |
    | Sømna IL                      | 5127        | 416   | 200     | Andreas Olsen                    | Vik                    | 26,81      | 2021.10.02 |
    | Sømna IL                      | 5128        | 412   | Lengde  | Niklas Andersson                 | Vik                    | 5,17       | 2021.10.02 |
    | Sømna IL                      | 5129        | 412   | Hut     | Brage Arumairasa                 | Berg                   | 1,28       | 2021.03.24 |
    | Sømna IL                      | 5130        | 408   | Høyde   | Niklas Andersson                 | Vik                    | 1,55       | 2021.10.02 |
    | Sømna IL                      | 5131        | 408   | Kule    | Bertil Storvik                   | Vik                    | 9,45       | 2021.10.02 |
    | Sømna IL                      | 5132        | 406   | 3000    | Rolv-Jørgen Bredesen             | Vik                    | 10,30,44   | 2021.10.02 |
    | Sømna IL                      | 5133        | 405   | Lut     | Brage Arumairasa                 | Berg                   | 2,55       | 2021.03.24 |
    | Sømna IL                      | 5134        | 404   | 3000    | Amund Reinfjord                  | Vik                    | 10,31,22   | 2021.10.02 |
    | Sømna IL                      | 5135        | 403   | Lengde  | Andreas Olsen                    | Overhalla              | 5,13       | 2021.06.30 |
    | Sømna IL                      | 5136        | 396   | 5000    | Steinar Westerberg               | Vik                    | 18,28,02   | 2021.10.02 |
    | Sømna IL                      | 5137        | 385   | 100     | Sander Mørch                     | Vik                    | 13,21      | 2021.10.02 |
    | Sømna IL                      | 5138        | 383   | 3000    | Steinar Westerberg               | Vik                    | 10,39,66   | 2021.10.02 |
    | Sømna IL                      | 5139        | 379   | 3000    | Gunnar Thrana                    | Vik                    | 10,41,38   | 2021.10.02 |
    | Sømna IL                      | 5140        | 379   | 1500    | Niklas Andersson                 | Vik                    | 4,54,77    | 2021.10.02 |
    | Sømna IL                      | 5141        | 377   | 3000    | Andreas Dahle                    | Vik                    | 10,42,16   | 2021.10.02 |
    | Sømna IL                      | 5142        | 376   | 800     | Einar Bjøru                      | Vik                    | 2,22,20    | 2021.10.02 |
    | Sømna IL                      | 5143        | 374   | 5000    | Andreas Dahle                    | Vik                    | 18,43,84   | 2021.10.02 |
    | Sømna IL                      | 5144        | 357   | 1500    | Nils Reinfjord                   | Vik                    | 4,58,90    | 2021.10.02 |
    | Sømna IL                      | 5145        | 351   | Lut     | Andreas Olsen                    | Berg                   | 2,48       | 2021.03.24 |
    | Sømna IL                      | 5146        | 348   | Slegge  | Tommy Dale                       | Dalbotn                | 23,70      | 2021.08.26 |
    | Sømna IL                      | 5147        | 347   | Lengde  | August Reinfjord                 | Vik                    | 4,90       | 2021.10.02 |
    | Sømna IL                      | 5148        | 338   | Kule    | Andreas Dahle                    | Vik                    | 8,56       | 2021.10.02 |
    | Sømna IL                      | 5149        | 337   | 100     | Sander Johansen                  | Nadderud               | 13,50      | 2021.10.16 |
    | Sømna IL                      | 5150        | 337   | 100     | Andreas Olsen                    | Mosjøen                | 13,50      | 2021.08.28 |
    | Sømna IL                      | 5151        | 328   | 1500    | Amund Reinfjord                  | Vik                    | 5,04,62    | 2021.10.02 |
    | Sømna IL                      | 5152        | 327   | 5000    | Gunnar Thrana                    | Vik                    | 19,19,16   | 2021.10.02 |
    | Sømna IL                      | 5153        | 327   | 3000    | August Reinfjord                 | Vik                    | 11,02,98   | 2021.10.02 |
    | Sømna IL                      | 5154        | 318   | 200     | Niklas Andersson                 | Vik                    | 28,30      | 2021.10.02 |
    | Sømna IL                      | 5155        | 317   | 10000   | Andreas Dahle                    | Vik                    | 41,20,18   | 2021.10.02 |
    | Sømna IL                      | 5156        | 308   | 3000    | Ørjar Evensen                    | Vik                    | 11,11,42   | 2021.10.02 |
    | Sømna IL                      | 5157        | 307   | 10000   | Leif Øvrebust                    | Vik                    | 41,38,96   | 2021.10.02 |
    | Sømna IL                      | 5158        | 306   | 10000   | Werner Reinfjord                 | Vik                    | 41,40,65   | 2021.10.02 |
    | Sømna IL                      | 5159        | 302   | 5000    | Amund Reinfjord                  | Vik                    | 19,38,0    | 2021.10.02 |
    | Sømna IL                      | 5160        | 297   | 5000    | Leif Øvrebust                    | Vik                    | 19,42,62   | 2021.10.02 |
    | Sømna IL                      | 5161        | 291   | 1500    | Andreas Olsen                    | Vik                    | 5,12,12    | 2021.10.02 |
    | Sømna IL                      | 5162        | 282   | 200     | Adrian Olsen                     | Vik                    | 28,90      | 2021.10.02 |
    | Sømna IL                      | 5163        | 279   | 800     | Nils Reinfjord                   | Vik                    | 2,31,75    | 2021.10.02 |
    | Sømna IL                      | 5164        | 270   | 400     | Adrian Olsen                     | Vik                    | 1,05,59    | 2021.10.02 |
    | Sømna IL                      | 5165        | 264   | 3000    | Martin Lillefjell                | Vik                    | 11,31,92   | 2021.10.02 |
    | Sømna IL                      | 5166        | 262   | 3000    | Håvard Pettersen                 | Vik                    | 11,32,94   | 2021.10.02 |
    | Sømna IL                      | 5167        | 259   | 5000    | Sander Mørch                     | Vik                    | 20,14,67   | 2021.10.02 |
    | Sømna IL                      | 5168        | 258   | 5000    | Werner Reinfjord                 | Vik                    | 20,16.01   | 2021.10.02 |
    | Sømna IL                      | 5169        | 244   | 200     | Albin Monsen                     | Vik                    | 29,54      | 2021.10.02 |
    | Sømna IL                      | 5170        | 233   | Høyde   | Andreas Olsen                    | Mosjøen                | 1,40       | 2021.08.28 |
    | Sømna IL                      | 5171        | 232   | 200     | Sander Johansen                  | Vik                    | 29,76      | 2021.10.02 |
    | Sømna IL                      | 5172        | 228   | 5000    | Martin Lillefjell                | Vik                    | 20,43,00   | 2021.10.02 |
    | Sømna IL                      | 5173        | 220   | 3000    | Leif Øvrebust                    | Vik                    | 11,54,00   | 2021.10.02 |
    | Sømna IL                      | 5174        | 218   | Kule    | Thomas Dahle                     | Vik                    | 7,12       | 2021.10.02 |
    | Sømna IL                      | 5175        | 217   | 3000    | Werner Reinfjord                 | Vik                    | 11,55,52   | 2021.10.02 |
    | Sømna IL                      | 5176        | 206   | 5000    | Håvard Pettersen                 | Vik                    | 21,03,78   | 2021.10.02 |
    | Sømna IL                      | 5177        | 205   | Lengde  | Brage Arumairasa                 | Vik                    | 4,33       | 2021.10.02 |
    | Sømna IL                      | 5178        | 165   | 100     | Jørgen Nordhuus                  | Vik                    | 14,70      | 2021.10.02 |
    | Sømna IL                      | 5179        | 145   | 200     | Werner Reinfjord                 | Vik                    | 31,37      | 2021.10.02 |
    | Sømna IL                      | 5180        | 119   | Lengde  | Adrian Olsen                     | Mosjøen                | 4,00       | 2021.08.28 |
    | Sømna IL                      | 5181        | 78    | 3000    | Glenn Slåttøy                    | Vik                    | 13,20,14   | 2021.10.02 |
    | Sømna IL                      | 5182        | 58    | 5000    | Jørgen Nordhuus                  | Vik                    | 23,51,64   | 2021.10.02 |
    | Sømna IL                      | 5183        | 19    | Høyde   | Emil Kolsvik                     | Vik                    | 1,25       | 2021.10.02 |
    | Søndre Land IL                | 5184        | 750   | 100     | Ilunga Kongolo                   | Jessheim               | 11,37      | 2021.09.09 |
    | Søndre Land IL                | 5185        | 693   | 100     | Muamba Kongolo                   | Jessheim               | 11,62      | 2021.09.09 |
    | Søndre Land IL                | 5186        | 652   | Høyde   | Nikolai Moshagen                 | Jessheim               | 1,80       | 2021.09.09 |
    | Søndre Land IL                | 5187        | 608   | 100     | Tshishimbi Kongolo               | Brandbu                | 12,01      | 2021.09.25 |
    | Søndre Land IL                | 5188        | 578   | 200     | Nikolai Moshagen                 | Lillehammer            | 24,75      | 2021.09.26 |
    | Søndre Land IL                | 5189        | 558   | Lengde  | Tshishimbi Kongolo               | Gjøvik                 | 5,79       | 2021.05.29 |
    | Søndre Land IL                | 5190        | 550   | 100     | Nikolai Moshagen                 | Brandbu                | 12,30      | 2021.09.25 |
    | Søndre Land IL                | 5191        | 500   | Lengde  | Nikolai Moshagen                 | Gjøvik                 | 5,54       | 2021.05.29 |
    | Søndre Land IL                | 5192        | 500   | Stav    | Nikolai Moshagen                 | Moss                   | 3,00       | 2021.10.09 |
    | Søndre Land IL                | 5193        | 463   | Kule    | Ilunga Kongolo                   | Fana                   | 10,18      | 2021.09.28 |
    | Søndre Land IL                | 5194        | 434   | 100     | Sander Johnsbråten               | Brandbu                | 12,92      | 2021.09.25 |
    | Søndre Land IL                | 5195        | 399   | 400     | Nikolai Moshagen                 | Hamar                  | 1,00,38    | 2021.08.22 |
    | Søndre Land IL                | 5196        | 344   | Diskos  | Ilunga Kongolo                   | Fana                   | 24,68      | 2021.09.28 |
    | Søndre Land IL                | 5197        | 300   | 1500    | Nikolai Moshagen                 | Hamar                  | 5,10,26    | 2021.08.22 |
    | Søndre Land IL                | 5198        | 284   | Tresteg | Mohamed Abdullahi                | Hov i Land             | 9,61       | 2021.10.02 |
    | Søndre Land IL                | 5199        | 250   | Lengde  | Mohamed Abdullahi                | Hov i Land             | 4,51       | 2021.10.02 |
    | Søndre Land IL                | 5200        | 166   | 1500    | Noah Hesla                       | Brandbu                | 5,40,87    | 2021.09.25 |
    | Søndre Land IL                | 5201        | 160   | 200     | Aksel Moshagen                   | Lillehammer            | 31,09      | 2021.09.26 |
    | Søndre Land IL                | 5202        | 147   | 100     | Aksel Moshagen                   | Lillehammer            | 14,84      | 2021.09.26 |
    | Søndre Land IL                | 5203        | 111   | Høyde   | Aksel Moshagen                   | Rjukan                 | 1,31       | 2021.09.12 |
    | Søndre Land IL                | 5204        | 72    | Lengde  | Sander Johnsbråten               | Gjøvik                 | 3,82       | 2021.05.29 |
    | Søndre Land IL                | 5205        | 59    | 100     | Mathias Lygre                    | Lillehammer            | 15,56      | 2021.09.26 |
    | Søndre Land IL                | 5206        | 19    | Høyde   | Johan Andresen                   | Hov i Land             | 1,25       | 2021.10.02 |
    | Sør-Vekkom Lauparlag          | 5207        | 554   | 3000    | Knut Tromsnes                    | Trondheim              | 9,38,59    | 2021.09.28 |
    | Sørild FIK                    | 5208        | 1000  | 100     | Even Meinseth                    | Schifflange/LUX        | 10,42      | 2021.08.22 |
    | Sørild FIK                    | 5209        | 782   | Hut     | Jonathan Askeland                | Grimstad               | 1,60       | 2021.10.25 |
    | Sørild FIK                    | 5210        | 748   | 100     | Jonathan Askeland                | Trondheim              | 11,38      | 2021.09.28 |
    | Sørild FIK                    | 5211        | 722   | 200     | Jonathan Askeland                | Trondheim              | 23,25      | 2021.09.28 |
    | Sørild FIK                    | 5212        | 705   | Høyde   | Jonathan Askeland                | Grimstad               | 1,86       | 2021.10.25 |
    | Sørild FIK                    | 5213        | 697   | 200     | Andreas Sollid                   | Trondheim              | 23,50      | 2021.09.28 |
    | Sørild FIK                    | 5214        | 684   | 200     | Marc Berntsen                    | Grimstad               | 23,63      | 2021.10.25 |
    | Sørild FIK                    | 5215        | 672   | Lengde  | Andreas Sollid                   | Tvedestrand            | 6,29       | 2021.09.15 |
    | Sørild FIK                    | 5216        | 666   | Lut     | Jonathan Askeland                | Grimstad               | 2,99       | 2021.10.25 |
    | Sørild FIK                    | 5217        | 635   | 400     | Andreas Sollid                   | Grimstad               | 53,22      | 2021.10.25 |
    | Sørild FIK                    | 5218        | 625   | 100     | Andreas Sollid                   | Grimstad               | 11,93      | 2021.10.25 |
    | Sørild FIK                    | 5219        | 615   | 200     | Elias Sollid                     | Jessheim               | 24,34      | 2021.09.09 |
    | Sørild FIK                    | 5220        | 602   | 100     | Jo Ølberg                        | Grimstad               | 12,04      | 2021.10.25 |
    | Sørild FIK                    | 5221        | 597   | 3000    | Eivind Tobiassen                 | Trondheim              | 9,25,36    | 2021.09.28 |
    | Sørild FIK                    | 5222        | 585   | 1500    | Eivind Tobiassen                 | Grimstad               | 4,21,21    | 2021.10.25 |
    | Sørild FIK                    | 5223        | 582   | 200     | Jo Ølberg                        | Grimstad               | 24,70      | 2021.10.25 |
    | Sørild FIK                    | 5224        | 572   | Lut     | Tom Storsæter                    | Grimstad               | 2,82       | 2021.10.25 |
    | Sørild FIK                    | 5225        | 568   | 800     | Eivind Tobiassen                 | Porsgrunn              | 2,06,92    | 2021.09.25 |
    | Sørild FIK                    | 5226        | 562   | 100     | Elias Sollid                     | Grimstad               | 12,24      | 2021.10.25 |
    | Sørild FIK                    | 5227        | 528   | 800     | Dennis Bergstrøm-Bendixen        | Porsgrunn              | 2,09,69    | 2021.09.25 |
    | Sørild FIK                    | 5228        | 507   | 400     | Jonathan Askeland                | Tvedestrand            | 56,6       | 2021.09.15 |
    | Sørild FIK                    | 5229        | 493   | 3000    | Tobias Fretheim                  | Grimstad               | 9,58,81    | 2021.10.25 |
    | Sørild FIK                    | 5230        | 490   | 1500    | Dennis Bergstrøm-Bendixen        | Jessheim               | 4,35,53    | 2021.09.09 |
    | Sørild FIK                    | 5231        | 471   | 200     | Eivind Tobiassen                 | Grimstad               | 26,06      | 2021.10.25 |
    | Sørild FIK                    | 5232        | 461   | Høyde   | Jo Ølberg                        | Grimstad               | 1,60       | 2021.10.25 |
    | Sørild FIK                    | 5233        | 458   | 3000    | Dennis Bergstrøm-Bendixen        | Grimstad               | 10,11,03   | 2021.10.25 |
    | Sørild FIK                    | 5234        | 453   | 800     | Tobias Fretheim                  | Grimstad               | 2,15,47    | 2021.10.25 |
    | Sørild FIK                    | 5235        | 442   | 200     | Sander Rønning                   | Haugesund              | 26,44      | 2021.09.12 |
    | Sørild FIK                    | 5236        | 419   | Høyde   | Sander Rønning                   | Haugesund              | 1,56       | 2021.09.12 |
    | Sørild FIK                    | 5237        | 374   | 1500    | David Harkestad                  | Haugesund              | 4,55,70    | 2021.09.12 |
    | Sørild FIK                    | 5238        | 319   | 1500    | Sindre Halvorsen                 | Haugesund              | 5,06,42    | 2021.09.12 |
    | Sørild FIK                    | 5239        | 299   | 1500    | Fredrik Svendsen                 | Tvedestrand            | 5,10,40    | 2021.09.15 |
    | Sørild FIK                    | 5240        | 288   | 800     | Fredrik Svendsen                 | Kristiansand           | 2,30,83    | 2021.10.06 |
    | Sørild FIK                    | 5241        | 279   | 800     | David Harkestad                  | Grimstad               | 2,31,70    | 2021.10.25 |
    | Sørild FIK                    | 5242        | 245   | 100     | Anders Sølvberg                  | Tvedestrand            | 14,11      | 2021.09.15 |
    | Sørild FIK                    | 5243        | 221   | 800     | Sindre Halvorsen                 | Grimstad               | 2,38,02    | 2021.10.25 |
    | Sørild FIK                    | 5244        | 167   | Høyde   | Johan Gjesteland                 | Tvedestrand            | 1,35       | 2021.09.15 |
    | Sørild FIK                    | 5245        | 166   | 100     | Fredrik Svendsen                 | Tvedestrand            | 14,69      | 2021.09.15 |
    | Sørild FIK                    | 5246        | 144   | 100     | Aksel Berg                       | Grimstad               | 14,86      | 2021.10.25 |
    | Sørild FIK                    | 5247        | 133   | 800     | Johan Gjesteland                 | Kristiansand           | 2,48,09    | 2021.10.06 |
    | Sørild FIK                    | 5248        | 121   | 200     | Oliver Ruud-Olsen                | Grimstad               | 31,86      | 2021.10.25 |
    | Sørild FIK                    | 5249        | 111   | Høyde   | Noah Solberg                     | Haugesund              | 1,31       | 2021.09.12 |
    | Sørild FIK                    | 5250        | 111   | 100     | Oliver Ruud-Olsen                | Grimstad               | 15,13      | 2021.10.25 |
    | Sørild FIK                    | 5251        | 109   | 200     | David Askeland                   | Grimstad               | 32,10      | 2021.10.25 |
    | Sørild FIK                    | 5252        | 104   | 200     | Samuel Karlsen-Dahlstrøm         | Grimstad               | 32,20      | 2021.10.25 |
    | Sørild FIK                    | 5253        | 99    | 100     | Sindre Halvorsen                 | Grimstad               | 15,22      | 2021.10.25 |
    | Sørild FIK                    | 5254        | 99    | 100     | David Askeland                   | Grimstad               | 15,22      | 2021.10.25 |
    | Sørild FIK                    | 5255        | 35    | Høyde   | Jesper Krakstad                  | Haugesund              | 1,26       | 2021.09.12 |
    | Sørild FIK                    | 5256        | 20    | 100     | Noah Solberg                     | Tvedestrand            | 15,90      | 2021.09.15 |
    | Sørild FIK                    | 5257        | 19    | Høyde   | Oliver Ruud-Olsen                | Grimstad               | 1,25       | 2021.10.25 |
    | Sørild FIK                    | 5258        | 15    | 100     | Samuel Karlsen-Dahlstrøm         | Grimstad               | 15,94      | 2021.10.25 |
    | Sørum IL                      | 5259        | 294   | 200     | Marcus Eek                       | Nittedal               | 28,69      | 2021.10.30 |
    | Sørum IL                      | 5260        | 283   | 200     | Kristoffer Dahl                  | Nittedal               | 28,88      | 2021.10.30 |
    | Sørum IL                      | 5261        | 96    | 800     | Andreas Lade                     | Nittedal               | 2,52,60    | 2021.10.30 |
    | Sørum IL                      | 5262        | 79    | 200     | Andreas Lade                     | Jessheim               | 32,70      | 2021.09.09 |
    | T&IF Viking                   | 5263        | 787   | 5000    | Cedrik Christophersen            | Greveskogen            | 14,53,25   | 2021.10.30 |
    | T&IF Viking                   | 5264        | 748   | 800     | Vincent Gjerde                   | Fana                   | 1,57,02    | 2021.09.28 |
    | T&IF Viking                   | 5265        | 745   | 400     | Vincent Gjerde                   | Arna                   | 50,78      | 2021.10.13 |
    | T&IF Viking                   | 5266        | 664   | 200     | Andreas Langhelle                | Leikvang               | 23,83      | 2021.08.29 |
    | T&IF Viking                   | 5267        | 654   | 200     | Vincent Gjerde                   | Os                     | 23,93      | 2021.09.26 |
    | T&IF Viking                   | 5268        | 648   | 100     | Andreas Langhelle                | Lillehammer            | 11,82      | 2021.09.26 |
    | T&IF Viking                   | 5269        | 615   | Lengde  | Linus Rygh                       | Os                     | 6,04       | 2021.09.26 |
    | T&IF Viking                   | 5270        | 596   | 100     | Linus Rygh                       | Os                     | 12,07      | 2021.09.26 |
    | T&IF Viking                   | 5271        | 590   | 200     | Linus Rygh                       | Trondheim              | 24,61      | 2021.09.28 |
    | T&IF Viking                   | 5272        | 578   | 100     | Tristan Nøttveit                 | Leikvang               | 12,16      | 2021.08.29 |
    | T&IF Viking                   | 5273        | 572   | 200     | Tristan Nøttveit                 | Leikvang               | 24,82      | 2021.08.29 |
    | T&IF Viking                   | 5274        | 550   | 200h    | Andreas Langhelle                | Haugesund              | 28,89      | 2021.09.12 |
    | T&IF Viking                   | 5275        | 523   | 100     | Øyvind Johansen                  | Os                     | 12,44      | 2021.09.26 |
    | T&IF Viking                   | 5276        | 499   | 200     | Øyvind Johansen                  | Bergen                 | 25,69      | 2021.10.30 |
    | T&IF Viking                   | 5277        | 493   | 200     | Thomas Krohn-Hansen              | Leikvang               | 25,77      | 2021.08.29 |
    | T&IF Viking                   | 5278        | 474   | Tresteg | Thomas Krohn-Hansen              | Os                     | 11,24      | 2021.09.26 |
    | T&IF Viking                   | 5279        | 461   | 800     | Gunnar Gausvik                   | Fana                   | 2,14,80    | 2021.09.28 |
    | T&IF Viking                   | 5280        | 454   | 200h    | Thomas Krohn-Hansen              | Haugesund              | 30,79      | 2021.09.12 |
    | T&IF Viking                   | 5281        | 450   | 100     | Benjamin Flygansvær              | Lillehammer            | 12,83      | 2021.09.26 |
    | T&IF Viking                   | 5282        | 446   | 200     | Benjamin Flygansvær              | Haugesund              | 26,39      | 2021.09.12 |
    | T&IF Viking                   | 5283        | 428   | Tresteg | Andreas Langhelle                | Os                     | 10,84      | 2021.09.26 |
    | T&IF Viking                   | 5284        | 412   | 100     | Thomas Krohn-Hansen              | Leikvang               | 13,05      | 2021.08.29 |
    | T&IF Viking                   | 5285        | 412   | 100     | Eirik Angeltvedt                 | Leikvang               | 13,05      | 2021.08.29 |
    | T&IF Viking                   | 5286        | 400   | Lengde  | Andreas Langhelle                | Leikvang               | 5,12       | 2021.08.29 |
    | T&IF Viking                   | 5287        | 373   | 200h    | Benjamin Flygansvær              | Arna                   | 32,46      | 2021.10.13 |
    | T&IF Viking                   | 5288        | 369   | Lengde  | Vincent Gjerde                   | Fana                   | 4,99       | 2021.09.28 |
    | T&IF Viking                   | 5289        | 359   | Lut     | Thomas Krohn-Hansen              | Bergen/Hø              | 2,49       | 2021.10.08 |
    | T&IF Viking                   | 5290        | 356   | 3000    | Espen Ellefsen                   | Arna                   | 10,50,44   | 2021.10.13 |
    | T&IF Viking                   | 5291        | 356   | 200     | Jonathan Gröning                 | Leikvang               | 27,70      | 2021.08.29 |
    | T&IF Viking                   | 5292        | 351   | Lut     | Andreas Langhelle                | Bergen/Hø              | 2,48       | 2021.10.08 |
    | T&IF Viking                   | 5293        | 321   | 400     | Jonathan Gröning                 | Bergen                 | 1,03,3     | 2021.10.30 |
    | T&IF Viking                   | 5294        | 310   | Lengde  | Tristan Nøttveit                 | Leikvang               | 4,75       | 2021.08.29 |
    | T&IF Viking                   | 5295        | 302   | 200     | Jens-Kristian Eide               | Fana                   | 28,55      | 2021.09.28 |
    | T&IF Viking                   | 5296        | 291   | 100     | Jonathan Gröning                 | Arna                   | 13,80      | 2021.10.13 |
    | T&IF Viking                   | 5297        | 285   | Lengde  | Thomas Krohn-Hansen              | Bergen                 | 4,65       | 2021.10.30 |
    | T&IF Viking                   | 5298        | 278   | Lut     | Wolfgang Blom                    | Bergen/Hø              | 2,40       | 2021.10.08 |
    | T&IF Viking                   | 5299        | 274   | Tresteg | Benjamin Flygansvær              | Haugesund              | 9,53       | 2021.09.12 |
    | T&IF Viking                   | 5300        | 240   | Hut     | Tristan Nøttveit                 | Bergen/Hø              | 1,18       | 2021.10.08 |
    | T&IF Viking                   | 5301        | 190   | Lut     | Benjamin Flygansvær              | Bergen/Hø              | 2,31       | 2021.10.08 |
    | T&IF Viking                   | 5302        | 180   | Hut     | Thomas Krohn-Hansen              | Bergen/Hø              | 1,15       | 2021.10.08 |
    | T&IF Viking                   | 5303        | 179   | Lengde  | Benjamin Flygansvær              | Bergen                 | 4,23       | 2021.10.30 |
    | T&IF Viking                   | 5304        | 160   | Lut     | Tristan Nøttveit                 | Bergen/Hø              | 2,28       | 2021.10.08 |
    | T&IF Viking                   | 5305        | 151   | Lengde  | Jonathan Gröning                 | Fana                   | 4,12       | 2021.09.28 |
    | T&IF Viking                   | 5306        | 130   | Lut     | David Oppedal                    | Bergen/Hø              | 2,25       | 2021.10.08 |
    | T&IF Viking                   | 5307        | 80    | Hut     | Benjamin Flygansvær              | Bergen/Hø              | 1,10       | 2021.10.08 |
    | T&IF Viking                   | 5308        | 80    | Hut     | Hallvard Husa                    | Bergen/Hø              | 1,10       | 2021.10.08 |
    | T&IF Viking                   | 5309        | 80    | Hut     | Andreas Langhelle                | Bergen/Hø              | 1,10       | 2021.10.08 |
    | T&IF Viking                   | 5310        | 78    | 3000K   | Jan Rolstad                      | Os                     | 20,06,31   | 2021.09.26 |
    | T&IF Viking                   | 5311        | 52    | 200     | Henrik Solheimsnes               | Fana                   | 33,27      | 2021.09.28 |
    | T&IF Viking                   | 5312        | 45    | 5000K   | Jan Rolstad                      | Førde                  | 35,09,45   | 2021.08.22 |
    | Tambarskjelvar IL             | 5313        | 423   | 5000    | Odd Rognebakke                   | Førde                  | 18,09,29   | 2021.08.22 |
    | Tambarskjelvar IL             | 5314        | 386   | 1500    | Odd Rognebakke                   | Førde                  | 4,53,48    | 2021.08.22 |
    | Tingvoll Friidrettsklubb      | 5315        | 408   | Høyde   | Henrik Kvisvik                   | Molde                  | 1,55       | 2021.06.20 |
    | Tingvoll Friidrettsklubb      | 5316        | 395   | 100     | Per Kvisvik                      | Tingvoll               | 13,15      | 2021.09.18 |
    | Tingvoll Friidrettsklubb      | 5317        | 297   | 3000    | Andreas Sletbakk                 | Tingvoll               | 11,16,12   | 2021.09.18 |
    | Tingvoll Idrettslag           | 5318        | 308   | Tresteg | Elias Hildebrand                 | Måndalen               | 9,81       | 2021.09.12 |
    | Tingvoll Idrettslag           | 5319        | 184   | Lengde  | Elias Hildebrand                 | Måndalen               | 4,25       | 2021.09.12 |
    | Tingvoll Idrettslag           | 5320        | 19    | Høyde   | John Solem                       | Tingvoll               | 1,25       | 2021.09.18 |
    | Tingvoll Idrettslag           | 5321        | 19    | Høyde   | Ola Mosand                       | Tingvoll               | 1,25       | 2021.09.18 |
    | Tjøme løpeklubb               | 5322        | 515   | 3000    | Joakim Skadal                    | Trondheim              | 9,51,26    | 2021.09.28 |
    | Torvastad IL                  | 5323        | 157   | 200     | Christopher Sandvik              | Haugesund              | 31,15      | 2021.09.12 |
    | Torvikbukt IL                 | 5324        | 625   | 3000    | Linus Engdahl                    | Lillehammer            | 9,17,31    | 2021.09.26 |
    | Tromsø Friidrettsklubb        | 5325        | 594   | Hut     | Kjetil Theodorsen                | Hvam                   | 1,43       | 2021.10.23 |
    | Tromsø Løpeklubb              | 5326        | 782   | 5000    | Kristian Ulriksen                | Oslo/Bi                | 14,55,62   | 2021.09.25 |
    | Tromsø Løpeklubb              | 5327        | 599   | 3000    | Johan Kilskar                    | Tromsø                 | 9,24,64    | 2021.09.15 |
    | Tromsø Løpeklubb              | 5328        | 597   | 3000    | Elias Kjærstad                   | Tromsø                 | 9,25,33    | 2021.09.15 |
    | Tromsø Løpeklubb              | 5329        | 422   | 3000    | Peter Utnes                      | Tromsø                 | 10,24,59   | 2021.09.15 |
    | Tromsø Løpeklubb              | 5330        | 408   | 3000    | Iver Martinsen                   | Tromsø                 | 10,29,88   | 2021.09.15 |
    | Tromsø Løpeklubb              | 5331        | 406   | 5000    | Audun Kvitvær                    | Bodø                   | 18,20,83   | 2021.09.21 |
    | Tromsø Løpeklubb              | 5332        | 392   | 3000    | Audun Kvitvær                    | Bodø                   | 10,35,98   | 2021.09.21 |
    | Tromsø Løpeklubb              | 5333        | 239   | 3000    | Julian Haagensen                 | Tromsø                 | 11,44,25   | 2021.09.15 |
    | Trondheim & Omegn Sportsklubb | 5334        | 530   | 10000   | Einar Sulheim                    | Trondheim              | 35,58,03   | 2021.09.28 |
    | Trondheim Friidrett           | 5335        | 850   | 400     | Timo Helland                     | Lillestrøm             | 48,75      | 2021.08.29 |
    | Trondheim Friidrett           | 5336        | 829   | 100     | Christian Mensah                 | Trondheim              | 11,05      | 2021.09.28 |
    | Trondheim Friidrett           | 5337        | 806   | 200     | Christian Mensah                 | Trondheim              | 22,47      | 2021.09.28 |
    | Trondheim Friidrett           | 5338        | 734   | 100     | Marcus Barkhald-Langjord         | Trondheim              | 11,44      | 2021.09.28 |
    | Trondheim Friidrett           | 5339        | 411   | 200h    | Trygve Sellgren                  | Trondheim              | 31,67      | 2021.09.28 |
    | Trondheim Friidrett           | 5340        | 388   | 200     | Torjus Iversen                   | Trondheim              | 27,21      | 2021.09.28 |
    | Trondheim Friidrett           | 5341        | 315   | 200     | Trygve Sellgren                  | Trondheim              | 28,34      | 2021.09.28 |
    | Trondheim Friidrett           | 5342        | 306   | Høyde   | Trygve Sellgren                  | Måndalen               | 1,46       | 2021.09.12 |
    | Trondheim Triatlonklubb       | 5343        | 646   | 5000    | Eskil Høien                      | Trondheim              | 15,59,73   | 2021.09.28 |
    | Trondheim Triatlonklubb       | 5344        | 606   | 3000    | Eskil Høien                      | Trondheim              | 9,22,80    | 2021.09.28 |
    | Trondheim Triatlonklubb       | 5345        | 520   | 3000    | Kristian Holmgaard               | Trondheim              | 9,49,72    | 2021.09.28 |
    | Trondheim Triatlonklubb       | 5346        | 435   | 5000    | Kristian Holmgaard               | Trondheim              | 18,01,24   | 2021.09.28 |
    | Trondheim Triatlonklubb       | 5347        | 378   | 10000   | Kristian Holmgaard               | Trondheim              | 39,36,79   | 2021.09.28 |
    | Trysil IL                     | 5348        | 557   | 800     | Emil Bakke                       | Nittedal               | 2,07,64    | 2021.10.30 |
    | Trysil IL                     | 5349        | 521   | 3000    | Emil Bakke                       | Nadderud               | 9,49,47    | 2021.10.16 |
    | Trysilgutten                  | 5350        | 583   | 800     | Emil Bakke                       | Nittedal               | 2,05,96    | 2021.10.30 |
    | Trysilgutten                  | 5351        | 561   | 1500    | Emil Bakke                       | Oslo/Bi                | 4,24,73    | 2021.09.25 |
    | Trysilgutten                  | 5352        | 335   | Lengde  | Julian Paula                     | Elverum                | 4,85       | 2021.06.17 |
    | Turn & IL Hovding             | 5353        | 328   | 100     | Thor Søilen                      | Leikvang               | 13,56      | 2021.08.29 |
    | Tvedestrand Turn & IF         | 5354        | 583   | Lut     | Knut Bjorvatn                    | Hvam                   | 2,84       | 2021.10.23 |
    | Tvedestrand Turn & IF         | 5355        | 503   | Hut     | Knut Bjorvatn                    | Grimstad               | 1,35       | 2021.10.25 |
    | Tvedestrand Turn & IF         | 5356        | 377   | 200     | Brede Danielsen                  | Lyngdal                | 27,38      | 2021.09.26 |
    | Tvedestrand Turn & IF         | 5357        | 372   | 200h    | Brede Danielsen                  | Haugesund              | 32,47      | 2021.09.12 |
    | Tvedestrand Turn & IF         | 5358        | 368   | 5000    | Andreas Nodland                  | Tvedestrand            | 18,48,1    | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5359        | 344   | 100     | Brede Danielsen                  | Tvedestrand            | 13,46      | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5360        | 341   | 400     | Brede Danielsen                  | Tvedestrand            | 1,02,5     | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5361        | 340   | 200     | Hans Danielsen                   | Tvedestrand            | 27,7       | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5362        | 333   | 100     | Magnus Dyngvold                  | Tvedestrand            | 13,53      | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5363        | 331   | 3000    | Andreas Nodland                  | Tvedestrand            | 11,01,0    | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5364        | 300   | 1500    | Brede Danielsen                  | Tvedestrand            | 5,10,23    | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5365        | 277   | 100     | Hans Danielsen                   | Tvedestrand            | 13,89      | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5366        | 253   | 800     | Brede Danielsen                  | Lyngdal                | 2,34,47    | 2021.09.26 |
    | Tvedestrand Turn & IF         | 5367        | 205   | 200     | Magnus Dyngvold                  | Tvedestrand            | 30,0       | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5368        | 172   | 5000    | Rune Sundsdal                    | Tvedestrand            | 21,38,4    | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5369        | 165   | 400     | Magnus Dyngvold                  | Tvedestrand            | 1,10,2     | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5370        | 133   | 3000    | Rune Sundsdal                    | Tvedestrand            | 12,43,61   | 2021.09.15 |
    | Tvedestrand Turn & IF         | 5371        | 71    | 3000    | Thore Jørgensen                  | Tvedestrand            | 13,24,69   | 2021.09.15 |
    | Tverlandet IL                 | 5372        | 726   | 10000   | Thomas Jeremiassen               | Bodø                   | 32,13,09   | 2021.09.21 |
    | Tverlandet IL                 | 5373        | 670   | 5000    | Thomas Jeremiassen               | Bodø                   | 15,47,76   | 2021.09.21 |
    | Tverlandet IL                 | 5374        | 501   | 3000    | Theodor Botten                   | Trondheim              | 9,55,94    | 2021.09.28 |
    | Tverlandet IL                 | 5375        | 493   | 3000    | Vegard Veisetaune                | Bodø                   | 9,58,66    | 2021.09.21 |
    | Tverlandet IL                 | 5376        | 425   | 800     | Theodor Botten                   | Bodø                   | 2,17,80    | 2021.09.21 |
    | Tønsberg Friidrettsklubb      | 5377        | 1026  | Lengde  | Henrik Flåtnes                   | Karlsruhe/GER          | 7,98       | 2021.09.04 |
    | Tønsberg Friidrettsklubb      | 5378        | 921   | 200     | Henrik Flåtnes                   | Ravnanger              | 21,50      | 2021.09.15 |
    | Tønsberg Friidrettsklubb      | 5379        | 873   | 1500    | Oliver Vedvik                    | Oslo/Bi                | 3,49,25    | 2021.09.25 |
    | Tønsberg Friidrettsklubb      | 5380        | 832   | 1500    | Jonatan Vedvik                   | Oslo/Bi                | 3,53,00    | 2021.09.25 |
    | Tønsberg Friidrettsklubb      | 5381        | 831   | 100     | Sebastian Berntsen               | Ravnanger              | 11,04      | 2021.09.15 |
    | Tønsberg Friidrettsklubb      | 5382        | 812   | Lengde  | Sebastian Berntsen               | Ravnanger              | 6,93       | 2021.09.15 |
    | Tønsberg Friidrettsklubb      | 5383        | 790   | 200     | Sebastian Berntsen               | Jessheim               | 22,62      | 2021.09.09 |
    | Tønsberg Friidrettsklubb      | 5384        | 788   | 800     | Oliver Vedvik                    | Oslo/Bi                | 1,55,21    | 2021.09.25 |
    | Tønsberg Friidrettsklubb      | 5385        | 781   | 800     | Håvard Skovly                    | Jessheim               | 1,55,55    | 2021.09.09 |
    | Tønsberg Friidrettsklubb      | 5386        | 775   | 10000   | Jonatan Vedvik                   | Greveskogen            | 31,23,86   | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5387        | 772   | Høyde   | Henrik Flåtnes                   | Ravnanger              | 1,94       | 2021.09.15 |
    | Tønsberg Friidrettsklubb      | 5388        | 770   | 200     | Henrik Duncan                    | Greveskogen            | 22,80      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5389        | 766   | Lut     | Reidar Moss                      | Greveskogen            | 3,17       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5390        | 765   | 100     | Henrik Flåtnes                   | Greveskogen            | 11,31      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5391        | 746   | 100     | Henrik Duncan                    | Greveskogen            | 11,39      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5392        | 739   | Slegge  | Øystein Hytten                   | Greveskogen            | 49,01      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5393        | 716   | Lut     | Sondre Evensen                   | Greveskogen            | 3,08       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5394        | 706   | 400     | Håvard Skovly                    | Greveskogen            | 51,61      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5395        | 690   | Diskos  | Iver Hytten                      | Greveskogen            | 40,29      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5396        | 678   | Kule    | Iver Hytten                      | Greveskogen            | 13,17      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5397        | 650   | Lut     | Henrik Duncan                    | Greveskogen            | 2,96       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5398        | 633   | Lut     | Henrik Flåtnes                   | Greveskogen            | 2,93       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5399        | 618   | 1500    | Håvard Skovly                    | Greveskogen            | 4,16,83    | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5400        | 607   | Høyde   | August Høgvold                   | Rjukan                 | 1,75       | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5401        | 592   | 100     | Øystein Hytten                   | Greveskogen            | 12,09      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5402        | 592   | Spyd    | Iver Hytten                      | Greveskogen            | 47,49      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5403        | 550   | Lut     | Øystein Hytten                   | Greveskogen            | 2,78       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5404        | 549   | Tresteg | Oddvar Viulsrød                  | Førde                  | 11,90      | 2021.08.22 |
    | Tønsberg Friidrettsklubb      | 5405        | 540   | Lengde  | Oddvar Viulsrød                  | Greveskogen            | 5,71       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5406        | 532   | Lut     | Torsten Moss                     | Greveskogen            | 2,75       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5407        | 519   | 100     | Lucas Løn-Haakanes               | Greveskogen            | 12,46      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5408        | 515   | 200h    | August Høgvold                   | Rjukan                 | 29,59      | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5409        | 511   | Høyde   | Øystein Hytten                   | Greveskogen            | 1,65       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5410        | 511   | Høyde   | Tarjei Aunan                     | Greveskogen            | 1,65       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5411        | 492   | 200     | Lucas Løn-Haakanes               | Greveskogen            | 25,78      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5412        | 477   | Lengde  | August Høgvold                   | Rjukan                 | 5,44       | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5413        | 461   | Høyde   | Jacob Abusdal                    | Greveskogen            | 1,60       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5414        | 461   | Slegge  | Lars Greiff                      | Sandefjord             | 30,04      | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5415        | 455   | 200     | August Høgvold                   | Greveskogen            | 26,27      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5416        | 452   | Tresteg | August Høgvold                   | Greveskogen            | 11,04      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5417        | 440   | Hut     | Thomas Rønvik                    | Hvam                   | 1,30       | 2021.10.23 |
    | Tønsberg Friidrettsklubb      | 5418        | 433   | Lut     | Thomas Rønvik                    | Hvam                   | 2,59       | 2021.10.23 |
    | Tønsberg Friidrettsklubb      | 5419        | 429   | 100     | Tarjei Aunan                     | Greveskogen            | 12,95      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5420        | 426   | Lut     | Sebastian Berntsen               | Greveskogen            | 2,58       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5421        | 419   | Høyde   | Ulf Tudem                        | Førde                  | 1,56       | 2021.08.22 |
    | Tønsberg Friidrettsklubb      | 5422        | 415   | 400     | August Høgvold                   | Greveskogen            | 59,83      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5423        | 414   | 200     | Jacob Abusdal                    | Nadderud               | 26,84      | 2021.10.16 |
    | Tønsberg Friidrettsklubb      | 5424        | 413   | 200     | Oddvar Viulsrød                  | Knarvik                | 26,85      | 2021.09.23 |
    | Tønsberg Friidrettsklubb      | 5425        | 401   | 100     | Oddvar Viulsrød                  | Greveskogen            | 13,11      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5426        | 398   | 100     | August Høgvold                   | Greveskogen            | 13,13      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5427        | 395   | Diskos  | Lars Greiff                      | Sandefjord             | 26,64      | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5428        | 388   | 100     | Jacob Abusdal                    | Greveskogen            | 13,19      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5429        | 385   | Kule    | Lars Greiff                      | Sandefjord             | 9,16       | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5430        | 383   | Tresteg | Jacob Abusdal                    | Nadderud               | 10,45      | 2021.10.16 |
    | Tønsberg Friidrettsklubb      | 5431        | 381   | Lengde  | Lucas Løn-Haakanes               | Greveskogen            | 5,04       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5432        | 370   | 1500    | Svale Vedvik                     | Oslo/Bi                | 4,56,44    | 2021.09.25 |
    | Tønsberg Friidrettsklubb      | 5433        | 364   | Høyde   | Morten Hestnes                   | Rjukan                 | 1,51       | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5434        | 353   | 100     | Even Hytten                      | Greveskogen            | 13,40      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5435        | 352   | Lengde  | Jacob Abusdal                    | Greveskogen            | 4,92       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5436        | 348   | 1500    | Jacob Abusdal                    | Nadderud               | 5,00,66    | 2021.10.16 |
    | Tønsberg Friidrettsklubb      | 5437        | 346   | Stav    | Morten Hestnes                   | Jessheim               | 2,45       | 2021.09.09 |
    | Tønsberg Friidrettsklubb      | 5438        | 333   | 200h    | Morten Hestnes                   | Rjukan                 | 33,30      | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5439        | 331   | 800     | Jacob Abusdal                    | Greveskogen            | 2,26,48    | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5440        | 327   | Lengde  | Even Hytten                      | Greveskogen            | 4,82       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5441        | 217   | Lengde  | Morten Hestnes                   | Larvik                 | 4,38       | 2021.09.15 |
    | Tønsberg Friidrettsklubb      | 5442        | 171   | 1500    | Pål Skyvang                      | Greveskogen            | 5,39,53    | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5443        | 161   | Stav    | René Myhre                       | Greveskogen            | 1,91       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5444        | 140   | Lut     | August Høgvold                   | Greveskogen            | 2,26       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5445        | 136   | Tresteg | Morten Hestnes                   | Rjukan                 | 8,41       | 2021.09.12 |
    | Tønsberg Friidrettsklubb      | 5446        | 112   | 400     | Morten Hestnes                   | Greveskogen            | 1,12,86    | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5447        | 106   | 200     | Morten Hestnes                   | Greveskogen            | 32,15      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5448        | 101   | 100     | Pål Skyvang                      | Greveskogen            | 15,21      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5449        | 96    | Høyde   | Lucas Løn-Haakanes               | Greveskogen            | 1,30       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5450        | 96    | 1500    | Oddvar Viulsrød                  | Knarvik                | 5,59,31    | 2021.09.23 |
    | Tønsberg Friidrettsklubb      | 5451        | 89    | 100     | Morten Hestnes                   | Greveskogen            | 15,31      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5452        | 62    | 800     | Hamza Elmrani                    | Greveskogen            | 2,56,74    | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5453        | 57    | 1500    | Even Hytten                      | Greveskogen            | 6,10,69    | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5454        | 45    | 200     | Fred Rosvoll                     | Greveskogen            | 33,41      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5455        | 29    | 100     | Hamza Elmrani                    | Greveskogen            | 15,82      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5456        | 25    | Stav    | Andreas Line                     | Greveskogen            | 1,60       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5457        | 19    | Høyde   | René Myhre                       | Greveskogen            | 1,25       | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5458        | 14    | 200     | Hamza Elmrani                    | Greveskogen            | 34,09      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5459        | 11    | 200     | Andreas Line                     | Greveskogen            | 34,16      | 2021.10.30 |
    | Tønsberg Friidrettsklubb      | 5460        | 1     | 1500    | Øystein Hytten                   | Greveskogen            | 6,28,25    | 2021.10.30 |
    | Ullensaker/Kisa IL            | 5461        | 1063  | 800     | Andreas Kramer                   | Stockholm/SWE          | 1,45,05    | 2021.07.04 |
    | Ullensaker/Kisa IL            | 5462        | 1002  | 3000H   | Jacob Boutera                    | Nice/FRA               | 8,26,60    | 2021.06.12 |
    | Ullensaker/Kisa IL            | 5463        | 999   | 5000    | Per Svela                        | Heusden-Zolder/BEL     | 13,32,97   | 2021.07.03 |
    | Ullensaker/Kisa IL            | 5464        | 991   | 3000    | Sigurd Skjeseth                  | Jessheim               | 7,52,72    | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5465        | 985   | 1500    | Fredrik Sandvik                  | Oslo/Bi                | 3,40,03    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5466        | 984   | 3000    | Per Svela                        | Naimette-Xhovémont/BEL | 7,54,08    | 2021.06.30 |
    | Ullensaker/Kisa IL            | 5467        | 979   | 3000    | Fredrik Sandvik                  | Jessheim               | 7,55,19    | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5468        | 974   | 5000    | Sigurd Skjeseth                  | Greveskogen            | 13,41,47   | 2021.10.30 |
    | Ullensaker/Kisa IL            | 5469        | 971   | 10000   | Sigurd Skjeseth                  | Kristiansand           | 28,36,06   | 2021.10.06 |
    | Ullensaker/Kisa IL            | 5470        | 960   | 5000    | Erik Pedersen                    | Oslo/Bi                | 13,46,07   | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5471        | 928   | 5000    | Awet Kibrab                      | Oslo/Bi                | 13,57,07   | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5472        | 917   | 3000H   | Fredrik Sandvik                  | Oslo/Bi                | 8,46,71    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5473        | 902   | 3000    | Senay Fissehatsion               | Jessheim               | 8,10,96    | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5474        | 902   | 1500    | Per Svela                        | Oslo/Bi                | 3,46,66    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5475        | 901   | 10000   | Erik Pedersen                    | Kristiansand           | 29,30,12   | 2021.10.06 |
    | Ullensaker/Kisa IL            | 5476        | 899   | 1500    | Sigurd Skjeseth                  | Oslo/Bi                | 3,46,92    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5477        | 888   | 5000    | Senay Fissehatsion               | Oslo/Bi                | 14,12,09   | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5478        | 869   | 10000   | Senay Fissehatsion               | Kristiansand           | 29,57,27   | 2021.10.06 |
    | Ullensaker/Kisa IL            | 5479        | 848   | 1500    | Senay Fissehatsion               | Oslo/Bi                | 3,51,44    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5480        | 798   | 800     | Senay Fissehatsion               | Oslo/Bi                | 1,54,77    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5481        | 769   | 200     | Emil Nordal                      | Lillehammer            | 22,81      | 2021.09.26 |
    | Ullensaker/Kisa IL            | 5482        | 769   | 3000    | Henrik Hanssen                   | Oslo/Bi                | 8,40,14    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5483        | 767   | 800     | Abdirahim Dahir                  | Lillestrøm             | 1,56,17    | 2021.08.29 |
    | Ullensaker/Kisa IL            | 5484        | 755   | 10000   | Mathias Sæten                    | Oslo/Bi                | 31,43,05   | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5485        | 753   | 800     | Henrik Hanssen                   | Lillestrøm             | 1,56,79    | 2021.08.29 |
    | Ullensaker/Kisa IL            | 5486        | 738   | 1500    | Henrik Hanssen                   | Lillehammer            | 4,02,38    | 2021.09.26 |
    | Ullensaker/Kisa IL            | 5487        | 731   | 400     | Emil Nordal                      | Lillehammer            | 51,07      | 2021.09.26 |
    | Ullensaker/Kisa IL            | 5488        | 711   | 100     | Emil Nordal                      | Oslo/Bi                | 11,54      | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5489        | 702   | 1500    | Abdirahim Dahir                  | Oslo/Bi                | 4,06,39    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5490        | 677   | 800     | Nani Kula                        | Nittedal               | 2,00,52    | 2021.10.30 |
    | Ullensaker/Kisa IL            | 5491        | 668   | 800     | Erlend Homble                    | Trondheim              | 2,01,00    | 2021.09.28 |
    | Ullensaker/Kisa IL            | 5492        | 648   | 1500    | Erlend Homble                    | Oslo/Bi                | 4,12,87    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5493        | 634   | 100     | Martin Brustad                   | Jessheim               | 11,89      | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5494        | 628   | 800     | Jonas Krossøy                    | Jessheim               | 2,03,22    | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5495        | 626   | 800     | Andreas Kværner                  | Oslo/St                | 2,03,37    | 2021.10.16 |
    | Ullensaker/Kisa IL            | 5496        | 616   | 400     | Abdirahim Dahir                  | Jessheim               | 53,69      | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5497        | 582   | 800     | Sondre Øines                     | Nittedal               | 2,06,01    | 2021.10.30 |
    | Ullensaker/Kisa IL            | 5498        | 581   | 3000    | Erlend Homble                    | Brandbu                | 9,30,38    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5499        | 574   | 800     | Ole-Kristian Kværner             | Lillestrøm             | 2,06,53    | 2021.08.29 |
    | Ullensaker/Kisa IL            | 5500        | 560   | 200     | Martin Brustad                   | Jessheim               | 24,95      | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5501        | 548   | 800     | Henrik Toverød                   | Lillestrøm             | 2,08,24    | 2021.08.29 |
    | Ullensaker/Kisa IL            | 5502        | 533   | 1500    | Ole-Kristian Kværner             | Oslo/Bi                | 4,28,92    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5503        | 528   | 3000    | Ole-Kristian Kværner             | Jessheim               | 9,47,19    | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5504        | 524   | 400     | Sondre Øines                     | Oslo/Bi                | 56,24      | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5505        | 511   | 1500    | Gaute Fosstveit                  | Oslo/Bi                | 4,32,16    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5506        | 488   | 200     | Christian Iversen                | Jessheim               | 25,83      | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5507        | 474   | 1500    | Nani Kula                        | Jessheim               | 4,38,13    | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5508        | 463   | 100     | Christian Iversen                | Jessheim               | 12,76      | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5509        | 450   | 100     | Johan Kristoffersen              | Arvika/SWE             | 12,83      | 2021.07.24 |
    | Ullensaker/Kisa IL            | 5510        | 438   | 200     | Johan Kristoffersen              | Lillehammer            | 26,50      | 2021.09.26 |
    | Ullensaker/Kisa IL            | 5511        | 411   | Tresteg | Stein Klungland                  | Førde                  | 10,69      | 2021.08.22 |
    | Ullensaker/Kisa IL            | 5512        | 408   | Høyde   | Emil Nordal                      | Oslo/St                | 1,55       | 2021.10.16 |
    | Ullensaker/Kisa IL            | 5513        | 393   | Lengde  | Stein Klungland                  | Førde                  | 5,09       | 2021.08.22 |
    | Ullensaker/Kisa IL            | 5514        | 384   | 800     | Iver Faksvåg                     | Jessheim               | 2,21,49    | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5515        | 379   | 1500    | Iver Faksevåg                    | Oslo/Bi                | 4,54,70    | 2021.09.25 |
    | Ullensaker/Kisa IL            | 5516        | 375   | Lut     | Emil Nordal                      | Jessheim               | 2,51       | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5517        | 353   | 200     | Iver Faksvåg                     | Nadderud               | 27,74      | 2021.10.16 |
    | Ullensaker/Kisa IL            | 5518        | 342   | Lut     | Johan Kristoffersen              | Jessheim               | 2,47       | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5519        | 332   | Lengde  | Johan Kristoffersen              | Lillehammer            | 4,84       | 2021.09.26 |
    | Ullensaker/Kisa IL            | 5520        | 306   | Høyde   | Even Ragnhildsløkken             | Rjukan                 | 1,46       | 2021.09.12 |
    | Ullensaker/Kisa IL            | 5521        | 303   | 200     | Simon Smistad                    | Jessheim               | 28,54      | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5522        | 301   | Spyd    | Emil Nordal                      | Oslo/St                | 28,28      | 2021.10.16 |
    | Ullensaker/Kisa IL            | 5523        | 293   | 400     | Johan Kristoffersen              | Lillehammer            | 1,04,62    | 2021.09.26 |
    | Ullensaker/Kisa IL            | 5524        | 261   | 1500    | Marius Myran                     | Rjukan                 | 5,18,64    | 2021.09.12 |
    | Ullensaker/Kisa IL            | 5525        | 258   | Kule    | Johan Kristoffersen              | Kongsvinger            | 7,58       | 2021.09.08 |
    | Ullensaker/Kisa IL            | 5526        | 210   | 100     | Iver Faksvåg                     | Jessheim               | 14,36      | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5527        | 170   | Lut     | Eirik Løvgaard                   | Hvam                   | 2,29       | 2021.10.23 |
    | Ullensaker/Kisa IL            | 5528        | 167   | Høyde   | Iver Faksvåg                     | Drøbak                 | 1,35       | 2021.06.19 |
    | Ullensaker/Kisa IL            | 5529        | 145   | Diskos  | Johan Kristoffersen              | Kongsvinger            | 17,64      | 2021.09.08 |
    | Ullensaker/Kisa IL            | 5530        | 93    | 200     | Lars Smistad                     | Jessheim               | 32,42      | 2021.09.09 |
    | Ullensaker/Kisa IL            | 5531        | 25    | Stav    | John Johansen                    | Førde                  | 1,60       | 2021.08.22 |
    | Ulvik IL                      | 5532        | 594   | 5000    | Torjus Børsheim                  | Lillehammer            | 16,26,66   | 2021.09.26 |
    | Undheim Idrettslag            | 5533        | 562   | 3000    | Svein Risa                       | Ålgård                 | 9,36,25    | 2021.09.20 |
    | Undheim Idrettslag            | 5534        | 461   | 1500    | Svein Risa                       | Egersund               | 4,40,21    | 2021.09.25 |
    | Undheim Idrettslag            | 5535        | 325   | 1500    | Bjørnar Taksdal                  | Sandnes                | 5,05,22    | 2021.10.28 |
    | Undheim Idrettslag            | 5536        | 310   | 200     | André Friestad                   | Ålgård                 | 28,42      | 2021.09.20 |
    | Undheim Idrettslag            | 5537        | 290   | Lengde  | Theodor Liverud                  | Frakkagjerd            | 4,67       | 2021.08.22 |
    | Undheim Idrettslag            | 5538        | 236   | 200     | Bjørnar Taksdal                  | Frakkagjerd            | 29,68      | 2021.08.22 |
    | Undheim Idrettslag            | 5539        | 233   | Høyde   | Theodor Liverud                  | Stavanger              | 1,40       | 2021.10.27 |
    | Undheim Idrettslag            | 5540        | 211   | 200     | Mons Oftedal                     | Stavanger              | 30,13      | 2021.10.27 |
    | Undheim Idrettslag            | 5541        | 181   | 100     | Mons Oftedal                     | Frøyland               | 14,58      | 2021.09.07 |
    | Undheim Idrettslag            | 5542        | 179   | 1500    | Even Liverud                     | Egersund               | 5,37,55    | 2021.09.25 |
    | Undheim Idrettslag            | 5543        | 171   | 1500    | Erik Mæle-Kommedal               | Egersund               | 5,39,71    | 2021.09.25 |
    | Undheim Idrettslag            | 5544        | 105   | 200     | Erik Mæle-Kommedal               | Haugesund              | 32,17      | 2021.09.12 |
    | Urædd Friidrett               | 5545        | 740   | Stav    | Odin Kjendalen                   | Trondheim              | 4,10       | 2021.09.28 |
    | Urædd Friidrett               | 5546        | 702   | Stav    | Adrian Kojen                     | Porsgrunn              | 3,91       | 2021.09.25 |
    | Urædd Friidrett               | 5547        | 560   | Høyde   | Even Sommersel                   | Porsgrunn              | 1,70       | 2021.09.25 |
    | Urædd Friidrett               | 5548        | 523   | Stav    | Odin Palmgren                    | Trondheim              | 3,10       | 2021.09.28 |
    | Urædd Friidrett               | 5549        | 521   | Høyde   | Odin Palmgren                    | Porsgrunn              | 1,66       | 2021.09.25 |
    | Urædd Friidrett               | 5550        | 490   | Tresteg | Odin Palmgren                    | Skien                  | 11,38      | 2021.08.11 |
    | Urædd Friidrett               | 5551        | 458   | Lengde  | Odin Palmgren                    | Rjukan                 | 5,36       | 2021.09.12 |
    | Urædd Friidrett               | 5552        | 456   | 100     | Odin Kjendalen                   | Porsgrunn              | 12,80      | 2021.09.25 |
    | Urædd Friidrett               | 5553        | 426   | 100     | Odin Palmgren                    | Notodden               | 12,97      | 2021.10.06 |
    | Urædd Friidrett               | 5554        | 422   | 200     | Even Sommersel                   | Porsgrunn              | 26,73      | 2021.09.25 |
    | Urædd Friidrett               | 5555        | 365   | 100     | Even Sommersel                   | Porsgrunn              | 13,33      | 2021.09.25 |
    | Urædd Friidrett               | 5556        | 256   | 200     | Albert Lomme                     | Porsgrunn              | 29,34      | 2021.09.25 |
    | Urædd Friidrett               | 5557        | 137   | 200     | Jonathan Waldenstrøm-Moen        | Porsgrunn              | 31,53      | 2021.09.25 |
    | Urædd Friidrett               | 5558        | 96    | Høyde   | Arvin Rugset                     | Notodden               | 1,30       | 2021.10.06 |
    | Urædd Friidrett               | 5559        | 77    | Stav    | Noah Waldenstrøm-Moen            | Porsgrunn              | 1,71       | 2021.09.25 |
    | Urædd Friidrett               | 5560        | 28    | 200     | Noah Waldenstrøm-Moen            | Porsgrunn              | 33,80      | 2021.09.25 |
    | Utleira IL Friidrett          | 5561        | 530   | Lengde  | Aksel Wormdahl                   | Trondheim              | 5,67       | 2021.09.28 |
    | Utleira IL Friidrett          | 5562        | 522   | 200     | Christian Johansen               | Trondheim              | 25,40      | 2021.09.28 |
    | Utleira IL Friidrett          | 5563        | 473   | 3000    | Bernt Rognes                     | Trondheim              | 10,05,84   | 2021.09.28 |
    | Utleira IL Friidrett          | 5564        | 441   | 100     | Jonas Husby                      | Trondheim              | 12,88      | 2021.09.28 |
    | Utleira IL Friidrett          | 5565        | 388   | 200     | Trygve Bjarkøy                   | Trondheim              | 27,22      | 2021.09.28 |
    | Utleira IL Friidrett          | 5566        | 376   | Lengde  | Jonas Husby                      | Trondheim              | 5,02       | 2021.09.28 |
    | Utleira IL Friidrett          | 5567        | 375   | 100     | Trygve Bjarkøy                   | Trondheim              | 13,27      | 2021.09.28 |
    | Utleira IL Friidrett          | 5568        | 345   | Lengde  | Trygve Bjarkøy                   | Trondheim              | 4,89       | 2021.09.28 |
    | Utleira IL Friidrett          | 5569        | 315   | Tresteg | Trygve Bjarkøy                   | Måndalen               | 9,87       | 2021.09.12 |
    | Utleira IL Friidrett          | 5570        | 283   | 200h    | Trygve Bjarkøy                   | Måndalen               | 34,36      | 2021.09.12 |
    | Utleira IL Friidrett          | 5571        | 58    | 200     | Aleksander Lunda                 | Trondheim              | 33,15      | 2021.09.28 |
    | Vadsø Turnforening            | 5572        | 436   | 100     | Simon Nilsen                     | Tromsø                 | 12,91      | 2021.09.15 |
    | Vadsø Turnforening            | 5573        | 421   | 200     | Simon Nilsen                     | Tromsø                 | 26,74      | 2021.09.15 |
    | Vadsø Turnforening            | 5574        | 320   | Lengde  | Simon Nilsen                     | Tromsø                 | 4,79       | 2021.09.15 |
    | Vadsø Turnforening            | 5575        | 225   | 1500    | Said Rashid                      | Alta                   | 5,26,75    | 2021.08.22 |
    | Vadsø Turnforening            | 5576        | 223   | 800     | Said Rashid                      | Alta                   | 2,37,73    | 2021.08.22 |
    | Vadsø Turnforening            | 5577        | 202   | 200     | Said Rashid                      | Alta                   | 30,30      | 2021.08.22 |
    | Vadsø Turnforening            | 5578        | 154   | 200     | Oliver Norseng                   | Måndalen               | 31,20      | 2021.09.12 |
    | Vadsø Turnforening            | 5579        | 116   | 100     | Said Rashid                      | Alta                   | 15,09      | 2021.08.22 |
    | Vadsø Turnforening            | 5580        | 12    | Lengde  | Said Rashid                      | Alta                   | 3,60       | 2021.08.22 |
    | Valnesfjord IL                | 5581        | 330   | 1500    | Tobias Hagenes                   | Bodø                   | 5,04,27    | 2021.09.21 |
    | Valnesfjord IL                | 5582        | 254   | 1500    | Magnus Djupvik                   | Måndalen               | 5,20,03    | 2021.09.12 |
    | Valnesfjord IL                | 5583        | 239   | 800     | Tobias Hagenes                   | Bodø                   | 2,35,97    | 2021.09.21 |
    | Valnesfjord IL                | 5584        | 233   | 200     | Magnus Djupvik                   | Måndalen               | 29,74      | 2021.09.12 |
    | Valnesfjord IL                | 5585        | 208   | 200     | Tobias Hagenes                   | Bodø                   | 30,19      | 2021.09.21 |
    | Varegg IL                     | 5586        | 838   | 10000   | Halfdan-Emil Færø                | Kristiansand           | 30,24,09   | 2021.10.06 |
    | Varegg IL                     | 5587        | 789   | 5000    | Børge Christensen                | Kristiansand           | 14,52,35   | 2021.10.06 |
    | Varegg IL                     | 5588        | 768   | 5000    | Fredrik Torgersen                | Arna                   | 15,01,79   | 2021.10.13 |
    | Varegg IL                     | 5589        | 767   | 3000    | Børge Christensen                | Jessheim               | 8,40,50    | 2021.09.09 |
    | Varegg IL                     | 5590        | 765   | 1500    | Fredrik Torgersen                | Arna                   | 3,59,54    | 2021.10.13 |
    | Varegg IL                     | 5591        | 763   | 3000    | Fredrik Torgersen                | Fana                   | 8,41,49    | 2021.09.28 |
    | Varegg IL                     | 5592        | 761   | 5000    | Jonas Gjesdal                    | Arna                   | 15,04,77   | 2021.10.13 |
    | Varegg IL                     | 5593        | 760   | 10000   | Børge Christensen                | Kristiansand           | 31,38,35   | 2021.10.06 |
    | Varegg IL                     | 5594        | 754   | 3000    | Jonas Gjesdal                    | Arna                   | 8,43,60    | 2021.10.13 |
    | Varegg IL                     | 5595        | 742   | 1500    | Tom Skjæråsen                    | Lillehammer            | 4,01,95    | 2021.09.26 |
    | Varegg IL                     | 5596        | 730   | 3000    | Tom Skjæråsen                    | Fana                   | 8,49,54    | 2021.09.28 |
    | Varegg IL                     | 5597        | 722   | 3000    | Anders Sommer                    | Fana                   | 8,51,55    | 2021.09.28 |
    | Varegg IL                     | 5598        | 719   | 5000    | Halfdan-Emil Færø                | Ostereidet             | 15,24,1    | 2021.09.26 |
    | Varegg IL                     | 5599        | 718   | 5000    | Tom Skjæråsen                    | Oslo/Bi                | 15,24,78   | 2021.09.25 |
    | Varegg IL                     | 5600        | 714   | 10000   | Bjørn Lundberg                   | Fana                   | 32,25,22   | 2021.09.28 |
    | Varegg IL                     | 5601        | 703   | 1500    | Børge Christensen                | Jessheim               | 4,06,20    | 2021.09.09 |
    | Varegg IL                     | 5602        | 678   | 1500    | Jonas Gjesdal                    | Jessheim               | 4,09,24    | 2021.09.09 |
    | Varegg IL                     | 5603        | 675   | 10000   | Tom Skjæråsen                    | Oslo/Bi                | 33,06,71   | 2021.09.25 |
    | Varegg IL                     | 5604        | 669   | 5000    | Bjørn Lundberg                   | Arna                   | 15,48,25   | 2021.10.13 |
    | Varegg IL                     | 5605        | 656   | 5000    | Aleksander Lie                   | Arna                   | 15,54,68   | 2021.10.13 |
    | Varegg IL                     | 5606        | 635   | 10000   | Aleksander Lie                   | Fana                   | 33,50,62   | 2021.09.28 |
    | Varegg IL                     | 5607        | 632   | 3000    | Bjørn Lundberg                   | Arna                   | 9,15,47    | 2021.10.13 |
    | Varegg IL                     | 5608        | 603   | 1500    | Anders Mjåtveit                  | Arna                   | 4,18,75    | 2021.10.13 |
    | Varegg IL                     | 5609        | 601   | 5000    | Tor Askeland                     | Arna                   | 16,23,15   | 2021.10.13 |
    | Varegg IL                     | 5610        | 585   | 5000    | Daniel Instanes                  | Arna                   | 16,31,93   | 2021.10.13 |
    | Varegg IL                     | 5611        | 560   | 3000    | Magnus Kallager                  | Fana                   | 9,36,90    | 2021.09.28 |
    | Varegg IL                     | 5612        | 557   | 3000    | Tor Askeland                     | Arna                   | 9,37,73    | 2021.10.13 |
    | Varegg IL                     | 5613        | 515   | 1500    | Tor Askeland                     | Arna                   | 4,31,54    | 2021.10.13 |
    | Varegg IL                     | 5614        | 505   | 1500    | Magnus Kallager                  | Arna                   | 4,33,12    | 2021.10.13 |
    | Varegg IL                     | 5615        | 474   | 200     | Trym Birkeland                   | Nadderud               | 26,02      | 2021.10.16 |
    | Varegg IL                     | 5616        | 473   | 5000    | Simon Morales                    | Arna                   | 17,36,88   | 2021.10.13 |
    | Varegg IL                     | 5617        | 460   | 1500    | Ørjan Nilsen                     | Arna                   | 4,40,42    | 2021.10.13 |
    | Varegg IL                     | 5618        | 452   | 3000    | Trygve Andresen                  | Arna                   | 10,13,35   | 2021.10.13 |
    | Varegg IL                     | 5619        | 419   | 1500    | Roger Eide                       | Arna                   | 4,47,56    | 2021.10.13 |
    | Varegg IL                     | 5620        | 409   | 800     | Roger Eide                       | Arna                   | 2,19,19    | 2021.10.13 |
    | Varegg IL                     | 5621        | 388   | 3000    | Magne Aunebakk                   | Arna                   | 10,37,42   | 2021.10.13 |
    | Varegg IL                     | 5622        | 355   | 1500    | Simon Morales                    | Arna                   | 4,59,28    | 2021.10.13 |
    | Varegg IL                     | 5623        | 347   | 1500    | Trym Birkeland                   | Fana                   | 5,00,74    | 2021.09.28 |
    | Varegg IL                     | 5624        | 346   | 3000    | Simon Morales                    | Arna                   | 10,54,51   | 2021.10.13 |
    | Varegg IL                     | 5625        | 267   | 800     | Bård Bringedal                   | Arna                   | 2,33,03    | 2021.10.13 |
    | Varegg IL                     | 5626        | 262   | 1500    | Geir Lindberg                    | Arna                   | 5,18,34    | 2021.10.13 |
    | Varegg IL                     | 5627        | 223   | 3000    | Geir Lindberg                    | Arna                   | 11,52,50   | 2021.10.13 |
    | Varegg IL                     | 5628        | 175   | 200     | Ludvig Linde                     | Arna                   | 30,80      | 2021.10.13 |
    | Varegg IL                     | 5629        | 90    | 200     | Mikkel Ueland                    | Bergen                 | 32,48      | 2021.10.30 |
    | Varegg IL                     | 5630        | 36    | 200     | Sigurd Omenås                    | Bergen                 | 33,62      | 2021.10.30 |
    | Vegårshei IL                  | 5631        | 609   | 5000    | Espen Frorud                     | Tvedestrand            | 16,18,7    | 2021.09.15 |
    | Vegårshei IL                  | 5632        | 576   | 5000    | Knut Vangstad                    | Tvedestrand            | 16,36,4    | 2021.09.15 |
    | Vegårshei IL                  | 5633        | 574   | 5000    | Daniel Straum                    | Tvedestrand            | 16,37,7    | 2021.09.15 |
    | Vegårshei IL                  | 5634        | 556   | 5000    | Per Voie                         | Tvedestrand            | 16,47,9    | 2021.09.15 |
    | Vegårshei IL                  | 5635        | 548   | 3000    | Per Voie                         | Tvedestrand            | 9,40,5     | 2021.09.15 |
    | Vegårshei IL                  | 5636        | 546   | 3000    | Espen Frorud                     | Tvedestrand            | 9,41,1     | 2021.09.15 |
    | Vegårshei IL                  | 5637        | 535   | 3000    | Knut Vangstad                    | Tvedestrand            | 9,44,7     | 2021.09.15 |
    | Vegårshei IL                  | 5638        | 533   | 3000    | Daniel Straum                    | Tvedestrand            | 9,45,4     | 2021.09.15 |
    | Vegårshei IL                  | 5639        | 480   | 3000    | Tor Myhre                        | Tvedestrand            | 10,03,29   | 2021.09.15 |
    | Vegårshei IL                  | 5640        | 417   | 3000    | Vemund Myhre                     | Tvedestrand            | 10,26,19   | 2021.09.15 |
    | Vegårshei IL                  | 5641        | 385   | 5000    | Einar Skogby                     | Tvedestrand            | 18,35,9    | 2021.09.15 |
    | Vegårshei IL                  | 5642        | 232   | 5000    | Lars Christiansen                | Tvedestrand            | 20,38,9    | 2021.09.15 |
    | Veldre Friidrett              | 5643        | 712   | 10000   | Hans Sørum                       | Oslo/Bi                | 32,26,94   | 2021.09.25 |
    | Veldre Friidrett              | 5644        | 669   | 10000   | Ole Flatebø                      | Oslo/Bi                | 33,12,76   | 2021.09.25 |
    | Verdal Friidrettsklubb        | 5645        | 726   | 1500    | Sigurd Valseth                   | Oslo/Bi                | 4,03,70    | 2021.09.25 |
    | Verdal Friidrettsklubb        | 5646        | 669   | 800     | Sigurd Valseth                   | Trondheim              | 2,00,95    | 2021.09.28 |
    | Verdal Friidrettsklubb        | 5647        | 661   | 5000    | Sigurd Valseth                   | Trondheim              | 15,52,14   | 2021.09.28 |
    | Verdal Friidrettsklubb        | 5648        | 634   | 800     | Olav Dybdal-Holthe               | Stadsbygd              | 2,02,9     | 2021.05.09 |
    | Verdal Friidrettsklubb        | 5649        | 632   | 3000    | Sigurd Valseth                   | Trondheim              | 9,15,42    | 2021.09.28 |
    | Verdal Friidrettsklubb        | 5650        | 586   | 400     | Olav Dybdal-Holthe               | Steinkjer              | 54,48      | 2021.09.30 |
    | Verdal Friidrettsklubb        | 5651        | 543   | 10000   | Espen Valseth                    | Trondheim              | 35,41,04   | 2021.09.28 |
    | Verdal Friidrettsklubb        | 5652        | 494   | 400     | Jesper Rotmo                     | Steinkjer              | 57,13      | 2021.09.30 |
    | Verdal Friidrettsklubb        | 5653        | 476   | 100     | Olav Dybdal-Holthe               | Steinkjer              | 12,69      | 2021.09.30 |
    | Verdal Friidrettsklubb        | 5654        | 448   | 100     | Jesper Rotmo                     | Stjørdal               | 12,6       | 2021.10.23 |
    | Verdal Friidrettsklubb        | 5655        | 400   | 800     | Jesper Rotmo                     | Levanger               | 2,19,98    | 2021.06.13 |
    | Verdal Friidrettsklubb        | 5656        | 334   | 1500    | Jesper Rotmo                     | Stjørdal               | 5,03,5     | 2021.10.23 |
    | Verdal Friidrettsklubb        | 5657        | 331   | 1500    | Aron Rotmo                       | Steinkjer              | 5,04,04    | 2021.09.30 |
    | Verdal Friidrettsklubb        | 5658        | 316   | 200     | Aron Rotmo                       | Måndalen               | 28,33      | 2021.09.12 |
    | Verdal Friidrettsklubb        | 5659        | 297   | 1500    | Ulrik Valseth                    | Stjørdal               | 5,10,90    | 2021.10.23 |
    | Verdal Friidrettsklubb        | 5660        | 167   | Høyde   | Lukas Olofsson                   | Levanger               | 1,35       | 2021.06.13 |
    | Verdal Friidrettsklubb        | 5661        | 114   | 200     | Martin Vollan                    | Steinkjer              | 32,00      | 2021.09.30 |
    | Verdal Friidrettsklubb        | 5662        | 111   | Høyde   | Aron Rotmo                       | Måndalen               | 1,31       | 2021.09.12 |
    | Verdal IL                     | 5663        | 230   | 200     | Ulrik Valseth                    | Måndalen               | 29,79      | 2021.09.12 |
    | Vik IL                        | 5664        | 451   | 3000    | Matyas Galambos                  | Sogndal                | 10,13,64   | 2021.05.12 |
    | Vindbjart Friidrett           | 5665        | 402   | Kule    | Joakim Hermansen                 | Tvedestrand            | 9,37       | 2021.09.15 |
    | Vindbjart Friidrett           | 5666        | 353   | Høyde   | Sondre Rosseland                 | Nadderud               | 1,50       | 2021.10.16 |
    | Vindbjart Friidrett           | 5667        | 279   | 200     | Sondre Rosseland                 | Lyngdal                | 28,94      | 2021.09.26 |
    | Vollan Idrettsklubb           | 5668        | 897   | 800     | Ånung Viken                      | Oslo/Bi                | 1,50,72    | 2021.09.25 |
    | Vollan Idrettsklubb           | 5669        | 877   | 1500    | Ånung Viken                      | Oslo/Bi                | 3,48,85    | 2021.09.25 |
    | Vollan Idrettsklubb           | 5670        | 847   | 3000    | Ånung Viken                      | Trondheim              | 8,22,65    | 2021.09.28 |
    | Vollan Idrettsklubb           | 5671        | 749   | 5000    | Ånung Viken                      | Oslo/Bi                | 15,10,13   | 2021.09.25 |
    | Vollan Idrettsklubb           | 5672        | 649   | 3000    | Ådne Norland                     | Trondheim              | 9,10,58    | 2021.09.28 |
    | Vollan Idrettsklubb           | 5673        | 561   | Lut     | Geir Karlsen                     | Hvam                   | 2,80       | 2021.10.23 |
    | Voss IL                       | 5674        | 561   | Slegge  | Troy Norbakk                     | Voss                   | 36,40      | 2021.09.15 |
    | Voss IL                       | 5675        | 459   | Spyd    | Troy Norbakk                     | Voss                   | 38,15      | 2021.09.15 |
    | Voss IL                       | 5676        | 452   | Kule    | Troy Norbakk                     | Voss                   | 10,04      | 2021.09.15 |
    | Voss IL                       | 5677        | 429   | 200     | Troy Norbakk                     | Voss                   | 26,63      | 2021.09.15 |
    | Voss IL                       | 5678        | 415   | Lengde  | Troy Norbakk                     | Voss                   | 5,18       | 2021.09.15 |
    | Voss IL                       | 5679        | 326   | Kule    | Andreas Økland                   | Voss                   | 8,41       | 2021.09.15 |
    | Voss IL                       | 5680        | 295   | Høyde   | Gudmund Andresen                 | Voss                   | 1,45       | 2021.09.15 |
    | Voss IL                       | 5681        | 257   | 200     | Andreas Økland                   | Voss                   | 29,32      | 2021.09.15 |
    | Voss IL                       | 5682        | 225   | Lengde  | Gudmund Andresen                 | Voss                   | 4,41       | 2021.09.15 |
    | Voss IL                       | 5683        | 162   | 200     | Halle Gjerstad                   | Voss                   | 31,05      | 2021.09.15 |
    | Voss IL                       | 5684        | 114   | Lengde  | Andreas Økland                   | Voss                   | 3,98       | 2021.09.15 |
    | Voss IL                       | 5685        | 51    | 800     | Halle Gjerstad                   | Voss                   | 2,58,10    | 2021.09.15 |
    | Ålesund Friidrettsklubb       | 5686        | 817   | 200     | Tor-Junor Vedde                  | Nittedal               | 22,38      | 2021.10.30 |
    | Ålesund Friidrettsklubb       | 5687        | 580   | 200     | Oskar Opdøl                      | Ålesund                | 24,72      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5688        | 565   | Lengde  | Oskar Opdøl                      | Ålesund                | 5,82       | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5689        | 454   | 400     | Ove Fremsæter                    | Førde                  | 58,46      | 2021.08.22 |
    | Ålesund Friidrettsklubb       | 5690        | 446   | Lengde  | Henning Berge                    | Ulsteinvik             | 5,31       | 2021.10.28 |
    | Ålesund Friidrettsklubb       | 5691        | 445   | 200     | Fredrik Aarseth                  | Molde                  | 26,40      | 2021.06.20 |
    | Ålesund Friidrettsklubb       | 5692        | 444   | 800     | Ove Fremsæter                    | Førde                  | 2,16,21    | 2021.08.22 |
    | Ålesund Friidrettsklubb       | 5693        | 443   | Diskos  | Eivind Stavang                   | Førde                  | 28,55      | 2021.08.22 |
    | Ålesund Friidrettsklubb       | 5694        | 429   | Spyd    | Henning Berge                    | Ålesund                | 36,19      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5695        | 415   | 100     | Henning Berge                    | Ålesund                | 13,03      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5696        | 408   | 100     | Fredrik Aarseth                  | Ørsta                  | 13,07      | 2021.10.07 |
    | Ålesund Friidrettsklubb       | 5697        | 396   | Lengde  | Thias Brunvoll                   | Ålesund                | 5,10       | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5698        | 394   | 3000    | Oliver Young                     | Ålesund                | 10,35,1    | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5699        | 393   | Lengde  | Magnus Rørvik                    | Ålesund                | 5,09       | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5700        | 375   | Kule    | Eivind Stavang                   | Førde                  | 9,03       | 2021.08.22 |
    | Ålesund Friidrettsklubb       | 5701        | 364   | 200     | Magnus Rørvik                    | Ålesund                | 27,58      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5702        | 353   | Høyde   | Thias Brunvoll                   | Ålesund                | 1,50       | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5703        | 350   | 200     | Daniel Albertsen                 | Måndalen               | 27,79      | 2021.09.12 |
    | Ålesund Friidrettsklubb       | 5704        | 342   | Spyd    | Sigurd Seljeseth                 | Ålesund                | 30,68      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5705        | 320   | 1500    | Aleksander Helset                | Ålesund                | 5,06,30    | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5706        | 204   | 200     | Robin Davidsson                  | Ålesund                | 30,27      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5707        | 189   | Kule    | Helge Schistad                   | Ålesund                | 6,78       | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5708        | 126   | 200     | Sebastian Davidsson              | Molde                  | 31,76      | 2021.06.20 |
    | Ålesund Friidrettsklubb       | 5709        | 96    | Høyde   | Mats Stige                       | Ålesund                | 1,30       | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5710        | 90    | 200     | Mats Stige                       | Ålesund                | 32,47      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5711        | 76    | 200     | Sturla Idland                    | Ålesund                | 32,77      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5712        | 71    | 100     | Mats Stige                       | Ålesund                | 15,46      | 2021.09.30 |
    | Ålesund Friidrettsklubb       | 5713        | 4     | 1500    | Christer Mittet                  | Ålesund                | 6,27,28    | 2021.09.30 |
    | Åndalsnes IF                  | 5714        | 437   | 1500    | Lucas Avanu                      | Måndalen               | 4,44,43    | 2021.09.12 |
    | Åndalsnes IF                  | 5715        | 238   | Lengde  | Lucas Avanu                      | Måndalen               | 4,46       | 2021.09.12 |
    | Ås IL                         | 5716        | 984   | 800     | Ole Solbu                        | Kristiansand           | 1,47,61    | 2021.10.06 |
    | Ås IL                         | 5717        | 885   | 1500    | Ole Solbu                        | Oslo/Bi                | 3,48,12    | 2021.09.25 |
    | Ås IL                         | 5718        | 828   | 400     | Ole Solbu                        | Oslo/Bi                | 49,15      | 2021.09.25 |
    | Ås IL                         | 5719        | 717   | 400     | Simen Hansen                     | Oslo/Bi                | 51,37      | 2021.09.25 |
    | Ås IL                         | 5720        | 716   | 200     | Simen Hansen                     | Oslo/Bi                | 23,31      | 2021.09.25 |
    | Ås IL                         | 5721        | 711   | 200h    | Simen Hansen                     | Ås                     | 26,31      | 2021.10.13 |
    | Ås IL                         | 5722        | 694   | Lengde  | Simen Hansen                     | Oslo/Bi                | 6,39       | 2021.09.25 |
    | Ås IL                         | 5723        | 691   | 400h    | Simen Hansen                     | Ravnanger              | 57,53      | 2021.09.15 |
    | Ås IL                         | 5724        | 689   | 1500    | Nils Tveite                      | Oslo/Bi                | 4,07,82    | 2021.09.25 |
    | Ås IL                         | 5725        | 681   | 110h    | Simen Hansen                     | Ås                     | 16,20      | 2021.10.13 |
    | Ås IL                         | 5726        | 645   | Diskos  | Simen Hansen                     | Ravnanger              | 37,87      | 2021.09.15 |
    | Ås IL                         | 5727        | 636   | 100     | Simen Hansen                     | Oslo/Bi                | 11,88      | 2021.09.25 |
    | Ås IL                         | 5728        | 604   | Tresteg | Simen Hansen                     | Ravnanger              | 12,40      | 2021.09.15 |
    | Ås IL                         | 5729        | 597   | Stav    | Simen Hansen                     | Ås                     | 3,42       | 2021.10.13 |
    | Ås IL                         | 5730        | 589   | Spyd    | Simen Hansen                     | Oslo/Bi                | 47,24      | 2021.09.25 |
    | Ås IL                         | 5731        | 555   | Kule    | Simen Hansen                     | Moss                   | 11,43      | 2021.10.09 |
    | Ås IL                         | 5732        | 541   | Høyde   | Simen Hansen                     | Oslo/Bi                | 1,68       | 2021.09.25 |
    | Ås IL                         | 5733        | 535   | 400     | Andreas Benoni                   | Nittedal               | 55,89      | 2021.10.30 |
    | Ås IL                         | 5734        | 528   | 200h    | Mikkel Finnbråten                | Ås                     | 29,33      | 2021.10.13 |
    | Ås IL                         | 5735        | 527   | 200     | Mikkel Finnbråten                | Ås                     | 25,35      | 2021.10.13 |
    | Ås IL                         | 5736        | 514   | 400     | Mikkel Finnbråten                | Oslo/Bi                | 56,54      | 2021.09.25 |
    | Ås IL                         | 5737        | 513   | 200     | Andreas Benoni                   | Nadderud               | 25,51      | 2021.10.16 |
    | Ås IL                         | 5738        | 509   | 100     | Oskar Platzack                   | Ås                     | 12,51      | 2021.10.13 |
    | Ås IL                         | 5739        | 484   | 400h    | Mikkel Finnbråten                | Ås                     | 1,06,36    | 2021.10.13 |
    | Ås IL                         | 5740        | 477   | 3000    | Anders Treekrem                  | Ås                     | 10,04,58   | 2021.10.13 |
    | Ås IL                         | 5741        | 476   | 5000    | Karl Lilleheier                  | Ås                     | 17,35,39   | 2021.10.13 |
    | Ås IL                         | 5742        | 470   | 3000    | Karl Lilleheier                  | Ås                     | 10,06,84   | 2021.10.13 |
    | Ås IL                         | 5743        | 468   | 100     | Andreas Benoni                   | Ås                     | 12,73      | 2021.10.13 |
    | Ås IL                         | 5744        | 458   | 1500    | Simen Hansen                     | Oslo/Bi                | 4,40,81    | 2021.09.25 |
    | Ås IL                         | 5745        | 427   | Kule    | Lars Nygaard                     | Ås                     | 9,70       | 2021.10.13 |
    | Ås IL                         | 5746        | 396   | Kule    | Kristian Seiersten               | Ås                     | 9,29       | 2021.10.13 |
    | Ås IL                         | 5747        | 325   | Kule    | Andreas Benoni                   | Ås                     | 8,39       | 2021.10.13 |
    | Ås IL                         | 5748        | 318   | Tresteg | Mikkel Finnbråten                | Ås                     | 9,90       | 2021.10.13 |
    | Ås IL                         | 5749        | 313   | 3000    | Jon Strandrud                    | Ås                     | 11,09,09   | 2021.10.13 |
    | Ås IL                         | 5750        | 310   | 3000    | Kristian Seiersten               | Ås                     | 11,10,44   | 2021.10.13 |
    | Ås IL                         | 5751        | 303   | 5000    | Jon-Vidar Gaustad                | Ås                     | 19,37,80   | 2021.10.13 |
    | Ås IL                         | 5752        | 299   | 200     | Sivert Haugli-Onstad             | Drøbak                 | 28,60      | 2021.06.19 |
    | Ås IL                         | 5753        | 280   | 3000    | Leif Skagemo                     | Ås                     | 11,24,16   | 2021.10.13 |
    | Ås IL                         | 5754        | 270   | 3000    | Jon-Vidar Gaustad                | Ås                     | 11,28,86   | 2021.10.13 |
    | Ås IL                         | 5755        | 234   | 200     | Fredrik Henriksen                | Oslo/St                | 29,72      | 2021.10.16 |
    | Ås IL                         | 5756        | 224   | 3000    | Hans Overvoll                    | Ås                     | 11,51,70   | 2021.10.13 |
    | Ås IL                         | 5757        | 215   | Lengde  | Martin Gjuvsland                 | Ås                     | 4,37       | 2021.10.13 |
    | Ås IL                         | 5758        | 211   | 3000    | Peter Øyen-Havekes               | Ås                     | 11,58,45   | 2021.10.13 |
    | Ås IL                         | 5759        | 207   | Høyde   | Fredrik Henriksen                | Drøbak                 | 1,38       | 2021.06.19 |
    | Ås IL                         | 5760        | 182   | 200     | Martin Gjuvsland                 | Ås                     | 30,67      | 2021.10.13 |
    | Ås IL                         | 5761        | 170   | Lut     | Asle Benoni                      | Hvam                   | 2,29       | 2021.10.23 |
    | Ås IL                         | 5762        | 118   | 200h    | Anders Lileng                    | Ås                     | 38,38      | 2021.10.13 |
    | Ås IL                         | 5763        | 96    | Høyde   | Sivert Haugli-Onstad             | Ås                     | 1,30       | 2021.10.13 |
    | Ås IL                         | 5764        | 44    | 800     | Sivert Haugli-Onstad             | Ås                     | 2,59,06    | 2021.10.13 |
    | Ås IL                         | 5765        | 18    | 800     | Gunnar Bjerva                    | Ås                     | 3,02,29    | 2021.10.13 |
    | Åsen IL                       | 5766        | 577   | 5000    | Victor Synnestvedt               | Oslo/Bi                | 16,35,91   | 2021.09.25 |
    | Ølen IL                       | 5767        | 651   | 800     | Stian Haugland                   | Haugesund              | 2,01,87    | 2021.09.12 |
    | Ørsta IL                      | 5768        | 799   | Spyd    | Elias Nilsen                     | Bækkelaget             | 62,95      | 2021.10.04 |
    | Ørsta IL                      | 5769        | 762   | 100     | Johannes Eiksund                 | Lillehammer            | 11,32      | 2021.09.26 |
    | Ørsta IL                      | 5770        | 717   | 200     | Johannes Eiksund                 | Lillehammer            | 23,30      | 2021.09.26 |
    | Ørsta IL                      | 5771        | 655   | Lut     | Elias Nilsen                     | Ørsta                  | 2,97       | 2021.10.07 |
    | Ørsta IL                      | 5772        | 530   | 400     | Filip Hoggen                     | Molde                  | 56,06      | 2021.06.20 |
    | Ørsta IL                      | 5773        | 523   | Diskos  | Erik Tønnessen                   | Ørsta                  | 31,97      | 2021.10.07 |
    | Ørsta IL                      | 5774        | 519   | 200     | Noah Merheb                      | Måndalen               | 25,44      | 2021.09.12 |
    | Ørsta IL                      | 5775        | 512   | Spyd    | Erik Tønnessen                   | Ørsta                  | 41,80      | 2021.10.07 |
    | Ørsta IL                      | 5776        | 509   | Lut     | Filip Hoggen                     | Ørsta                  | 2,71       | 2021.10.07 |
    | Ørsta IL                      | 5777        | 507   | Lengde  | Filip Hoggen                     | Molde                  | 5,57       | 2021.06.20 |
    | Ørsta IL                      | 5778        | 491   | 1500    | Noah Merheb                      | Måndalen               | 4,35,42    | 2021.09.12 |
    | Ørsta IL                      | 5779        | 483   | 800     | Noah Merheb                      | Ørsta                  | 2,13,06    | 2021.10.07 |
    | Ørsta IL                      | 5780        | 472   | 100     | Noah Merheb                      | Ørsta                  | 12,71      | 2021.10.07 |
    | Ørsta IL                      | 5781        | 466   | Tresteg | Filip Hoggen                     | Ørsta                  | 11,17      | 2021.10.07 |
    | Ørsta IL                      | 5782        | 464   | Kule    | Erik Tønnessen                   | Ørsta                  | 10,19      | 2021.10.07 |
    | Ørsta IL                      | 5783        | 455   | 1500    | Jonatan Ryste                    | Måndalen               | 4,41,27    | 2021.09.12 |
    | Ørsta IL                      | 5784        | 443   | Slegge  | Erik Tønnessen                   | Ørsta                  | 28,97      | 2021.10.07 |
    | Ørsta IL                      | 5785        | 439   | 200     | Filip Hoggen                     | Ørsta                  | 26,49      | 2021.10.07 |
    | Ørsta IL                      | 5786        | 394   | 200     | Jonatan Ryste                    | Ørsta                  | 27,13      | 2021.10.07 |
    | Ørsta IL                      | 5787        | 371   | Lengde  | Noah Merheb                      | Ørsta                  | 5,00       | 2021.10.07 |
    | Ørsta IL                      | 5788        | 321   | 400     | Jonatan Ryste                    | Ørsta                  | 1,03,44    | 2021.10.07 |
    | Ørsta IL                      | 5789        | 246   | 800     | Erik Tønnessen                   | Ørsta                  | 2,35,18    | 2021.10.07 |
    | Ørsta IL                      | 5790        | 125   | Høyde   | Isak Lothe                       | Ulsteinvik             | 1,32       | 2021.10.28 |
    | Ørsta IL                      | 5791        | 10    | Lut     | Jonatan Ryste                    | Ørsta                  | 2,13       | 2021.10.07 |
    | Øyer-Tretten IL               | 5792        | 330   | 3000    | Anders Bergum                    | Lillehammer            | 11,01,60   | 2021.09.26 |
    | Øyer-Tretten IL               | 5793        | 128   | 100     | Trygve Lagerthon                 | Lillehammer            | 14,99      | 2021.09.26 |
    | Øyer-Tretten IL               | 5794        | 104   | 100     | Ole Lagerthon                    | Lillehammer            | 15,18      | 2021.09.26 |
    | ----------------------------- | ----------- | ----- | ------- | -------------------------------- | ---------------------- | ---------- | ---------- |

    Når kalkulatorbatch kjøres med serieår 2021 og uttrekksdato 2021.12.31

    Så skal batchen bruke under 120 sekunder

    Og laginfo bli:
    
    | Serieår | Klubb                         | Lagnummer | Fra og med | Til og med | Poeng | Poeng obligatoriske | Poeng valgfri | Antall noteringer | Antall deltakere |
    | ------- | ----------------------------- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |
    | 2021    | Adamstuen Løpeklubb           | 1         | 2021.12.31 |            | 566   | 566                 | 0             | 2                 | 1                |
    | 2021    | Almenning IL                  | 1         | 2021.12.31 |            | 497   | 497                 | 0             | 2                 | 1                |
    | 2021    | Alsvåg Idrettslag             | 1         | 2021.12.31 |            | 501   | 501                 | 0             | 1                 | 1                |
    | 2021    | Alta IF                       | 1         | 2021.12.31 |            | 1911  | 1071                | 840           | 5                 | 4                |
    | 2021    | Andebu IL                     | 1         | 2021.12.31 |            | 1185  | 551                 | 634           | 2                 | 1                |
    | 2021    | Aremark IF                    | 1         | 2021.12.31 |            | 7028  | 4766                | 2262          | 11                | 3                |
    | 2021    | Ask Friidrett                 | 1         | 2021.12.31 |            | 17451 | 9178                | 8273          | 25                | 9                |
    | 2021    | Ask Friidrett                 | 2         | 2021.12.31 |            | 7744  | 3319                | 4425          | 14                | 6                |
    | 2021    | Ask Friidrett                 | 3         | 2021.12.31 |            | 4032  | 1597                | 2435          | 11                | 9                |
    | 2021    | Ask Friidrett                 | 4         | 2021.12.31 |            | 816   | 407                 | 409           | 4                 | 3                |
    | 2021    | Asker Sk. Friidrett           | 1         | 2021.12.31 |            | 12583 | 7284                | 5299          | 20                | 6                |
    | 2021    | Asker Sk. Friidrett           | 2         | 2021.12.31 |            | 6089  | 2219                | 3870          | 14                | 7                |
    | 2021    | Asker Sk. Friidrett           | 3         | 2021.12.31 |            | 2652  | 1199                | 1453          | 12                | 7                |
    | 2021    | Asker Sk. Friidrett           | 4         | 2021.12.31 |            | 319   | 206                 | 113           | 5                 | 3                |
    | 2021    | Askim IF                      | 1         | 2021.12.31 |            | 4002  | 4002                | 0             | 5                 | 3                |
    | 2021    | Aure IL                       | 1         | 2021.12.31 |            | 5605  | 2680                | 2925          | 9                 | 4                |
    | 2021    | Aurskog/Høland Friidrettslag  | 1         | 2021.12.31 |            | 4380  | 2408                | 1972          | 7                 | 3                |
    | 2021    | BFG Bergen                    | 1         | 2021.12.31 |            | 633   | 633                 | 0             | 2                 | 1                |
    | 2021    | BFG Bergen Løpeklubb          | 1         | 2021.12.31 |            | 589   | 0                   | 589           | 1                 | 1                |
    | 2021    | Bagn IL                       | 1         | 2021.12.31 |            | 1179  | 543                 | 636           | 2                 | 1                |
    | 2021    | Bardu IL                      | 1         | 2021.12.31 |            | 3785  | 2526                | 1259          | 17                | 6                |
    | 2021    | Begnadalen IL                 | 1         | 2021.12.31 |            | 829   | 829                 | 0             | 1                 | 1                |
    | 2021    | Bergen Løpeklubb              | 1         | 2021.12.31 |            | 680   | 680                 | 0             | 1                 | 1                |
    | 2021    | Bergens Turnforening          | 1         | 2021.12.31 |            | 8050  | 3718                | 4332          | 16                | 7                |
    | 2021    | Bergens Turnforening          | 2         | 2021.12.31 |            | 32    | 32                  | 0             | 1                 | 1                |
    | 2021    | Birkenes IL                   | 1         | 2021.12.31 |            | 1869  | 0                   | 1869          | 2                 | 1                |
    | 2021    | Bodø Bauta Løpeklubb          | 1         | 2021.12.31 |            | 4651  | 1499                | 3152          | 9                 | 6                |
    | 2021    | Bodø Bauta Løpeklubb          | 2         | 2021.12.31 |            | 3837  | 1264                | 2573          | 9                 | 6                |
    | 2021    | Bodø Bauta Løpeklubb          | 3         | 2021.12.31 |            | 3131  | 1066                | 2065          | 9                 | 7                |
    | 2021    | Bodø Bauta Løpeklubb          | 4         | 2021.12.31 |            | 2433  | 655                 | 1778          | 8                 | 7                |
    | 2021    | Bodø Bauta Løpeklubb          | 5         | 2021.12.31 |            | 1637  | 512                 | 1125          | 8                 | 5                |
    | 2021    | Bodø Friidrettsklubb          | 1         | 2021.12.31 |            | 9300  | 5435                | 3865          | 18                | 11               |
    | 2021    | Bodø Friidrettsklubb          | 2         | 2021.12.31 |            | 270   | 43                  | 227           | 3                 | 3                |
    | 2021    | Botne SK                      | 1         | 2021.12.31 |            | 2151  | 1548                | 603           | 6                 | 3                |
    | 2021    | Brandbu IF                    | 1         | 2021.12.31 |            | 8122  | 4482                | 3640          | 13                | 9                |
    | 2021    | Brandbu IF                    | 2         | 2021.12.31 |            | 342   | 342                 | 0             | 1                 | 1                |
    | 2021    | Bratsberg IL                  | 1         | 2021.12.31 |            | 4242  | 781                 | 3461          | 7                 | 6                |
    | 2021    | Bratsberg IL                  | 2         | 2021.12.31 |            | 737   | 0                   | 737           | 2                 | 2                |
    | 2021    | Bremnes Idrettslag            | 1         | 2021.12.31 |            | 7026  | 3860                | 3166          | 18                | 8                |
    | 2021    | Bremnes Idrettslag            | 2         | 2021.12.31 |            | 1123  | 464                 | 659           | 10                | 7                |
    | 2021    | Bryne FIK                     | 1         | 2021.12.31 |            | 3592  | 2619                | 973           | 13                | 7                |
    | 2021    | Brønnøysund IL                | 1         | 2021.12.31 |            | 1214  | 762                 | 452           | 3                 | 2                |
    | 2021    | Byåsen IL                     | 1         | 2021.12.31 |            | 4427  | 2758                | 1669          | 16                | 12               |
    | 2021    | Byåsen IL                     | 2         | 2021.12.31 |            | 30    | 30                  | 0             | 1                 | 1                |
    | 2021    | Bækkelagets SK                | 1         | 2021.12.31 |            | 15143 | 7648                | 7495          | 25                | 12               |
    | 2021    | Bækkelagets SK                | 2         | 2021.12.31 |            | 4312  | 1751                | 2561          | 18                | 11               |
    | 2021    | Bækkelagets SK                | 3         | 2021.12.31 |            | 663   | 392                 | 271           | 6                 | 6                |
    | 2021    | Bærums Verk IF                | 1         | 2021.12.31 |            | 850   | 651                 | 199           | 2                 | 2                |
    | 2021    | Bæverfjord IL                 | 1         | 2021.12.31 |            | 716   | 716                 | 0             | 2                 | 2                |
    | 2021    | Bøler IF                      | 1         | 2021.12.31 |            | 6249  | 4379                | 1870          | 20                | 10               |
    | 2021    | Bøler IF                      | 2         | 2021.12.31 |            | 75    | 75                  | 0             | 1                 | 1                |
    | 2021    | Børsa IL                      | 1         | 2021.12.31 |            | 3247  | 3247                | 0             | 4                 | 1                |
    | 2021    | Dimna IL                      | 1         | 2021.12.31 |            | 19113 | 9330                | 9783          | 28                | 11               |
    | 2021    | Dimna IL                      | 2         | 2021.12.31 |            | 1692  | 1195                | 497           | 7                 | 6                |
    | 2021    | Dombås IL                     | 1         | 2021.12.31 |            | 626   | 0                   | 626           | 1                 | 1                |
    | 2021    | Drøbak-Frogn IL Friidrett     | 1         | 2021.12.31 |            | 5296  | 2646                | 2650          | 15                | 8                |
    | 2021    | Drøbak-Frogn IL Friidrett     | 2         | 2021.12.31 |            | 126   | 94                  | 32            | 2                 | 2                |
    | 2021    | Egersunds IK                  | 1         | 2021.12.31 |            | 5378  | 2319                | 3059          | 14                | 10               |
    | 2021    | Egersunds IK                  | 2         | 2021.12.31 |            | 3007  | 942                 | 2065          | 10                | 9                |
    | 2021    | Egersunds IK                  | 3         | 2021.12.31 |            | 1196  | 319                 | 877           | 6                 | 5                |
    | 2021    | Eikanger IL                   | 1         | 2021.12.31 |            | 4542  | 2176                | 2366          | 14                | 7                |
    | 2021    | Eikanger IL                   | 2         | 2021.12.31 |            | 566   | 270                 | 296           | 7                 | 5                |
    | 2021    | Eikefjord IL                  | 1         | 2021.12.31 |            | 779   | 779                 | 0             | 3                 | 3                |
    | 2021    | FIK Orion                     | 1         | 2021.12.31 |            | 10949 | 6528                | 4421          | 16                | 10               |
    | 2021    | FIK Orion                     | 2         | 2021.12.31 |            | 575   | 575                 | 0             | 2                 | 2                |
    | 2021    | FIK Ren-Eng                   | 1         | 2021.12.31 |            | 8819  | 4454                | 4365          | 12                | 7                |
    | 2021    | FIK Ren-Eng                   | 2         | 2021.12.31 |            | 1781  | 602                 | 1179          | 3                 | 2                |
    | 2021    | FIL Aks-77                    | 1         | 2021.12.31 |            | 5041  | 2601                | 2440          | 19                | 11               |
    | 2021    | FIL Aks-77                    | 2         | 2021.12.31 |            | 22    | 22                  | 0             | 1                 | 1                |
    | 2021    | FIL Borg                      | 1         | 2021.12.31 |            | 1641  | 1641                | 0             | 2                 | 1                |
    | 2021    | Fagernes IL                   | 1         | 2021.12.31 |            | 4656  | 2744                | 1912          | 11                | 5                |
    | 2021    | Fana IL                       | 1         | 2021.12.31 |            | 19028 | 8056                | 10972         | 26                | 17               |
    | 2021    | Fana IL                       | 2         | 2021.12.31 |            | 8845  | 4846                | 3999          | 17                | 10               |
    | 2021    | Fana IL                       | 3         | 2021.12.31 |            | 3275  | 1833                | 1442          | 15                | 13               |
    | 2021    | Fana IL                       | 4         | 2021.12.31 |            | 716   | 270                 | 446           | 8                 | 6                |
    | 2021    | Fana IL                       | 5         | 2021.12.31 |            | 11    | 11                  | 0             | 1                 | 1                |
    | 2021    | Farsund og Lista IK           | 1         | 2021.12.31 |            | 3059  | 1979                | 1080          | 8                 | 3                |
    | 2021    | Finnøy IL                     | 1         | 2021.12.31 |            | 242   | 242                 | 0             | 4                 | 1                |
    | 2021    | Fitjar Idrettslag             | 1         | 2021.12.31 |            | 2290  | 1696                | 594           | 9                 | 5                |
    | 2021    | Fjellørnen IL                 | 1         | 2021.12.31 |            | 1538  | 874                 | 664           | 2                 | 1                |
    | 2021    | Fjærland IL                   | 1         | 2021.12.31 |            | 597   | 597                 | 0             | 2                 | 1                |
    | 2021    | Flatås Idrettslag             | 1         | 2021.12.31 |            | 932   | 932                 | 0             | 2                 | 1                |
    | 2021    | Florø Turn og IF              | 1         | 2021.12.31 |            | 8585  | 4113                | 4472          | 11                | 6                |
    | 2021    | Florø Turn og IF              | 2         | 2021.12.31 |            | 128   | 128                 | 0             | 1                 | 1                |
    | 2021    | Flå IL                        | 1         | 2021.12.31 |            | 571   | 571                 | 0             | 2                 | 2                |
    | 2021    | Flåværingen IL                | 1         | 2021.12.31 |            | 1747  | 1136                | 611           | 5                 | 2                |
    | 2021    | Fossum IF                     | 1         | 2021.12.31 |            | 1574  | 1094                | 480           | 3                 | 2                |
    | 2021    | Fredrikstad IF                | 1         | 2021.12.31 |            | 11618 | 6355                | 5263          | 20                | 12               |
    | 2021    | Fredrikstad IF                | 2         | 2021.12.31 |            | 6535  | 3724                | 2811          | 19                | 11               |
    | 2021    | Fredrikstad IF                | 3         | 2021.12.31 |            | 2689  | 1116                | 1573          | 11                | 10               |
    | 2021    | Fredrikstad IF                | 4         | 2021.12.31 |            | 584   | 245                 | 339           | 4                 | 4                |
    | 2021    | Frol IL                       | 1         | 2021.12.31 |            | 2372  | 1981                | 391           | 6                 | 5                |
    | 2021    | Froland IL                    | 1         | 2021.12.31 |            | 705   | 0                   | 705           | 1                 | 1                |
    | 2021    | Frøyland IL                   | 1         | 2021.12.31 |            | 408   | 408                 | 0             | 1                 | 1                |
    | 2021    | Fyllingen IL                  | 1         | 2021.12.31 |            | 9335  | 4256                | 5079          | 15                | 6                |
    | 2021    | Fyllingen IL                  | 2         | 2021.12.31 |            | 3526  | 1686                | 1840          | 11                | 6                |
    | 2021    | Fyresdal Idrettslag           | 1         | 2021.12.31 |            | 1100  | 570                 | 530           | 5                 | 5                |
    | 2021    | Førde IL Friidrett            | 1         | 2021.12.31 |            | 9882  | 6017                | 3865          | 20                | 12               |
    | 2021    | Førde IL Friidrett            | 2         | 2021.12.31 |            | 4006  | 1876                | 2130          | 13                | 9                |
    | 2021    | Førde IL Friidrett            | 3         | 2021.12.31 |            | 1046  | 833                 | 213           | 5                 | 4                |
    | 2021    | Føyk Idrettslag               | 1         | 2021.12.31 |            | 1289  | 672                 | 617           | 2                 | 1                |
    | 2021    | GTI                           | 1         | 2021.12.31 |            | 11443 | 6872                | 4571          | 20                | 8                |
    | 2021    | GTI                           | 2         | 2021.12.31 |            | 6299  | 3110                | 3189          | 20                | 14               |
    | 2021    | GTI                           | 3         | 2021.12.31 |            | 507   | 339                 | 168           | 3                 | 2                |
    | 2021    | Gaular IL                     | 1         | 2021.12.31 |            | 2092  | 1778                | 314           | 5                 | 4                |
    | 2021    | Gausdal FIK                   | 1         | 2021.12.31 |            | 7193  | 3983                | 3210          | 15                | 9                |
    | 2021    | Gausdal FIK                   | 2         | 2021.12.31 |            | 2169  | 1507                | 662           | 10                | 6                |
    | 2021    | Gjerpen Idrettsforening       | 1         | 2021.12.31 |            | 217   | 217                 | 0             | 1                 | 1                |
    | 2021    | Gjesdal IL                    | 1         | 2021.12.31 |            | 5423  | 1631                | 3792          | 15                | 10               |
    | 2021    | Gjesdal IL                    | 2         | 2021.12.31 |            | 2198  | 147                 | 2051          | 7                 | 7                |
    | 2021    | Gjesdal IL                    | 3         | 2021.12.31 |            | 294   | 84                  | 210           | 2                 | 2                |
    | 2021    | Gjøvik FIK                    | 1         | 2021.12.31 |            | 3744  | 2440                | 1304          | 12                | 3                |
    | 2021    | Gloppen Friidrettslag         | 1         | 2021.12.31 |            | 14159 | 6489                | 7670          | 23                | 15               |
    | 2021    | Gloppen Friidrettslag         | 2         | 2021.12.31 |            | 465   | 465                 | 0             | 2                 | 2                |
    | 2021    | Gossen IL                     | 1         | 2021.12.31 |            | 593   | 0                   | 593           | 1                 | 1                |
    | 2021    | Grimstad TIF                  | 1         | 2021.12.31 |            | 109   | 109                 | 0             | 1                 | 1                |
    | 2021    | Grong IL                      | 1         | 2021.12.31 |            | 1724  | 1246                | 478           | 8                 | 3                |
    | 2021    | Groruddalen Friidrettsklubb   | 1         | 2021.12.31 |            | 7437  | 3960                | 3477          | 15                | 8                |
    | 2021    | Groruddalen Friidrettsklubb   | 2         | 2021.12.31 |            | 40    | 40                  | 0             | 1                 | 1                |
    | 2021    | Grue IL                       | 1         | 2021.12.31 |            | 242   | 242                 | 0             | 1                 | 1                |
    | 2021    | Gui Sportsklubb               | 1         | 2021.12.31 |            | 7891  | 3855                | 4036          | 15                | 6                |
    | 2021    | Gui Sportsklubb               | 2         | 2021.12.31 |            | 3021  | 1391                | 1630          | 13                | 7                |
    | 2021    | Gui Sportsklubb               | 3         | 2021.12.31 |            | 42    | 0                   | 42            | 1                 | 1                |
    | 2021    | Gulset IF Friidrett           | 1         | 2021.12.31 |            | 1298  | 659                 | 639           | 2                 | 1                |
    | 2021    | Hafslo IL                     | 1         | 2021.12.31 |            | 418   | 0                   | 418           | 1                 | 1                |
    | 2021    | Halden IL                     | 1         | 2021.12.31 |            | 10185 | 4663                | 5522          | 16                | 9                |
    | 2021    | Hamar IL                      | 1         | 2021.12.31 |            | 8468  | 4316                | 4152          | 16                | 7                |
    | 2021    | Hamar IL                      | 2         | 2021.12.31 |            | 869   | 499                 | 370           | 3                 | 3                |
    | 2021    | Hareid IL                     | 1         | 2021.12.31 |            | 3556  | 1662                | 1894          | 8                 | 4                |
    | 2021    | Hattfjelldal IL               | 1         | 2021.12.31 |            | 6641  | 2756                | 3885          | 13                | 7                |
    | 2021    | Haugesund IL                  | 1         | 2021.12.31 |            | 14590 | 7487                | 7103          | 23                | 13               |
    | 2021    | Haugesund IL                  | 2         | 2021.12.31 |            | 4249  | 1665                | 2584          | 9                 | 6                |
    | 2021    | Haugesund IL                  | 3         | 2021.12.31 |            | 65    | 65                  | 0             | 2                 | 1                |
    | 2021    | Havørn IL                     | 1         | 2021.12.31 |            | 590   | 590                 | 0             | 1                 | 1                |
    | 2021    | Heggedal FIK                  | 1         | 2021.12.31 |            | 1431  | 1106                | 325           | 4                 | 1                |
    | 2021    | Hegra IL                      | 1         | 2021.12.31 |            | 1684  | 1588                | 96            | 5                 | 2                |
    | 2021    | Herkules Friidrett            | 1         | 2021.12.31 |            | 10818 | 6226                | 4592          | 16                | 7                |
    | 2021    | Herkules Friidrett            | 2         | 2021.12.31 |            | 592   | 592                 | 0             | 2                 | 2                |
    | 2021    | Hinna IL                      | 1         | 2021.12.31 |            | 4347  | 2421                | 1926          | 10                | 5                |
    | 2021    | Hitra FIK                     | 1         | 2021.12.31 |            | 4061  | 2325                | 1736          | 15                | 5                |
    | 2021    | Hommelvik IL                  | 1         | 2021.12.31 |            | 3782  | 3282                | 500           | 6                 | 3                |
    | 2021    | Horten Friidrettsklubb        | 1         | 2021.12.31 |            | 1583  | 1583                | 0             | 6                 | 3                |
    | 2021    | Hurdal IL                     | 1         | 2021.12.31 |            | 168   | 168                 | 0             | 2                 | 2                |
    | 2021    | Hvam IL                       | 1         | 2021.12.31 |            | 3222  | 1490                | 1732          | 8                 | 3                |
    | 2021    | Hyen IL                       | 1         | 2021.12.31 |            | 667   | 497                 | 170           | 4                 | 3                |
    | 2021    | IF Eiker-Kvikk                | 1         | 2021.12.31 |            | 3079  | 3079                | 0             | 6                 | 3                |
    | 2021    | IF Hellas                     | 1         | 2021.12.31 |            | 6851  | 4756                | 2095          | 16                | 8                |
    | 2021    | IF Hellas                     | 2         | 2021.12.31 |            | 29    | 29                  | 0             | 1                 | 1                |
    | 2021    | IF Kamp-Vestheim              | 1         | 2021.12.31 |            | 3023  | 1533                | 1490          | 4                 | 3                |
    | 2021    | IF Sturla                     | 1         | 2021.12.31 |            | 14946 | 8362                | 6584          | 25                | 10               |
    | 2021    | IF Sturla                     | 2         | 2021.12.31 |            | 4413  | 2078                | 2335          | 12                | 8                |
    | 2021    | IF Sturla                     | 3         | 2021.12.31 |            | 461   | 318                 | 143           | 3                 | 2                |
    | 2021    | IK Grane                      | 1         | 2021.12.31 |            | 8869  | 5049                | 3820          | 16                | 5                |
    | 2021    | IK Grane                      | 2         | 2021.12.31 |            | 228   | 137                 | 91            | 3                 | 3                |
    | 2021    | IK Hind                       | 1         | 2021.12.31 |            | 13168 | 7980                | 5188          | 20                | 9                |
    | 2021    | IK Hind                       | 2         | 2021.12.31 |            | 7497  | 3779                | 3718          | 16                | 9                |
    | 2021    | IK Hind                       | 3         | 2021.12.31 |            | 805   | 367                 | 438           | 6                 | 5                |
    | 2021    | IK Tjalve                     | 1         | 2021.12.31 |            | 27738 | 14268               | 13470         | 30                | 16               |
    | 2021    | IK Tjalve                     | 2         | 2021.12.31 |            | 19782 | 9987                | 9795          | 29                | 15               |
    | 2021    | IK Tjalve                     | 3         | 2021.12.31 |            | 6927  | 3880                | 3047          | 11                | 4                |
    | 2021    | IK Våg                        | 1         | 2021.12.31 |            | 4396  | 3303                | 1093          | 8                 | 3                |
    | 2021    | IL Bjarg                      | 1         | 2021.12.31 |            | 1513  | 1400                | 113           | 7                 | 6                |
    | 2021    | IL Bjørn                      | 1         | 2021.12.31 |            | 64    | 64                  | 0             | 1                 | 1                |
    | 2021    | IL Dalebrand                  | 1         | 2021.12.31 |            | 880   | 700                 | 180           | 3                 | 2                |
    | 2021    | IL Express                    | 1         | 2021.12.31 |            | 954   | 582                 | 372           | 3                 | 3                |
    | 2021    | IL Fri                        | 1         | 2021.12.31 |            | 15992 | 9106                | 6886          | 25                | 12               |
    | 2021    | IL Fri                        | 2         | 2021.12.31 |            | 5584  | 2551                | 3033          | 13                | 10               |
    | 2021    | IL Fri                        | 3         | 2021.12.31 |            | 3017  | 1635                | 1382          | 11                | 6                |
    | 2021    | IL Fri                        | 4         | 2021.12.31 |            | 229   | 138                 | 91            | 5                 | 4                |
    | 2021    | IL Gneist                     | 1         | 2021.12.31 |            | 24422 | 12586               | 11836         | 30                | 13               |
    | 2021    | IL Gneist                     | 2         | 2021.12.31 |            | 12715 | 7542                | 5173          | 20                | 10               |
    | 2021    | IL Gneist                     | 3         | 2021.12.31 |            | 8265  | 4421                | 3844          | 17                | 8                |
    | 2021    | IL Gneist                     | 4         | 2021.12.31 |            | 4362  | 1805                | 2557          | 12                | 8                |
    | 2021    | IL Gneist                     | 5         | 2021.12.31 |            | 544   | 387                 | 157           | 4                 | 4                |
    | 2021    | IL Gular                      | 1         | 2021.12.31 |            | 18757 | 9892                | 8865          | 24                | 13               |
    | 2021    | IL Gular                      | 2         | 2021.12.31 |            | 11049 | 5916                | 5133          | 13                | 7                |
    | 2021    | IL Gular                      | 3         | 2021.12.31 |            | 10088 | 5508                | 4580          | 13                | 7                |
    | 2021    | IL Gular                      | 4         | 2021.12.31 |            | 7481  | 4050                | 3431          | 13                | 7                |
    | 2021    | IL Gular                      | 5         | 2021.12.31 |            | 726   | 661                 | 65            | 5                 | 2                |
    | 2021    | IL Heming                     | 1         | 2021.12.31 |            | 693   | 0                   | 693           | 1                 | 1                |
    | 2021    | IL Koll                       | 1         | 2021.12.31 |            | 5302  | 2976                | 2326          | 17                | 11               |
    | 2021    | IL Koll                       | 2         | 2021.12.31 |            | 1210  | 729                 | 481           | 10                | 7                |
    | 2021    | IL Korlevoll-Odda             | 1         | 2021.12.31 |            | 594   | 0                   | 594           | 1                 | 1                |
    | 2021    | IL Molde-Olymp                | 1         | 2021.12.31 |            | 3897  | 1924                | 1973          | 9                 | 8                |
    | 2021    | IL Nidelv                     | 1         | 2021.12.31 |            | 1471  | 1303                | 168           | 5                 | 3                |
    | 2021    | IL Nordlys                    | 1         | 2021.12.31 |            | 1065  | 326                 | 739           | 5                 | 2                |
    | 2021    | IL Norodd                     | 1         | 2021.12.31 |            | 5299  | 2362                | 2937          | 14                | 9                |
    | 2021    | IL Norodd                     | 2         | 2021.12.31 |            | 339   | 0                   | 339           | 2                 | 2                |
    | 2021    | IL Nybrott                    | 1         | 2021.12.31 |            | 4396  | 2520                | 1876          | 13                | 7                |
    | 2021    | IL Nybrott                    | 2         | 2021.12.31 |            | 205   | 205                 | 0             | 2                 | 2                |
    | 2021    | IL Pioner                     | 1         | 2021.12.31 |            | 3442  | 1437                | 2005          | 11                | 4                |
    | 2021    | IL Runar                      | 1         | 2021.12.31 |            | 7448  | 3112                | 4336          | 11                | 7                |
    | 2021    | IL Runar                      | 2         | 2021.12.31 |            | 1597  | 860                 | 737           | 4                 | 2                |
    | 2021    | IL Sand                       | 1         | 2021.12.31 |            | 268   | 268                 | 0             | 1                 | 1                |
    | 2021    | IL Sandvin                    | 1         | 2021.12.31 |            | 12755 | 7795                | 4960          | 20                | 7                |
    | 2021    | IL Sandvin                    | 2         | 2021.12.31 |            | 6429  | 4109                | 2320          | 20                | 8                |
    | 2021    | IL Sandvin                    | 3         | 2021.12.31 |            | 646   | 314                 | 332           | 7                 | 4                |
    | 2021    | IL Stein                      | 1         | 2021.12.31 |            | 317   | 317                 | 0             | 2                 | 1                |
    | 2021    | IL Stjørdals-Blink            | 1         | 2021.12.31 |            | 167   | 167                 | 0             | 1                 | 1                |
    | 2021    | IL Trio                       | 1         | 2021.12.31 |            | 2491  | 1296                | 1195          | 13                | 7                |
    | 2021    | IL Tyrving                    | 1         | 2021.12.31 |            | 22823 | 11145               | 11678         | 30                | 17               |
    | 2021    | IL Tyrving                    | 2         | 2021.12.31 |            | 11245 | 5909                | 5336          | 18                | 11               |
    | 2021    | IL Tyrving                    | 3         | 2021.12.31 |            | 6614  | 3106                | 3508          | 13                | 9                |
    | 2021    | IL Tyrving                    | 4         | 2021.12.31 |            | 4375  | 1932                | 2443          | 11                | 4                |
    | 2021    | IL Tyrving                    | 5         | 2021.12.31 |            | 2616  | 1256                | 1360          | 10                | 8                |
    | 2021    | IL Tyrving                    | 6         | 2021.12.31 |            | 708   | 305                 | 403           | 8                 | 8                |
    | 2021    | IL Tyrving                    | 7         | 2021.12.31 |            | 27    | 22                  | 5             | 3                 | 3                |
    | 2021    | IL i BUL                      | 1         | 2021.12.31 |            | 20845 | 9236                | 11609         | 27                | 16               |
    | 2021    | IL i BUL                      | 2         | 2021.12.31 |            | 12102 | 6669                | 5433          | 18                | 11               |
    | 2021    | IL i BUL                      | 3         | 2021.12.31 |            | 9738  | 5332                | 4406          | 15                | 9                |
    | 2021    | IL i BUL                      | 4         | 2021.12.31 |            | 8025  | 3943                | 4082          | 12                | 7                |
    | 2021    | IL i BUL                      | 5         | 2021.12.31 |            | 6394  | 2948                | 3446          | 11                | 8                |
    | 2021    | IL i BUL                      | 6         | 2021.12.31 |            | 5434  | 2626                | 2808          | 11                | 6                |
    | 2021    | IL i BUL                      | 7         | 2021.12.31 |            | 1888  | 1012                | 876           | 9                 | 7                |
    | 2021    | IL i BUL                      | 8         | 2021.12.31 |            | 73    | 73                  | 0             | 1                 | 1                |
    | 2021    | IL i BUL Tromsø               | 1         | 2021.12.31 |            | 12057 | 6782                | 5275          | 20                | 8                |
    | 2021    | IL i BUL Tromsø               | 2         | 2021.12.31 |            | 6129  | 2575                | 3554          | 15                | 12               |
    | 2021    | IL i BUL Tromsø               | 3         | 2021.12.31 |            | 3406  | 1029                | 2377          | 9                 | 8                |
    | 2021    | IL i BUL Tromsø               | 4         | 2021.12.31 |            | 1300  | 130                 | 1170          | 8                 | 8                |
    | 2021    | IL i BUL Tromsø               | 5         | 2021.12.31 |            | 9     | 9                   | 0             | 1                 | 1                |
    | 2021    | Idrettsforeningen Ørn         | 1         | 2021.12.31 |            | 1014  | 0                   | 1014          | 2                 | 1                |
    | 2021    | Idrettslaget Fram             | 1         | 2021.12.31 |            | 18    | 18                  | 0             | 1                 | 1                |
    | 2021    | Idrettslaget Ilar             | 1         | 2021.12.31 |            | 122   | 122                 | 0             | 1                 | 1                |
    | 2021    | Idrettslaget Skjalg           | 1         | 2021.12.31 |            | 18448 | 9489                | 8959          | 25                | 11               |
    | 2021    | Idrettslaget Skjalg           | 2         | 2021.12.31 |            | 10413 | 5406                | 5007          | 19                | 11               |
    | 2021    | Idrettslaget Skjalg           | 3         | 2021.12.31 |            | 7656  | 3862                | 3794          | 16                | 11               |
    | 2021    | Idrettslaget Skjalg           | 4         | 2021.12.31 |            | 5773  | 3027                | 2746          | 13                | 8                |
    | 2021    | Idrettslaget Skjalg           | 5         | 2021.12.31 |            | 3472  | 1555                | 1917          | 10                | 7                |
    | 2021    | Idrettslaget Skjalg           | 6         | 2021.12.31 |            | 1466  | 915                 | 551           | 9                 | 7                |
    | 2021    | Ikornnes Idrettslag           | 1         | 2021.12.31 |            | 4175  | 2555                | 1620          | 8                 | 3                |
    | 2021    | Inderøy IL                    | 1         | 2021.12.31 |            | 1416  | 1205                | 211           | 4                 | 2                |
    | 2021    | Innstranda IL                 | 1         | 2021.12.31 |            | 1210  | 1210                | 0             | 2                 | 2                |
    | 2021    | Isfjorden IL                  | 1         | 2021.12.31 |            | 779   | 414                 | 365           | 2                 | 2                |
    | 2021    | Ivrig                         | 1         | 2021.12.31 |            | 507   | 507                 | 0             | 1                 | 1                |
    | 2021    | Jardar IL                     | 1         | 2021.12.31 |            | 181   | 166                 | 15            | 2                 | 2                |
    | 2021    | Josefvatn IL                  | 1         | 2021.12.31 |            | 56    | 0                   | 56            | 1                 | 1                |
    | 2021    | Jotun IL                      | 1         | 2021.12.31 |            | 8436  | 5391                | 3045          | 15                | 5                |
    | 2021    | Jægervatnet IL                | 1         | 2021.12.31 |            | 964   | 884                 | 80            | 5                 | 1                |
    | 2021    | Jølster IL                    | 1         | 2021.12.31 |            | 11026 | 6224                | 4802          | 15                | 7                |
    | 2021    | Jølster IL                    | 2         | 2021.12.31 |            | 6355  | 3225                | 3130          | 12                | 8                |
    | 2021    | Jølster IL                    | 3         | 2021.12.31 |            | 1427  | 639                 | 788           | 5                 | 4                |
    | 2021    | KFUM-Kameratene               | 1         | 2021.12.31 |            | 389   | 389                 | 0             | 3                 | 1                |
    | 2021    | Kamp/Vestheim IF              | 1         | 2021.12.31 |            | 3105  | 1590                | 1515          | 4                 | 2                |
    | 2021    | Kaupanger IL                  | 1         | 2021.12.31 |            | 1355  | 539                 | 816           | 4                 | 3                |
    | 2021    | Kjelsås IL                    | 1         | 2021.12.31 |            | 2360  | 1391                | 969           | 4                 | 3                |
    | 2021    | Kleppestø IL                  | 1         | 2021.12.31 |            | 71    | 0                   | 71            | 1                 | 1                |
    | 2021    | Kolvereid IL                  | 1         | 2021.12.31 |            | 2063  | 2063                | 0             | 4                 | 2                |
    | 2021    | Kongsberg IF                  | 1         | 2021.12.31 |            | 2486  | 2238                | 248           | 5                 | 3                |
    | 2021    | Kongsvinger IL Friidrett      | 1         | 2021.12.31 |            | 4457  | 3089                | 1368          | 12                | 6                |
    | 2021    | Kragerø IF Friidrett          | 1         | 2021.12.31 |            | 5071  | 1961                | 3110          | 12                | 9                |
    | 2021    | Kristiansand Løpeklubb        | 1         | 2021.12.31 |            | 5852  | 1508                | 4344          | 8                 | 5                |
    | 2021    | Kristiansand Løpeklubb        | 2         | 2021.12.31 |            | 1330  | 0                   | 1330          | 2                 | 2                |
    | 2021    | Kristiansands IF Friidrett    | 1         | 2021.12.31 |            | 12219 | 7491                | 4728          | 19                | 13               |
    | 2021    | Kristiansands IF Friidrett    | 2         | 2021.12.31 |            | 1714  | 1011                | 703           | 9                 | 6                |
    | 2021    | Krødsherad IL                 | 1         | 2021.12.31 |            | 490   | 400                 | 90            | 3                 | 3                |
    | 2021    | Kvæfjord IL                   | 1         | 2021.12.31 |            | 3732  | 1921                | 1811          | 6                 | 2                |
    | 2021    | Kyrksæterøra IL               | 1         | 2021.12.31 |            | 6426  | 3300                | 3126          | 12                | 5                |
    | 2021    | Kyrksæterøra IL               | 2         | 2021.12.31 |            | 607   | 278                 | 329           | 2                 | 1                |
    | 2021    | Laksevåg TIL                  | 1         | 2021.12.31 |            | 11170 | 6339                | 4831          | 20                | 9                |
    | 2021    | Laksevåg TIL                  | 2         | 2021.12.31 |            | 4854  | 1987                | 2867          | 15                | 9                |
    | 2021    | Laksevåg TIL                  | 3         | 2021.12.31 |            | 1140  | 373                 | 767           | 8                 | 8                |
    | 2021    | Lambertseter IF               | 1         | 2021.12.31 |            | 8102  | 3919                | 4183          | 15                | 5                |
    | 2021    | Lambertseter IF               | 2         | 2021.12.31 |            | 1654  | 957                 | 697           | 8                 | 6                |
    | 2021    | Langesund Triathlonklubb      | 1         | 2021.12.31 |            | 2530  | 801                 | 1729          | 7                 | 7                |
    | 2021    | Larvik Turn & IF              | 1         | 2021.12.31 |            | 12663 | 6886                | 5777          | 20                | 8                |
    | 2021    | Larvik Turn & IF              | 2         | 2021.12.31 |            | 2732  | 1185                | 1547          | 13                | 9                |
    | 2021    | Leinstrand IL                 | 1         | 2021.12.31 |            | 2239  | 1140                | 1099          | 4                 | 2                |
    | 2021    | Lillehammer IF                | 1         | 2021.12.31 |            | 14292 | 7861                | 6431          | 20                | 9                |
    | 2021    | Lillehammer IF                | 2         | 2021.12.31 |            | 7937  | 3820                | 4117          | 16                | 7                |
    | 2021    | Lillehammer IF                | 3         | 2021.12.31 |            | 5683  | 2459                | 3224          | 12                | 9                |
    | 2021    | Lillehammer IF                | 4         | 2021.12.31 |            | 3339  | 1430                | 1909          | 10                | 8                |
    | 2021    | Lillehammer IF                | 5         | 2021.12.31 |            | 202   | 79                  | 123           | 3                 | 3                |
    | 2021    | Lillesand IL                  | 1         | 2021.12.31 |            | 583   | 0                   | 583           | 1                 | 1                |
    | 2021    | Loddefjord IL                 | 1         | 2021.12.31 |            | 1053  | 1015                | 38            | 6                 | 4                |
    | 2021    | Lyn Ski                       | 1         | 2021.12.31 |            | 718   | 718                 | 0             | 2                 | 2                |
    | 2021    | Lyngdal IL                    | 1         | 2021.12.31 |            | 2497  | 1869                | 628           | 8                 | 5                |
    | 2021    | Lysekloster Idrettslag        | 1         | 2021.12.31 |            | 594   | 494                 | 100           | 3                 | 2                |
    | 2021    | Lånke IL Friidrett            | 1         | 2021.12.31 |            | 4567  | 1664                | 2903          | 14                | 7                |
    | 2021    | Lånke IL Friidrett            | 2         | 2021.12.31 |            | 110   | 0                   | 110           | 1                 | 1                |
    | 2021    | Lørenskog Friidrettslag       | 1         | 2021.12.31 |            | 9547  | 4937                | 4610          | 17                | 6                |
    | 2021    | Lørenskog Friidrettslag       | 2         | 2021.12.31 |            | 3741  | 1207                | 2534          | 11                | 9                |
    | 2021    | Lørenskog Friidrettslag       | 3         | 2021.12.31 |            | 106   | 106                 | 0             | 1                 | 1                |
    | 2021    | Løten Friidrett               | 1         | 2021.12.31 |            | 3044  | 1264                | 1780          | 5                 | 4                |
    | 2021    | Mandal & Halse IL             | 1         | 2021.12.31 |            | 2757  | 2357                | 400           | 8                 | 5                |
    | 2021    | Markabygda IL                 | 1         | 2021.12.31 |            | 1323  | 389                 | 934           | 4                 | 3                |
    | 2021    | Markane IL                    | 1         | 2021.12.31 |            | 543   | 543                 | 0             | 1                 | 1                |
    | 2021    | Medkila Skilag                | 1         | 2021.12.31 |            | 313   | 313                 | 0             | 1                 | 1                |
    | 2021    | Midsund IL                    | 1         | 2021.12.31 |            | 3682  | 2822                | 860           | 9                 | 5                |
    | 2021    | Midtbygdens IL                | 1         | 2021.12.31 |            | 2266  | 1225                | 1041          | 13                | 4                |
    | 2021    | Mjøndalen IL                  | 1         | 2021.12.31 |            | 797   | 0                   | 797           | 2                 | 2                |
    | 2021    | Mjøsdalen IL                  | 1         | 2021.12.31 |            | 9214  | 4738                | 4476          | 17                | 6                |
    | 2021    | Mjøsdalen IL                  | 2         | 2021.12.31 |            | 3252  | 1138                | 2114          | 12                | 11               |
    | 2021    | Mjøsdalen IL                  | 3         | 2021.12.31 |            | 1053  | 361                 | 692           | 10                | 10               |
    | 2021    | Modum FIK                     | 1         | 2021.12.31 |            | 7587  | 4036                | 3551          | 16                | 7                |
    | 2021    | Modum FIK                     | 2         | 2021.12.31 |            | 61    | 61                  | 0             | 1                 | 1                |
    | 2021    | Moelven IL                    | 1         | 2021.12.31 |            | 11787 | 5153                | 6634          | 16                | 8                |
    | 2021    | Moelven IL                    | 2         | 2021.12.31 |            | 4565  | 1582                | 2983          | 8                 | 5                |
    | 2021    | Molde og Omegn IF             | 1         | 2021.12.31 |            | 1091  | 743                 | 348           | 3                 | 3                |
    | 2021    | Moltustranda IL               | 1         | 2021.12.31 |            | 415   | 415                 | 0             | 1                 | 1                |
    | 2021    | Mosjøen Friidrettsklubb       | 1         | 2021.12.31 |            | 4983  | 2184                | 2799          | 10                | 6                |
    | 2021    | Moss IL                       | 1         | 2021.12.31 |            | 12775 | 7495                | 5280          | 20                | 12               |
    | 2021    | Moss IL                       | 2         | 2021.12.31 |            | 4284  | 2287                | 1997          | 17                | 9                |
    | 2021    | Moss IL                       | 3         | 2021.12.31 |            | 117   | 117                 | 0             | 1                 | 1                |
    | 2021    | Mosvik IL                     | 1         | 2021.12.31 |            | 1051  | 0                   | 1051          | 2                 | 2                |
    | 2021    | Målselv IL                    | 1         | 2021.12.31 |            | 1230  | 666                 | 564           | 6                 | 3                |
    | 2021    | NTNUI                         | 1         | 2021.12.31 |            | 6995  | 2677                | 4318          | 11                | 8                |
    | 2021    | NTNUI                         | 2         | 2021.12.31 |            | 1618  | 0                   | 1618          | 4                 | 4                |
    | 2021    | Namdal Løpeklubb              | 1         | 2021.12.31 |            | 4937  | 2691                | 2246          | 10                | 9                |
    | 2021    | Namdal Løpeklubb              | 2         | 2021.12.31 |            | 777   | 341                 | 436           | 4                 | 4                |
    | 2021    | Namdalseid                    | 1         | 2021.12.31 |            | 159   | 140                 | 19            | 2                 | 2                |
    | 2021    | Namsen Friidrettsforening     | 1         | 2021.12.31 |            | 6973  | 3158                | 3815          | 14                | 6                |
    | 2021    | Namsen Friidrettsforening     | 2         | 2021.12.31 |            | 191   | 133                 | 58            | 2                 | 2                |
    | 2021    | Narvik IL                     | 1         | 2021.12.31 |            | 6624  | 4435                | 2189          | 12                | 5                |
    | 2021    | Nesbyen IL                    | 1         | 2021.12.31 |            | 1414  | 1090                | 324           | 5                 | 4                |
    | 2021    | Nesodden IF                   | 1         | 2021.12.31 |            | 4348  | 3304                | 1044          | 14                | 8                |
    | 2021    | Nesseby Idrettsforening       | 1         | 2021.12.31 |            | 169   | 169                 | 0             | 1                 | 1                |
    | 2021    | Nesøya IL                     | 1         | 2021.12.31 |            | 1534  | 1534                | 0             | 3                 | 1                |
    | 2021    | Nittedal IL                   | 1         | 2021.12.31 |            | 19931 | 9296                | 10635         | 30                | 14               |
    | 2021    | Nittedal IL                   | 2         | 2021.12.31 |            | 5763  | 2339                | 3424          | 15                | 11               |
    | 2021    | Nittedal IL                   | 3         | 2021.12.31 |            | 3940  | 1075                | 2865          | 9                 | 8                |
    | 2021    | Nittedal IL                   | 4         | 2021.12.31 |            | 3222  | 804                 | 2418          | 8                 | 6                |
    | 2021    | Nittedal IL                   | 5         | 2021.12.31 |            | 2319  | 641                 | 1678          | 8                 | 7                |
    | 2021    | Nordfjorden IL                | 1         | 2021.12.31 |            | 1234  | 1234                | 0             | 2                 | 1                |
    | 2021    | Nordkjosbotn IL               | 1         | 2021.12.31 |            | 420   | 0                   | 420           | 1                 | 1                |
    | 2021    | Nordre Eidsvoll IL            | 1         | 2021.12.31 |            | 1216  | 1216                | 0             | 2                 | 1                |
    | 2021    | Nordre Land friidrett         | 1         | 2021.12.31 |            | 2082  | 1052                | 1030          | 7                 | 5                |
    | 2021    | Nordøy IL                     | 1         | 2021.12.31 |            | 1109  | 1109                | 0             | 4                 | 1                |
    | 2021    | Norna-Salhus IL               | 1         | 2021.12.31 |            | 21470 | 10340               | 11130         | 28                | 17               |
    | 2021    | Norna-Salhus IL               | 2         | 2021.12.31 |            | 7611  | 3436                | 4175          | 15                | 9                |
    | 2021    | Norna-Salhus IL               | 3         | 2021.12.31 |            | 3866  | 1760                | 2106          | 13                | 10               |
    | 2021    | Norna-Salhus IL               | 4         | 2021.12.31 |            | 482   | 124                 | 358           | 5                 | 5                |
    | 2021    | Nøtterøy Idrettsforening      | 1         | 2021.12.31 |            | 1370  | 1370                | 0             | 4                 | 1                |
    | 2021    | Oksskolten IL                 | 1         | 2021.12.31 |            | 562   | 562                 | 0             | 1                 | 1                |
    | 2021    | Olden IL                      | 1         | 2021.12.31 |            | 4859  | 4189                | 670           | 7                 | 3                |
    | 2021    | Oppegård Idrettslag           | 1         | 2021.12.31 |            | 5083  | 3101                | 1982          | 16                | 8                |
    | 2021    | Oppegård Idrettslag           | 2         | 2021.12.31 |            | 101   | 101                 | 0             | 2                 | 1                |
    | 2021    | Oppstad IL                    | 1         | 2021.12.31 |            | 1045  | 523                 | 522           | 2                 | 2                |
    | 2021    | Opptur Motbakkeklubb          | 1         | 2021.12.31 |            | 1122  | 494                 | 628           | 4                 | 3                |
    | 2021    | Os Turnforening               | 1         | 2021.12.31 |            | 6494  | 3995                | 2499          | 14                | 9                |
    | 2021    | Os Turnforening               | 2         | 2021.12.31 |            | 55    | 55                  | 0             | 1                 | 1                |
    | 2021    | Oslo Politis IL               | 1         | 2021.12.31 |            | 727   | 97                  | 630           | 3                 | 1                |
    | 2021    | Oslostudentenes IK Friidrett  | 1         | 2021.12.31 |            | 7922  | 3068                | 4854          | 10                | 5                |
    | 2021    | Oslostudentenes IK Friidrett  | 2         | 2021.12.31 |            | 6587  | 2094                | 4493          | 9                 | 8                |
    | 2021    | Oslostudentenes IK Friidrett  | 3         | 2021.12.31 |            | 5349  | 1468                | 3881          | 8                 | 8                |
    | 2021    | Oslostudentenes IK Friidrett  | 4         | 2021.12.31 |            | 2177  | 585                 | 1592          | 4                 | 3                |
    | 2021    | Osterøy IL                    | 1         | 2021.12.31 |            | 17379 | 9197                | 8182          | 25                | 12               |
    | 2021    | Osterøy IL                    | 2         | 2021.12.31 |            | 6922  | 3731                | 3191          | 17                | 8                |
    | 2021    | Osterøy IL                    | 3         | 2021.12.31 |            | 4481  | 1618                | 2863          | 11                | 6                |
    | 2021    | Osterøy IL                    | 4         | 2021.12.31 |            | 3345  | 1041                | 2304          | 9                 | 6                |
    | 2021    | Osterøy IL                    | 5         | 2021.12.31 |            | 1725  | 108                 | 1617          | 7                 | 7                |
    | 2021    | Osterøy IL                    | 6         | 2021.12.31 |            | 802   | 0                   | 802           | 6                 | 6                |
    | 2021    | Otra IL                       | 1         | 2021.12.31 |            | 5759  | 3049                | 2710          | 9                 | 4                |
    | 2021    | Overhalla IL                  | 1         | 2021.12.31 |            | 10144 | 4624                | 5520          | 16                | 7                |
    | 2021    | Overhalla IL                  | 2         | 2021.12.31 |            | 2545  | 555                 | 1990          | 10                | 6                |
    | 2021    | Overhalla IL                  | 3         | 2021.12.31 |            | 230   | 170                 | 60            | 2                 | 2                |
    | 2021    | Rana FIK                      | 1         | 2021.12.31 |            | 5472  | 2915                | 2557          | 12                | 5                |
    | 2021    | Rana FIK                      | 2         | 2021.12.31 |            | 268   | 268                 | 0             | 1                 | 1                |
    | 2021    | Ranheim IL                    | 1         | 2021.12.31 |            | 16958 | 8875                | 8083          | 25                | 11               |
    | 2021    | Ranheim IL                    | 2         | 2021.12.31 |            | 9346  | 5255                | 4091          | 17                | 7                |
    | 2021    | Ranheim IL                    | 3         | 2021.12.31 |            | 3521  | 2213                | 1308          | 10                | 7                |
    | 2021    | Raufoss Idrettslag Friidrett  | 1         | 2021.12.31 |            | 7943  | 3377                | 4566          | 11                | 5                |
    | 2021    | Raumnes & Årnes IL            | 1         | 2021.12.31 |            | 3215  | 2655                | 560           | 5                 | 2                |
    | 2021    | Rennebu IL                    | 1         | 2021.12.31 |            | 992   | 687                 | 305           | 3                 | 1                |
    | 2021    | Rindal IL                     | 1         | 2021.12.31 |            | 6503  | 2454                | 4049          | 10                | 5                |
    | 2021    | Rindal IL                     | 2         | 2021.12.31 |            | 4060  | 949                 | 3111          | 8                 | 7                |
    | 2021    | Ringerike Friidrettsklubb     | 1         | 2021.12.31 |            | 7495  | 4225                | 3270          | 16                | 9                |
    | 2021    | Risør IL                      | 1         | 2021.12.31 |            | 1472  | 397                 | 1075          | 6                 | 6                |
    | 2021    | Rjukan Idrettslag             | 1         | 2021.12.31 |            | 7405  | 4407                | 2998          | 19                | 9                |
    | 2021    | Rjukan Idrettslag             | 2         | 2021.12.31 |            | 2114  | 551                 | 1563          | 8                 | 8                |
    | 2021    | Rjukan Idrettslag             | 3         | 2021.12.31 |            | 928   | 294                 | 634           | 8                 | 6                |
    | 2021    | Romerike Friidrett            | 1         | 2021.12.31 |            | 5156  | 2605                | 2551          | 12                | 8                |
    | 2021    | Romerike Friidrett            | 2         | 2021.12.31 |            | 211   | 102                 | 109           | 4                 | 4                |
    | 2021    | Ros IL                        | 1         | 2021.12.31 |            | 4488  | 2755                | 1733          | 10                | 8                |
    | 2021    | Rosendal Turnlag              | 1         | 2021.12.31 |            | 2918  | 1670                | 1248          | 8                 | 4                |
    | 2021    | Rygge IL                      | 1         | 2021.12.31 |            | 1771  | 1289                | 482           | 3                 | 2                |
    | 2021    | Røros IL                      | 1         | 2021.12.31 |            | 496   | 0                   | 496           | 1                 | 1                |
    | 2021    | Røyken UIL                    | 1         | 2021.12.31 |            | 120   | 0                   | 120           | 1                 | 1                |
    | 2021    | SK Freidig                    | 1         | 2021.12.31 |            | 3044  | 2169                | 875           | 4                 | 3                |
    | 2021    | SMIL Engavågen                | 1         | 2021.12.31 |            | 558   | 539                 | 19            | 3                 | 2                |
    | 2021    | Salangen Friidrett            | 1         | 2021.12.31 |            | 1720  | 871                 | 849           | 2                 | 1                |
    | 2021    | Sandane Turn og Idrettslag    | 1         | 2021.12.31 |            | 89    | 89                  | 0             | 1                 | 1                |
    | 2021    | Sandefjord Turn & IF          | 1         | 2021.12.31 |            | 6393  | 3398                | 2995          | 15                | 8                |
    | 2021    | Sandefjord Turn & IF          | 2         | 2021.12.31 |            | 66    | 66                  | 0             | 1                 | 1                |
    | 2021    | Sandnes IL                    | 1         | 2021.12.31 |            | 24677 | 11446               | 13231         | 30                | 14               |
    | 2021    | Sandnes IL                    | 2         | 2021.12.31 |            | 13292 | 5678                | 7614          | 23                | 14               |
    | 2021    | Sandnes IL                    | 3         | 2021.12.31 |            | 7494  | 3426                | 4068          | 15                | 10               |
    | 2021    | Sandnes IL                    | 4         | 2021.12.31 |            | 4308  | 1445                | 2863          | 13                | 10               |
    | 2021    | Sandnes IL                    | 5         | 2021.12.31 |            | 1946  | 697                 | 1249          | 10                | 9                |
    | 2021    | Sandnes IL                    | 6         | 2021.12.31 |            | 1021  | 281                 | 740           | 9                 | 8                |
    | 2021    | Sandnes IL                    | 7         | 2021.12.31 |            | 83    | 48                  | 35            | 2                 | 2                |
    | 2021    | Sandnessjøen IL               | 1         | 2021.12.31 |            | 1466  | 640                 | 826           | 6                 | 4                |
    | 2021    | Sarpsborg IL                  | 1         | 2021.12.31 |            | 11692 | 6015                | 5677          | 23                | 11               |
    | 2021    | Sarpsborg IL                  | 2         | 2021.12.31 |            | 525   | 525                 | 0             | 2                 | 2                |
    | 2021    | Sauda IL                      | 1         | 2021.12.31 |            | 2907  | 1004                | 1903          | 8                 | 5                |
    | 2021    | Selbu IL                      | 1         | 2021.12.31 |            | 95    | 90                  | 5             | 2                 | 2                |
    | 2021    | Seljord IL                    | 1         | 2021.12.31 |            | 5092  | 3520                | 1572          | 9                 | 4                |
    | 2021    | Selsbakk IF                   | 1         | 2021.12.31 |            | 7875  | 4910                | 2965          | 10                | 2                |
    | 2021    | Sem IF                        | 1         | 2021.12.31 |            | 6333  | 2819                | 3514          | 11                | 6                |
    | 2021    | Sigdal FIK                    | 1         | 2021.12.31 |            | 2925  | 1271                | 1654          | 9                 | 7                |
    | 2021    | Sjetne IL                     | 1         | 2021.12.31 |            | 80    | 0                   | 80            | 1                 | 1                |
    | 2021    | Skarphedin IL                 | 1         | 2021.12.31 |            | 5475  | 1848                | 3627          | 9                 | 5                |
    | 2021    | Skarphedin IL                 | 2         | 2021.12.31 |            | 520   | 357                 | 163           | 3                 | 3                |
    | 2021    | Skaun IL                      | 1         | 2021.12.31 |            | 20    | 19                  | 1             | 2                 | 2                |
    | 2021    | Ski IL Friidrett              | 1         | 2021.12.31 |            | 7254  | 4044                | 3210          | 17                | 10               |
    | 2021    | Ski IL Friidrett              | 2         | 2021.12.31 |            | 356   | 356                 | 0             | 3                 | 2                |
    | 2021    | Skogn IL                      | 1         | 2021.12.31 |            | 2228  | 2228                | 0             | 5                 | 1                |
    | 2021    | Snåsa IL                      | 1         | 2021.12.31 |            | 434   | 0                   | 434           | 1                 | 1                |
    | 2021    | Snøgg Friidrett               | 1         | 2021.12.31 |            | 12171 | 6996                | 5175          | 20                | 10               |
    | 2021    | Snøgg Friidrett               | 2         | 2021.12.31 |            | 5201  | 2763                | 2438          | 15                | 8                |
    | 2021    | Snøgg Friidrett               | 3         | 2021.12.31 |            | 1756  | 668                 | 1088          | 7                 | 6                |
    | 2021    | Sogndal IL                    | 1         | 2021.12.31 |            | 643   | 0                   | 643           | 2                 | 2                |
    | 2021    | Sortland Friidrettsklubb      | 1         | 2021.12.31 |            | 10105 | 5575                | 4530          | 19                | 6                |
    | 2021    | Sortland Friidrettsklubb      | 2         | 2021.12.31 |            | 3604  | 1706                | 1898          | 14                | 9                |
    | 2021    | Sortland Friidrettsklubb      | 3         | 2021.12.31 |            | 175   | 100                 | 75            | 3                 | 3                |
    | 2021    | Spillum IL                    | 1         | 2021.12.31 |            | 203   | 203                 | 0             | 1                 | 1                |
    | 2021    | Spirit Friidrettsklubb        | 1         | 2021.12.31 |            | 7864  | 3227                | 4637          | 12                | 6                |
    | 2021    | Spirit Friidrettsklubb        | 2         | 2021.12.31 |            | 5632  | 2371                | 3261          | 10                | 8                |
    | 2021    | Spirit Friidrettsklubb        | 3         | 2021.12.31 |            | 4490  | 1850                | 2640          | 10                | 7                |
    | 2021    | Spirit Friidrettsklubb        | 4         | 2021.12.31 |            | 429   | 237                 | 192           | 2                 | 2                |
    | 2021    | Spjelkavik og Omegn Friidrett | 1         | 2021.12.31 |            | 3221  | 2216                | 1005          | 11                | 3                |
    | 2021    | Sportsklubben Vidar           | 1         | 2021.12.31 |            | 18214 | 9097                | 9117          | 22                | 14               |
    | 2021    | Sportsklubben Vidar           | 2         | 2021.12.31 |            | 6347  | 2685                | 3662          | 11                | 7                |
    | 2021    | Sportsklubben Vidar           | 3         | 2021.12.31 |            | 4766  | 1687                | 3079          | 10                | 7                |
    | 2021    | Sportsklubben Vidar           | 4         | 2021.12.31 |            | 2884  | 881                 | 2003          | 7                 | 6                |
    | 2021    | Spydeberg IL                  | 1         | 2021.12.31 |            | 914   | 914                 | 0             | 2                 | 2                |
    | 2021    | Stadsbygd IL                  | 1         | 2021.12.31 |            | 8407  | 4346                | 4061          | 14                | 6                |
    | 2021    | Stadsbygd IL                  | 2         | 2021.12.31 |            | 4393  | 1745                | 2648          | 10                | 6                |
    | 2021    | Stegaberg IL                  | 1         | 2021.12.31 |            | 167   | 167                 | 0             | 2                 | 2                |
    | 2021    | Steinkjer Friidrettsklubb     | 1         | 2021.12.31 |            | 17866 | 9748                | 8118          | 25                | 8                |
    | 2021    | Steinkjer Friidrettsklubb     | 2         | 2021.12.31 |            | 9393  | 5054                | 4339          | 15                | 8                |
    | 2021    | Steinkjer Friidrettsklubb     | 3         | 2021.12.31 |            | 3030  | 1181                | 1849          | 7                 | 6                |
    | 2021    | Stjørdal Friidrettsklubb      | 1         | 2021.12.31 |            | 6958  | 3571                | 3387          | 15                | 4                |
    | 2021    | Stjørdal Friidrettsklubb      | 2         | 2021.12.31 |            | 509   | 182                 | 327           | 3                 | 3                |
    | 2021    | Stokmarknes IL                | 1         | 2021.12.31 |            | 483   | 0                   | 483           | 1                 | 1                |
    | 2021    | Stord Idrettslag              | 1         | 2021.12.31 |            | 20184 | 10158               | 10026         | 30                | 15               |
    | 2021    | Stord Idrettslag              | 2         | 2021.12.31 |            | 5788  | 3030                | 2758          | 15                | 8                |
    | 2021    | Stord Idrettslag              | 3         | 2021.12.31 |            | 1271  | 915                 | 356           | 10                | 7                |
    | 2021    | Stovnerkameratene             | 1         | 2021.12.31 |            | 2336  | 2033                | 303           | 13                | 6                |
    | 2021    | Strindheim IL                 | 1         | 2021.12.31 |            | 12183 | 7040                | 5143          | 19                | 13               |
    | 2021    | Strindheim IL                 | 2         | 2021.12.31 |            | 7018  | 3625                | 3393          | 13                | 8                |
    | 2021    | Strindheim IL                 | 3         | 2021.12.31 |            | 2498  | 930                 | 1568          | 9                 | 6                |
    | 2021    | Strindheim IL                 | 4         | 2021.12.31 |            | 6     | 6                   | 0             | 1                 | 1                |
    | 2021    | Stålkameratene IL             | 1         | 2021.12.31 |            | 765   | 505                 | 260           | 5                 | 1                |
    | 2021    | Stårheim IL                   | 1         | 2021.12.31 |            | 1179  | 1179                | 0             | 2                 | 1                |
    | 2021    | Sunndal IL Friidrett          | 1         | 2021.12.31 |            | 689   | 689                 | 0             | 3                 | 2                |
    | 2021    | Surnadal IL                   | 1         | 2021.12.31 |            | 2608  | 1955                | 653           | 6                 | 2                |
    | 2021    | Svarstad IL                   | 1         | 2021.12.31 |            | 4580  | 2368                | 2212          | 6                 | 2                |
    | 2021    | Svelgen T & IF                | 1         | 2021.12.31 |            | 126   | 126                 | 0             | 1                 | 1                |
    | 2021    | Svint IL                      | 1         | 2021.12.31 |            | 1819  | 1491                | 328           | 6                 | 2                |
    | 2021    | Svorkmo N.O.I.                | 1         | 2021.12.31 |            | 8749  | 3849                | 4900          | 11                | 4                |
    | 2021    | Svorkmo N.O.I.                | 2         | 2021.12.31 |            | 4442  | 700                 | 3742          | 7                 | 6                |
    | 2021    | Svorkmo N.O.I.                | 3         | 2021.12.31 |            | 463   | 0                   | 463           | 1                 | 1                |
    | 2021    | Søfteland TIL                 | 1         | 2021.12.31 |            | 252   | 107                 | 145           | 2                 | 1                |
    | 2021    | Søgne IL                      | 1         | 2021.12.31 |            | 2850  | 1437                | 1413          | 10                | 6                |
    | 2021    | Sømna IL                      | 1         | 2021.12.31 |            | 11029 | 7074                | 3955          | 20                | 10               |
    | 2021    | Sømna IL                      | 2         | 2021.12.31 |            | 6537  | 3361                | 3176          | 17                | 9                |
    | 2021    | Sømna IL                      | 3         | 2021.12.31 |            | 3494  | 1769                | 1725          | 13                | 10               |
    | 2021    | Sømna IL                      | 4         | 2021.12.31 |            | 301   | 223                 | 78            | 3                 | 2                |
    | 2021    | Søndre Land IL                | 1         | 2021.12.31 |            | 7647  | 4694                | 2953          | 18                | 8                |
    | 2021    | Søndre Land IL                | 2         | 2021.12.31 |            | 78    | 78                  | 0             | 2                 | 2                |
    | 2021    | Sør-Vekkom Lauparlag          | 1         | 2021.12.31 |            | 554   | 0                   | 554           | 1                 | 1                |
    | 2021    | Sørild FIK                    | 1         | 2021.12.31 |            | 10306 | 4887                | 5419          | 15                | 7                |
    | 2021    | Sørild FIK                    | 2         | 2021.12.31 |            | 5259  | 2124                | 3135          | 13                | 9                |
    | 2021    | Sørild FIK                    | 3         | 2021.12.31 |            | 888   | 376                 | 512           | 11                | 6                |
    | 2021    | Sørum IL                      | 1         | 2021.12.31 |            | 752   | 390                 | 362           | 4                 | 3                |
    | 2021    | T&IF Viking                   | 1         | 2021.12.31 |            | 9094  | 4726                | 4368          | 16                | 7                |
    | 2021    | T&IF Viking                   | 2         | 2021.12.31 |            | 5090  | 2229                | 2861          | 14                | 7                |
    | 2021    | T&IF Viking                   | 3         | 2021.12.31 |            | 564   | 302                 | 262           | 4                 | 4                |
    | 2021    | Tambarskjelvar IL             | 1         | 2021.12.31 |            | 809   | 809                 | 0             | 2                 | 1                |
    | 2021    | Tingvoll Friidrettsklubb      | 1         | 2021.12.31 |            | 1100  | 803                 | 297           | 3                 | 3                |
    | 2021    | Tingvoll Idrettslag           | 1         | 2021.12.31 |            | 530   | 511                 | 19            | 4                 | 3                |
    | 2021    | Tjøme løpeklubb               | 1         | 2021.12.31 |            | 515   | 0                   | 515           | 1                 | 1                |
    | 2021    | Torvastad IL                  | 1         | 2021.12.31 |            | 157   | 157                 | 0             | 1                 | 1                |
    | 2021    | Torvikbukt IL                 | 1         | 2021.12.31 |            | 625   | 0                   | 625           | 1                 | 1                |
    | 2021    | Tromsø Friidrettsklubb        | 1         | 2021.12.31 |            | 594   | 0                   | 594           | 1                 | 1                |
    | 2021    | Tromsø Løpeklubb              | 1         | 2021.12.31 |            | 3606  | 782                 | 2824          | 7                 | 6                |
    | 2021    | Tromsø Løpeklubb              | 2         | 2021.12.31 |            | 239   | 0                   | 239           | 1                 | 1                |
    | 2021    | Trondheim & Omegn Sportsklubb | 1         | 2021.12.31 |            | 530   | 530                 | 0             | 1                 | 1                |
    | 2021    | Trondheim Friidrett           | 1         | 2021.12.31 |            | 4639  | 2791                | 1848          | 8                 | 5                |
    | 2021    | Trondheim Triatlonklubb       | 1         | 2021.12.31 |            | 2585  | 1024                | 1561          | 5                 | 2                |
    | 2021    | Trysil IL                     | 1         | 2021.12.31 |            | 1078  | 557                 | 521           | 2                 | 1                |
    | 2021    | Trysilgutten                  | 1         | 2021.12.31 |            | 1479  | 1479                | 0             | 3                 | 2                |
    | 2021    | Turn & IL Hovding             | 1         | 2021.12.31 |            | 328   | 328                 | 0             | 1                 | 1                |
    | 2021    | Tvedestrand Turn & IF         | 1         | 2021.12.31 |            | 4755  | 1972                | 2783          | 14                | 6                |
    | 2021    | Tvedestrand Turn & IF         | 2         | 2021.12.31 |            | 71    | 0                   | 71            | 1                 | 1                |
    | 2021    | Tverlandet IL                 | 1         | 2021.12.31 |            | 2815  | 1821                | 994           | 5                 | 3                |
    | 2021    | Tønsberg Friidrettsklubb      | 1         | 2021.12.31 |            | 20914 | 10286               | 10628         | 29                | 13               |
    | 2021    | Tønsberg Friidrettsklubb      | 2         | 2021.12.31 |            | 7905  | 4389                | 3516          | 19                | 9                |
    | 2021    | Tønsberg Friidrettsklubb      | 3         | 2021.12.31 |            | 1195  | 983                 | 212           | 11                | 5                |
    | 2021    | Ullensaker/Kisa IL            | 1         | 2021.12.31 |            | 20058 | 9095                | 10963         | 30                | 15               |
    | 2021    | Ullensaker/Kisa IL            | 2         | 2021.12.31 |            | 8211  | 3994                | 4217          | 13                | 7                |
    | 2021    | Ullensaker/Kisa IL            | 3         | 2021.12.31 |            | 5357  | 1988                | 3369          | 10                | 7                |
    | 2021    | Ullensaker/Kisa IL            | 4         | 2021.12.31 |            | 733   | 472                 | 261           | 3                 | 3                |
    | 2021    | Ulvik IL                      | 1         | 2021.12.31 |            | 594   | 594                 | 0             | 1                 | 1                |
    | 2021    | Undheim Idrettslag            | 1         | 2021.12.31 |            | 3159  | 1475                | 1684          | 11                | 7                |
    | 2021    | Urædd Friidrett               | 1         | 2021.12.31 |            | 6152  | 3126                | 3026          | 14                | 7                |
    | 2021    | Urædd Friidrett               | 2         | 2021.12.31 |            | 105   | 105                 | 0             | 2                 | 1                |
    | 2021    | Utleira IL Friidrett          | 1         | 2021.12.31 |            | 4106  | 1808                | 2298          | 11                | 6                |
    | 2021    | Vadsø Turnforening            | 1         | 2021.12.31 |            | 2109  | 1625                | 484           | 9                 | 3                |
    | 2021    | Valnesfjord IL                | 1         | 2021.12.31 |            | 1264  | 802                 | 462           | 5                 | 2                |
    | 2021    | Varegg IL                     | 1         | 2021.12.31 |            | 7848  | 3275                | 4573          | 11                | 6                |
    | 2021    | Varegg IL                     | 2         | 2021.12.31 |            | 6703  | 2616                | 4087          | 11                | 6                |
    | 2021    | Varegg IL                     | 3         | 2021.12.31 |            | 4489  | 1294                | 3195          | 9                 | 6                |
    | 2021    | Varegg IL                     | 4         | 2021.12.31 |            | 1821  | 496                 | 1325          | 6                 | 5                |
    | 2021    | Vegårshei IL                  | 1         | 2021.12.31 |            | 3944  | 609                 | 3335          | 7                 | 4                |
    | 2021    | Vegårshei IL                  | 2         | 2021.12.31 |            | 1514  | 385                 | 1129          | 4                 | 4                |
    | 2021    | Veldre Friidrett              | 1         | 2021.12.31 |            | 1381  | 712                 | 669           | 2                 | 2                |
    | 2021    | Verdal Friidrettsklubb        | 1         | 2021.12.31 |            | 7197  | 4144                | 3053          | 15                | 6                |
    | 2021    | Verdal Friidrettsklubb        | 2         | 2021.12.31 |            | 411   | 411                 | 0             | 2                 | 2                |
    | 2021    | Verdal IL                     | 1         | 2021.12.31 |            | 230   | 230                 | 0             | 1                 | 1                |
    | 2021    | Vik IL                        | 1         | 2021.12.31 |            | 451   | 0                   | 451           | 1                 | 1                |
    | 2021    | Vindbjart Friidrett           | 1         | 2021.12.31 |            | 1034  | 1034                | 0             | 3                 | 2                |
    | 2021    | Vollan Idrettsklubb           | 1         | 2021.12.31 |            | 4580  | 2523                | 2057          | 6                 | 3                |
    | 2021    | Voss IL                       | 1         | 2021.12.31 |            | 3746  | 2662                | 1084          | 12                | 4                |
    | 2021    | Ålesund Friidrettsklubb       | 1         | 2021.12.31 |            | 8041  | 4615                | 3426          | 18                | 10               |
    | 2021    | Ålesund Friidrettsklubb       | 2         | 2021.12.31 |            | 1548  | 1052                | 496           | 10                | 8                |
    | 2021    | Åndalsnes IF                  | 1         | 2021.12.31 |            | 675   | 675                 | 0             | 2                 | 1                |
    | 2021    | Ås IL                         | 1         | 2021.12.31 |            | 13789 | 8341                | 5448          | 25                | 11               |
    | 2021    | Ås IL                         | 2         | 2021.12.31 |            | 2651  | 853                 | 1798          | 12                | 8                |
    | 2021    | Ås IL                         | 3         | 2021.12.31 |            | 136   | 18                  | 118           | 2                 | 2                |
    | 2021    | Åsen IL                       | 1         | 2021.12.31 |            | 577   | 577                 | 0             | 1                 | 1                |
    | 2021    | Ølen IL                       | 1         | 2021.12.31 |            | 651   | 651                 | 0             | 1                 | 1                |
    | 2021    | Ørsta IL                      | 1         | 2021.12.31 |            | 10265 | 6310                | 3955          | 20                | 7                |
    | 2021    | Øyer-Tretten IL               | 1         | 2021.12.31 |            | 562   | 128                 | 434           | 3                 | 3     
    | ------- | ----------------------------- | --------- | ---------- | ---------- | ----- | ------------------- | ------------- | ----------------- | ---------------- |