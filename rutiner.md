# Rutiner

### Start ny serie:
1. *Oppsettbatch*: Legg til ny serie og kjør.
2. *Konfig*: Legg til mappe for det nye serieåret med:
   - `øvelsesinfo.json`
   - `resultatavvik.json`
   - `settinger.json`
1. *Grunnlagsdatabatch*: Kjør.
2. *Github og Railway*: Oppdater miljøvariabelen `LAGSERIEN_SERIEAR` i github og railway.

### Avslutt serie:
1. *Avrundingsbatch*: Kjør.
2. *Oppsettbatch*:
    - Legg inn nye verdier for arkiv_sluttplasseringer (csv-fil) og eventuelle resultatbytter.
    - Kjør.

### Nytt resultatbytte
1. *Oppsettbatch*: Legg inn resultatbytte, og kjør.

### Ny artikkel
1. *Oppsettbatch*: Legg inn artikkel, og kjør.

### Ny eller fjerning av rullestolutøvere
1. *Konfig*: Endre rullestolutøvere i `konfig/<serieår>/resultatavvik.json`
2. *Grunnlagsbatch*: Kjør.

### Endring av overbygningsklubber eller klubber/utøvere unntatt overbygning
1. *Konfig*: Foreta endringen i `konfig/<serieår>/resultatavvik.json`
2. *Grunnlagsbatch*: Kjør.