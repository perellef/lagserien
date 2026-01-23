
# Datavalg

Her kan du lese mer om bakgrunnen til dataene til seriesystemet. For å heller se hvordan dataene ser ut, sjekk [datakatalogen](datakatalog.md).

## Grunnlagsdata

Grunnlagsdata er data forutsettes av systemet. Dette er til forskjell fra [produsert data](##produsert-data) (se seksjon nedenfor).

### Innhentet data
Systemet henter en data fra statistikken. Vi får informasjon om:
- __*resultater*__,
- __*klubber*__,
- __*øvelser*__,
- __*utøvere*__,
- __*stevner*__,
- __*stevneinvitasjoner*__.

Resten persisteres kun i seriesystemet.

### Serier

Vi har en egen tabell som viser når en serie starter og slutter. Dette er normalt sett fra 1. januar til 31. desember, men kan unntaksvis avvike, slik som i 2020-sesongen. Den viser også dato serien er publisert, som er relevant da flere resultater ofte blir innrapportert i ettertid.
- _**serier**_

### Koblinger

Fra statistikken er vi gitt koblinger:
 - *resultat*-*øvelse* 
 - *resultat*-*utøver* 
 - *resultat*-*stevne*
 - *resultat*-*klubb*

De tre første stoler vi på, men sistnevnte viser ikke alltid den klubben et resultat skal gjelde for. Dette skyldes klubboverganger.

### Klubboverganger

Klubbovergang er når en utøver deltar for en annen klubb enn den utøveren tilhører. Disse kan oppstå på to måter:
- *Ferierepresentasjon* – i sommerferieperioden kan en utøver stille for en annen klubb, typisk i forbindelse med hjemreise til familie.

- *Klubboverbygning* – visse klubber har samarbeid mellom seg. Utøverne stiller under overklubben i storstilte stevner, mens ellers moderklubben. Lagseriens overbygningsregler skiller seg litt fra friidretten for øvrig.

Statistikkens *resultat*-*klubb* kobling har tatt høyde for ferierepresentasjon, men ikke klubboverbygning.

Klubboverbygning, med de mange reglene som følger med, gir opphav til en rekke nye tabeller:
 - __*Overklubber*__ – tabell med overklubber, samt aldersbetingelser for flytt av utøver.
 - __*Overbygninger*__ – tabell med overbygninger mellom overklubb og moderklubb.
 - __*Klubber unntatt overbygning*__ – tabell med overklubb og moderklubb som samarbeider ellers, men ikke i lagserien.
 - __*Utøvere unntatt overbygning*__ – tabell med en håndfull utøvere som er unntatt denne overbygningsordning.

### Tillatt resultat

Det persisteres også tabeller i forbindelse med om et resultat er godkjent. Resultater av rullestolutøvere skal fjernes. Det gir tabellen:
- _**Rullestolutøvere**_

Vi har også to krav til resultatet. Et manuelt resultat skal kun godkjennes hvis øvelsen tillater manuell tid. Dessuten er det tilatt med et mellomtid-resultat hvis totaløvelsen ikke er en serieøvelse. Begge disse er håndtert med tabellen:
- _**Øvelsesregler**_

Merk at det også er krav til at en utøver skal være minst 11-år for at resultatet skal godkjennes. Dette er i dag hardkodet i systemet.

### Resultatbytter

Tanken var at utledning av klubb skulle gjøres helt automatisk uten behov for å manuelt bytte klubb. I ettertid viste det seg at det finnes noen situasjoner som rett og slett må håndteres manuelt. Det er særlig to situasjoner:
1. Ved klubber unntatt overbygning hender det at en klubb kun har deltatt for overklubben. Om utøveren ikke har deltatt for moderklubben, blir resultatet værende fordi det ikke finnes noen måte å vite at utøveren egentlig tilhører moderklubben. (Dette fordi det mangler en *utøver*-*klubb* kobling.)

2. Et resultat kan dukke opp uten at utøveren fyller kriteriet at de har oppholdt seg i Norge sammenhengende i mer enn de 3 siste månedene forut for konkurransen.

Dessuten finnes noen scenarier med skjønnsmessige vurderinger. Derfor har det vært nødvendig med en tabell der du kan sette klubb manuelt:
- _**resultatbytter**_

### Grunnlagsdata til kalkulator

Systemets mest sentrale del er kalkulatoren. Helt sentralt er det å ha en oversikt over hvilken divisjon lag plasseres i:
- _**menn_topplag**_ 
- _**kvinner_topplag**_

Det er dessuten noen beregningsrelaterte verdier som endrer seg fra år til år. Et prinsipp for systemet er at man skal kunne kjøre tilbake i tid. Derfor er det nødvendig å bevare disse verdiene:
- *Øvelsestype*: Vi trenger å vite hvilke øvelser som skal gjelde for serien. Dette endrer seg fra år til år. Dessuten må vi vite hvilke som er obligatoriske og tekniske. Vi trenger også å vite øvelsesrekkefølge for obligatorisk oppstilling. 

- *Beregningsparametre*: Vi trenger å vite hvor mange resultater det skal være i valgfri og obligatorisk oppstilling, samt hvor mange av dem som må være tekniske. Det er dessuten valgt å ha med maks antall resultater per utøver. Dette er strengt tatt ikke nødendig nå, men kan bli det i fremtiden. 

Derfor har vi tabellene:
- _**menn_øvelsesinfo**_
- _**kvinner_øvelsesinfo**_ 
- _**oppstillingskrav**_


## Produsert data

Seriesystemet produserer mye data. Det viktigste er selvsagt lagoppsett og tabell. Men serien produserer også en del biprodukter, produsert av Batch 2 og 3.

Det er et interessant samspill mellom Batche 2, 3 og 4. De kjører alle hver dag, og utdata fra Batch 2 er inndata i Batch 3. Tilsvarende er utdata fra Batch 3 inndata i Batch 4.

Grunnen til at biproduktene er bevart er at de er nyttig for å forstå seg på systemet – særlig hvis ting ser rare ut.

### Uttrekksbatch

Uttrekksbatch har i hovedoppgave å lese inn data, ikke produsere. Erfaring derimot tilsier at resultater lest inn en dag kan være borte en annen. Dessuten kan de være korrigert slik at de ikke lenger ser ut som de gjorde.

For å lese dette er opprettet tabeller:
- _**menn_uttrekksresultater**_
- _**kvinner_uttrekksresultater**_

Disse er periodisert. Altså vises det når et resultat gjelder fra og til. I utgangspunktet er til-datoen løpende, altså fortsetter til evig tid. Men skulle resultatet mangle en dag, får den en til-dato.  

En annen ting uttrekksbatchen produserer er:
- _**klubbkretser**_.

Dette er en tabell som angir hvilken krets en klubb gjelder for. Denne er også periodisert for å ta høyde for at den endres over tid.

Å vite krets er ikke essensielt. Den brukes kun til å vise kretsen til klubbene i serietabellen.

### Tildelingsbatch

Tildelingsbatchen har to oppgaver:
1. Beregne et resultats poeng
2. Avgjøre klubben resultatet gjelder for.

Likevel kan begge disse sammenfattes til én tabell per kjønn:
- _**menn_serieresultater**_
- _**kvinner_serieresultater**_

Hver tabell inneholder kort og greit resultatet med tilhørende *poengverdi* og *klubb* (kan være ingen).

I tillegg er serieresultatene periodisert. Forklaringen på denne er rett og slett at systemendringer kan forekomme. Naturlige tilfeller tilhører de sjeldne, men for eksempel kan en ny klubbovergang legges til midt i sesongen. Da vil utledet klubbverdi endres, og vi får en ny periode.

### Kalkulatorbatchen

Kalkulatorbatchen produserer mye data. Dette skyldes at informasjon om lagoppsett er splittet opp i mindre tabeller:
- _**menn_lag**_
- _**menn_laginfo**_
- _**menn_lagresultater**_
- _**menn_lagplasseringer**_
- _**kvinner_lag**_
- _**kvinner_laginfo**_
- _**kvinner_lagresultater**_
- _**kvinner_lagplasseringer**_

Tilsvarende uttrekks- og serieresultater er tabellene periodisert.

En ulempe med *lagplasseringer*-tabellene slik de ser ut i dag er at 
er de angir plasseringen i divisjonen. For tredjedivisjonslag hender det at klubber får stor økning i poeng, og avanserer mange plasser. Alle nedskyvede klubber får da nye rader. Særlig på slutten av sesongen mange korte perioder av lagplasseringer.

En løsning på dette problemet hadde vært å angi laget man ligger bak. Slik kan tabellen utledes, for eksempel med et view for å forenkle prosessen.

En annen løsning kunne være å ha resultatpoengene som en kommaseparert streng i laginfo (typ. "1000,0998,0991...") og sortere på dette ved poenglikhet. 

Det siste kalkulatorbatchen produserer er:
- _**menn_utøver_merverdi**_
- _**kvinner_utøver_merverdi**_

Disse brukes for å helt konkret kunne vise til hvor mange poeng en utøver bidro med til laget.