
function vis_data(data, tbody_id) {
    tbody = document.getElementById(tbody_id);

    forrige_poeng = 0
    forrige_indeks = 0

    data.forEach(function(rad, i) {
        var tr = document.createElement('tr');

        indeks = i;
        if (rad[0] == forrige_poeng) {
            indeks = forrige_indeks;
        }
        forrige_indeks = indeks;
        forrige_poeng = rad[0]

        var indekscelle = document.createElement('td')
        indekscelle.textContent = indeks+1;
        indekscelle.style.whiteSpace = "nowrap";
        indekscelle.style.paddingTop = "2px";
        indekscelle.style.paddingBottom = "2px";
        indekscelle.style.fontSize = "8px"
        indekscelle.style.color = "gray"
        tr.appendChild(indekscelle);

        rad.forEach(function(verdi) {
            var celle = document.createElement('td')
            celle.textContent = verdi;
            
            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";
            celle.style.paddingTop = "2px";
            celle.style.paddingBottom = "2px";
            tr.appendChild(celle);
        });
    
        console.log(tr);

        tbody.appendChild(tr);
    });
}

alle_utmerkelser = [
    ["utøvere", "sterkeste-enkeltresultat"],
    ["utøvere", "mest-aktive-utøver"],
    ["utøvere", "mest-avgjørende-utøver"],
    ["klubber", "klubb-med-størst-bredde"],
    ["klubber", "klubb-med-størst-forbedring"],
    ["øvelser", "mest-populære-øvelse"],
]

alle_utmerkelser.forEach(function(verdi) {
    const [kategori, tittel] = verdi;
    console.log(kategori + "  .  " + tittel)
    vis_data(cached_data.rangeringer[kategori][tittel], tittel);

    document.getElementById(tittel + "-knapp").addEventListener('click', function() {
        alle_utmerkelser.forEach(function(annen_verdi) {
            document.getElementById(annen_verdi[1] + "-visning").style.display = "none";
        });
        document.getElementById(tittel + "-visning").style.display = "block";
    });
});
