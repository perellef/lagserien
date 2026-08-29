const mine_resultater = []

function datoTilNormalform(yyyyMMdd) {
    var date = new Date(yyyyMMdd);
    
    var day = String(date.getDate()).padStart(2, '0');  // Pads day to 2 digits
    var month = String(date.getMonth() + 1).padStart(2, '0');  // Pads month to 2 digits
    var year = date.getFullYear();

    return day + '.' + month + '.' + year;
}

function erTom(verdi) {
    return verdi == "";
}

function erIkkeØvelse(øvelseValue) {
    return !Object.values(cached_data.øvelser).some(arr => arr.includes(øvelseValue));
}

function erIkkeUtøverformat(utøverValue) {
    return !/^[a-zA-ZÅØäåæèéíñöøü\s.'-]+$/.test(utøverValue)
}

function finn_feilmelding_til_nytt_resultat(øvelseValue, utøverValue, poengValue) {
    if (erTom(poengValue)) return "Poeng må fylles inn.";
    if (erIkkeHeltall(poengValue)) return "Poeng skal være et heltall.";
    if (parseInt(poengValue) <= 0 || parseInt(poengValue) > 1300) return "Poeng skal være mellom 1 og 1300.";
    if (erTom(øvelseValue)) return "Øvelse må fylles inn.";
    if (erTom(utøverValue)) return "Utøver må fylles inn.";
    if (erIkkeØvelse(øvelseValue)) return "Øvelsen '" + øvelseValue + "' eksistererer ikke.";
    if (erIkkeUtøverformat(utøverValue)) return "Utøver inneholder tall eller ukjente symboler.";
   
    return null
}

function erIkkeHeltall(verdi) {
    return !Number.isInteger(Number(verdi));
}

document.getElementById('nytt-resultat-knapp').addEventListener('click', function() {
    øvelseValue = document.getElementById('øvelseInput').value;
    utøverValue = document.getElementById('utøverInput').value;
    poengValue = document.getElementById('poengInput').value;

    var errorMessage = document.getElementById('error-message2');

    feilmelding = finn_feilmelding_til_nytt_resultat(øvelseValue, utøverValue, poengValue);

    if (feilmelding !== null) {
        errorMessage.textContent = feilmelding;
        return;
    }

    errorMessage.textContent = "";
    
    legg_til_resultat(poengValue, øvelseValue, utøverValue, true);
    oppdater_mine_resultater();

});

function datoTilISOform(ddMMyyyy) {
    let [day, month, year] = ddMMyyyy.split('.');
    return year + '-' + month.padStart(2, '0') + '-' + day.padStart(2, '0');
}

// legg til resultat
function legg_til_resultat(poeng, øvelse, utøver, kan_fjernes) {
    if (!utøvere.includes(utøver)) {
        utøvere.push(utøver);
    }
    resultat_finnes = mine_resultater.some(res => res.length === 3 && res[0] === poeng && res[1] === øvelse && res[2] == utøver);
    if (resultat_finnes) {
        return;
    }
    mine_resultater.push([poeng, øvelse, utøver])

    var tableBody = document.querySelector('#gridTable tbody');
    var newRow = document.createElement('tr');
    var celle1 = document.createElement('td');
    var celle2 = document.createElement('td');
    var celle3 = document.createElement('td');
    var celle4 = document.createElement('td');
    var celle5 = document.createElement('td');  
        
    celle1.textContent = poeng;
    celle2.textContent = øvelse;
    celle3.textContent = utøver;
    celle4.textContent = utøvere.indexOf(utøver)+1;

    if (kan_fjernes) {
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
        celle5.appendChild(deleteBtn);

    }

    [celle1, celle2, celle3, celle4, celle5].forEach(function(celle) {
        celle.style.whiteSpace = "nowrap";
        celle.style.overflow = "hidden";
        celle.style.textOverflow = "ellipsis";
        celle.style.fontSize = "0.85rem"
        celle.style.paddingTop = "1px";
        celle.style.paddingBottom = "1px";

        if (kan_fjernes) {
            celle.style.backgroundColor = "#d1ffdf"
        }

        newRow.appendChild(celle);
    })

    tableBody.prepend(newRow);

    if (kan_fjernes) {
        deleteBtn.addEventListener('click', function() {
            tableBody.removeChild(newRow);
            oppdater_mine_resultater()
            
            mine_resultater = mine_resultater.filter(res => !(res[0] === poeng && res[1] === øvelse && res[2] === utøver))
            utøvere = [...new Set([...klubbresultater.map(v => v[3]), mine_resultater.map(v => v[2])])];
        }); 
    };
}

function oppdater_mine_resultater() {
    const antall_resultater = document.getElementById("mitt-lag").children.length;

    autocomplete(document.getElementById("utøverInput"), utøvere.map(v => [v]));

    oppstiller_knapp = document.getElementById("utforsker-knapp");

    h4 = document.getElementById("mine-resultater-tittel"); 
    h4.textContent = "Mine resultater (" + antall_resultater + ")";

    thead = document.getElementById("mitt-lag-header");
    thead.innerHTML = "";

    if (antall_resultater > opprinnelige_resultater) {
        oppstiller_knapp.style.backgroundColor = "#e19e39";
    } else {
        oppstiller_knapp.style.backgroundColor = "lightgray";
    }
    tr = mine_resultater_header_tr();
    thead.appendChild(tr);
}

function mine_resultater_header_tr() {
    poeng_th = document.createElement("th");
    øvelse_th = document.createElement("th");
    utøver_th = document.createElement("th");
    utøver_id_th = document.createElement("th");
    action_th = document.createElement("th");
    
    poeng_th.style.width = "16%";
    øvelse_th.style.width = "30%";
    utøver_th.style.width = "60%";
    utøver_id_th.style.width = "11%";
    action_th.style.width = "7%";

    poeng_th.textContent = "Poeng";
    øvelse_th.textContent = "Øvelse";
    utøver_th.textContent = "Utøver";
    utøver_id_th.textContent = "#";
    action_th.textContent = "";

    poeng_th.style.fontSize = "0.85rem";
    øvelse_th.style.fontSize = "0.85rem";
    utøver_th.style.fontSize = "0.85rem";
    utøver_id_th.style.fontSize = "0.85rem";
    action_th.style.fontSize = "0.85rem";

    poeng_th.style.paddingTop = "1px";  
    poeng_th.style.paddingBottom = "1px";  
    øvelse_th.style.paddingTop = "1px";  
    øvelse_th.style.paddingBottom = "1px";  
    utøver_th.style.paddingTop = "1px";  
    utøver_th.style.paddingBottom = "1px";  
    utøver_id_th.style.paddingTop = "1px";  
    utøver_id_th.style.paddingBottom = "1px";  
    action_th.style.paddingTop = "1px";  
    action_th.style.paddingBottom = "1px";  

    tr = document.createElement("tr");

    tr.appendChild(poeng_th);
    tr.appendChild(øvelse_th);
    tr.appendChild(utøver_th);
    tr.appendChild(utøver_id_th);
    tr.appendChild(action_th);
    
    return tr;
}

document.getElementById('utforsker-knapp').addEventListener('click', function() {
    var lagDiv = document.querySelector('#lag');
    lagDiv.innerHTML = "";

    var data = []
    var mine_resultater_trs = document.querySelectorAll('#gridTable tbody tr');
    mine_resultater_trs.forEach(function(resultat) {
        var cells = resultat.querySelectorAll('td');
        var rowData = [];
        for (var i = 0; i < cells.length - 1; i++) {
            rowData.push(cells[i].textContent);
        }
        data.push(rowData);
    });

    if (mine_resultater.length == 0) {
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
        body: JSON.stringify({ klubbnavn: klubbnavn, kjønn: kjønn, resultater: data }),
    })
    .then(response => response.json())
    .then(lag => {
        beregningshjul.style.display = 'none';

        var lagDiv = document.querySelector('#utforsker-lag');
        lagDiv.innerHTML = "";

        h4 = document.createElement("h4");
        h4.style.margin = "20px 0 10px 5px"
        h4.textContent = "Beregnede lag";
        lagDiv.appendChild(h4);
        
        var i = 0
        lag.forEach(function(lagdata) {
            i++;

            var lagresultater_div = document.createElement("div");
            lagresultater_div.id = "lag-" + i;
            lagresultater_div.classList.add("collapse");
            
            knapp = document.createElement("div");
            knapp.setAttribute("data-toggle", "collapse");
            knapp.setAttribute("href", "#lag-" + i);
            knapp.setAttribute("role", "button");
            knapp.setAttribute("aria-expanded", "true");

            knapp.textContent = "Lag " + i + " – " + lagdata[1] + (lagdata[0] == 0 ? "" : " (" + (lagdata[0] > 0 ? "+" : "") + lagdata[0]+")");
            knapp.style.border = "1px lightgray solid";
            knapp.style.paddingLeft = "12px";
            knapp.style.fontSize = "0.9rem";
            var chevron = document.createElement('img');
            chevron.src = `${window.location.origin}/static/assets/ikoner/chevron-compact-down.svg`;
            chevron.style.width = "20px"; 
            chevron.style.marginRight = "5px";
            knapp.prepend(chevron);

            obl_ = lag_oppstilling(lagdata[2], "OBLIGATORISK") 
            val_ = lag_oppstilling(lagdata[2], "VALGFRI") 
            lagresultater_div.appendChild(obl_);
            lagresultater_div.appendChild(val_);
            lagresultater_div.style.backgroundColor = "white";
            lagresultater_div.style.padding = "10px";
            lagresultater_div.style.fontSize = "0.9rem";

            lagDiv.appendChild(knapp);
            lagDiv.appendChild(lagresultater_div);
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
    
    kol1.textContent = "Poeng";
    kol2.textContent = "Øvelse";
    kol3.textContent = "Utøver";

    kol1.style.width = "10%"
    kol2.style.width = "20%"
    kol3.style.width = "40%"

    tr.appendChild(kol1)
    tr.appendChild(kol2)
    tr.appendChild(kol3)
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
            if (lagresultat[1] !== '') {
                celle.style.paddingTop = "0px";
                celle.style.paddingBottom = "0px";
            }
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
    table.style.fontSize = "0.85rem";

    oppstilling_div.appendChild(table)
    return oppstilling_div;
}

utøvere = [...new Set(klubbresultater.map(v => v[3]))];

klubbresultater.reverse().map(x => ["" + x[0], x[1], x[3]]).forEach(e => legg_til_resultat(e[0], e[1], e[2], false));
const opprinnelige_resultater = klubbresultater.length;
oppdater_mine_resultater();

autocomplete(document.getElementById("øvelseInput"), cached_data.øvelser);