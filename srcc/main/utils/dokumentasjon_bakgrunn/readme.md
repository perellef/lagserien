
Dokumentasjon

Merk at tabellene man oppgir ikke 


Den bakenforliggende dataarkitekturen er forsøkt skjult for å være mest mulig leselig for brukeren.

Implisitte tabeller:
- Øvelser
- Utøvere
- Klubber
- Konkurranser

**Batchavhengigheter**

Seriegrunnlag er avhengig av klubber, mens Alle batchene er avhengig av øvelser, utøvere, klubber og konkurranser.

<table>
  <tr>
    <th>Batch</th>
    <th>Inn</th>
    <th>Ut</th>
  </tr>
  <tr>
    <td>Seriegrunnlag</td>
    <td>
        <li>(Klubb)</li>
        <li>Avsluttede tabeller</li>
</td>
    <td>
        <li>Øvelsesregler</li>
        <li>Serieøvelser</li>
        <li>Klubbtilhørighet</li>
        <li>Ferierepresentasjon</li>
        <li>Rullestolutøvere</li>
        <li>...</li>
    </td>
  </tr>
  <tr>
    <td>Uttrekk</td>
    <td>
        <li>(Øvelser, Klubb, ...)</li>
    </td>
    <td>
        <li>Resultater</li>
    </td>
  </tr>
  <tr>
    <td>Manipulasjon</td>
    <td>
        <li>Øvelsesregler</li>
        <li>Serieøvelser</li>
        <li>Klubbtilhørighet</li>
        <li>Ferierepresentasjon</li>
        <li>Rullestolutøvere</li>
        <li>...</li></td>
    <td>
        <li>Klubbresultater<li\>
    </td>
  </tr>
  <tr>
    <td>Kalkulator</td>
    <td>
        <li>Serieøvelser</li>
        <li>Resultater</li>
        <li>Klubbresultater</li></td>
        <li>Mann- og kvinnelige resultater</li>
    </td>
    <td>
        <li>Oppstillinger</li>
        <li>Lag</li>
        <li>Lagplassering</li>
    </td>
  </tr>
</table>

**Batchkjøringer**

Batch | Kjøres |
--- | --- |
Seriegrunnlag | Årlig eller ved bakgrunnsoppdateringer |
Uttrekk | Daglig  |
Manipulator | Daglig |
Kalkulator | Daglig |


**Klubb-kolonne til klubbresultatr**

Kalkulatorrbatchen tar inn vil bearbeide all data den tar i mot. Dataene inn og ut vil være spesifisert med en kolonne "klubb" men i dokumentasjonen kan denne unnlates hvis det er uinteressant å se på tvers av klubbene. 

Bruk p 

Dette gjelder oppstillinger og lag. 



som beskriver hvilke data som skal gruppgruppert på klubb. I dokumentasjonen kan dette 


, men dette er uinNoe Dette innebærer at dataene kan inneholde kolonner som beskriver hvordan den skal grupperes. 

Klubbresultater vil som regel



hensiktsmessig.


Eksempler er at 