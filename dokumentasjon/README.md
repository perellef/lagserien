## Dokumentasjon av funksjonell oppførsel

Her er en dokumentasjon over systemets funksjonelle oppførsel. **Dette er hva systemet er faktisk gjør.**

Dokumentasjonen verifiseres løpende, slik at du kan være trygg på at den stemmer.

## Uttrekksbatch

Lite dokumentasjon foreligger her da mye av batch-arbeidet er å innhente data fra et API til friidrettsstatistikken som er på et så krøkete dataformatet at det er vanskelig å replisere.

NFIF er i gang med å erstatte det gamle statistikksystemet og i den forbindelse er det naturlig å håpe på et forbedret API, som det er naturlig å legge inn kjørende dokumentasjon til.

## Tildelingsbatch

Funksjonell oppførsel for tildelingsbatch.

- **Frafall av uttrekksresultat** – når et uttrekksresultat skal ignoreres helt:
    - [Klubb i seriekrets](batch_3_utdeling/klubb_i_seriekrets.feature)
    - [Utdeling resultat](batch_3_utdeling/utdeling_resultat.feature)


- **Tildeling av klubb** – hvilken klubb resultatet skal gjelde for, om noen:
    - [Yngre utøvere](batch_3_utdeling/yngre_utøvere_feature.feature)
    - [Manuelle tider](batch_3_utdeling/manuelle_tider.feature)
    - [Mellomtider](batch_3_utdeling/mellomtider.feature)
    - [Overbygning](batch_3_utdeling/overbygning.feature):
        - [Klubb unntatt overbygning](batch_3_utdeling/klubber_unntatt_overbygning.feature)
        - [Utøver unntatt overbygning](batch_3_utdeling/utøver_unntatt_overbygning.feature)
    - [Rullestolutøvere](batch_3_utdeling/rullestolutøvere.feature)
    - [Resultatbytter](batch_3_utdeling/resultatbytter.feature)

- **Poengberegning** – hvor mange poeng resultatet gir:
    - [Poengberegner](poengberegner.feature)

- **Fjerning av overflødige serieresultater** – hvordan utkonkurrerte resultater fjernes:
    - [Unike serieresultater](batch_3_utdeling/unike_serieresultater.feature)

- **Periodisering av serieresultat** – hvordan endringer av serieresultat bevares:
    - [Periodisering serieresultat](batch_3_utdeling/periodisering_serieresultat.feature)


## Kalkulatorbatch

- **Frafall av serieresultat** – når et serieresultat skal ignoreres helt:
    - [Frafall serieresultat](batch_4_kalkulator/periodisering_serieresultat.feature)
- **Oppsett av lag og tabeller** – hvordan lag og tabeller blir seende ut gitt visse tilfeller:
    - [Laginfo](batch_4_kalkulator/laginfo.feature)
    - [Lagplassering](batch_4_kalkulator/lagplassering.feature)
    - [Oppstilling rekkefølge](batch_4_kalkulator/oppstilling_rekkefølge.feature)
    - [Optimal oppstilling](batch_4_kalkulator/optimal_oppstilling.feature)
    - [Spesielle beregningstilfeller](batch_4_kalkulator/spesielle_bregningstilfeller.feature)
    - [Tunge beregninger](batch_4_kalkulator/tunge_beregninger.feature)

- **Periodisering av lag og tabeller** – hvordan endringer av lag og tabeller bevares:
    - [Periodisering laginfo](batch_4_kalkulator/periodisering_laginfo.feature)
    - [Periodisering lagresultat](batch_4_kalkulator/periodisering_lagresultat.feature)
    - [Periodisering utøver merverdi](batch_4_kalkulator/periodisering_utøver_merverdi.feature)

