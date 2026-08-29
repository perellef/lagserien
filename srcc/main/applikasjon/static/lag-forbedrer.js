
document.getElementById('analyser-lagforbedring').addEventListener('click', function() {

    var beregningshjul = document.querySelector('#beregning') 
    if (beregningshjul.style.display == 'block') {
        return;
    }
    beregningshjul.style.display = 'block';

    fetch('/verktøy/lagforbedrer/analyser', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            kjønn: kjønn,
            klubb: klubbnavn,
        }),
    })
    .then(response => response.json())
    .then(rows => {
        beregningshjul.style.display = 'none';

        analysefelt = document.getElementById("analysefelt");
        analysefelt.style.display = "block";

        vis_forbedringer(rows);
        sett_oppstilling(rows[1][0])

    });
});

function sett_forbedring_deloppstilling(resultater, oppstillingstype) {
    div = document.getElementById("analyser-lag");

    h6 = document.createElement("h6");
    h6.textContent = oppstillingstype + " OPPSTILLING";
    h6.style.color = "rgb(61, 61, 61)";
    h6.style.margin = "20px 0 8px 10%";

    table = document.createElement("table");
    table.style.fontSize = "0.8rem";
    table.style.tableLayout = "fixed";
    table.classList.add("table");
    table.classList.add("table-sm");

    thead = document.createElement("thead");
    thead.classList.add("table-light");
    tbody = document.createElement("tbody");

    div.appendChild(h6);
    div.appendChild(table);
    table.appendChild(thead);
    table.appendChild(tbody);

    thead_tr = document.createElement("tr");
    thead_tr.appendChild(document.createElement("th"));
    thead_tr.appendChild(document.createElement("th"));
    thead_tr.appendChild(document.createElement("th"));
    thead_tr.appendChild(document.createElement("th"));
    thead_tr.appendChild(document.createElement("th"));
    thead.appendChild(thead_tr)

    thead_tr.children[0].style.width = "3%";
    thead_tr.children[0].style.visibility = "hidden";
    thead_tr.children[0].style.border = "none";
    thead_tr.children[1].style.width = "10%";
    thead_tr.children[1].textContent = "Poeng";
    thead_tr.children[2].style.width = "15%";
    thead_tr.children[2].textContent = "Øvelse";
    thead_tr.children[3].style.width = "30%";
    thead_tr.children[3].textContent = "Navn";
    thead_tr.children[4].style.width = "5%";
    thead_tr.children[4].style.visibility = "hidden";
    thead_tr.children[4].style.border = "none";

    resultater.forEach(function(resultat) {
        tr = document.createElement("tr");

        resultat.forEach(function(verdi, indeks) {
            if (indeks == 5 || indeks == 3) {
                return;
            }
            if (indeks == 0) {
                celle = td_med("", verdi == 0 ? "" : (verdi > 0 ? "+"+verdi : verdi));
                celle.style.textAlign = "end";
                celle.style.fontSize = "0.7rem"
                celle.style.paddingRight = "5px"
                celle.style.backgroundColor = "transparent";
                celle.style.border = "none";
            } else if (indeks == 6) {
                celle = td_med("", "");
                if (verdi == "ny") {
                    celle.style.display = "flex"
                    celle.style.justifyContent = "right";

                    var div = document.createElement('div');
                    div.style.height = "20px";
                    div.style.border = "1px gray solid";
                    div.style.backgroundColor = "#d8ffce";
                    div.style.width = "22px";
                    div.style.lineHeight = "16px";
                    div.style.fontSize = "13px";
                    div.style.paddingLeft = "1px";
                    div.textContent = verdi;
                    celle.appendChild(div);
                }
                celle.style.border = "none";
                celle.style.backgroundColor = "transparent";
            } else {
                celle = td_med("", verdi);
            }
            
            if (indeks > 0 && indeks < 5) {
                celle.style.backgroundColor = finn_bakgrunnsfarge(resultat[5]);
                if (resultat[5] == "ut" || resultat[5] == "ut-opp" || resultat[5] == "ut-ned") {
                    celle.style.fontStyle = "italic";
                }
            }

            if (indeks != 0) {
                celle.style.whiteSpace = "nowrap";
                celle.style.overflow = "hidden";
                celle.style.textOverflow = "ellipsis";
            }
            if (resultat[1] !== '') {
                celle.style.paddingTop = "0px";
                celle.style.paddingBottom = "0px";
            }
            if (verdi == "hvem som helst" || verdi == "under 5 resultater") {
                celle.style.fontStyle = "italic";
            }


            tr.appendChild(celle);
        })

        tbody.appendChild(tr);
    })
}

function finn_bakgrunnsfarge(endringsverdi) {
    if (endringsverdi == "") {
        return "#ffffff"
    } else if (endringsverdi == "ut") {
        return "#F8E0E0";
    } else if (endringsverdi == "ut-opp" || endringsverdi == "ut-ned" || endringsverdi == "inn-opp" || endringsverdi == "inn-ned") {
        return "#fdffd7ff";
    } else if (endringsverdi == "inn") {
        return "#d8ffce"
    }
}

function td_med(klasse, verdi) {
    td = document.createElement('td');
    td.className = klasse;
    td.textContent = verdi;
    td.style.verticalAlign = "middle";
    return td;
}

function sett_forbedringsoppstilling(lagresultater) {
    document.getElementById("analyser-lag").innerHTML = "";

    sett_forbedring_deloppstilling(lagresultater["OBLIGATORISK"], "OBLIGATORISK")
    sett_forbedring_deloppstilling(lagresultater["VALGFRI"], "VALGFRI")
}

function vis_forbedringer(forbedringsdata) {
    sett_forbedringsoppstilling(
        {
            OBLIGATORISK: lagresultater.OBLIGATORISK.filter(e => !e[10].includes("ut")).map(e => [0, e[2], e[3], e[4], e[5]]),
            VALGFRI: lagresultater.VALGFRI.filter(e => !e[10].includes("ut")).map(e => [0, e[2], e[3], e[4], e[5]])
        }
    )

    var forbedringer_tabell = document.querySelector('#forbedringer-tabell');
    forbedringer_tabell.innerHTML = "";

    var h5 = document.createElement("h5");
    h5.textContent = "Forbedringer"
    forbedringer_tabell.appendChild(h5)
    
    var thead = document.createElement('thead');
    thead.classList.add("table-light");
    var tr = document.createElement('tr');

    var kol1 = document.createElement('th')
    var kol2 = document.createElement('th')
    var kol3 = document.createElement('th')
    var kol4 = document.createElement('th')
    
    kol1.textContent = "Poeng";
    kol2.textContent = "Øvelse";
    kol3.textContent = "Resultat";
    kol4.textContent = "Utøver";

    kol1.style.width = "20%"
    kol2.style.width = "27%"
    kol3.style.width = "25%"
    kol4.style.width = "37%"

    tr.appendChild(kol1)
    tr.appendChild(kol2)
    tr.appendChild(kol3)
    tr.appendChild(kol4)
    thead.appendChild(tr)

    var tbody = document.createElement('tbody');

    forbedringsdata[0].forEach(function(forbedring, indeks) {
        var tr = document.createElement('tr');
        forbedring.forEach(function(verdi, i) {
            var celle = document.createElement('td');

            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";
            celle.style.paddingTop = "0px";
            celle.style.paddingBottom = "0px";
            if (verdi == "hvem som helst" || verdi == "under 5 resultater") {
                celle.style.fontStyle = "italic";
            }

            celle.textContent = verdi;
            tr.appendChild(celle)
        });
        tr.style.cursor = "pointer";

        tr.addEventListener("click", () => {
            sett_forbedringsoppstilling(forbedringsdata[1][indeks+1]);
            tbody.querySelectorAll("td").forEach(td => td.style.backgroundColor = "white");
            tr.querySelectorAll("td").forEach(td => td.style.backgroundColor = "rgb(251, 247, 231)");
        });
        tr.addEventListener("mouseenter", () => {
            tr.querySelectorAll("td").forEach(td => {
                if (td.style.backgroundColor != "rgb(251, 247, 231)") {
                    td.style.backgroundColor = "#f6f6f6";
                }
            });
        });
        tr.addEventListener("mouseleave", () => {
            tr.querySelectorAll("td").forEach(td => {
                if (td.style.backgroundColor != "rgb(251, 247, 231)") {
                    td.style.backgroundColor = "white";
                }
            });
        });

        tbody.appendChild(tr)
    });

    var table = document.createElement('table');
    table.classList.add("table");
    table.classList.add("table-sm");
    table.setAttribute('id', 'laganalyse');
    table.appendChild(thead);
    table.appendChild(tbody);
    table.style.tableLayout = "fixed";
    table.style.marginTop = "12px"
    table.style.fontSize = "0.9rem";

    forbedringer_tabell.appendChild(table);
}