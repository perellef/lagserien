
function vis_tverrsnitt_lagplasseringer(hovedlagets_plassering) {
    divisjon = laginfo[1];

    lagplasseringer = cached_data.livetabell[kjønn][divisjon]
    noteringer = cached_data.noteringer[divisjon]

    tbody = document.getElementById('tverrsnitt-lagplasseringer');
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    var forrige = 100000000
    lagplasseringer.forEach(function(lagplassering, indeks) {
            
        if (indeks+1 < hovedlagets_plassering-2 || indeks+1 > hovedlagets_plassering + 2) {
            forrige = lagplassering[3];
            return;
        } 

        var lag = document.createElement('tr');

        celler = [
            td_med("plassering-endring", ""),
            td_med("plassering", lagplassering[1]),
            td_med("logo", ""),
            td_med("lag", ""),
            td_med("seriepoeng", lagplassering[3]),
            td_med("poengendring", ""),
            td_med("noteringer", lagplassering[5]+"/"+noteringer),
            td_med("krets", lagplassering[7]),
        ]

        if (indeks+1 == hovedlagets_plassering) {
            celler.forEach(function(celle) {
                celle.style.backgroundColor = "#e1ffe5";
            })
        }

        celler[0].style.fontSize = "0.8rem";
        celler[4].style.textAlign = "right";
        celler[5].style.fontSize = "0.85rem";
        celler[5].style.textAlign = "right";
        celler[5].style.paddingRight = "10px";
        celler[6].style.textAlign = "right";
        celler[7].style.paddingLeft = "20px";

        if (lagplassering[0] > 0) {celler[0].textContent = lagplassering[0] + "▲"; celler[0].style.color = "green";}
        if (lagplassering[0] < 0) {celler[0].textContent = String(lagplassering[0]).slice(1) + "▼"; celler[0].style.color = "red";} 

        var anchor = document.createElement('a');
        anchor.href = "/livetabell/" + lagplassering[2] + " ("+ kjønn+")";
        anchor.textContent = lagplassering[2];
        celler[3].appendChild(anchor)

        if (lagplassering[4] > 0) {celler[5].textContent = "+" + lagplassering[4]}
        if (lagplassering[4] < 0) {celler[5].textContent = lagplassering[4]}

        if (cached_data["klubblogoer"].includes(lagplassering[8])) {
            logo = `${window.location.origin}/static/assets/klubblogo/${lagplassering[8]}.png`;
            var img = document.createElement('img');
            img.src = logo;
            img.style.maxHeight = "100%"; 
            
            var anchor = document.createElement('a');
            anchor.href = "/livetabell/" + lagplassering[2].replace(/\s\d\. lag$/, '');
            anchor.append(img)

            celler[2].appendChild(anchor)
            celler[2].style.textAlign = "center";
        }

        celler.forEach((celle, indeks) => {
            if (divisjon == 3 &&  forrige >= 5000 && celler[4].textContent < 5000) {
                celle.style.borderTop = "solid 1.5px #777777"
            }

            if (celler[1].textContent == 4 && (divisjon == 2 || divisjon == 3)) {
                celle.style.borderBottom = "solid 1px #999999"
            }
            if (celler[1].textContent == 10 && (divisjon == 1 || divisjon == 2)) {
                celle.style.borderBottom = "solid 1px #999999"
            }

            celle.style.whiteSpace = "nowrap";
            if (indeks == 3 || indeks == 7) {
                celle.style.overflow = "hidden";
                celle.style.textOverflow = "ellipsis";
            }
            lag.appendChild(celle);
        });
        forrige = celler[4].textContent;

        tbody.appendChild(lag)
    });
}

async function fileExists(url) {
  try {
    const response = await fetch(url, { method: 'HEAD' }); 
    return response.ok;
  } catch (err) {
    return false;
  }
}

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
    
    vis_endringer_siste_7_dager = document.getElementById('endringer siste 7 dager').checked

    resultater = lagresultater[oppstillingstype]

    resultater.forEach(function(resultat) {
        tr = document.createElement("tr");

        resultat.forEach(function(verdi, indeks) {
            if (!vis_endringer_siste_7_dager && (resultat[9] == "ut" || resultat[9] == "ut-ned" || resultat[9] == "ut-opp")) {
                return;
            }
            if (indeks == 9) {
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
                    celle.style.backgroundColor = finn_bakgrunnsfarge(resultat[9]);
                }
                tr.appendChild(celle);

                celle = td_med("", verdi);
            } else if (indeks == 8) {
                if (verdi == "") {
                    celle = td_med("", "");
                } else {
                    celle = td_med("", datoNormalform(verdi));
                }
            } else if (indeks == 10) {
                celle = td_med("", "");
                if (verdi == "ny" || verdi == "fjernet") {
                    var div = document.createElement('div');
                    div.style.height = "20px";
                    div.style.border = "1px gray solid";
                    if (verdi == "ny") {
                        div.style.backgroundColor = "#d8ffce";
                        div.style.width = "30px";
                    } else {
                        div.style.backgroundColor = "#F8E0E0";
                        div.style.width = "50px";
                    }
                    div.style.lineHeight = "16px";
                    div.style.paddingLeft = "4px";
                    div.textContent = verdi;
                    celle.appendChild(div);
                }
                celle.style.border = "none";
            } else {
                celle = td_med("", verdi);
            }
            
            if (vis_endringer_siste_7_dager && indeks > 0 && indeks < 9) {
                celle.style.backgroundColor = finn_bakgrunnsfarge(resultat[9]);
                if (resultat[9] == "ut" || resultat[9] == "ut-opp" || resultat[9] == "ut-ned") {
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

document.getElementById("laginfo-knapp").addEventListener('click', function() {
    document.getElementById("oppstilling").style.display = "none";
    document.getElementById("laginfo").style.display = "block";
    this.style.backgroundColor = "white";
    document.getElementById("oppstilling-knapp").style.backgroundColor = "rgb(233, 233, 233)";
});

document.getElementById('endringer siste 7 dager').addEventListener('change', function () {
    sett_oppstilling()
});

document.getElementById("oppstilling-knapp").addEventListener('click', function() {
    document.getElementById("laginfo").style.display = "none";
    document.getElementById("oppstilling").style.display = "block";
    this.style.backgroundColor = "white";
    document.getElementById("laginfo-knapp").style.backgroundColor = "rgb(233, 233, 233)";
});

if (laginfo[2][0] == "(") {
    plassering = parseInt(laginfo[2].slice(1, -1))
} else {
    plassering = parseInt(laginfo[2])
}

vis_tverrsnitt_lagplasseringer(plassering)
sett_oppstilling()
