function vis_varsler() {
    div = document.getElementById("varseldiv");

    varsler.forEach((varsel,i) => {
        panel = document.createElement("div");
        panel.style.paddingBottom = "10px";

        knapp = document.createElement("div");
        knapp.setAttribute("data-toggle", "collapse");
        knapp.setAttribute("href", "#varsel-" + i);
        knapp.setAttribute("role", "button");
        knapp.setAttribute("aria-expanded", "true");

        knapp.style.border = "1px lightgray solid";
        knapp.style.paddingLeft = "12px";
        knapp.style.display = "flex";
        knapp.style.justifyContent = "space-between"; 

        tittel = document.createElement("span");
        var chevron = document.createElement('img');
        chevron.src = `${window.location.origin}/static/assets/ikoner/chevron-compact-down.svg`;
        chevron.style.width = "20px"; 

        tittel.textContent = varsel[0];
        tittel.appendChild(chevron);
        knapp.appendChild(tittel);

        feil = document.createElement("div");
        feil.style.display = "flex";
        feil.textContent = resultater[i].length
        feil.style.marginRight = "20px";
        fargeboks = document.createElement("div");
        fargeboks.textContent = (resultater[i].length > 0 ? "⚠️" : "🟢");
        feil.prepend(fargeboks);

        knapp.appendChild(feil);

        spørring = document.createElement("div");
        spørring.id = "varsel-" + i;
        spørring.innerHTML = varsel[1];
        spørring.style.backgroundColor = "white";
        spørring.style.padding = "15px 30px 15px 30px";
        spørring.style.border = "1px solid #cdcdcd";
        spørring.style.borderCollapse = "collapse";
        spørring.style.whiteSpace = "pre-wrap"; 
        spørring.style.overflowX = "auto";
        spørring.style.whiteSpace = "nowrap";

        panel.appendChild(knapp);
        panel.appendChild(spørring);
        div.appendChild(panel);

        if (resultater[i].length > 0) {

            feiloversikt = document.createElement("div");

            vis_knapp = document.createElement("div");
            vis_knapp.textContent = "vis feil";
            vis_knapp.style.textDecoration = "underline";
            vis_knapp.style.paddingLeft = "20px";
            vis_knapp.style.fontSize = "12px";
            vis_knapp.setAttribute("data-toggle", "collapse");
            vis_knapp.setAttribute("href", "#varsel-feil-" + i);
            vis_knapp.setAttribute("role", "button");
            vis_knapp.setAttribute("aria-expanded", "true");

            instanser = document.createElement("table");
            instanser.id = "varsel-feil-" + i;

            resultater[i].forEach((varselinstans) => {
                tr = document.createElement("tr");
                varselinstans.forEach((verdi) => {
                    td = document.createElement("td");
                    td.textContent = verdi;
                    tr.appendChild(td);
                });
                instanser.appendChild(tr);
            });

            feiloversikt.appendChild(vis_knapp);
            feiloversikt.appendChild(instanser);
            panel.appendChild(feiloversikt);
        }
    });
}

vis_varsler()