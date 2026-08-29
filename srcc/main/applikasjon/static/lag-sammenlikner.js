document.getElementById('lagsam-kjønn-venstre1').addEventListener('click', function() {
    kjønn1 = document.getElementById('lagsam-kjønn1');
    if (kjønn1.textContent == "menn") {
        kjønn1.textContent = "kvinner"
    } else {
        kjønn1.textContent = "menn"
    }
});

document.getElementById('lagsam-kjønn-høyre1').addEventListener('click', function() {
    kjønn1 = document.getElementById('lagsam-kjønn1');
    if (kjønn1.textContent == "menn") {
        kjønn1.textContent = "kvinner"
    } else {
        kjønn1.textContent = "menn"
    }
});

document.getElementById('lagsam-serieår-venstre1').addEventListener('click', function() {
    serieår1 = document.getElementById('lagsam-serieår1');
    serieår1.textContent = serieår1.textContent - 1
});

document.getElementById('lagsam-serieår-høyre1').addEventListener('click', function() {
    serieår1 = document.getElementById('lagsam-serieår1');
    serieår1.textContent = parseInt(serieår1.textContent) + 1
});

document.getElementById('lagsam-lag-venstre1').addEventListener('click', function() {
    lag = document.getElementById('lagsam-lag1');
    lag.textContent = (parseInt(lag.textContent)+3)%5+1
});

document.getElementById('lagsam-lag-høyre1').addEventListener('click', function() {
    lag = document.getElementById('lagsam-lag1');
    lag.textContent = parseInt(lag.textContent)%5+1
});

function erUkjentSerieår(serieårValue) {
    return !(cached_data.serier.hasOwnProperty(serieårValue))
}

function erTomKlubb(klubbValue) {
    return klubbValue == ""
}

function erUkjentKlubb(klubbValue) {
    return !cached_data.klubber.some(pair => pair[0] === klubbValue)
}

function finn_feilmelding_til_input(serieårValue, klubbValue) {
    if (erUkjentSerieår(serieårValue)) return "Det fantes ingen serie med serieår " + serieårValue + "."
    if (erTomKlubb(klubbValue)) return "Klubb må fylles inn."
    if (erUkjentKlubb(klubbValue)) return "Klubben '" + klubbValue + "' finnes ikke."

    return null
}

document.getElementById('sammenliknBtn').addEventListener('click', function() {
    kjønnValue1 = document.getElementById('lagsam-kjønn1').textContent;
    serieårValue1 = document.getElementById('lagsam-serieår1').textContent;
    klubbValue1 = document.getElementById('klubbInput1').value;
    lagValue1 = document.getElementById('lagsam-lag1').textContent;

    errorMessage1 = document.getElementById('error-message1');
    
    feilmelding1 = finn_feilmelding_til_input(serieårValue1, klubbValue1);
    
    errorMessage1.textContent = "";
    if (feilmelding1 !== null) {
        errorMessage1.textContent = feilmelding1;
        return
    }

    fetch('/verktøy/lagsammenlikner/sammenlikn', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            kjønn1: kjønnValue1,
            serieår1: serieårValue1,
            klubb1: klubbValue1,
            lag1: lagValue1,
            kjønn2: kjønn,
            serieår2: serieår,
            klubb2: klubbnavn,
            lag2: lagnummer
        }),
    })
    .then(response => response.json())
    .then(rows => {
        vis_sammenlikning(rows)
    });
});

function lag_laginfo_tabell(kolonne) {
    const ramme = document.createElement("div");

    const h5 = document.createElement("h5");
    h5.textContent = "Laginfo";
    h5.fontSize = "1.05rem";
    h5.style.color = "rgb(61, 61, 61)";
    ramme.appendChild(h5)

    // tabell
    var tbody = document.createElement('tbody');

    const header = ["Divisjon", "Plassering", "Poeng", "Antall noteringer", "Antall deltakere"] 
    kolonne.map((value, index) => [header[index], value]).forEach(function(rad) {
        var tr = document.createElement('tr');
        rad.forEach(function(verdi) {
            var celle = document.createElement('td')
            celle.textContent = verdi;
            celle.style.padding = "1px 25px 1px 3px";
            celle.style.whiteSpace = "nowrap";
            celle.style.fontSize = "0.85rem";
            tr.appendChild(celle)
            tr.style.borderWidth = "1px"
        })
    
        tbody.appendChild(tr)
    })

    var tabell = document.createElement('table');
    tabell.classList.add("table");
    tabell.classList.add("table-sm");
    tabell.style.width = "auto";
    tabell.appendChild(tbody)

    ramme.appendChild(tabell)
    return ramme
}


function lag_oppstilling_tabell(tittel, rader) {
    const header = ["Øvelse", "Utøver", "Poeng"];

    const ramme = document.createElement("div");

    const h5 = document.createElement("h5");
    h5.textContent = tittel;
    h5.fontSize = "1.05rem";
    h5.style.color = "rgb(61, 61, 61)";
    ramme.appendChild(h5)

    // tabell
    var thead = document.createElement('thead');
    thead.classList.add("table-light");
    var tr = document.createElement('tr');
    
    const maxWidth = ["23%", "49%", "15%", "13%"]
    header.forEach(function(verdi, index) {
        var celle = document.createElement('th')
        celle.textContent = verdi;
        celle.style.width = maxWidth[index];
        celle.classList.add("standard-celle");
        tr.appendChild(celle)

        if (index == 3) {
            celle.style.backgroundColor = "transparent";
            celle.style.fontSize = "0.85rem";
        } else {
            if (index == 0) {
                celle.style.borderLeft = "1px lightgray solid";
            }
            if (index == 2) {
                celle.style.borderRight = "1px lightgray solid";
            }
            celle.style.borderBottom = "1px lightgray solid";
            celle.style.borderTop = "1px lightgray solid";
            celle.style.whiteSpace = "nowrap";
            celle.style.fontSize = "0.85rem";
            if (index == 2) {
                celle.style.padding = "0 7px 0 3px";
            } else {
                celle.style.padding = "0 15px 0 3px";
            }
        }
    })
    thead.appendChild(tr);

    var tbody = document.createElement('tbody');

    rader.forEach(function(rad) {
        var tr = document.createElement('tr');
        rad.forEach(function(verdi, index) {
            var celle = document.createElement('td')
            tr.appendChild(celle)

            celle.textContent = verdi;
            celle.style.paddingTop = "0px";
            celle.style.paddingBottom = "0px";
            
            if (index == 0 || index == 1) {
                celle.style.whiteSpace = "nowrap";
                celle.style.overflow = "hidden";
                celle.style.textOverflow = "ellipsis";
            }
            
            if (index == 3) {
                celle.style.fontSize = "0.75rem";
                celle.style.verticalAlign = "bottom";
                celle.style.borderBottomColor = "transparent";
                celle.style.paddingLeft = "5px";
                celle.style.borderLeft = "1px lightgray solid";
                celle.style.textAlign = "right";
                if (verdi != "") {
                    if (verdi >= 0) {
                        tr.children[2].style.backgroundColor = "#d8ffce";
                        celle.textContent = "+" + verdi;
                    } else {
                        tr.children[2].style.backgroundColor = "#fefab0";
                    }
                }
            } else {
                if (index == 0) {
                    celle.style.borderLeft = "1px lightgray solid";
                }
                if (index == 2) {
                    celle.style.textAlign = "right";
                }
                celle.style.padding = "1px 15px 1px 3px";
                celle.style.fontSize = "0.85rem";
                celle.style.borderBottom = "1px lightgray solid";
                celle.style.borderTop = "1px lightgray solid";
            }

            if (verdi == "ignorer") {
                celle.style.visibility = "hidden";
                celle.style.border = "none";
                celle.textContent = ".";
            }
            if (verdi == "") {
                celle.textContent = "‎"
            }
        })
        tbody.appendChild(tr)
    })

    var tabell = document.createElement('table');
    tabell.classList.add("table");
    tabell.classList.add("table-sm");
    tabell.appendChild(thead)
    tabell.appendChild(tbody)
    tabell.style.tableLayout = "fixed";

    ramme.appendChild(tabell)
    return ramme
}

function lag_panel(rows) {
    panel = document.createElement("div");

    lagnavn = document.createElement("h4");
    lagnavn.textContent = rows[0];
    lagnavn.style.maxWidth = "80%";
    lagnavn.style.marginLeft = "2px";
    lagnavn.style.whiteSpace = "nowrap";
    lagnavn.style.overflow = "hidden";
    lagnavn.style.textOverflow = "ellipsis";

    panel.appendChild(lagnavn);

    lagpanel = document.createElement("div");
    lagpanel.style.backgroundColor = "white";
    lagpanel.style.border = "2px rgb(232, 232, 234) solid";
    lagpanel.style.padding = "10px 5px 0 5px";

    lagpanel.appendChild(lag_laginfo_tabell(rows[1]));
    lagpanel.appendChild(document.createElement("hr"))
    lagpanel.appendChild(lag_oppstilling_tabell("OBLIGATORISK", rows[2]));
    lagpanel.appendChild(lag_oppstilling_tabell("VALGFRI", rows[3]));

    panel.appendChild(lagpanel);
    return panel
}

function vis_sammenlikning(rows) {
    var sammenlikningDiv = document.querySelector('#panel-sammenlikning');
    sammenlikningDiv.innerHTML = "";

    første_panel = lag_panel(rows[0]);
    andre_panel = lag_panel(rows[1])

    første_panel.style.marginRight = "2px";
    andre_panel.style.marginLeft = "2px"; 

    sammenlikningDiv.appendChild(første_panel);
    sammenlikningDiv.appendChild(andre_panel);
}

document.getElementById("klubbInput1").addEventListener("keydown", function (event) {
    if (event.key === "Enter") {
        this.blur();
    }
});

autocomplete(document.getElementById("klubbInput1"), cached_data.klubber);

siste_serieår = Object.keys(cached_data.serier).reduce((a, b) => a > b ? a : b);

document.getElementById("lagsam-serieår1").textContent = siste_serieår;