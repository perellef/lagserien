
function td_med(klasse, verdi) {
    td = document.createElement('td');
    td.className = klasse;
    td.textContent = verdi;
    return td;
}

function vis_forsinkelser() {

    forsinkelser = cached_data.forsinkelser

    tbody = document.getElementById('forsinkelser');
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    forsinkelser.forEach(function(forsinkelse) {
        var rad = document.createElement('tr');

        const dato = new Date(forsinkelse[2]);
        const i_dag = new Date();
        const delta_ms = i_dag - dato;
        const delta_dager = Math.floor(delta_ms / (1000 * 60 * 60 * 24));

        celler = [
            td_med("", delta_dager + "d"),
            td_med("", forsinkelse[0]),
            td_med("", forsinkelse[1]),
            td_med("", new Date(forsinkelse[2]).toLocaleDateString('de-DE', { day: '2-digit', month: '2-digit', year: 'numeric' })),
        ]

        if (true) {celler[0].style.color = "green";} 
        if (delta_dager > 5) {celler[0].style.color = "orange";} 
        if (delta_dager > 10) {celler[0].style.color = "red";}
        
        celler.forEach(function(celle) {
            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";

            rad.appendChild(celle)
        });

        tbody.appendChild(rad)
    });
}


vis_forsinkelser()
//window.addEventListener("load", vis_forsinkelser);