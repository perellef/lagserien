function vis_forsinkelser() {

    forsinkelser = cached_data.forsinkelser

    tbody = document.getElementById('forsinkelser');
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    forsinkelser.forEach(function(forsinkelse) {
        var rad = document.createElement('tr');

        const dato = new Date(forsinkelse[2]);
        const i_dag = new Date();
        const delta_ms = i_dag - dato;
        const delta_dager = Math.floor(delta_ms / (1000 * 60 * 60 * 24));

        celler = [
            td_med("", delta_dager + "d"),
            td_med("", forsinkelse[0]),
            td_med("", forsinkelse[1]),
            td_med("", new Date(forsinkelse[2]).toLocaleDateString('de-DE', { day: '2-digit', month: '2-digit', year: 'numeric' })),
        ]

        if (true) {celler[0].style.color = "green";} 
        if (delta_dager > 5) {celler[0].style.color = "orange";} 
        if (delta_dager > 10) {celler[0].style.color = "red";}
        
        celler.forEach(function(celle) {
            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";

            rad.appendChild(celle)
        });

        tbody.appendChild(rad)
    });
}

function td_med(klasse, verdi) {
    td = document.createElement('td');
    td.className = klasse;
    td.textContent = verdi;
    return td;
}

const months = ["Jan", "Feb", "Mar", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Des"];

function interpolateColor(color1, color2, weight) {
    // Linear interpolation between two RGB colors
    let r = Math.round(color1[0] + weight * (color2[0] - color1[0]));
    let g = Math.round(color1[1] + weight * (color2[1] - color1[1]));
    let b = Math.round(color1[2] + weight * (color2[2] - color1[2]));
    return `rgb(${r}, ${g}, ${b})`;
}

const today = new Date();
let selectedMonth = today.getMonth();

function generateMonthButtons() {
    const colorStart = [227, 227, 227]; // lightgray
    const colorEnd = [84, 203, 125]; // green

    stevnekalender = cached_data.stevnekalender
    const maks_verdi = Math.max(...Object.values(months).map(month => stevnekalender[months.indexOf(month)].length))

    const monthsContainer = document.getElementById("months");
    monthsContainer.innerHTML = "";
    months.forEach((month, index) => {
        const btn = document.createElement("button");
        btn.textContent = month;
        btn.classList.add("måned-btn");

        const weight = stevnekalender[String(months.indexOf(month))].length / maks_verdi;
        const farge = interpolateColor(colorStart, colorEnd, weight); 
        btn.style.backgroundColor = farge;

        if (index === selectedMonth) btn.classList.add("active");
        btn.onclick = () => selectMonth(index);
        monthsContainer.appendChild(btn);
    });
}

function selectMonth(monthIndex) {
    selectedMonth = monthIndex;
    selectedDay = 1; // Default to the first day of the month
    updateActiveButton("months", monthIndex);
    updateDisplay();
}

function updateActiveButton(containerId, index) {
    document.querySelectorAll(`#${containerId} .btn`).forEach((btn, i) => {
        btn.classList.toggle("active", i === index);
    });
}

function updateDisplay() {
    datoelement = document.getElementById("valgt-kalenderdato")
    datoelement.textContent = `Stevner ${months[selectedMonth]} ${cached_data.serieår}`;
    vis_kalenderstevner(selectedMonth)
}

function datoNormalform(yyyyMMdd) {
    var date = new Date(yyyyMMdd);
    
    var day = String(date.getDate()).padStart(2, '0');
    var month = String(date.getMonth() + 1).padStart(2, '0');
    var year = date.getFullYear();

    return day + '.' + month + '.' + year;
}

function vis_kalenderstevner(month) {
    stevnekalender = cached_data.stevnekalender

    tbody = document.getElementById('datoens-stevner');
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    (stevnekalender[month] || []).forEach(function(stevne) {
        var rad = document.createElement('tr');

        er_rapportert = stevne[4]
        er_invitasjon = stevne[5]

        dato = stevne[0]
        tittel = stevne[1]
        arena = stevne[2]
        antall_resultater = stevne[3]

        celler = [
            td_med("", (er_invitasjon ? "📩" : "") + (er_rapportert ? "✔️" : "")),
            td_med("", datoNormalform(dato)),
            td_med("", arena),
            td_med("", tittel),
            td_med("", (antall_resultater === null ? "" : "(" + antall_resultater + (antall_resultater == 1 ? " resultat)" : " resultater)")))
        ]

        if (antall_resultater === null) {
            celler[3].colSpan = 2;
        } else {
            if (parseInt(antall_resultater, 10) > 29) rad.style.fontWeight = 500;
            if (parseInt(antall_resultater, 10) > 99) rad.style.fontWeight = 700;
        }

        celler.forEach(function(celle) {
            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";
            celle.style.paddingTop = "5px"
            celle.style.paddingBottom = "5px"

            celle.style.fontSize = "15px"

            rad.appendChild(celle)
        });
        celler[0].style.fontSize = "14px";
        celler[4].style.textAlign = "right";

        tbody.appendChild(rad)
    });
}

generateMonthButtons();
updateDisplay();

window.onload = vis_forsinkelser;