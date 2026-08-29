function td_med(klasse, verdi) {
    td = document.createElement('td');
    td.className = klasse;
    td.textContent = verdi;
    td.style.verticalAlign = "middle";
    return td;
}

function datoNormalform(yyyyMMdd) {
    var date = new Date(yyyyMMdd);
    
    var day = String(date.getDate()).padStart(2, '0');
    var month = String(date.getMonth() + 1).padStart(2, '0');

    return day + '.' + month;
}

function sett_deloppstilling(id, oppstillingstype) {
    tbody = document.getElementById(id);
    tbody.innerHTML = "";
    
    vis_endringer_siste_7_dager = document.getElementById('vis-endringer').checked
    vis_potensial = window.getComputedStyle(document.getElementById('oppstilling-potensial')).backgroundColor === "rgb(255, 255, 255)"
    
    resultater = vis_potensial ? lagforbedringer[oppstillingstype] : lagresultater[oppstillingstype];

    resultater.forEach(function(resultat) {
        tr = document.createElement("tr");

        if (!vis_endringer_siste_7_dager && (resultat[10] == "ut" || resultat[10] == "ut-ned" || resultat[10] == "ut-opp")) {
            return;
        }

        resultat.forEach(function(verdi, indeks) {
            
            if (indeks == 9 || indeks == 10) {
                return;
            }
            if (indeks == 0) {
                celle = td_med("", verdi == 0 ? "" : (verdi > 0 ? "+"+verdi : verdi));
                celle.style.textAlign = "end";
                celle.style.fontSize = "0.8rem"
                celle.style.paddingRight = "5px"
                celle.style.backgroundColor = "transparent";
                celle.style.border = "none";
            } else if (indeks == 1) {
                celle = td_med("", "");
                if (verdi != "" && verdi <= 8) {
                    var div = document.createElement('div');
                    div.style.width = "13px";
                    div.style.height = "13px";
                    div.style.borderRadius = "50%";
                    div.style.lineHeight = "11px"
                    div.style.border = "1px gray solid"
                    div.textContent = verdi
                    div.style.fontSize = "11px";
                    div.style.textAlign = "center";
                    div.style.paddingTop = "-5px";
                    div.style.marginLeft = "auto";
                    celle.appendChild(div);
                    if (verdi == 1) {
                        div.style.backgroundColor = "yellow";
                    } else if (verdi == 2) {
                        div.style.backgroundColor = "silver";
                    } else if (verdi == 3) {
                        div.style.backgroundColor = "orange";
                    } else {
                        div.style.backgroundColor = "white";
                    }
                }
                tr.appendChild(celle);
            } else if (indeks == 3) {
                celle = td_med("", "");
                if (verdi != "") {
                    var anchor = document.createElement('img');
                    anchor.src = finn_øvelsesikon(verdi);
                    anchor.style.width = "20px"
                    
                    celle.appendChild(anchor)
                }
                if (vis_endringer_siste_7_dager) {
                    celle.style.backgroundColor = vis_potensial ? finn_potensialfarge(resultat[10]) : finn_endringsfarge(resultat[10]);
                }
                tr.appendChild(celle);

                celle = td_med("", verdi);
            } else if (indeks == 8) {
                if (verdi == "" || resultat[8] == null) {
                    celle = td_med("", "");
                } else {
                    celle = td_med("", datoNormalform(verdi));
                }
            } else if (indeks == 11) {
                celle = td_med("", "");
                if (verdi == "ny" || verdi == "fjernet" || verdi == "forslag") {
                    var div = document.createElement('div');
                    div.style.height = "20px";
                    div.style.border = "1px gray solid";
                    if (verdi == "forslag") {
                        div.style.backgroundColor = "#cedfff";
                        div.style.width = "52px";
                        div.textContent = "forslag";
                    } else if (verdi == "ny") {
                        div.style.backgroundColor = "#d8ffce";
                        div.style.width = "30px";
                        div.textContent = verdi;
                    } else {
                        div.style.backgroundColor = "#F8E0E0";
                        div.style.width = "50px";
                        div.textContent = verdi;
                    }
                    div.style.lineHeight = "16px";
                    div.style.paddingLeft = "4px";
                    celle.appendChild(div);
                }
                celle.style.border = "none";
            } else {
                celle = td_med("", verdi);
            }
            
            if (vis_endringer_siste_7_dager && indeks > 0 && indeks < 9) {
                celle.style.backgroundColor = vis_potensial ? finn_potensialfarge(resultat[10]) : finn_endringsfarge(resultat[10]);
                if (resultat[10] == "ut" || resultat[10] == "ut-opp" || resultat[10] == "ut-ned") {
                    celle.style.fontStyle = "italic";
                }
            }

            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";

            tr.appendChild(celle);
        })

        tbody.appendChild(tr);
    })
}

function sett_verktøyoppstilling(id, oppstillingstype) {
    tbody = document.getElementById(id);
    
    lagresultater[oppstillingstype].forEach(function(resultat) {
        tr = document.createElement("tr");

        if (resultat[10] == "ut" || resultat[10] == "ut-ned" || resultat[10] == "ut-opp") {
            return;
        }

        resultat.forEach(function(verdi, indeks) {
            
            if (indeks == 0 || indeks == 1|| indeks == 4 || indeks == 6 || indeks == 7 || indeks == 8 || indeks == 9 || indeks == 10 || indeks == 11) {
                return;
            }
            
            celle = td_med("", verdi);
            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";
            celle.style.padding = "0";
            tr.appendChild(celle);
        })

        tbody.appendChild(tr);
    })
}

function finn_endringsfarge(endringsverdi) {
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

function finn_potensialfarge(endringsverdi) {
    if (endringsverdi == "") {
        return "#ffffff"
    } else if (endringsverdi == "ut") {
        return "#f5f5f5";
    } else if (endringsverdi == "ut-opp" || endringsverdi == "ut-ned" || endringsverdi == "inn-opp" || endringsverdi == "inn-ned") {
        return "#fdffd7ff";
    } else if (endringsverdi == "inn") {
        return "#cee5ff"
    }
}

function finn_øvelsesikon(øvelse) {
    if (øvelse.endsWith("hekk")) return øvelsesikoner["hekk"];   
    if (øvelse.endsWith("kapp.")) return øvelsesikoner["kappgang"];         
    if (øvelse.endsWith("u.t")) return øvelsesikoner[øvelse.slice(0, -4).toLowerCase()];  
    if (/^[0-9]/.test(øvelse)) {
        if ((øvelse.length <= 3) || (øvelse.length == 4 && øvelse[0] < '5')) return øvelsesikoner["sprint"];  
        return øvelsesikoner["løp"]
    }

    return øvelsesikoner[øvelse.toLowerCase()];
}

function sett_oppstilling() {
    sett_deloppstilling("obl-oppstilling-nå", "OBLIGATORISK")
    sett_deloppstilling("val-oppstilling-nå", "VALGFRI")
}

function sett_historiske_plasseringer(historiske_plasseringer) {
    tbody = document.getElementById("tabell-historiske-plasseringer")

    historiske_plasseringer.forEach(rad => {
        tr = document.createElement("tr");
        rad.forEach((v,i) => {
            td = document.createElement("td");
            if (i == 0) {
                if (v > 0) {
                    td.style.fontSize = "0.5rem"
                    td.textContent = "▲";
                    td.style.color = "green";
                } else if (v < 0) {
                    td.style.fontSize = "0.5rem"
                    td.textContent = "▼";
                    td.style.color = "red";
                } else {
                    td.style.fontSize = "0.7rem";
                    td.style.fontWeight = "1000";
                    td.textContent = "–";
                    td.style.color = "gray";
                } 
            } else {
                td.textContent = v;
            }
            td.style.paddingTop = "2px";
            td.style.paddingBottom = "2px";
            tr.appendChild(td);
        })
        tbody.appendChild(tr);
    })
}

function sett_utøverdata(utøverdata) {
    const div = document.getElementById("utøvere");

    utøverdata.forEach((rad, r) => {
        table = document.createElement("table");
        table.style.fontSize = "0.9rem";
        table.classList.add("table", "table-sm");
        table.style.tableLayout = "fixed";
        table.style.marginBottom = "0px";

        thead = document.createElement("thead");
        thead.classList.add("table-light");
        table.appendChild(thead);

        div.appendChild(table);
        colgroup = document.createElement("colgroup");
        table.appendChild(colgroup)

        titler = [["", 1], ["Merverdi", 2],  ["Seriepoeng", 2], ["Utøver", 1], ["Født", 1]]
        kolonner = [5, 5, 5, 5, 7, 35, 15]

        kolonner.forEach(bredde => {
            col = document.createElement("col");
            col.style.width = bredde + "%";
            colgroup.appendChild(col);
        })

        tr = document.createElement("tr");
        thead.appendChild(tr);
        if (r == 0) {
            titler.forEach(([tittel, colspan]) => {
                th = document.createElement("th");
                th.textContent = tittel;
                th.scope = "col";
                th.colSpan=colspan;
                tr.appendChild(th);
            })
        }

        tbody = document.createElement("tbody");
        table.appendChild(tbody)

        tr = document.createElement("tr");
        tr.style.cursor = "pointer";
        var chevron = document.createElement('i');
        chevron.classList.add("bi", "bi-chevron-down");
        chevron.style.fontSize = "13px"; 
        chevron.style.lineHeight = "0.4";
        chevron.style.display = "block";
        chevron.style.transform = "scaleY(0.6)";
        td = document.createElement("td");
        td.appendChild(chevron)
        tr.appendChild(td)

        tr.onclick = function(event) {
            if (event.target.tagName === "A") return;
           utøverres = document.getElementById("utøver-" + r)
            this.querySelectorAll(":scope > td").forEach(td => {
                td.style.setProperty("background-color", (utøverres.style.display == "none") ? "#eeeeee" : "white", "important");
            });
            utøverres.style.display = (utøverres.style.display == "none") ? "block" : "none";

        }

        tbody.appendChild(tr)

        rad.forEach((v, i) => {
            if (i == 5 || i == 7) {
                return;
            }
            td = document.createElement("td");
            td.style.paddingTop = "0";
            td.style.paddingBottom = "0";
            td.style.verticalAlign = "middle";

            if (i == 4) {
                var anchor = document.createElement('a');   
                anchor.href = "/utovere/" + rad[5];
                anchor.textContent = v;
                anchor.style.textDecoration = "none";
                td.appendChild(anchor)
            } else {
                if (i == 1  || i == 3) {
                    td.style.fontSize = "0.75rem";
                    td.style.paddingLeft = "15px";
                    v = v > 0 ? "+"+v : (v == 0 ? "" : v)
                } else if (i == 0  || i == 2) {
                    td.style.textAlign = "right";
                }
                td.textContent = v;
            }
            
            td.style.whiteSpace = "nowrap";
            td.style.overflow = "hidden";
            td.style.textOverflow = "ellipsis";

            tr.appendChild(td);
        });
        
        utøverres = lag_utøverens_resultattabell(rad[7]);
        utøverres.id = "utøver-" + r;
        utøverres.style.display = "none";
                  
        div.appendChild(utøverres);
    });
}

function lag_utøverens_resultattabell(utøverresultater) {
    table = document.createElement("table");

    table.classList.add("table", "table-sm");
    table.style.margin = "3px 0 5px 40px";
    table.style.fontSize = "0.80rem";
    table.style.tableLayout = "fixed";
    table.style.width = "80%";

    colgroup = document.createElement("colgroup");
    table.appendChild(colgroup);
    kolonner = [5, 5, 5, 5, 5, 5];

    kolonner.forEach(bredde => {
        col = document.createElement("col");
        col.style.width = bredde + "%";
        colgroup.appendChild(col);
    });

    thead = document.createElement("thead");
    tbody = document.createElement("tbody");
    
    tbody.style.outline = "solid 1px #888888";
    table.appendChild(thead);
    table.appendChild(tbody);

    utøverresultater.forEach(rad => {
        tr = document.createElement("tr")
        rad.forEach((v,i) => {
            if (i == 0) {
                return;
            }
            td = document.createElement("td")
            if (i == 6) {
                if (v == '1') {
                    i = document.createElement("i")
                    i.classList += "bi bi-diamond-fill";
                    i.style.fontSize = "0.55rem"
                    i.style.color = "rgba(0, 89, 255, 0.6)";
                    td.appendChild(i)
                }
            } else {
                td.textContent = v;
            }
            td.style.paddingTop = "0";
            td.style.paddingBottom = "0";
            tr.appendChild(td);
        })
        tbody.appendChild(tr);
    })
    return table;
}

document.getElementById('oppstilling-nå').addEventListener("click", function () {
    if (window.getComputedStyle(this).backgroundColor === "rgb(255, 255, 255)") {
        return;
    }
    this.style.backgroundColor = "white";
    document.getElementById('oppstilling-potensial').style.backgroundColor = "#efefef";
    sett_oppstilling();

    document.getElementById('vis-endringer').parentElement.children[1].textContent = "Vis endringer siste 7 dager";
});

document.getElementById('oppstilling-potensial').addEventListener("click", function () {
    if (window.getComputedStyle(this).backgroundColor === "rgb(255, 255, 255)") {
        return;
    }
    this.style.backgroundColor = "white";
    document.getElementById('oppstilling-nå').style.backgroundColor = "#efefef";
    sett_oppstilling();

    document.getElementById('vis-endringer').parentElement.children[1].textContent = "Vis endringer";
});

document.getElementById('vis-endringer').addEventListener('change', function () {
    sett_oppstilling();
});

hovedvisninger = ["oppstilling", "utøvere", "historikk", "verktøy"];
hovedvisninger.forEach((visning) => {
    document.getElementById(visning+"-knapp").addEventListener('click', function() {
        hovedvisninger.forEach((v) => {
            document.getElementById(v).style.display = "none";
            document.getElementById(v+"-knapp").style.backgroundColor = "rgb(233, 233, 233)";
        })
        document.getElementById(visning).style.display = "block";
        this.style.backgroundColor = "white";
    });
})

verktøy = ["sammenlikner", "oppstiller", "utforsker", "forbedrer"]
verktøy.forEach((verkt) => {
    document.getElementById("verktøy-"+verkt+"-knapp").addEventListener('click', function() {
        verktøy.forEach((v) => {
            document.getElementById("verktøy-"+v).style.display = "none";
            document.getElementById("verktøy-"+v+"-knapp").style.backgroundColor = "rgb(233, 233, 233)";
        })
        document.getElementById("verktøy-"+verkt).style.display = "block";
        this.style.backgroundColor = "white";
    });
})

sett_oppstilling()
sett_historiske_plasseringer(historiske_plasseringer)
sett_utøverdata(utøverdata)