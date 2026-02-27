document.getElementById('spørring-knapp').addEventListener('click', function() {
    spørringValue = document.getElementById('spørring').value;

    return;
    fetch(UTFØR, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            spørring: spørringValue,
        }),
    })
    .then(response => response.json())
    .then(rows => {
        vis_resultater(rows);
    });
});
                
function vis_resultater(resultater) {
    div = document.getElementById("spørring-resultater");
    div.innerHTML = "";

    table = document.createElement("table");
    thead = document.createElement("thead");
    tbody = document.createElement("tbody");

    table.appendChild(thead);
    table.appendChild(tbody);
    div.appendChild(table);

    resultater.forEach(function(resultat) {
        tr = document.createElement("tr");

        resultat.forEach(function(verdi) {
            td = document.createElement("td");
            td.textContent = verdi;
            tr.appendChild(td);
        });

        tbody.appendChild(tr);
    });
}