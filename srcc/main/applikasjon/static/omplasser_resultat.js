function vis_resultatbytter() {
    tbody = document.getElementById("eksisterende-resultatbytter");

    resultatbytter.forEach(function(resultatbytte) {
        tr = document.createElement("tr");

        resultatbytte.forEach(function(verdi, i) {
            td = document.createElement("td");
            td.style.whiteSpace = "nowrap";
            if (i == 2) {
                td.textContent = new Date(verdi).toLocaleString('de-DE', {day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit'})
            } else {
                td.textContent = verdi;
            }
            tr.appendChild(td);
        });

        tbody.appendChild(tr);
    });
}

vis_resultatbytter()