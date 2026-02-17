# Dataarkitektur

For å få et robust seriesystem har det vært viktig med en solid dataarkitektur.

## Prinsipper

I seriesystemet har sentrale prinsipper for dataarkitektur:
- **Datakvalitet**: Data skal være korrekte fra de registreres. Inkorrekt data lagres trygt uten å påvirke systemet.

- **Skalerbarhet**: Dataarkitekturen må kunne håndtere økende datamengder og trafikk.

- **Periodisering**: All produsert data periodiseres for at tidligere kjøringer kan spores og etterprøves.

- **Bevaring av mellomliggende data**: Systemet består av flere batcher som videreformidler sine resultater videre til neste. Istedenfor å kun bevare sluttdataene, lagrer vi mellomdataene også, for å enklere kunne forstå oss på *hvorfor* dataene ble som de ble.



## Videre innhold
- [Datavalg](datavalg.md) – bakgrunn for hvorfor dataene ser ut slik de gjør,
- [Dataoversikt](tabellrelasjoner.png) – skisse over tabellene med relasjonene seg imellom,
- [Datakatalog](datakatalog.md) – beskrivelser av tabeller og attributter til dataene.
