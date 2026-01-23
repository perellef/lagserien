# Kjøreskript

Denne README'en inneholder skript brukt i systemet. Endringer i systemet gjøres gjennom disse, kun med unntak beskrevet under [rutinene](../rutiner.md).

### Batchskript: 
Det er en rekke skript for å kjøre batchene:
- Batch 0: `kjør_oppsett.py`
- Batch 1: `kjør_seriegrunnlag.py`
- Batch 2: `kjør_serieuttrekk.py`
- Batch 3: `kjør_serieutdeling.py`
- Batch 4: `kjør_seriekalkulator.py`, eventuelt `kjør_seriekalkulator_for_periode.py` ved simulering tilbake i tid ved oppstart
- Batch 5: (mangler)
- Batch 6: `kjør_stevnekontroll.py`

Batch 6, 2, 3, 4 kan kjøres sekvensielt med `kjør_rutine.py`.

### Annet:
-  `start_nettside.py` starter nettsiden lokalt
- `kjør_isolert_gjennomkjøring.py` er nyttig hvis man ønsker en full kjøring som ikke påvirker produksjonsdataene.
- `oppdater_offisielle_excelark.py` er et skript som oppdaterer excelarkene liggende under `srcc/applikasjon/static/assets/excelfiler/serieoppsett_yyyy-mm-dd.zip`.
- `kjør_features.py` brukes for å kjøre featurefilene.
- `kjør_to_og_sammenlikn.py` er et sammenlikningsskript for å se effekten av en endring togglet med en feature-toggle.