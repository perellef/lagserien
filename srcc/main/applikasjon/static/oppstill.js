document.getElementById("uttrekksdatoInput").addEventListener("change", function() {
    inputField = document.getElementById("spesifikk-dato");
    datoalternativ = document.getElementById("uttrekksdatoInput").value;

    if (datoalternativ === "egendefinert") {
        inputField.type = "date";
        inputField.style.color = "#363636";
    } else {
        inputField.type = "text";
        inputField.style.color = "gray";
    }

    inputField.disabled = (datoalternativ === "seneste" || datoalternativ === "offisiell-slutt");
    inputField.value = utledDatoverdi(datoalternativ,"oppst-serieår");

    if (datoalternativ === "egendefinert") {
        inputField.focus()
    }
})

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

function oppdaterDato(byttet_alternativ) {
    datoalternativ = document.getElementById("uttrekksdatoInput").value
    if (!byttet_alternativ && datoalternativ === "egendefinert") {
        return
    }

    datofelt = document.getElementById("spesifikk-dato");
    datofelt.value = utledDatoverdi(datoalternativ, "oppst-serieår")
}

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

function erTom(verdi) {
    return verdi == "";
}

function erIkkeØvelse(øvelseValue) {
    return !cached_data.øvelser.includes(øvelseValue)
}

function erUkjentKlubb(klubbValue) {
    return !(cached_data.klubber.includes(klubbValue))
}

function erIkkeUtøverformat(utøverValue) {
    return !/^[a-zA-ZÅØäåæèéíñöøü\s.'-]+$/.test(utøverValue)
}

function finn_feilmelding_til_hent_klubbresultater(serieårValue, datoalternativ, datoValue, klubbValue) {
    if (erTom(klubbValue)) return "Klubb må fylles inn.";
    if (erUkjentSerieår(serieårValue)) return "Det fantes ingen serie med serieår " + serieårValue + ".";
    if (erIkkeDato(datoValue) && datoalternativ == 'offisiell-slutt') return "Serieåret " + serieårValue + " er ikke avsluttet enda.";
    if (erIFremtiden(datoValue)) return "Dato skal ikke være i fremtiden.";
    if (erUkjentKlubb(klubbValue)) return "Klubben '" + klubbValue + "' finnes ikke.";

    return null
}

function finn_feilmelding_til_nytt_resultat(øvelseValue, utøverValue, poengValue) {
    if (erTom(øvelseValue)) return "Øvelse må fylles inn.";
    if (erTom(utøverValue)) return "Utøver må fylles inn.";
    if (erTom(poengValue)) return "Poeng må fylles inn.";
    if (erIkkeØvelse(øvelseValue)) return "Øvelsen '" + øvelseValue + "' eksistererer ikke.";
    if (erIkkeUtøverformat(utøverValue)) return "Utøver inneholder tall eller ukjente symboler.";
    if (erIkkeHeltall(poengValue)) return "Poeng skal være et heltall.";
    if (parseInt(poengValue) <= 0 || parseInt(poengValue) > 1300) return "Poeng skal være mellom 1 og 1300.";

    return null
}

function erIkkeHeltall(verdi) {
    return !Number.isInteger(Number(verdi));
}

function finn_feilmelding_til_regeldetaljer(antall_obligatoriske, antall_valgfrie, min_obligatoriske_tekniske, min_valgfrie_tekniske) {
    
    if (erTom(antall_obligatoriske) || erTom(antall_valgfrie) || erTom(min_obligatoriske_tekniske) || erTom(min_valgfrie_tekniske)) return "Alle felt i oppstillingsregler må være fylt.";
    
    if (erIkkeHeltall(antall_obligatoriske)) return "Antall obligatoriske er ikke et heltall.";
    if (erIkkeHeltall(antall_valgfrie)) return "Antall valgfrie er ikke et heltall.";
    if (erIkkeHeltall(min_obligatoriske_tekniske)) return "Minimum antall tekniske obligatoriske skal være et heltall.";
    if (erIkkeHeltall(min_valgfrie_tekniske)) return "Minimum antall tekniske valgfrie skal være et heltall.";
    
    antall_obligatoriske = parseInt(antall_obligatoriske)
    antall_valgfrie = parseInt(antall_valgfrie)
    min_obligatoriske_tekniske = parseInt(min_obligatoriske_tekniske)
    min_valgfrie_tekniske = parseInt(min_valgfrie_tekniske)

    if (antall_obligatoriske < 0 || antall_obligatoriske > 30) return "Oppstillingsregler skal ha antall obligatoriske mellom 0 og 30."
    if (antall_valgfrie < 0 || antall_valgfrie > 30) return "Oppstillingsregler skal ha antall valgfrie mellom 0 og 30."
    if (antall_obligatoriske + antall_valgfrie < 5) return "Oppstillingsregler skal ha totalt minst 5 resultater."
    if (antall_obligatoriske < min_obligatoriske_tekniske) return "Antall obligatoriske tekniske resultater kan ikke være større enn antall obligatoriske resultater"
    if (antall_valgfrie < min_valgfrie_tekniske) return "Antall valgfrie tekniske resultater kan ikke være større enn antall valgfrie resultater"

    return null
}

document.getElementById('nytt-resultat-knapp').addEventListener('click', function() {
    øvelseValue = document.getElementById('øvelseInput').value;
    utøverValue = document.getElementById('utøverInput').value;
    poengValue = document.getElementById('poengInput').value;

    var errorMessage = document.getElementById('error-message1');

    feilmelding = finn_feilmelding_til_nytt_resultat(øvelseValue, utøverValue, poengValue);
    if (feilmelding !== null) {
        errorMessage.textContent = feilmelding;
        return;
    }

    errorMessage.textContent = "";
    
    legg_til_resultat(poengValue, øvelseValue, utøverValue, "");
    oppdater_mine_resultater();

});

function datoTilISOform(ddMMyyyy) {
    let [day, month, year] = ddMMyyyy.split('.');
    return year + '-' + month.padStart(2, '0') + '-' + day.padStart(2, '0');
}

// legg til resultat
function legg_til_resultat(poeng, øvelse, utøver, kilde) {

    if (!utøvere.includes(utøver)) {
        utøvere.push(utøver);
    }
    resultat_finnes = resultater.some(resultat => resultat.length === 3 && resultat[0] === poeng && resultat[1] === øvelse && resultat[2] == utøver);
    if (resultat_finnes) {
        return;
    }
    resultater.push([poeng, øvelse, utøver])

    var tableBody = document.querySelector('#gridTable tbody');
    var newRow = document.createElement('tr');
    var celle1 = document.createElement('td');
    var celle2 = document.createElement('td');
    var celle3 = document.createElement('td');
    var celle4 = document.createElement('td');
    var celle5 = document.createElement('td');  
    var celle6 = document.createElement('td'); 
        
    celle1.textContent = poeng;
    celle2.textContent = øvelse;
    celle3.textContent = utøver;
    celle4.textContent = utøvere.indexOf(utøver)+1;
    celle5.textContent = kilde;

    var deleteBtn = document.createElement('div');
    deleteBtn.textContent = 'x';
    deleteBtn.className = 'delete-btn';
    deleteBtn.style.cursor = "pointer";
    deleteBtn.style.backgroundColor = "#feb9b0";
    deleteBtn.style.width = "15px";
    deleteBtn.style.height = "15px";
    deleteBtn.style.textAlign = "center";
    deleteBtn.style.color = "white";
    deleteBtn.style.lineHeight = "11px";

    celle6.appendChild(deleteBtn);

    [celle1, celle2, celle3, celle4, celle5, celle6].forEach(function(celle) {
        celle.style.whiteSpace = "nowrap";
        celle.style.overflow = "hidden";
        celle.style.textOverflow = "ellipsis";
        celle.style.fontSize = "0.9rem"

        newRow.appendChild(celle);
    })

    tableBody.appendChild(newRow);

    deleteBtn.addEventListener('click', function() {
        tableBody.removeChild(newRow);
        oppdater_mine_resultater()
        
        resultater = resultater.filter(res => !(res[0] === poeng && res[1] === øvelse && res[2] === utøver))
    }); 
}

document.getElementById('hent-klubbresultater-knapp').addEventListener('click', function() {
    kjønnValue = document.getElementById('oppst-kjønn').textContent;
    serieårValue = document.getElementById('oppst-serieår').textContent;
    klubbValue = document.getElementById('klubbInput').value;
    datoalternativ = document.getElementById("uttrekksdatoInput").value;
    datoValue = document.getElementById('spesifikk-dato').value;

    if (datoalternativ !== "egendefinert" && datoValue !== "?") {datoValue = datoTilISOform(datoValue)}

    errorMessage = document.getElementById('error-message2');
    
    feilmelding = finn_feilmelding_til_hent_klubbresultater(serieårValue, datoalternativ, datoValue, klubbValue);

    if (feilmelding !== null) {
        errorMessage.textContent = feilmelding;
        return;
    }    
    errorMessage.textContent = "";

    fetch('/verktøy/lagoppstiller/hent_resultater', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            kjønn: kjønnValue,
            serieår: serieårValue,
            klubb: klubbValue,
            dato: datoValue,
        }),
    })
    .then(response => response.json())
    .then(rows => {
        rows.forEach(function(rowData) {
            legg_til_resultat(rowData[0], rowData[1], rowData[3], klubbValue)
            oppdater_mine_resultater()
        });
    })
});

function oppdater_mine_resultater() {
    const antall_resultater = document.getElementById("mitt-lag").children.length;

    autocomplete(document.getElementById("utøverInput"), utøvere);

    oppstiller_knapp = document.getElementById("oppstiller-knapp");

    h4 = document.getElementById("mine-resultater-tittel"); 
    h4.textContent = "Mine resultater (" + antall_resultater + ")";

    thead = document.getElementById("mitt-lag-header");
    thead.innerHTML = "";

    if (antall_resultater == 0) {
        oppstiller_knapp.style.backgroundColor = "lightgray";
    } else {
        oppstiller_knapp.style.backgroundColor = "#2772e3";

        tr = mine_resultater_header_tr();
        thead.appendChild(tr);
    }
}

function mine_resultater_header_tr() {
    poeng_th = document.createElement("th");
    øvelse_th = document.createElement("th");
    utøver_th = document.createElement("th");
    utøver_id_th = document.createElement("th");
    kilde_th = document.createElement("th");
    action_th = document.createElement("th");
    
    poeng_th.style.width = "12%";
    øvelse_th.style.width = "18%";
    utøver_th.style.width = "40%";
    utøver_id_th.style.width = "7%";
    kilde_th.style.width = "15%";
    action_th.style.width = "5%";

    poeng_th.textContent = "Poeng";
    øvelse_th.textContent = "Øvelse";
    utøver_th.textContent = "Utøver";
    utøver_id_th.textContent = "#";
    kilde_th.textContent = "Kilde"
    action_th.textContent = "";

    tr = document.createElement("tr");

    tr.appendChild(poeng_th);
    tr.appendChild(øvelse_th);
    tr.appendChild(utøver_th);
    tr.appendChild(utøver_id_th);
    tr.appendChild(kilde_th);
    tr.appendChild(action_th);
    
    return tr;
}

document.getElementById('ny-lagregel').addEventListener('click', function() {
    legg_til_lagregel()
})

function legg_til_lagregel() {
    lagregler_div = document.getElementById("lagregler") 

    lagnr = lagregler_div.children.length-1;

    regeldiv = document.createElement("div");
    regeldiv.style.backgroundColor = "#f3f3f3";
    regeldiv.style.margin = "5px";
    regeldiv.style.padding = "2px 5px 2px 15px";
    regeldiv.style.border = "1px lightgray solid";
    regeldiv.style.borderRadius = "5px";

    vist_innhold = document.createElement("div");
    vist_innhold.style.display = "flex";
    vist_innhold.style.lineHeight = "1.7";

    lagnavn = document.createElement("span");
    lagnavn.style.display = "inline-block";
    lagnavn.style.width = "70px";
    lagnavn.textContent = lagnr + ". lag:";

    vist_innhold.appendChild(lagnavn);

    select = document.createElement("select");
    select.id = "select-regler-"+lagnr
    select.style.padding = "0 10px 0 5px";
    select.style.border = "1px solid #ccc";
    select.name = "response";

    divisjon_1 = document.createElement("option");
    divisjon_1.value = "1-divisjon";
    divisjon_1.textContent = "1. divisjon";
    divisjon_2 = document.createElement("option");
    divisjon_2.value = "2-divisjon";
    divisjon_2.textContent = "2. divisjon";
    divisjon_3 = document.createElement("option");
    divisjon_3.value = "3-divisjon";
    divisjon_3.textContent = "3. divisjon";
    divisjon_3.selected = true;
    egendefinert = document.createElement("option");
    egendefinert.value = "egendefinert";
    egendefinert.textContent = "egendefinert";

    select.appendChild(divisjon_1);
    select.appendChild(divisjon_2);
    select.appendChild(divisjon_3);
    select.appendChild(egendefinert);

    vist_innhold.appendChild(select);

    a_detaljer = document.createElement("a");
    a_detaljer.textContent = "Detaljer";
    a_detaljer.style.fontSize = "0.7rem";
    a_detaljer.style.marginLeft = "20px";
    a_detaljer.setAttribute("data-toggle", "collapse");
    a_detaljer.setAttribute("href", "#detaljer-lagregel-"+lagnr);
    a_detaljer.setAttribute("role", "button");
    a_detaljer.setAttribute("aria-expanded", "true");
    
    vist_innhold.appendChild(a_detaljer)

    skjult_innhold = document.createElement("div");
    skjult_innhold.id = "detaljer-lagregel-"+lagnr;
    skjult_innhold.classList.add("collapse");
    skjult_innhold.style.fontSize = "0.7rem";
    skjult_innhold.style.marginTop = "5px";

    antall_obligatoriske = document.createElement("span");
    antall_obligatoriske.textContent = "Antall obligatoriske:";
    antall_obligatoriske.style.display = "inline-block";
    antall_obligatoriske.style.width = "105px";
    antall_valgfrie = document.createElement("span");
    antall_valgfrie.textContent = "Antall valgfrie:";
    antall_valgfrie.style.display = "inline-block";
    antall_valgfrie.style.width = "105px";

    input_obl = lagMiniInput("regler-obl-lag-"+lagnr);
    input_obl_tek = lagMiniInput("regler-obl-tek-lag-"+lagnr);
    input_val = lagMiniInput("regler-val-lag-"+lagnr);
    input_val_tek = lagMiniInput("regler-val-tek-lag-"+lagnr);

    skjult_innhold.appendChild(antall_obligatoriske);
    skjult_innhold.appendChild(input_obl);
    skjult_innhold.appendChild(document.createTextNode(" hvorav minst "));
    skjult_innhold.appendChild(input_obl_tek);
    skjult_innhold.appendChild(document.createTextNode(" tekniske"));
    skjult_innhold.appendChild(document.createElement("br"));
    skjult_innhold.appendChild(antall_valgfrie);
    skjult_innhold.appendChild(input_val);
    skjult_innhold.appendChild(document.createTextNode(" hvorav minst "));
    skjult_innhold.appendChild(input_val_tek);
    skjult_innhold.appendChild(document.createTextNode(" tekniske"));

    regeldiv.appendChild(vist_innhold);
    regeldiv.appendChild(skjult_innhold);

    lagregler_div.insertBefore(regeldiv, lagregler_div.children[lagnr-1]);

    $("#detaljer-lagregel-"+lagnr).collapse("hide");
    oppdaterDetaljer(lagnr, "3. divisjon");
    
    select.addEventListener("change", function() {
        if (this.value == "egendefinert") {
            $("#detaljer-lagregel-"+this.id.slice(14)).collapse("show");
        } 
        oppdaterDetaljer(this.id.slice(14), this.value);
    })
}

function lagMiniInput(id) {
    input = document.createElement("input");
    input.id = id;
    input.style.height = "18px"; 
    input.style.width = "20px"; 
    return input;
}

function oppdaterDetaljer(lagnr, alternativ) {
    input_obl = document.getElementById("regler-obl-lag-"+lagnr);
    input_obl_tek = document.getElementById("regler-obl-tek-lag-"+lagnr);
    input_val = document.getElementById("regler-val-lag-"+lagnr);
    input_val_tek = document.getElementById("regler-val-tek-lag-"+lagnr);
    
    input_obl.disabled = (alternativ !== "egendefinert");
    input_obl_tek.disabled = (alternativ !== "egendefinert");
    input_val.disabled = (alternativ !== "egendefinert");
    input_val_tek.disabled = (alternativ !== "egendefinert");

    if (alternativ == "egendefinert") {
        input_obl.value = "";
        input_obl_tek.value = "";
        input_val.value = "";
        input_val_tek.value = "";
        return;
    }

    divisjon = parseInt(alternativ[0]);
    regler = cached_data.krav[divisjon];
    
    input_obl.value = parseInt(regler[0]);
    input_obl_tek.value = parseInt(regler[0])-parseInt(regler[2]);
    input_val.value = parseInt(regler[1]);
    input_val_tek.value = parseInt(regler[1])-parseInt(regler[3]);
}

document.getElementById('oppstiller-knapp').addEventListener('click', function() {
    var lagDiv = document.querySelector('#lag');
    lagDiv.innerHTML = "";

    // lagregler
    var regler = []
    var errorMessage = document.getElementById('error-message');

    var lagregler_div = document.getElementById('lagregler');    
    for (let lagnr = 1; lagnr < lagregler_div.children.length - 1; lagnr++) {
        detaljer = document.getElementById("detaljer-lagregel-"+lagnr);
        
        antall_obligatoriske = document.getElementById("regler-obl-lag-"+lagnr).value;
        antall_valgfrie = document.getElementById("regler-val-lag-"+lagnr).value;
        min_obligatoriske_tekniske = document.getElementById("regler-obl-tek-lag-"+lagnr).value;
        min_valgfrie_tekniske = document.getElementById("regler-val-tek-lag-"+lagnr).value;

        feilmelding = finn_feilmelding_til_regeldetaljer(antall_obligatoriske, antall_valgfrie, min_obligatoriske_tekniske, min_valgfrie_tekniske)
        
        if (feilmelding !== null) {
            errorMessage.textContent = feilmelding;
            return;
        }

        regler.push([antall_obligatoriske, antall_valgfrie, min_obligatoriske_tekniske, min_valgfrie_tekniske]);
    }
    errorMessage.textContent = "";

    // resultater
    var resultater = document.querySelectorAll('#gridTable tbody tr');
    var data = [];

    resultater.forEach(function(resultat) {
        var cells = resultat.querySelectorAll('td');
        var rowData = [];
        for (var i = 0; i < cells.length - 1; i++) { // Exclude the last cell (delete button)
            rowData.push(cells[i].textContent);
        }
        data.push(rowData);
    });

    if (resultater.length == 0) {
        return;
    }
    var beregningshjul = document.querySelector('#beregning') 
    if (beregningshjul.style.display == 'block') {
        return;
    }
    beregningshjul.style.display = 'block';

    fetch('/verktøy/lagoppstiller/beregn', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ resultater: data, oppstillingsregler: regler }),
    })
    .then(response => response.json())
    .then(lag => {
        beregningshjul.style.display = 'none';

        var lagDiv = document.querySelector('#lag');

        h4 = document.createElement("h4");
        h4.textContent = "Beregnede lag";
        lagDiv.appendChild(h4);
        
        var i = 0
        lag.forEach(function(lagdata) {
            i++;

            var lagresultater = document.createElement("div");
            lagresultater.id = "lag-" + i;
            lagresultater.classList.add("collapse");
            
            knapp = document.createElement("div");
            knapp.setAttribute("data-toggle", "collapse");
            knapp.setAttribute("href", "#lag-" + i);
            knapp.setAttribute("role", "button");
            knapp.setAttribute("aria-expanded", "true");

            knapp.textContent = "Lag " + i + " – " + lagdata[0];
            knapp.style.border = "1px lightgray solid";
            knapp.style.paddingLeft = "12px";
            var chevron = document.createElement('img');
            chevron.src = chevron_down;
            chevron.style.width = "20px"; 
            knapp.appendChild(chevron);

            obl = lag_oppstilling(lagdata[1], "OBLIGATORISK") 
            val = lag_oppstilling(lagdata[1], "VALGFRI") 
            lagresultater.appendChild(obl);
            lagresultater.appendChild(val);
            lagresultater.style.backgroundColor = "white";
            lagresultater.style.padding = "10px";
            lagresultater.style.fontSize = "0.9rem";

            lagDiv.appendChild(knapp);
            lagDiv.appendChild(lagresultater);
        });

    });
});

function lag_oppstilling(lagresultater, oppstillingstype) {
    var oppstilling_div = document.createElement("div");
    var h6 = document.createElement("h6");
    h6.textContent = oppstillingstype
    oppstilling_div.appendChild(h6)
    
    var thead = document.createElement('thead');
    thead.classList.add("table-light");
    var tr = document.createElement('tr');

    var kol1 = document.createElement('th')
    var kol2 = document.createElement('th')
    var kol3 = document.createElement('th')
    var kol4 = document.createElement('th')
    
    kol1.textContent = "Poeng";
    kol2.textContent = "Øvelse";
    kol3.textContent = "Utøver";
    kol4.textContent = "Kilde";

    kol1.style.width = "10%"
    kol2.style.width = "20%"
    kol3.style.width = "40%"
    kol4.style.width = "30%"

    tr.appendChild(kol1)
    tr.appendChild(kol2)
    tr.appendChild(kol3)
    tr.appendChild(kol4)
    thead.appendChild(tr)

    var tbody = document.createElement('tbody');

    lagresultater[oppstillingstype].forEach(function(lagresultat) {
        var tr = document.createElement('tr');
        lagresultat.forEach(function(verdi) {
            var celle = document.createElement('td');

            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";

            celle.textContent = verdi;
            tr.appendChild(celle)
        });
        tbody.appendChild(tr)
    });

    var table = document.createElement('table');
    table.classList.add("table");
    table.classList.add("table-sm");
    table.appendChild(thead);
    table.appendChild(tbody);
    table.style.tableLayout = "fixed";

    oppstilling_div.appendChild(table)
    return oppstilling_div;
}

document.getElementById('oppst-kjønn-venstre').addEventListener('click', function() {
    kjønn = document.getElementById('oppst-kjønn');
    if (kjønn.textContent == "menn") {
        kjønn.textContent = "kvinner"
    } else {
        kjønn.textContent = "menn"
    }
});

document.getElementById('oppst-kjønn-høyre').addEventListener('click', function() {
    kjønn = document.getElementById('oppst-kjønn');
    if (kjønn.textContent == "menn") {
        kjønn.textContent = "kvinner"
    } else {
        kjønn.textContent = "menn"
    }
});

document.getElementById('oppst-serieår-venstre').addEventListener('click', function() {
    serieår = document.getElementById('oppst-serieår');
    serieår.textContent = serieår.textContent - 1
    oppdaterDato(false)
});

document.getElementById('oppst-serieår-høyre').addEventListener('click', function() {
    serieår = document.getElementById('oppst-serieår');
    serieår.textContent = parseInt(serieår.textContent) + 1
    oppdaterDato(false)
});


utøvere = []
resultater = []

oppdaterDato(true)

autocomplete(document.getElementById("øvelseInput"), cached_data.øvelser);
autocomplete(document.getElementById("klubbInput"), cached_data.klubber);

siste_serieår = Object.keys(cached_data.serier).reduce((a, b) => a > b ? a : b);

document.getElementById("oppst-serieår").textContent = siste_serieår
document.getElementById("spesifikk-dato").value = datoTilNormalform(cached_data.serier[siste_serieår].siste_dato)

legg_til_lagregel()
legg_til_lagregel()