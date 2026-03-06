aktivert_farge = "white"
deaktivert_farge = "rgb(233, 233, 233)"

function vis_år(viktige_år) {
    let div = document.getElementById("serieår-knapper");

    viktige_år.forEach(function(år, i) {
        button = document.createElement("button");
        button.style.borderRadius = "15px";
        button.style.border = "4px lightgray solid";
        button.style.minWidth = "100px";
        button.style.padding = "0 15px 0 15px";
        button.style.height = "33px"; 
        button.style.backgroundColor = deaktivert_farge;
        button.style.margin = "0 7px 0 7px";
        button.style.whiteSpace = "nowrap";
        button.textContent = (år == serieår ? år + " (live)" : år)

        if (i === viktige_år.length-1) {
            button.style.backgroundColor = aktivert_farge;
            vis_utøverresultater(år);
            vis_utøverens_lagresultater(år);
        }

        button.addEventListener('click', function() {
            if (getComputedStyle(this).backgroundColor == aktivert_farge) {
                return;
            }
            div.querySelectorAll('button').forEach(function(child) {
                child.style.backgroundColor = deaktivert_farge;
            });
            this.style.backgroundColor = aktivert_farge;

            vis_utøverresultater(år); 
            vis_utøverens_lagresultater(år);  
        });

        div.prepend(button);
    });
}

function vis_utøverens_lagresultater(år) {
    div = document.getElementById("utøver-lagresultater");
    div.innerHTML = "";

    if (lagresultater[år] !== undefined) {
         Object.keys(lagresultater[år]).forEach(function(klubb) {
            vis_lagresultater_for_klubb(år, klubb);
        });
    }
}

function vis_lagresultater_for_klubb(år, klubb) {
    div = document.getElementById("utøver-lagresultater");

    h5 = document.createElement("h5");
    h5.textContent = klubb;
    div.appendChild(h5);
        
    function ny_th(verdi) {
        th = document.createElement("th");
        th.textContent = verdi;
        th.style.padding = "0";
        return th;
    }

    table = document.createElement("table");
    table.classList.add("table");
    table.classList.add("table-sm");
    div.appendChild(table)

    thead = document.createElement("thead");
    thead.classList.add("table-light");
    table.appendChild(thead)

    tr = document.createElement("tr");
    thead.appendChild(tr)

    tr.appendChild(ny_th("Poeng"))
    tr.appendChild(ny_th("Øvelse"))
    tr.appendChild(ny_th("Resultat"))
    tr.appendChild(ny_th("Sted"))
    tr.appendChild(ny_th("Dato"))

    tbody = document.createElement("tbody");
    table.appendChild(tbody);

    lagresultater[år][klubb].forEach(function(resultat) {
        tr = document.createElement("tr");
        
        resultat.forEach(function(verdi, i) {
            td = document.createElement("td");
            if (i == 4) {
                var date = new Date(verdi);
                var day = String(date.getDate()).padStart(2, '0');
                var month = String(date.getMonth() + 1).padStart(2, '0');
                td.textContent = day + '.' + month;
            } else {
                td.textContent = verdi;
            }

            td.style.padding = "0";
            td.style.whiteSpace = "nowrap";
            td.style.overflow = "hidden";
            td.style.textOverflow = "ellipsis";
            tr.appendChild(td);
        });

        tbody.appendChild(tr);
    });
}

function vis_utøverresultater(år) {
    let tbody = document.getElementById("utøverresultater");
    tbody.innerHTML = "";

    utøverresultater[år].forEach(function(resultat) {
        tr = document.createElement("tr");
        
        resultat.forEach(function(verdi, i) {
            td = document.createElement("td");
            if (i == 4) {
                var date = new Date(verdi);
                var day = String(date.getDate()).padStart(2, '0');
                var month = String(date.getMonth() + 1).padStart(2, '0');
                td.textContent = day + '.' + month;
            } else {
                td.textContent = verdi;
            }
            td.style.padding = "0";
            td.style.whiteSpace = "nowrap";
            td.style.overflow = "hidden";
            td.style.textOverflow = "ellipsis";
            tr.appendChild(td);
        });

        tbody.appendChild(tr);
    });
}

vis_år(Object.keys(utøverresultater))
