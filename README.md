# Lagserien – serieoppsett

Dette systemet utfører serieoppsett til *Lagserien* (innunder [NFIF](https://www.friidrett.no/)) fra resultater i [statistikken](https://minfriidrettsstatistikk.info/). Serieoppsettet vises på [lagserien.no](https://www.lagserien.no).

## Batcher

I tillegg til webapplikasjonen er systemet er delt inn i 7 batcher.

  0. **Oppsettbatch** : Innleder systemet. *Kjøres ved første anledning.*
  1. **Grunnlagsbatch**: Forbereder ny serie. *Kjøres ved start av serie.*
  2. **Uttrekksbatch**: Leser inn stevner og resultater. *Kjøres daglig.*
  3. **Tildelingsbatch**: Beregner resultatenes poeng og avgjør klubben de tilhører. *Kjøres daglig etter batch 2.*
  4. **Kalkulatorbatch**: Beregner lag og tabell. *Kjøres daglig etter batch 3.*
  5. **Avrundingsbatch**: Markerer sluttdato for serien. *Kjøres årlig.*

## Kom i gang

1. Installer avhengigheter.
```bash
pip install -r requirements.txt
```

2. For å kjøre:


   - **Med lokal database**  
        1. Erstatt alle forekomster av `Database.PRODUKSJON` med `Database.TESTDATA`.

   - **Med produksjonsdata**  
     1. Opprett en `.env`-fil i prosjektmappen.  
     2. Fyll inn databasepassordet `LAGSERIEN_DB_PSW=`:
3. Kjør oppsettbatch med `python bin/kjør_oppsett.py`.

Nå er du klar!

## Systemdesign

- **Modularitet** – systemet er inndelt i mindre batcher som kan utvikles, testes og vedlikeholdes separat.
- **Kjørende dokumentasjon** – funksjonell oppførsel er godt dokumentert og verifiseres at stemmer.
- **Reproduserbarhet** – tidligere kjøringer kan (med noen unntak) reproduseres og etterprøves.
- **Stor testdekning** – et stort omfang av enhetstester bidrar til å fange opp feil tidlig.

## Eksterne tjenester
- [Github-actions](https://github.com/perellef/lagserien/actions) for automatiserte kjøringer.
- [Railway](https://railway.com/) for å hoste og deploye applikasjonen.
- [Supabase](https://supabase.com/) for database.

## Les mer

Trykk deg videre for:
- [Funksjonell dokumentasjon](dokumentasjon/README.md) – Kjørbare scenarier som viser systemets oppførsel.
- [Dataarkitektur](data/dataarkitektur.md) – Prinsipper til data. Se også:
  - [Datavalg](data/datavalg.md) – bakgrunn for hvorfor dataene ser ut slik de gjør,
  - [Dataoversikt](data/tabellrelasjoner.png) – skisse over tabellene med relasjonene seg imellom,
  - [Datakatalog](data/datakatalog.md) – beskrivelser av tabeller og attributter til dataene.
- [Betraktninger rundt algoritme for lagoppsett](srcc/main/batch_4_kalkulator/readme.md) – innsikt i utfordringer og løsning til algoritme for korrekt lagoppsett.
- [Rutiner](rutiner.md) – Tips og veiledning for hvordan ulike oppgaver utføres.
- [Kjøreskript](bin/README.md) – Info om kjøreskript til systemet.

## Lisens

Dette prosjektet er lisensiert under PolyForm Noncommercial License 1.0.0.  
Du kan bruke, dele og endre denne programvaren kun til **ikke-kommersielle formål**. Se [LICENSE](LICENSE) for detaljer.