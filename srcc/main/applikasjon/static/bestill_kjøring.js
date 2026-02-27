function vis_batchkjøringer() {
    tbody = document.getElementById("batchkjøringer");

    batchkjøringer.forEach(function(kjøring) {
        tr = document.createElement("tr");

        kjøring.forEach(function(verdi, i) {
            td = document.createElement("td");
            if (i == 2) {
                td.textContent = new Date(verdi).toLocaleDateString('de-DE', { day: '2-digit', month: '2-digit', year: 'numeric' })
            } else if (i == 3 || i == 4) {
                td.textContent = new Date(verdi).toLocaleString('de-DE', {day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit'})
            } else {
                td.textContent = verdi;
            }
            tr.appendChild(td);
        });

        tbody.appendChild(tr);
    });
}

vis_batchkjøringer()