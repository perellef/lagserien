
function lag_utsnitt_tabell(kjønn, divisjon, lagplasseringer) {
    noteringer = cached_data.noteringer[divisjon]

    table = document.createElement("table");
    table.classList.add("table");
    table.classList.add("table-sm");
    table.classList.add("notistabell");
    thead = document.createElement("thead");
    tbody = document.createElement("tbody");
    table.appendChild(thead);
    table.appendChild(tbody);
    colgroup = document.createElement("colgroup");
    thead.appendChild(colgroup)
    tr = document.createElement("tr");
    thead.appendChild(tr);

    widths = ["5","7","5","20","8","12","12","21"]
    widths.forEach(width => {
        col = document.createElement("col");
        colgroup.appendChild(col);
        col.style.width = width+"%";
        col.style.whiteSpace = "nowrap";
    })

    header = ["","","","Lag","Poeng","Noteringer","Krets"]
    header.forEach((tittel, i) => {
        th = document.createElement("th");
        tr.appendChild(th);
        th.scope = "col";
        th.value = tittel;

        if (i == 4) th.colspan = "2";
        if (i == 6) th.style.paddingLeft = "20px";
    })

    var forrige = 100000000
    lagplasseringer.forEach(function(lagplassering, indeks) {

        var lag = document.createElement('tr');

        celler = [
            td_med(""),
            td_med(lagplassering[1]),
            td_med(""),
            td_med(""),
            td_med(lagplassering[3]),
            td_med(""),
            td_med(lagplassering[5]+"/"+noteringer),
            td_med(lagplassering[7]),
        ]

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

        if (cached_data.klubblogoer.includes(lagplassering[8])) {
            logo = `${window.location.origin}/static/assets/klubblogo/${lagplassering[8]}.png`;
            var img = document.createElement('img');
            img.src = logo;
            img.style.maxHeight = "20px";
            img.style.width = "auto";
            
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
    return table;
}

function td_med(verdi) {
    td = document.createElement('td');
    td.textContent = verdi;
    td.style.verticalAlign = "middle";
    return td;
}
