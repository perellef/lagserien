
# Datakatalog

Her har du en oversikt over tabeller og attributter. Ønsker du å forstå deg på *hvorfor* snarere enn *hva* bør du heller ta en titt på [datavalg](datavalg.md).

Se [dataoversikt](tabellrelasjoner.png) for skisse over tabellene med relasjonene seg imellom.

#

*Tips*: Trykk på tabellnavn og attributter for å lese mer; 🔑 viser primærnøkler.

                
### UTTREKK

<table>        
        <tr>
            <td valign="top">
                <table>        
                    <tr>
                        <td colspan="2"><details><summary style="list-style: none;" ><strong>RESULTATER</strong></summary><br>
                                Tabell med resultater hentet fra statistikken. Resultatene er knyttet til følgende tabeller
                            <ul>
                                <li><code>UTTREKKSRESULTATER</code>: angir hvilken klubb resultatet var registrert med i samt perioden den gjelder for.</li>
                                <li><code>SERIERESULTATER</code>: angir poengene resultatet gir og hvilken klubb resultatet tildeles.</li>
                                <li><code>LAGRESULTATER</code>: angi hvilke lag resultatet inngår i.</li>
                            </ul>
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 resultat_id</summary><br>
                            Identifikator for resultatet, opprettet internt i seriesystemet. Denne skiller seg fra <code>statistikk_resultat_id</code>, som kommer direkte fra statistikken.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">stevne_id</summary><br>Referanse til stevnet (i <code>STEVNER</code>) resultatet ble oppnådd på.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">utøver_id</summary><br>
                            Referanse til utøveren (i <code>UTØVERE</code>) som oppnådde resultatet.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                    <td>
                        <details><summary style="list-style: none;">øvelseskode</summary><br>
                            Referanse til øvelsen (i <code>ØVELSER</code>) resultatet gjelder.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">prestasjon</summary><br>
                            Den faktiske prestasjonen i øvelsen, uttrykt som tid eller lengde. Eksempler er <code>7,2</code> (60m) og <code>60,52</code> (spyd) og <code>36,26,65</code> (10000m). Feltet støtter flere formater. Tider kan ha suffiks <code>+</code> for mellom tid eller <code>mx</code> for miksløp. Dersom formatet ikke kan tolkes, vil <code>poeng</code> være <code>null</code> i <code>SERIERESULTATER</code>.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">dato</summary><br>
                            Datoen konkurransen ble avholdt. Denne kan avvike fra stevnedatoen hvis stevnet foregår over flere dager.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">statistikk_resultat_id</summary><br>
                            Identifikator for det <em>faktiske</em> resultatet, innlest fra statistikken. I motsetning til <code>resultat_id</code> blir denne identifikatoren bevart ved korreksjon av resultatet. Dette er nyttig i <code>RESULTATBYTTER</code> som ikke trenger å få opprettet et nytt resultatbytte.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>STEVNER</strong></summary><br>
                                Tabell med stevner hentet fra statistikken.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 stevne_id</summary><br>
                        Identifikator for stevnet, innlest fra statistikken.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">stevnedato</summary><br>
                            Datoen stevnet starter, også om stevnet varer over flere dager.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">stevnetittel</summary><br>
                            Stevnets navn, slik det er registrert i statistikken. 
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">arena</summary><br>
                            Arenaen eller stedet stevnet ble arrangert. Et friidrettsstevne som foregår over flere arenaer er splittet opp i separate stevner.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">er_nasjonalt</summary><br>
                            Angir om stevnet ble arrangert i Norge.
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">rapportert</summary><br>
                            Datoen stevnet først ble lest inn i seriesystemet. Nyttig for å analysere etterrapportering og forsinkelse.
                        </details></td>
                        <td>dato</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>UTØVERE</strong></summary><br>
                            Tabell med utøvere hentet fra statistikken.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 utøver_id</summary><br>
                        Identifikator for utøveren, innlest fra statistikken. Det kan finnes flere utøvere med samme <code>navn</code> og <code>fødelsår</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">navn</summary><br>
                        Utøverens fulle navn slik det er registrert i statistikken. Navnet kan variere noe fra gang til gang.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                        <td><details><summary style="list-style: none;">fødselsår</summary><br>
                            Utøverens fødelsår. For enkelte utøvere er denne ukjent, angitt med <code>null</code>. Dette gjelder typisk veteranutøvere.
                        </details></td>
                        <td>tall*</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>SERIER</summary><br>
                            Tabell med serier. Det er en serie hvert år.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                        Året serien gjelder for.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">fra_og_med</summary><br>
                        Startdato for serien, normalt 1. januar.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                        Sluttdato for serien, normalt 31. desember.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">avsluttet</summary><br>
                            Datoen serien offisielt ble avsluttet og publisert, vanligvis rundt én måned etter serieslutt på grunn av etterrapportering. Feltet er  <code>null</code> mens serien pågår.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>ØVELSER</strong></summary><br>
                            Tabell over øvelser.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 øvelseskode</summary><br>
                            Fast kode for øvelsen, oversatt fra identifikator i statistikken. Eksempler er <code>60</code>, <code>110h</code> og <code>høyde</code>.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">øvelsesnavn</summary><br>
                            Navnet til øvelsen på lesevennlig form. Eksempler er <code>60m</code>, <code>110m hekk</code> og <code>Høyde</code>.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KLUBBER</strong></summary><br>
                            Tabell over registrerte klubber i statistikken.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                         Identifikator for klubben, innlest fra statistikken.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubbnavn</summary><br>
                        Klubbens navn slik det leses inn fra statistikken. Navnet kan variere noe fra gang til gang.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">kjernenavn</summary><br>
                        Standardisert variant av klubbnavnet som holdes konstant over tid. Utledes fra <code>klubbnavn</code> ved å fjerne vanlige pre- og suffikser. Eksempler er <code>Ås</code> og <code>Tjalve</code>. Brukes sammen med <code>klubb_id</code> ved manuelle føringer for å sikre at ID-en stemmer med riktig klubb.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>MENN UTTREKKSRESULTATER</strong></summary><br>
                            Tabell over menns resultater periodisert etter når de var registrert i statistikken. Hensikten er å ha kontroll ved korrigering eller fjerning av resultater.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 resultat_id</summary><br>
                            Referanse til resultatet (i <code>RESULTATER</code>) .
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                        Første dato resultatet ble tilordnet klubben, eller gjeninnført.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                             Siste dato resultatet var tilordnet klubben. Feltet er <code>null</code> hvis resultatet fortsatt gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) resultatet var registrert med i statistikken.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KVINNER UTTREKKSRESULTATER</strong></summary><br>
                            Tabell over kvinners resultater periodisert etter når de var registrert i statistikken. Hensikten er å ha kontroll ved korrigering eller fjerning av resultater.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 resultat_id</summary><br>
                            Referanse til resultatet (i <code>RESULTATER</code>) .
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                            Første dato resultatet ble tilordnet klubben, eller gjeninnført.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                             Siste dato resultatet var tilordnet klubben. Feltet er <code>null</code> hvis resultatet fortsatt gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) resultatet var registrert med i statistikken.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KLUBBKRETSER</strong></summary><br>
                            Tabell med periodisert oversikt over klubbers tilhørende friidrettskrets.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) med kretsen.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                            Første dato klubben ble tilordnet kretsen, eller gjeninnført.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                             Siste dato klubben var tilordnet kretsen. Feltet er <code>null</code> hvis kretsen fortsatt gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">krets</summary><br>
                        Friidrettskretsen. Eksempler er <code>Oslo og Akershus</code>, <code>Hordaland</code> og <code>Innlandet</code>. Enkelte har rare kretser som <code>Sverige</code> eller <code>Ukjent</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
        </tr>
</table>
  
<div style="display: flex; flex-wrap: wrap; gap: 10px;">
</div>

<br>


### TILDELING

<table>        
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>RESULTATBYTTER</strong></summary><br>
                            Tabell for manuelle endringer av hvilken klubb et resultat tildeles. Skal brukes med varsomhet, kun der systemet logikk ikke er tilstrekkelig eller der skjønnsmessige vurderinger er nødvendige.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 statistikk_resultat_id</summary><br>
                            Referanse til ett eller flere resultater (i <code>RESULTATER</code>) som skal få klubb satt manuelt.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) resultatet skal tildeles. Kan være <code>null</code> dersom resultatet ikke skal tildeles noen klubb.
                        </details></td>
                        <td>tall*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">dato</summary><br>
                            Dato resultatbyttet ble registrert i systemet. Hvis flere bytter finnes for samme <code>statistikk_resultat_id</code>, benyttes det med seneste dato.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">notat</summary><br>
                            Kort begrunnelse for hvorfor resultatbyttet er lagt inn.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none"><strong>ØVELSESREGLER</strong></summary><br>
                            Tabell med regler for hva slags resultater som godkjennes innen en øvelse.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) regelen gjelder for.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 øvelseskode</summary><br>
                            Refererer til øvelsen (i <code>ØVELSER</code>) regelen gjelder for.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">mellomtidgruppe</summary><br>
                            Navnet på mellomtidgruppen, dersom øvelsen inngår i en slik gruppe. Er <code>null</code> dersom øvelsen ikke inngår i noen gruppe.<br>
                            <br>
                            En mellomtidgruppe består av løpsøvelser der kortere distanser kan godkjennes som mellomtider i en lengre øvelse. For eksempel kan en 10 000m gi gyldige mellomtider for 60m, 100m, 200m, 400m, 800m, 1500m, 3000m og 5000m. Disse er altså i én og samme mellomtidgruppe. Det samme gjelder kappgang-øvelser. Hekkeløp inngår ikke i en mellomtidgruppe  fordi de har ulik hekkeavstand og -høyde. Dette gjelder også tekniske øvelser.<br>
                            <br>
                            Mellomtidgrupper brukes for å avgjøre om et mellomtidsresultat (markert med <code>+</code> i prestasjonen). Et slikt resultat kan kun godkjennes hvis det ikke finnes et resultat på lengre distanse i samme gruppe fra samme konkurranse.<br>
                            <br>
                            I år der mellomtider ikke tillates settes 
                            samtlige øvelser til <code>null</code>.
                        </details></td>
                        <td>tekst*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">mellomtidgruppe_distanse</summary><br>
                        Rekkefølge på distanser i mellomtidgruppen, der lav verdi indikerer kort distanse. Brukes for å utlede hvilke lengre distanser som tilhører samme mellomtidgruppe. Er <code>null</code> dersom øvelsen ikke inngår i noen mellomtidgruppe.</details></td>
                        <td>tekst*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">forutsetter_elektronisk_tidtakning</summary><br>
                            Angir om manuelle tider tillates i øvelsen. Manuelle tider har én desimal (f.eks <code>7,2</code>), mens elektroniske tider har to (f.eks <code>7,20<code>).
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none"><strong>RULLESTOLUTØVERE</strong></summary><br>
                            Tabell over parautøvere i rullestol som skal utelates fra serien. Systemet støtter per i dag utelatelse for hele serieåret, men det kan bli behov for å tillate utøveren for deler av serien i fremtiden.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) utøveren skal utelates fra.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 utøver_id</summary><br>
                            Referanse til parautøveren (i <code>UTØVERE</code>) som benytter rullestol.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none"><strong>OVERKLUBBER</strong></summary><br>
                            Tabell over klubber som er overklubb i en overbygning, og dermed skal motta resultater fra én eller flere moderklubber.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) der klubben er overklubb.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 overklubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) som er overklubb.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">alder_11_14</summary><br>
                            Angir om resultater fra utøvere i alderen 11–14 år skal overføres til overklubben.
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">alder_15_19</summary><br>
                            Angir om resultater fra utøvere i alderen 15–19 år skal overføres til overklubben.
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">alder_20_pluss</summary><br>
                            Angir om resultater fra utøvere fra og med 20 år skal overføres til overklubben.
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none"><strong>OVERBYGNINGER</strong></summary><br>
                            Tabell over samarbeidsforhold i form av overbygning mellom moderklubber og overklubber.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) overbygningen finner sted.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 moderklubb_id</summary><br>
                            Referanse til moderklubben (i <code>KLUBBER</code>) som avgir resultater til overklubben innen angitte aldersgrupper.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none">overklubb_id</summary><br>
                            Referanse til overklubben (i <code>OVERKLUBBER</code>) som mottar moderklubbens resultater.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none"><strong>KLUBBER UNNTATT OVERBYGNING</strong></summary><br>
                            Tabell over klubber som har overbygningsforhold ellers i friidretten, men ikke i Lagserien. Resultater av moderklubbens utøvere registrert under overklubben i statistikken, skal overføres til moderklubben
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) unntaket fra overbygning finner sted.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 moderklubb_id</summary><br>
                            Referanse til moderklubben (i <code>KLUBBER</code>) som mottar resultater fra overklubben.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">overklubb_id</summary><br>
                            Referanse til overklubben (i <code>OVERKLUBBER</code>) som avgir resultater til moderklubben.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none"><strong>UTØVERE UNNTATT OVERBYGNING</strong></summary><br>
                            Tabell over utøvere unntatt fra moderklubbens overbygning. Deres resultater overføres ikke til overklubben.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) unntaket gjelder for.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 utøver_id</summary><br>
                            Referanse til utøveren (i <code>UTØVERE</code>) som er unntatt overbygning.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">moderklubb_id</summary><br>
                            Referanse til moderklubben (i <code>KLUBBER</code>) som beholder og eventuelt får utøverens resultater hos overklubben.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;"><strong>MENN SERIERESULTATER</strong></summary><br>
                            Tabell over poengberegnede resultater og klubben de er tildelt. For hver utøver beholdes kun beste resultat per øvelse. Resultater med <code>0</code> poeng er også fjernet. Poeng er <code>null</code> hvis resultatets <code>prestasjon</code> er utolkbart. Tildelt klubb er <code>null</code> dersom resultatet er ugyldig.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 resultat_id</summary><br>
                            Referanse til resultatet (i <code>RESULTATER</code>) som er poengberegnet og tildelt.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                        Startdato for perioden serieresultatet gjelder for.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                        Sluttdato for perioden serieresultatet gjelder for.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng</summary><br>
                            Poeng beregnet for resultatet. Er <code>null</code> dersom prestasjonen ikke kunne tolkes.
                        </details></td>
                        <td>tall*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Klubben (i <code>KLUBBER</code>) resultatet er tildelt. Kan være null dersom resultatet er ugyldig.
                        </details></td>
                        <td>tall*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">forløp</summary><br>
                            Beskrivelse av hvorfor resultatet ble tildelt klubben.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none"><strong>KVINNER SERIERESULTATER</strong></summary><br>
                        Tabell over poengberegnede resultater og klubben de er tildelt. For hver utøver beholdes kun beste resultat per øvelse. Resultater med <code>0</code> poeng er også fjernet. Poeng er <code>null</code> hvis resultatets <code>prestasjon</code> er utolkbart. Tildelt klubb er <code>null</code> dersom resultatet er ugyldig.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 resultat_id</summary><br>
                            Referanse til resultatet (i <code>RESULTATER</code>) som er poengberegnet og tildelt.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                        Startdato for perioden serieresultatet gjelder for.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                        Sluttdato for perioden serieresultatet gjelder for.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng</summary><br>
                            Poeng beregnet for resultatet. Er <code>null</code> dersom prestasjonen ikke kunne tolkes.
                        </details></td>
                        <td>tall*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Klubben (i <code>KLUBBER</code>) resultatet er tildelt. Kan være null dersom resultatet er ugyldig.
                        </details></td>
                        <td>tall*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">forløp</summary><br>
                            Beskrivelse av hvorfor resultatet ble tildelt klubben.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                </table>
            </td>
        </tr>
</table>

### SERIE

<table>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>OPPSTILLINGSKRAV</strong></summary><br>
                            Tabell over krav til antall øvelser av visse typer.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) oppstillingskravet gjelder for.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 divisjon</summary><br>
                            Divisjonen oppstillingskravet gjelder for.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">antall_obligatoriske</summary><br>
                            Maks antall resultater som kan brukes i obligatorisk oppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">antall_valgfri</summary><br>
                            Maks antall resultater som kan brukes i valgfri oppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">maks_obligatoriske_løp</summary><br>
                            Maks antall løpsresultater som kan inngå i obligatorisk oppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">maks_valgfri_løp</summary><br>
                            Maks antall løpsresultater som kan inngå i valgfri oppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">maks_resultater_per_utøver</summary><br>
                            Maks antall resultater per utøver.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>MENN TOPPLAG</strong></summary><br>
                            Tabell over lag i de to øverste divisjonene.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">divisjon</summary><br>
                            Divisjonen laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>MENN SERIEØVELSER</strong></summary><br>
                            Tabell over seriens øvelser og deres kategorier.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) øvelsen er serieøvelse i.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 øvelseskode</summary><br>
                            Referanse til øvelsen (i <code>ØVELSER</code>) som er serieøvelse.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">er_obligatorisk</summary><br>
                            Angir om øvelsen er obligatorisk.
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">er_teknisk</summary><br>
                            Angir om øvelsen er teknisk. Hvis ikke, er det en løpsøvelse.
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">prioritet</summary><br>
                            Prioriteten til øvelsen, brukt til å sortere resultater i obligatorisk resultateroppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>MENN LAG</strong></summary><br>
                            Tabell over seriens lag.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>MENN LAGINFO</strong></summary><br>
                            Tabell med informasjon om laget. Lagets plassering finnes i <code>MENN LAGPLASSERINGER</code>, mens lagets resultater i <code>MENN LAGRESULTATER</code>.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                            Startdato for perioden informasjonen gjelder.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                            Sluttdato for perioden. Er <code>null</code> hvis informasjonen fremdeles gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng</summary><br>
                            Totalpoeng for laget (summen av enkeltresultatene).
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng_obligatoriske</summary><br>
                            Summen av enkeltresultater i obligatorisk oppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng_valgfri</summary><br>
                            Summen av enkeltresultater i valgfri oppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">antall_noteringer</summary><br>
                            Antall resultater som inngår i laget. Kan være lavere enn oppstillingskravet dersom ikke alle resultatfelter fylles.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">antall_deltakere</summary><br>
                            Attributt med antall deltakere. Tomme resultatfelter ignoreres.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>MENN LAGPLASSERING</strong></summary><br>
                            Tabell med lagenes plasseringer. Poeng finnes i <code>MENN LAGINFO</code>, mens lagets resultater i <code>MENN LAGRESULTATER</code>.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                           Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 divisjon</summary><br>
                            Divisjonen laget er plassert i.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 plassering</summary><br>
                            Lagets plassering i divisjonen.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                            Startdato for perioden plasseringen gjelder.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                            Sluttdato for perioden. Er <code>null</code> dersom den fortsatt gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>MENN LAGRESULTATER</strong></summary><br>
                            Tabell over resultater som inngår i lagene.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 resultat_id</summary><br>
                            Referanse til resultatet (i <code>RESULTATER</code>) som inngår i laget.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">fra_og_med</summary><br>
                            Startdato for perioden resultater inngår i laget.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                            Sluttdato for perioden. Er <code>null</code> dersom den fortsatt inngår i laget.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">oppstillingstype</summary><br>
                            Angir om resultatet tilhører <code>OBLIGATORISK</code> eller <code>VALGFRI</code> oppstilling.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>MENN UTØVERE MERVERDIER</strong></summary><br>
                            Tabell over poengmerverdi en utøver tilfører laget.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) utøveren har merverdien i.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 utøver_id</summary><br>
                            Referanse til utøveren (i <code>UTØVEREN</code>) som står for poengforbedringen.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                            Startdato for perioden utøveren har merverdien.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                            Sluttdato for perioden. Er <code>null</code> dersom merverdien fortsatt gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng</summary><br>
                            Antall poeng utøveren tilfører laget.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KVINNER TOPPLAG</strong></summary><br>
                            Tabell over lag i de to øverste divisjonene.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">divisjon</summary><br>
                            Divisjonen laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KVINNER SERIEØVELSER</strong></summary><br>
                            Tabell over seriens øvelser og deres kategorier.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) øvelsen er serieøvelse i.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 øvelseskode</summary><br>
                            Referanse til øvelsen (i <code>ØVELSER</code>) som er serieøvelse.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">er_obligatorisk</summary><br>
                            Angir om øvelsen er obligatorisk.
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">er_teknisk</summary><br>
                            Angir om øvelsen er teknisk. Hvis ikke, er det en løpsøvelse.
                        </details></td>
                        <td>boolsk</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">prioritet</summary><br>
                            Prioriteten til øvelsen, brukt til å sortere resultater i obligatorisk resultateroppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KVINNER LAG</strong></summary><br>
                            Tabell over seriens lag.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KVINNER LAGINFO</strong></summary><br>
                            Tabell med informasjon om laget. Lagets plassering finnes i <code>KVINNER LAGPLASSERINGER</code>, mens lagets resultater i <code>KVINNER LAGRESULTATER</code>.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                            Startdato for perioden informasjonen gjelder.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                            Sluttdato for perioden. Er <code>null</code> hvis informasjonen fremdeles gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng</summary><br>
                            Totalpoeng for laget (summen av enkeltresultatene).
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng_obligatoriske</summary><br>
                            Summen av enkeltresultater i obligatorisk oppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng_valgfri</summary><br>
                            Summen av enkeltresultater i valgfri oppstilling.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">antall_noteringer</summary><br>
                            Antall resultater som inngår i laget. Kan være lavere enn oppstillingskravet dersom ikke alle resultatfelter fylles.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">antall_deltakere</summary><br>
                            Attributt med antall deltakere. Tomme resultatfelter ignoreres.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KVINNER LAGPLASSERING</strong></summary><br>
                            Tabell med lagenes plasseringer. Poeng finnes i <code>KVINNER LAGINFO</code>, mens lagets resultater i <code>KVINNER LAGRESULTATER</code>.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                           Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 divisjon</summary><br>
                            Divisjonen laget er plassert i.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 plassering</summary><br>
                            Lagets plassering i divisjonen.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                            Startdato for perioden plasseringen gjelder.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                            Sluttdato for perioden. Er <code>null</code> dersom den fortsatt gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KVINNER LAGRESULTATER</strong></summary><br>
                            Tabell over resultater som inngår i lagene.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">lagnummer</summary><br>
                            Lagets nummer i klubben, for eksempel <code>2</code> for <code>Ås IL 2. lag</code>.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 resultat_id</summary><br>
                            Referanse til resultatet (i <code>RESULTATER</code>) som inngår i laget.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 fra_og_med</summary><br>
                            Startdato for perioden resultater inngår i laget.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                            Sluttdato for perioden. Er <code>null</code> dersom den fortsatt inngår i laget.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">oppstillingstype</summary><br>
                            Angir om resultatet tilhører <code>OBLIGATORISK</code> eller <code>VALGFRI</code> oppstilling.
                        </details></td>
                        <td>tekst</td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <table>
                    <tr><td colspan="2"><details><summary style="list-style: none;" ><strong>KVINNER UTØVERE MERVERDIER</strong></summary><br>
                            Tabell over poengmerverdi en utøver tilfører laget.
                        </details></td></tr>
                    <tr>
                        <td><details><summary style="list-style: none;">🔑 serieår</summary><br>
                            Referanse til serien (i <code>SERIER</code>) utøveren har merverdien i.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">klubb_id</summary><br>
                            Referanse til klubben (i <code>KLUBBER</code>) laget tilhører.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">utøver_id</summary><br>
                            Referanse til utøveren (i <code>UTØVEREN</code>) som står for poengforbedringen.
                        </details></td>
                        <td>tall</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">fra_og_med</summary><br>
                            Startdato for perioden utøveren har merverdien.
                        </details></td>
                        <td>dato</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">til_og_med</summary><br>
                            Sluttdato for perioden. Er <code>null</code> dersom merverdien fortsatt gjelder.
                        </details></td>
                        <td>dato*</td>
                    </tr>
                    <tr>
                        <td><details><summary style="list-style: none;">poeng</summary><br>
                            Antall poeng utøveren tilfører laget.
                        </details></td>
                        <td>tall</td>
                    </tr>
                </table>
            </td>
        </tr>
</table>