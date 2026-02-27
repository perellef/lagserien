
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
    
        tbody.appendChild(tr);
    });
}

alle_utmerkelser = [
    ["utøvere", "mest-aktive-utøver"],
    ["utøvere", "mest-avgjørende-utøver"],
    ["lag", "mest-gjennomførte-lag"],
    ["lag", "lag-med-størst-potensial"],
    ["lag", "lag-med-flest-juniorpoeng"],
    ["klubber", "klubb-med-størst-forbedring"],
    ["klubber", "klubb-med-størst-bredde"],
    ["annet", "mest-populære-øvelse"],
    ["annet", "største-krets"]
]

alle_utmerkelser.forEach(function(verdi) {
    const [kategori, tittel] = verdi;
    vis_data(cached_data.rangeringer[kategori][tittel], tittel);

    document.getElementById(tittel + "-knapp").addEventListener('click', function() {
        alle_utmerkelser.forEach(function(annen_verdi) {
            document.getElementById(annen_verdi[1] + "-visning").style.display = "none";
        });
        document.getElementById(tittel + "-visning").style.display = "block";
    });
});
