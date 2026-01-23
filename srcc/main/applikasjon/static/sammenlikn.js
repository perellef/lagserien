document.getElementById("uttrekksdatoInput1").addEventListener("change", function() {
    endringerSFAnyttDatoalternativ(1);
});

document.getElementById("uttrekksdatoInput2").addEventListener("change", function() {
    endringerSFAnyttDatoalternativ(2);
});

function endringerSFAnyttDatoalternativ(nummer) {
    inputField = document.getElementById("spesifikk-dato-"+nummer);
    datoalternativ = document.getElementById("uttrekksdatoInput"+nummer).value;

    if (datoalternativ === "egendefinert") {
        inputField.type = "date";
        inputField.style.color = "#363636";
    } else {
        inputField.type = "text";
        inputField.style.color = "gray";
    }

    inputField.disabled = (datoalternativ === "seneste" || datoalternativ === "offisiell-slutt");
    inputField.value = utledDatoverdi(datoalternativ,"lagsam-serieår"+nummer);

    if (datoalternativ === "egendefinert") {
        inputField.focus()
    }
}

function utledDatoverdi(datoalternativ, serieår_id) {
    if (datoalternativ == "egendefinert") {
        return ""
    }
    
    serieår = document.getElementById(serieår_id).textContent;
    if (erUkjentSerieår(serieår)) {
        return "?"
    }
    if (datoalternativ == "seneste") {
        return datoTilNormalform(cached_data.serier[serieår].siste_dato)
    }
    if (datoalternativ == "offisiell-slutt") {
        if (cached_data.serier[serieår].avsluttet === null) {
            return "?"
        }
        return datoTilNormalform(cached_data.serier[serieår].avsluttet)
    }
    return "?"
}

function datoTilNormalform(yyyyMMdd) {
    var date = new Date(yyyyMMdd);
    
    var day = String(date.getDate()).padStart(2, '0');  // Pads day to 2 digits
    var month = String(date.getMonth() + 1).padStart(2, '0');  // Pads month to 2 digits
    var year = date.getFullYear();

    return day + '.' + month + '.' + year;
}

function datoTilISOform(ddMMyyyy) {
    let [day, month, year] = ddMMyyyy.split('.');
    return year + '-' + month.padStart(2, '0') + '-' + day.padStart(2, '0');
}

function oppdaterDato1(byttet_alternativ) {
    datoalternativ = document.getElementById("uttrekksdatoInput1").value
    if (!byttet_alternativ && datoalternativ === "egendefinert") {
        return
    }

    datofelt = document.getElementById("spesifikk-dato-1");
    datofelt.value = utledDatoverdi(datoalternativ, "lagsam-serieår1")
}

function oppdaterDato2(byttet_alternativ) {
    datoalternativ = document.getElementById("uttrekksdatoInput2").value
    if (!byttet_alternativ && datoalternativ === "egendefinert") {
        return
    }

    datofelt = document.getElementById("spesifikk-dato-2");
    datofelt.value = utledDatoverdi(datoalternativ,"lagsam-serieår2")
}

document.getElementById('lagsam-kjønn-venstre1').addEventListener('click', function() {
    kjønn = document.getElementById('lagsam-kjønn1');
    if (kjønn.textContent == "menn") {
        kjønn.textContent = "kvinner"
    } else {
        kjønn.textContent = "menn"
    }
});

document.getElementById('lagsam-kjønn-høyre1').addEventListener('click', function() {
    kjønn = document.getElementById('lagsam-kjønn1');
    if (kjønn.textContent == "menn") {
        kjønn.textContent = "kvinner"
    } else {
        kjønn.textContent = "menn"
    }
});

document.getElementById('lagsam-kjønn-venstre2').addEventListener('click', function() {
    kjønn = document.getElementById('lagsam-kjønn2');
    if (kjønn.textContent == "menn") {
        kjønn.textContent = "kvinner"
    } else {
        kjønn.textContent = "menn"
    }
});

document.getElementById('lagsam-kjønn-høyre2').addEventListener('click', function() {
    kjønn = document.getElementById('lagsam-kjønn2');
    if (kjønn.textContent == "menn") {
        kjønn.textContent = "kvinner"
    } else {
        kjønn.textContent = "menn"
    }
});

document.getElementById('lagsam-serieår-venstre1').addEventListener('click', function() {
    serieår = document.getElementById('lagsam-serieår1');
    serieår.textContent = serieår.textContent - 1
    oppdaterDato1(false)
});

document.getElementById('lagsam-serieår-høyre1').addEventListener('click', function() {
    serieår = document.getElementById('lagsam-serieår1');
    serieår.textContent = parseInt(serieår.textContent) + 1
    oppdaterDato1(false)
});

document.getElementById('lagsam-serieår-venstre2').addEventListener('click', function() {
    serieår = document.getElementById('lagsam-serieår2');
    serieår.textContent = serieår.textContent - 1
    oppdaterDato2(false)
});

document.getElementById('lagsam-serieår-høyre2').addEventListener('click', function() {
    serieår = document.getElementById('lagsam-serieår2');
    serieår.textContent = parseInt(serieår.textContent) + 1
    oppdaterDato2(false)
});

document.getElementById('lagsam-lag-venstre1').addEventListener('click', function() {
    lag = document.getElementById('lagsam-lag1');
    lag.textContent = (parseInt(lag.textContent)+3)%5+1
});

document.getElementById('lagsam-lag-høyre1').addEventListener('click', function() {
    lag = document.getElementById('lagsam-lag1');
    lag.textContent = parseInt(lag.textContent)%5+1
});

document.getElementById('lagsam-lag-venstre2').addEventListener('click', function() {
    lag = document.getElementById('lagsam-lag2');
    lag.textContent = (parseInt(lag.textContent)+3)%5+1
});

document.getElementById('lagsam-lag-høyre2').addEventListener('click', function() {
    lag = document.getElementById('lagsam-lag2');
    lag.textContent = parseInt(lag.textContent)%5+1
});

function erUkjentSerieår(serieårValue) {
    return !(cached_data.serier.hasOwnProperty(serieårValue))
}

function erIkkeDato(datoValue) {
    const date = new Date(datoValue);
    return isNaN(date.getTime()) || datoValue !== date.toISOString().slice(0,10);
}


function erIFremtiden(datoValue) {
    const options = {
        timeZone: 'Europe/Oslo',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit'
      };
      
    const formatter = new Intl.DateTimeFormat('no-NO', options);
    const osloDate = formatter.format(new Date());
    return new Date(datoValue) > osloDate;
}

function erTomKlubb(klubbValue) {
    return klubbValue == ""
}

function erUkjentKlubb(klubbValue) {
    return !(cached_data.klubber.includes(klubbValue))
}

function finn_feilmelding_til_input(serieårValue, datoalternativ, datoValue, klubbValue) {
    if (erUkjentSerieår(serieårValue)) return "Det fantes ingen serie med serieår " + serieårValue + "."
    if (erIkkeDato(datoValue) && datoalternativ == 'offisiell-slutt') return "Serieåret " + serieårValue + " er ikke avsluttet enda."
    if (erIFremtiden(datoValue)) return "Dato skal ikke være i fremtiden."
    if (erTomKlubb(klubbValue)) return "Klubb må fylles inn."
    if (erUkjentKlubb(klubbValue)) return "Klubben '" + klubbValue + "' finnes ikke."

    return null
}

document.getElementById('sammenliknBtn').addEventListener('click', function() {

    kjønnValue1 = document.getElementById('lagsam-kjønn1').textContent;
    serieårValue1 = document.getElementById('lagsam-serieår1').textContent;
    datoalternativ1 = document.getElementById("uttrekksdatoInput1").value
    datoValue1 = document.getElementById('spesifikk-dato-1').value;
    klubbValue1 = document.getElementById('klubbInput1').value;
    lagValue1 = document.getElementById('lagsam-lag1').textContent;
    kjønnValue2 = document.getElementById('lagsam-kjønn2').textContent;
    serieårValue2 = document.getElementById('lagsam-serieår2').textContent;
    datoalternativ2 = document.getElementById("uttrekksdatoInput2").value
    datoValue2 = document.getElementById('spesifikk-dato-2').value;
    klubbValue2 = document.getElementById('klubbInput2').value;
    lagValue2 = document.getElementById('lagsam-lag2').textContent;

    if (datoalternativ1 !== "egendefinert" && datoValue1 !== "?") {datoValue1 = datoTilISOform(datoValue1)}
    if (datoalternativ2 !== "egendefinert" && datoValue2 !== "?") {datoValue2 = datoTilISOform(datoValue2)}

    errorMessage1 = document.getElementById('error-message1');
    errorMessage2 = document.getElementById('error-message2');
    
    feilmelding1 = finn_feilmelding_til_input(serieårValue1, datoalternativ1, datoValue1, klubbValue1);
    feilmelding2 = finn_feilmelding_til_input(serieårValue2, datoalternativ2, datoValue2, klubbValue2);
    
    errorMessage1.textContent = "";
    errorMessage2.textContent = "";
    if (feilmelding1 !== null) {
        errorMessage1.textContent = feilmelding1;
    }
    if (feilmelding2 !== null) {
        errorMessage2.textContent = feilmelding2;
    }
    if (feilmelding1 !== null || feilmelding2 !== null) {
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
            uttrekksdato1: datoValue1,
            klubb1: klubbValue1,
            lag1: lagValue1,
            kjønn2: kjønnValue2,
            serieår2: serieårValue2,
            uttrekksdato2: datoValue2,
            klubb2: klubbValue2,
            lag2: lagValue2
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
            celle.style.fontSize = "0.9rem";
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
            celle.style.fontSize = "0.9rem";
            if (index == 2) {
                celle.style.padding = "1px 7px 1px 3px";
            } else {
                celle.style.padding = "1px 15px 1px 3px";
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

            
            if (index == 0 || index == 1) {
                celle.style.whiteSpace = "nowrap";
                celle.style.overflow = "hidden";
                celle.style.textOverflow = "ellipsis";
            }
            
            if (index == 3) {
                celle.style.fontSize = "0.8rem";
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
                celle.style.fontSize = "0.9rem";
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

function bytt(id1, id2) {
    source = document.getElementById(id1);
    target = document.getElementById(id2);

    let sourceklone = source.cloneNode(true);
    let targetklone = target.cloneNode(true);

    sourceklone.id = id2;
    targetklone.id = id1;
    sourceklone.value = source.value;
    targetklone.value = target.value;

    source.replaceWith(targetklone);
    target.replaceWith(sourceklone);
}

document.getElementById("bytt-om-lag").addEventListener('click', function() {
    bytt('lagsam-kjønn1', 'lagsam-kjønn2');
    bytt('lagsam-serieår1', 'lagsam-serieår2');
    bytt("uttrekksdatoInput1", "uttrekksdatoInput2");
    bytt("spesifikk-dato-1", "spesifikk-dato-2");
    bytt("klubbInput1", "klubbInput2");
    bytt("lagsam-lag1", "lagsam-lag2");

    document.getElementById("uttrekksdatoInput1").addEventListener("change", function() {
        endringerSFAnyttDatoalternativ(1);
    });
    
    document.getElementById("uttrekksdatoInput2").addEventListener("change", function() {
        endringerSFAnyttDatoalternativ(2);
    });

    autocomplete(document.getElementById("klubbInput1"), cached_data.klubber);
    autocomplete(document.getElementById("klubbInput2"), cached_data.klubber);

});

document.getElementById("spesifikk-dato-1").addEventListener("keydown", function (event) {
    if (event.key === "Enter") {
        document.getElementById("klubbInput1").focus();
    }
});

document.getElementById("klubbInput1").addEventListener("keydown", function (event) {
    if (event.key === "Enter") {
        this.blur();
    }
});

document.getElementById("spesifikk-dato-2").addEventListener("keydown", function (event) {
    if (event.key === "Enter") {
        document.getElementById("klubbInput2").focus();
    }
});

document.getElementById("klubbInput2").addEventListener("keydown", function (event) {
    if (event.key === "Enter") {
        this.blur();
    }
});

autocomplete(document.getElementById("klubbInput1"), cached_data.klubber);
autocomplete(document.getElementById("klubbInput2"), cached_data.klubber);

oppdaterDato1(true)
oppdaterDato2(true)

siste_serieår = Object.keys(cached_data.serier).reduce((a, b) => obj[a] > obj[b] ? a : b);

document.getElementById("lagsam-serieår1").textContent = siste_serieår
document.getElementById("lagsam-serieår2").textContent = siste_serieår
document.getElementById("spesifikk-dato-1").value = datoTilNormalform(cached_data.serier[siste_serieår].siste_dato)
document.getElementById("spesifikk-dato-2").value = datoTilNormalform(cached_data.serier[siste_serieår].siste_dato)