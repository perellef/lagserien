
document.getElementById("klubbinfo-knapp").addEventListener('click', function() {
    document.getElementById("resultater").style.display = "none";
    document.getElementById("klubbinfo").style.display = "block";
    this.style.backgroundColor = "white";
    document.getElementById("resultater-knapp").style.backgroundColor = "rgb(233, 233, 233)";
});

document.getElementById("resultater-knapp").addEventListener('click', function() {
    document.getElementById("klubbinfo").style.display = "none";
    document.getElementById("resultater").style.display = "block";
    this.style.backgroundColor = "white";
    document.getElementById("klubbinfo-knapp").style.backgroundColor = "rgb(233, 233, 233)";
});

// Function to filter rows
function filterTable() {
    const labels = document.querySelectorAll("#resultat-filterboks div label");
    
    let filtere = new Map(
        Array.from(labels)
            .map(label => [label.getAttribute("data-attributt"), label.getAttribute("data-verdi")])
        );

    const rows = document.querySelectorAll("#klubbresultater tr");

    rows.forEach(row => {
        let vis_rad = [...filtere].every(([attr, verdi]) => row.getAttribute(`data-${attr}`) === verdi);
        
        row.style.display = (vis_rad ? "" : "none");
    });
}

document.querySelectorAll(".filter-kjønn").forEach(checkbox => {
    checkbox.addEventListener("change", filterTable);
});

function vis_resultater() {
    tbody = document.getElementById('klubbresultater');

    klubbresultater.forEach(function(klubbresultat) {
        tr = document.createElement("tr");

        attributter = {
            0: "poeng",
            1: "øvelse",
            2: "resultat",
            3: "utøver",
            4: "født",
            5: "sted",
            6: "dato",
        }
        poeng = klubbresultat[0];
        øvelse = klubbresultat[1];
        resultat = klubbresultat[2];
        navn = klubbresultat[3];
        født = klubbresultat[4];
        sted = klubbresultat[5];
        dato = klubbresultat[6];
        fra = klubbresultat[7];
        til = klubbresultat[8];
        forløp = klubbresultat[9];
        er_menn = klubbresultat[10];
        er_kvinner = klubbresultat[11];
        er_fjernet = klubbresultat[12];
        er_fra = klubbresultat[13];
        er_til = klubbresultat[14];

        tr.setAttribute('data-er_menn', er_menn);
        tr.setAttribute('data-er_kvinner', er_kvinner);
        // disse kan også løkker gjennom ved å bruke attributter-variabelen ovenfor
        tr.setAttribute('data-poeng', poeng);
        tr.setAttribute('data-øvelse', øvelse);
        tr.setAttribute('data-resultat', resultat);
        tr.setAttribute('data-utøver', navn);
        tr.setAttribute('data-født', født);
        tr.setAttribute('data-sted', sted);
        tr.setAttribute('data-dato', datoNormalform(dato));
        tr.setAttribute('data-kjønn', (er_menn ? "menn" : "kvinner"));

        klubbresultat.forEach(function(verdi, indeks) {
            if (indeks > 9) {
                return;
            } else if (indeks == 1 || indeks == 3) {
                td = document.createElement("td");
                if (er_fjernet) td.style.backgroundColor = "#F8E0E0";
                if (er_til) td.style.backgroundColor = "#faf8d2ff";
                if (er_fra) td.style.backgroundColor = "#CFF8DB";
                tr.appendChild(td);
                img = document.createElement('img');
                img.style.maxHeight = "100%";
                
                if (indeks == 1) {
                    img.src = finn_øvelsesikon(verdi);
                } else {
                    img.src = (er_menn ? mann_svg : kvinne_svg);

                    td.style.cursor = "pointer";
                    lag_filter_ved_trykk(td, "kjønn", (er_menn ? "menn" : "kvinner"))
                }
                td.appendChild(img);
            }

            td = document.createElement("td");
            td.style.fontSize = "0.9rem";
            td.style.whiteSpace = "nowrap";
            td.style.overflow = "hidden";
            td.style.textOverflow = "ellipsis";

            if (indeks > 6) {
                
                var div = document.createElement('div');
                div.style.height = "20px";
                div.style.border = "1px gray solid";
                div.style.backgroundColor = "#d8ffce";
                div.style.lineHeight = "16px";
                div.style.padding = "0 8px 0 4px";
                div.style.whiteSpace = "nowrap";
                div.style.overflow = "hidden";
                div.style.textOverflow = "ellipsis";
                td.appendChild(div);
                td.style.border = "none";
                td.style.display = "inline-block";
                td.style.backgroundColor = "transparent";

                const klubblink = document.createElement('a');
                klubblink.href = '/livetabell/' + verdi;
                klubblink.textContent = verdi;
                klubblink.style.textDecoration = "none";

                if (er_fra && indeks == 7) {
                    div.style.backgroundColor = "#d8ffce";
                    div.append("fra ")
                    div.appendChild(klubblink);
                } else if (er_fjernet && indeks == 8) {
                    div.style.backgroundColor = (er_til ? "#fefab0" : "#FFBABA");
                    if (er_til) {
                        div.append("til ")
                        div.appendChild(klubblink);
                    } else {
                        div.append("fjernet")
                    }
                } else {
                    return;
                }

            } else {
                if (er_fjernet) td.style.backgroundColor = "#F8E0E0";
                if (er_til) td.style.backgroundColor = "#faf8d2ff";
                if (er_fra) td.style.backgroundColor = "#CFF8DB";
                td.textContent = (indeks == 6 ? datoNormalform(verdi) : verdi);
                td.style.cursor = "pointer";
                lag_filter_ved_trykk(td, attributter[indeks], td.textContent)
            }

            tr.appendChild(td);
            tr.style.display = "none";
        });

        tbody.appendChild(tr)
    });
    
    filterTable()
}

function lag_filter_ved_trykk(trigger, attributt, verdi) {
    trigger.addEventListener('click', function() {
        filterboks = document.getElementById("resultat-filterboks");

        let div = document.getElementById('filter-'+attributt);

        if (!div) {
            div = document.createElement('div');
            div.id = 'filter-'+attributt; 
            div.style.display = "inline-flex";
            div.style.backgroundColor = "white";
            div.style.padding = "0 10px 0 10px";
            div.style.alignItems = "center";
            filterboks.appendChild(div);
        } else {
            div.innerHTML = "";
        }
        
        filter = document.createElement('label')
        div.appendChild(filter);

        filter.textContent = attributt + "=" + verdi
        filter.setAttribute('data-attributt', attributt);
        filter.setAttribute('data-verdi', verdi);

        slett_knapp = document.createElement('div');
        div.appendChild(slett_knapp)
        slett_knapp.classList.add("slett-knapp");
        slett_knapp.style.marginLeft = "10px";
        slett_knapp.textContent = "x";
        slett_knapp.addEventListener('click', function() {
            filterboks.removeChild(document.getElementById('filter-'+attributt));
            filterTable()
        })

        filterTable()
    });
}

function finn_øvelsesikon(øvelse) {
    if (øvelse.endsWith("hekk")) return øvelsesikoner["hekk"];         
    if (/^[0-9]/.test(øvelse) && øvelse.length <= 3) return øvelsesikoner["sprint"];
    if (/^[0-9]/.test(øvelse) && øvelse.length > 3) return øvelsesikoner["løp"];
    if (øvelse.endsWith("u.t")) return øvelsesikoner[øvelse.slice(0, -4).toLowerCase()];       

    return øvelsesikoner[øvelse.toLowerCase()];
}

attributter = [["poeng", 0], ["øvelse", 2], ["resultat", 3], ["navn", 5], ["født", 6], ["sted", 7], ["dato", 8]]

attributter.forEach(([attributt, kolonneindeks]) => {
    id = attributt+"-th";
    document.getElementById(id).addEventListener('click', function() {
        sorterTabell(kolonneindeks, "klubbresultater");
    })
})

function sorterTabell(columnIndex, id) {
    const tbody = document.getElementById(id);
    const rows = Array.from(tbody.querySelectorAll("tr"));
  
    const isAsc = tbody.getAttribute("data-sort-dir") !== "asc";
    tbody.setAttribute("data-sort-dir", isAsc ? "asc" : "desc");
  
    rows.sort((a, b) => {
      const aText = a.children[columnIndex].textContent;
      const bText = b.children[columnIndex].textContent;

      if (columnIndex == 2) {
          return isAsc
            ? cached_data.øvelser.indexOf(aText) - cached_data.øvelser.indexOf(bText)
            : cached_data.øvelser.indexOf(bText) - cached_data.øvelser.indexOf(aText)
      }

      if (columnIndex == 8) {
        a_switched = aText.split(".")[1]+aText.split(".")[0];
        b_switched = bText.split(".")[1]+bText.split(".")[0];
        return isAsc
             ? a_switched.localeCompare(b_switched)
             : b_switched.localeCompare(a_switched)
      }

      const aNum = parseFloat(aText);
      const bNum = parseFloat(bText);

      if (aNum.toString() == aText && bNum.toString() == bText) {
        return isAsc ? aNum - bNum : bNum - aNum;
      } else {
        return isAsc
          ? aText.localeCompare(bText)
          : bText.localeCompare(aText);
      }
    });
    
  rows.forEach(row => tbody.appendChild(row));
};

function datoNormalform(yyyyMMdd) {
    var date = new Date(yyyyMMdd);
    
    var day = String(date.getDate()).padStart(2, '0');
    var month = String(date.getMonth() + 1).padStart(2, '0');

    return day + '.' + month;
}

function vis_klubblag(klubblag, kjønn) {
    tbody = document.getElementById("klubblag-" + kjønn);

    klubblag.forEach(function(lag, rad_i) {
        tr = document.createElement("tr");

        lag.slice(0,4).forEach(function(verdi, kol_i) {
            td = document.createElement("td");
            if (kol_i == 0) {
                var anchor = document.createElement('a');
                anchor.href = "/livetabell/" + verdi + " ("+ kjønn+")";
                anchor.textContent = (rad_i + 1) + ". lag";
                anchor.style.textDecoration = "none";
                td.appendChild(anchor)
                tr.append(td)
                return
            }
            td.textContent = verdi
            tr.appendChild(td);
        });
        tbody.appendChild(tr);
    })
}

vis_resultater();
vis_klubblag(menn_klubblag, "menn");
vis_klubblag(kvinner_klubblag, "kvinner")