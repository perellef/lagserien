
document.getElementById('divisjon-venstre').addEventListener('click', function() {
    divisjon = document.getElementById('livetabell-divisjon');
    divisjon.textContent = ((divisjon.textContent + 1) % 3) + 1
    vis_lagplasseringer()
});

document.getElementById('divisjon-høyre').addEventListener('click', function() {
    divisjon = document.getElementById('livetabell-divisjon');
    divisjon.textContent = (divisjon.textContent % 3) + 1
    vis_lagplasseringer()
});

document.getElementById('kjønn-venstre').addEventListener('click', function() {
    divisjon = document.getElementById('livetabell-kjønn');
    if (divisjon.textContent == "menn") {
        divisjon.textContent = "kvinner"
    } else {
        divisjon.textContent = "menn"
    }
    vis_lagplasseringer()
});

document.getElementById('kjønn-høyre').addEventListener('click', function() {
    divisjon = document.getElementById('livetabell-kjønn');
    if (divisjon.textContent == "menn") {
        divisjon.textContent = "kvinner"
    } else {
        divisjon.textContent = "menn"
    }
    vis_lagplasseringer()
});

function vis_lagplasseringer() {
    kjønn = document.getElementById('livetabell-kjønn').textContent;
    divisjon = document.getElementById('livetabell-divisjon').textContent;
    krets = document.getElementById("kretsalternativer").value;

    lagplasseringer = cached_data.livetabell[kjønn][divisjon]
    noteringer = cached_data.noteringer[divisjon]

    tbody = document.getElementById('lagplasseringer');
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    var forrige = 100000000
    lagplasseringer.forEach(function(lagplassering) {

        if (krets != "alle" && krets != lagplassering[7]) {
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

        celler[0].style.fontSize = "0.8rem";
        celler[0].style.textAlign = "right";
        celler[1].style.textAlign = "center";
        celler[4].style.textAlign = "right";
        celler[5].style.fontSize = "0.85rem";
        celler[5].style.textAlign = "right";
        celler[5].style.paddingRight = "40px";
        celler[6].style.paddingRight = "20px";
        celler[6].style.textAlign = "right";
        celler[7].style.paddingLeft = "20px";
        
        if (lagplassering[0] > 0) {celler[0].textContent = lagplassering[0] + "▲"; celler[0].style.color = "green";}
        if (lagplassering[0] < 0) {celler[0].textContent = String(lagplassering[0]).slice(1) + "▼"; celler[0].style.color = "red";} 

        var anchor = document.createElement('a');   
        anchor.href = "/livetabell/" + lagplassering[2] + " (" + kjønn + ")";
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

        if (divisjon == 3 && celler[4].textContent < 4000 && lagplasseringer.length > 100 && krets == "alle") {
            lag.style.display = "none";
        }

        forrige = celler[4].textContent;
        tbody.appendChild(lag)
    });

    knapp = document.getElementById('eventuell-se-alle-knapp');
    if (divisjon == 3 && lagplasseringer.length > 100 && krets == "alle") {
        knapp.style.display = "block";
        knapp.addEventListener("click", function() {
            Array.from(tbody.children).forEach(lag => {
                lag.style.display = "table-row";
                knapp.style.display = "none";
            })
        });
    } else {
        knapp.style.display = "none";
    }
}

function td_med(klasse, verdi) {
    td = document.createElement('td');
    td.className = klasse;
    td.textContent = verdi;
    td.style.verticalAlign = "middle";
    return td;
}

function sett_inn_kretsalternativer() {
    kretsalternativer = document.getElementById('kretsalternativer');
    kretsalternativer.addEventListener("change", () => {
        vis_lagplasseringer()
    });

    cached_data.kretser.forEach(function(krets) {
        var kretsoption = document.createElement('option');
        kretsoption.value = krets;
        kretsoption.textContent = krets;
        kretsoption.style.fontSize = "0.8rem";

        kretsalternativer.appendChild(kretsoption)
    })
}

const thNoteringer = document.getElementById('th-noteringer');
const colNoteringer = document.getElementById('col-noteringer');

// Cache initial widths
const initialColWidth = colNoteringer ? getComputedStyle(colNoteringer).width : '100px';

window.onload = vis_lagplasseringer();
sett_inn_kretsalternativer()