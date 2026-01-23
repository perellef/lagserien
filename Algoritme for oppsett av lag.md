# Algoritme for oppsett av lag

## Introduksjon

Av alle funksjoner i systemet har den klart mest krevende delen vært å lage en algoritme for lagoppsett. Det har faktisk vært såpass krevende, at for å virkelig forstå kjernen av problemet, så har vi skrevet dette dokumentet. Målet er at dette gir innsikt til å forstå problemet godt, og at læringene lever videre. Til slutt presenteres løsningen.

Innholdfortegnelse:


## Oppgaven

For å forstå problemet må vi først forstå oppgaven. Allerede her kommer en viktig innsikt. 
- *oppgaven i sin kjerne er uoversiktlig*.

Vi gjør likevel et forsøk.

<hr>

Norsk Friidrett har mange klubber tilsluttet seg. Disse deltar automatisk i Lagserien med **lag**. Det er noen *divisjonsvarierte* regler for hvor mange og hva slags klubbresultater et lag kan ha. Øvrige klubbresultater kan brukes på opprette flere lag. Dermed kan en klubb fort ha mange lag.

Laget består av:
- En **obligatorisk oppstilling**: ForFor at et Den obligatoriske oppstillingen kan kun inneholde ett resultat per øvelse. Dessuten må øvelsen være en serieøvelse for at den skal kunne benyttes.
- En **valgfri oppstilling**.

Den obligatoriske oppstillingen kan kun inneholde ett resultat per øvelse. Dessuten må øvelsen være en serieøvelse for at den skal kunne benyttes.

<hr>

### Sammenlikning med Eliteserien i fotball serier

Å forstå seg på hvordan serien virker er komplisert. La oss ta en sammenlikning med Eliteserien i fotball. De har x antall lag, som spiller kamper mot hverandre, med utfallet: seier, uavgjort eller tap. Beregne lagets poeng: 3x antall seire + uavgjort. For å finne plassering er det å sortere på poeng, eventuelt måldifferanse og mål ved likhet. 

Det er en åpenbart mye mer komplisert serie enn Eliteserien. Men samtidig er det forståelig. Friidretten er lagt opp helt annerledes. Det må bli komplisert. Men det representerer en utfordring for systemet.  

## Behov

Hva skal til for at oppgaven kan sies er løst? Dette kan virke intuitivt, men la oss likevel formalisere det.

Vi har to krav til løsningen. Den må være _**korrekt**_ og _**effektiv**_.

- *Korrekthet*: At den er korrekt betyr at den setter opp lag som er *optimale* – det finnes ingen bedre måte å sette opp laget på.

- *Effektivitet*: At den er effektiv betyr ikke bruker unødvendig lang tid. –Men, hva er unødvendig lang tid? Det er lenger enn man *kan* eller *gidder* å la det ta.

### Litt om effektivitet

Vi bruker med vilje effektivitetsbegrepet feil her. Egentlig har effektivitet med **kjøretidskompleksitet** å gjøre. Kjøretidskompleksitet er hvordan kjøretiden utvikler seg med størrelse på inndata. Altså, hvis inndataen dobler i størrelse hvor mye lenger tid vil algoritmen bruke. Hvis:
- Lineært - O(n^2):
- Kvadratisk - O(n^2):
- Logaritmisk - O(n^2):

Se graf.


Effektivitet er egentlig om algoritmen har en unødvendig høy kjøretidskompleksitet. Hvis for eksempel inndata 

Så må man også ta i betraktning inndataene. Hvis for eksempel inndataene aldri blir større enn en viss størrelse vil det også påvirke.

Og her kommer paradokset:
- *det kan hende oppgaven ikke kan løses raskt selv om den er maksimalt effektiv*.

I de første versjonene var dette en reell tankevekker. Men heldigvis, slik som det set ut nå så er ikke dette tilfellet. For vi har klart å lage en rask nok algoritme nå. Men det stemmer kun for størrelsen på inndataene vi har nå. Det kan tenkes at aktiviteten ved senere år trappes opp, eller at flere resultater sentreres rundt færre klubber. Det kan altså hende at vi i fremtiden ikke vil kunna ha en algoritme om er rask nok, og det kan hende ingen finnes. 

Disse problemene kalles ofte NP-problemer, altså "non-polynomial". Dette betyr at de ikke har en polynomiell løsning, altså øker kjøretiden veldig raskt med voksende inndata.

### Travelling Saleman Problem

Et kjent NP-problem er *Travelling Salesman problem*. Denne går ut på at du ønsker å besøke en rekke byer med gitte avstander mellom hverandre. Du ønsker å finne raskeste rute gjennom alle.

En bruteforce algoritm må for n byer sjekke n! løsninger. Det finnes heldigvis forbedringer på algoritmen, men ikke nok til at kjøretidene eksploderer med økt inndata. 

## De første algoritmene 

De har vært mange forløpere til dagens algoritme.

### Bruteforce

Det aller første forsøket på algoritme var bruteforce, rett og slett å sjekke alle mulige permutasjoner. Da er du garantert det korrekte svaret. Og dette er det aller enkleste å skrive, og også derfor greit å prøve først.

Dette ble et blindskudd. Som forventet fløy kjøretiden ut av dimensjoner.

### Forutsi aktuelle resultater

Neste algoritme var utspekulert. Den gikk ut på å forutsi hvilke resultater som var obligatoriske, valgfri tekniske og valgfri løps-resultater. Noen visste man, mens de gjenværende prøvde man alle kombinasjoner av. Da hadde man luket ut nesten alle uinteressante oppstillinger og trengte kun vurdere et fåtall oppstillinger for å finne den beste

Dette var en algoritme som fungerte veldig godt – da. Den var aldri perfekt, den krevde en del tilpasninger. I starten var det et hundretall tilpasninger, men som resultat av stadig forbedringer ble det mot slutten rundt 10 årlig.

Svakheten dens var at den slet med utøvere med mer enn 5 resultater. Da ble det vanskelig å forutsi hvilke resultater den skulle ta med, så den tok med veldig mange. Og når den sjekket oppstillinger, kunne det hende den sjekket alle valgfrie oppstillinger til en obligatorisk oppstilling som var veldig dårlig. Den klarte ikke forkaste dårlige obligatoriske oppstillinger uten å gå gjennom hver tilhørende valgfri.   

### Se på hele oppstilling

For å fjerne svakheten med forrige, ble det laget en ny sofistikert algoritme. Denne kunne på en svært effektiv og spisset måte gå gjennom oppstillingene på. En oppstilling ble bygd opp resultat for resultat, og i det øyeblikk oppstillingen ikke tilfredsstilte kravene eller var for svak totaltsett, ble oppstillingen forkastet. En av de smarte løsningene var å bruke forrige oppstilling til å bygge opp den nye. Dette tok mye kortere tid enn å bygge den opp fra bunnen.

Algoritmen var først en stor suksess. Alle klubber for 2020-2024 gikk helt automatisk. De krevde ikke noen tilpasninger. Derimot ble aldri algoritmen tatt i bruk. I senhøsten dukket det opp nye resultater for Norodd kvinner som algoritmen rett og slett ikke taklet. I forsøk på å løse dette, ble det startet arbeid med å lage en helt ny algoritme. Dette endte opp som dagens løsning.

## Dagens algoritme

Dagens algoritme er faktisk blant de enklere å forstå seg på. Det kan instruktivt at oppgaver løses ved å komme så nærme problemet som mulig.


I tillegg var den mange færre sikre resultater, så alle disse usikre variantene ble sjekket. Og blant disse var det flere som reelt sett var uinteressante.

linger forholdsvis raskt å 


Diss Dessuten var det en del resultater som 







, men det er alltid greit å prøve. For hvis problemet kan løses med  


Før nåværende algoritme ble




- *hvordan vet vi om lagoppsettet er optimalt*

Sammenlikner vi med 



På denne måten kan en klubb ha mange lag. Derimot kan en utøver kun benyttes i et lag.


 kan stille for et lag. Gj

Vi ønker å sette opp lag 




at læringen tas med videre, og  innsikt om hvorfor utarbeidingen har vært så krevende. Det vil gjøre det enklere å forstå løsningen slik den er i dag. Til slutt går jeg grundig gjennom algoritmen.

Dette skyldes flere punkter, men et av de er at
- problemet i sin kjerne er uoversiktlig.

## Oppstillingsregler

Så hva kjennetegner et lag.






 Kort fortalt



komplisert.


- 

Ser 

Samtidig kan dataene fort bli uoversiktlige.



beregningskrevende.

Å finne en algoritme i 



ganske komplisert - . Man kan spørre seg




Men hI første omgang kan man spørre seg hva som gjør problemet nettopp det. Å finne en algoritme som gir riktig svar er en enkel sak. Men det er så fort man 

Det er store krav til både riktighet






, selv om den ikke er så vanskelig å forstå.





Det har vist seg svært utfordrende å lage en algoritme som både er riktig og effektiv.

I løpet av årene har det vært mange forbedringer av oppsettalgoritme. Dagens er et produkt at mange analyser optimalisert med hensyn på effektivitet, samt beregner riktig for kjente tidligere beregnede lag.

Dagens algoritme dekker behovet for effektivitet. 97% av klubbene tar mindre enn 1 sekund. Ingen tar mer enn 20 sekunder. Alt tilsier også at den beregner korrekt.

I begynnelsen var en utfordring å finne ut om lag var optimale. I senere tider har dette vært greiere å sjekke ved å sammenlikne med tidligere algoritmer.

Innholdsfortegnelse:
- dd
- dd

## Bakgrunn


Det er fascinerende at så enkle regel for oppsett gir opphav til et så ulent problem. 

Statuttene har noen regler for hva som er en gyldig oppstilling. Utover disse er det mange muligheter. Sammenlikner man de beste oppstillingene kan det være store forskjeller.
- Utfordringen med å lage algoritmen er å snevre inn antall oppstillinger som sjekkes. Det er vrient å finne en algoritme som både snevrer inn aktuelle oppstillinger uten å miste potensielt bedre oppstillinger. 

- Et annet punkt er at overganger fra å sjekke en oppstilling til en annen burde være gjort på en måte som ikke tar mye tid.

## Algoritme forklart

Algoritmen kan forklares ganske enkelt:
1. Ta utgangspunkt i en optimal oppstilling uten følgende krav:
   - under 5 resultater per utøver
   - maksimalt antall obligatoriske løpsøvelser
   - maksimalt antall valgfrie løpsresultater
2. Gjenta følgende:
	1. Ta en oppstilling.
	    - Hvis den bryter en av kravene nevnt over: gjør noe med det. Legg den nye oppstillingen inn i rekka.
		- Hvis ikke: sjekk om den har mer poeng enn beste foreløpig.


Første forsøk på en algoritme 

Det 


Første versjon I de første versjonene har det vært brukt algoritmer som har behøvd manuell tilpasning av resultater for visse klubber. Det har selvsagt ikke vært ideelt, men svært mye bedre enn de 


te 


tidligere versjoner har det algoritmer vært algoritmer som . I ettertid har det vært enklere å ettersjekke at lagene faktisk er riktig ved å sammenlikne med tidligere versjoner.

En riktig algoritme har alltid vært 

Å lage en algoritme som har væ tilstrekkelig g

I tidligere versjoner har det vært  













# Nedenfor fjernes

 
**Beregningsstrategi**


Etter å ha aktuelle resultatbolker til en klubb finnes det mange oppstillinger. En analyse viser at for alle lag i 2021 fantes det totalt XXXX antall oppstillinger. For å unngå å måtte beregne seg gjennom alle lag (som ville gjort systemet tregt). Kalkulatoren benytter seg av en egenutviklet strategi som beregner seg gjennom oppstillinger mye mer effektivt. 


**OBLIGATORISK OPPSTILLING**


Frem til nå har vi sett på disse tilstandsvariablene som noe statisk. Men tanken bak strukturen er å effektivt se gjennom interessante oppstillinger.

Dette gjøres ved å for hver oppstilling vurdere om de er videre interessante eller ikke. Tre muligheter:
	1. Hvis interessant: øk resultatindeks eller lagre oppstilling
	2. Hvis uinteressant: oppdater tilstand fra resultatindeks. Resultatindeks kan også måtte bli oppdatert som en konsekvens.



Det sentrale med denne strategien er at det strukturen tillater at man med tre enkle regler går gjennom alle interessante obligatoriske oppstillinger. Og i det en oppstilling blir uinteressant vil den med en gang forkastes. Det eneste som da trengs vil være en fornuftig vurdering av om en oppstilling er interessant.


**Predikat av interessant oppstilling**

Det kan tenkes at man står fritt til å velge et predikat på interessant oppstilling og ikke, men fremgangsmåten har ett viktig premiss: En interessant oppstilling kan ikke ha en deloppstilling som er uinteressant. Hvis deloppstillingen er uinteressant, forkastes oppstilling. Dette er hele poenget med strategien - at man så fort som mulig kvitter seg med unødvendige oppstillinger. 

Et eksempel som illustrerer dette er følgende predikat: en interessant oppstilling har over 1000 poeng. Hvis en oppstilling inneholder to resultater som totalt gir 800 poeng vil oppstillingen være uinteressant. Men hvis den får et resultat med 400 poeng vil oppstillingen igjen være interessant. Dette bryter med premisset.

Det er ønskelig å velge predikater som innsnevrer antall oppstillinger mest mulig. Det er nærliggende å tillegge oppstillingene følgende predikater.

En obligatorisk oppstilling er uinteressant hvis:
- en utøver har mer enn 5 resultater,
- det benyttes flere løpsresultater enn det maksimalt tillatte,
- sideøvelser må komme i forventet rekkefølge 

Som tidligere nevnt var det for 2021 i lagserien XXXX antall obligatoriske oppstillinger. Med strategien brukt ovenfor er disse redusert til XXXX. Dette er selvsagt mye bedre, men systemet presterer fremdeles svakt. Vi kan gjøre bedre.


**VALGFRI OPPSTILLING**


Ved å se nærmere på egenskaper som gjør en obligatorisk oppstilling spennende så virker det nærliggende at seriepoengene ha sammenheng. En oppstilling er vel ikke særlig interessant hvis den har lite poeng, fordi da blir den utkonkurrert. Det viser seg derimot at det ikke er så rett frem å vurdere obligatorisk oppstillinger basert på deres seriepoeng, fordi også valgfri oppstilling gir seriepoeng. Den kan hende at en obligatorisk oppstilling virker svak, men gir en svært gunstig valgfri oppstilling, og at denne kombinasjonen er best. Vi burde altså vurdere totalpoengene opp mot hverandre, altså se på den komplette oppstillingen.

Dette gir oss følgende predikat: 

En obligatorisk oppstilling er uinteressant hvis:
- dens poeng pluss poengene til best tenkelige tillatte valgfri oppstilling er mindre enn en tidligere funnet poeng.

For å kunne bruke dette predikatet må man kunne finne en best tenkelig tillatt valgfri oppstilling. Også her brukes det en egenutviklet strategi.

**Strategien**


... 




