function hash(s) {
  let hash = 0;
  for (let i = 0; i < s.length; i++) {
    hash = ((hash << 5) - hash + s.charCodeAt(i)) | 0; // 32-bit integer
  }
  return hash;
}

function dager_siden(dato) {
    return Math.floor((new Date() - dato) / (1000 * 60 * 60 * 24));
}

const dager = ["Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag"];
const måneder = ["januar", "februar", "mars", "april", "mai", "juni", "juli", "august", "september", "oktober", "november", "desember"]

function til_lesevennlig_dato(dato) {
    d = dager_siden(dato)

    if (d == 0) return "I dag";
    else if (d == 1) return "I går";
    else if (d > 1 && d < 5) return dager[dato.getDay()];    

    var day = String(dato.getDate()).padStart(2, '0');
    var month = måneder[dato.getMonth()];

    return day + '. ' + month;
}

function vis_notiser() {
    notisbar = document.getElementById("notisbar");

    listediv = document.getElementById("notiser-liste")
    notiserdiv = document.getElementById("notiser");

    let forriges_dato = undefined;
    
    let seksjon = undefined;    
    let seksjon_nr = 0;
    cached_data.notiser.forEach((notisdata, i) => {
        if (!(notisdata.notistype in notisformater)) {
            console.log("Ukjent notistype: " + notisdata.notistype);
            return;
        }
        if (!(notisdata.undertype in notisformater[notisdata.notistype])) {
            console.log("Ukjent undertype: " + notisdata.notistype + " - " + notisdata.undertype);
            return;
        }

        if (notisdata.generert != forriges_dato) {
            seksjon_nr += 1;

            lesevennlig_dato = til_lesevennlig_dato(new Date(notisdata.generert));
            const a = document.createElement("a");
            a.classList.add("list-group-item", "list-group-item-action");
            a.textContent = lesevennlig_dato;
            a.href = "#seksjon-" + seksjon_nr
            if (seksjon_nr == 1) a.classList += "active";
            listediv.appendChild(a);

            seksjon = document.createElement("div");
            seksjon.id = "seksjon-" + seksjon_nr;
            seksjon.style.marginBotton = "100px";
            notiserdiv.appendChild(seksjon);

            span = document.createElement("span");
            span.style.fontWeight = "bold";
            span.textContent = lesevennlig_dato;
            seksjon.appendChild(span);

            const svgdiv = document.createElement("div")
            svgdiv.style.display = "flex";
            svgdiv.style.alignItems = "center";

            if (seksjon_nr == 1) {
                svgdiv.style.margin = "0 20px 0 20px";
            } else if (seksjon_nr > 1) {
                notisbar.lastElementChild.style.borderRight = "1px solid #dbdbdb";

                svgdiv.style.margin = "0 20px 0 10px";
            }
            
            notisbar.appendChild(svgdiv);

            dato = document.createElement("div");
            dato.style.display = "inline-flex";
            dato.style.fontWeight = "500";
            dato.style.color = "#444444"
            dato.textContent = lesevennlig_dato;
            dato.style.fontSize = "10px";
            dato.style.whiteSpace = "nowrap";
            if (lesevennlig_dato == "I dag") {
                var div = document.createElement('div');
                div.style.margin = "3px";
                div.style.width = "5px";
                div.style.height = "5px";
                div.style.borderRadius = "50%";
                dato.prepend(div);
                div.style.backgroundColor = "red";
            }
        }

        forriges_dato = notisdata.generert;

        const tittelformater = notisformater[notisdata.notistype][notisdata.undertype]["tittel"]
        const innholdsformater = notisformater[notisdata.notistype][notisdata.undertype]["innhold"]

        const h1 = Math.abs(hash(`${notisdata.generert}:${i}:1`));
        const h2 = Math.abs(hash(`${notisdata.generert}:${i}:2`));

        const tittelformat = tittelformater[h1 % tittelformater.length]
        const innholdsformat = innholdsformater[h2 % innholdsformater.length]
        const tittel1 = erstatt_placeholders(tittelformat, notisdata).cloneNode(true)
        const tittel2 = erstatt_placeholders(tittelformat, notisdata).cloneNode(true)
        
        underinfo = document.createElement("div");
        underinfo.style.display = "flex";
        underinfo.style.justifyContent = "space-between"
        kategori = document.createElement("div");
        underinfo.appendChild(dato.cloneNode(true))
        underinfo.appendChild(kategori);
        kategori.textContent = notisdata.kategori;
        kategori.style.margin = "0 0 0 15px";
        kategori.style.textAlign = "left";
        kategori.style.color = "#292929";
        kategori.style.fontSize = "10px";
        notis = document.createElement("button");
        notis.style.backgroundColor = "white"
        notis.style.border = "none"
        tittel1.style.fontSize = "12px"
        tittel1.style.fontWeight = "600";
        notis.appendChild(tittel1);
        notis.appendChild(underinfo)
        notis.style.borderLeft = "1px solid #dbdbdb";
        notis.style.padding = "0 35px 0 15px";
        notis.style.whiteSpace = "nowrap";
        notis.style.color = "#2e2e2e";
        notis.style.cursor = "pointer";
        notis.onclick = function(event) {
            if (event.target.tagName === "A") return;
            this.style.backgroundColor = "#f9f9f9";
            setTimeout(() => {
                this.style.backgroundColor = "white";
            }, 150);
            bytt_til_relevant_side(notisdata.notistype, notisdata.kategori)
        }
        notisbar.appendChild(notis);

        panel = document.createElement("div");
        panel.style.padding = "5px 10px 10px 10px";
        panel.style.margin = "0 0 25px 0";
        panel.style.border = "1px solid #bbbbbb"; 
        overd = document.createElement("div");
        d = document.createElement("div");
        kategori = document.createElement("div");
        kategori.textContent = notisdata.kategori;
        kategori.style.fontSize = "12px";
        kategori.style.color = "#222222";
        kategori.style.padding = "0 0 5px 0"
        overd.appendChild(kategori)
        overd.appendChild(d)
        d.appendChild(tittel2)
        tittel2.style.fontWeight = "bold";
        panel.appendChild(overd)

        if (innholdsformat !== '') {
            const innhold = erstatt_placeholders(innholdsformat, notisdata).cloneNode(true)
            innhold.style.marginTop ="10px";
            panel.appendChild(innhold)
        }
        seksjon.appendChild(panel)
    });
}

function bytt_til_relevant_side(notistype, kategori) {
    if (notistype == "kommende stevne") {
        handlers["kalender"].call();
    } else if (notistype == "serieutvalget kontroll") {

    } else if (notistype == "oppdatering") {
        
    } else if (notistype == "stor-aktivitet") {

    } else if (['tronen', 'førsteplass','opprykksplass','unngå-nedrykksplass','over-5000-poeng-grensen','klubbforbedring','historisk-plassering','historisk-poeng'].includes(notistype)) {
        handlers["tabell"].call();
        handlers["tabell-"+kategori].call();
    } else if (notistype.startsWith("rangering")) {
        handlers["rangeringer"].call();
        handlers[notistype].call();
    } else {
        console.log("Kunne ikke vise side til " + notistype);
    }
}

function formater_lag(notisdata) {
    lagnavn = notisdata.elementer.lag[0][1] + (notisdata.elementer.lag[0][2] == 1 ? "" : " " + notisdata.elementer.lag[0][2]+ ". lag");
    return formatert_a_tag(
        lagnavn,
        "/livetabell/"+lagnavn+ " (" + notisdata.elementer.lag[0][3] + ")"
    ).outerHTML
}

function formater_lag_2(notisdata) {
    lagnavn = notisdata.elementer.lag[1][1] + (notisdata.elementer.lag[1][2] == 1 ? "" : " " + notisdata.elementer.lag[1][2]+ ". lag");
    return formatert_a_tag(
        lagnavn,
        "/livetabell/"+notisdata.elementer.lag[1][1] + " (" + notisdata.elementer.lag[1][3] + ")"
    ).outerHTML
}

function formater_ett_to_eller_flere_nye_lag(notisdata) {
    if (notisdata.elementer.lag.length > 2) {
        return "Flere nye klubber";
    } else {
        return formater_ett_to_eller_flere_lag(notisdata);
    }
}

function formater_ett_to_eller_flere_lag(notisdata) {
    if (notisdata.elementer.lag.length <= 2) {
        const lagelementer = [];
        notisdata.elementer.lag.forEach(lag => {
            lagnavn = lag[1] + (lag[2] == 1 ? "" : " " + lag[2]+ ". lag");
            lag_a = formatert_a_tag(
                lagnavn,
                "/livetabell/"+lagnavn + " (" + lag[3] + ")"
            )
            lagelementer.push(lag_a);
        });
        return joinWithOg(lagelementer).outerHTML;
    } else {
        return "Flere lag";
    }
}

function formater_nye_stevner(notisdata) {
    antall = notisdata.elementer["oppdatering-info"][0][0];
    if (antall == 1) {
        return antall + " stevne";
    }
    return antall + " stevner";
}

function formater_nye_resultater(notisdata) {
    antall = notisdata.elementer["oppdatering-info"][0][1];
    if (antall == 1) {
        return antall + " resultat";
    }
    return antall + " resultater";
}

function formater_forbedrede_lag(notisdata) {
    return notisdata.elementer["oppdatering-info"][0][2];
}

function formater_lagforbedring(notisdata) {
    return notisdata.elementer.lag[0][3];
}

function formater_klubb(notisdata) {
    const a = document.createElement("a");
    a.href = "/livetabell/"+notisdata.elementer.klubb[0][1];
    a.textContent = notisdata.elementer.klubb[0][1];
    a.style.textDecoration = "none";
    a.style.color="#4a7fbf";
    return a.outerHTML
}

function formater_utøvere(notisdata) {
    const utøverelementer = [];
    notisdata.elementer.utøver.forEach(utøver => {
        utøver_a = formatert_a_tag(
            utøver[1] + " (" + utøver[2] + ")",
            "/utovere/"+utøver[0]
        )
        utøverelementer.push(utøver_a);
    });
    return joinWithOg(utøverelementer).outerHTML;
}

function formater_utøvere_juniorpoeng(notisdata) {
    const utøverelementer = [];
    notisdata.elementer.utøver.forEach(utøver => {
        const span = document.createElement("span"); 
        utøver_a = formatert_a_tag(
            utøver[1] + " (" + utøver[2] + ")",
            "/utovere/"+utøver[0]
        )

        span.appendChild(utøver_a);
        const poeng = document.createElement("span");
        poeng.textContent = utøver[3];
        utøverelementer.push(span);
    });
    return joinWithOg(utøverelementer).outerHTML;
}

function formater_stevne(notisdata) {
    return formatert_a_tag(
        notisdata.elementer.stevne[0][1],
        "/stevner/"+notisdata.elementer.stevne[0][0]
    ).outerHTML;
}

function formater_utøver(notisdata) {
    return formatert_a_tag(
        notisdata.elementer.utøver[0][1],
        "/utovere/"+notisdata.elementer.utøver[0][0]
    ).outerHTML;
}

function formatert_a_tag(textContent, href) {
    const a = document.createElement("a");
    a.href = href;
    a.textContent = textContent;
    a.style.textDecoration = "none";
    a.style.color="#4a7fbf";
    a.classList.add("hover-weaken-blue");
    return a
}

function formater_topp_3_rangering(data, rangering) {
    table = formater_topp_3_kopi(rangering)
    vis_data(table.tBodies[0], data, rangering)
    return table.outerHTML
}

function formater_topp_3_kopi(rangering) {
    const original = document.getElementById(rangering + "-tabell");
    const utsnitt = original.cloneNode(true);
    utsnitt.innerHTML = ""
    utsnitt.appendChild(original.querySelector('colgroup').cloneNode(true));
    const tbody = document.createElement("tbody")
    utsnitt.appendChild(tbody);
    utsnitt.style.marginTop = "10px";
    return utsnitt;
}

function som_allrounder_data(notisdata) {
    const utøver = notisdata.elementer.utøver
    const ekstra = notisdata.elementer["allroundere-rad"]

    return utøvere.map((ut, i) => [ekstra[i][0], ekstra[i][1], ut[1], ut[0], ekstra[i][2], ekstra[i][3], ekstra[i][4]])
}

function som_nøkkelutøver_data(notisdata) {
    const utøvere = notisdata.elementer.utøver
    const lag = notisdata.elementer.lag
    const ekstra = notisdata.elementer["nøkkelutøvere-rad"]

    return utøvere.map((ut, i) => [ekstra[i][0], ekstra[i][1], ut[1], ut[0], ekstra[i][2], ekstra[i][3], ekstra[i][4], lag[i][0], lag[i][1]])
}

function som_nykommer_data(notisdata) {
    const utøvere = notisdata.elementer.utøver
    const ekstra = notisdata.elementer["nykommere-rad"]

    return rangering = utøvere.map((ut, i) => [ekstra[i][0], ekstra[i][1], ut[1], ut[0], ekstra[i][2], 0, 0])
}

function som_ideallag_data(notisdata) {
    const lag = notisdata.elementer.lag
    const ekstra = notisdata.elementer["ideallag-rad"]

    return lag.map((l, i) => [ekstra[i][0], ekstra[i][1], l[0], l[1], ekstra[i][2], ekstra[i][3], ekstra[i][4]])
}

function som_juniorlag_data(notisdata) {
    const lag = notisdata.elementer.lag
    const ekstra = notisdata.elementer["juniorlag-rad"]

    return lag.map((l, i) => [ekstra[i][0], ekstra[i][1], l[0], l[1], ekstra[i][1], ekstra[i][2]])
}

function formater_tabell(notisdata) {
    kjønn = notisdata.elementer["tabell"][0][0]
    divisjon = notisdata.elementer["tabell"][0][1]
    
    tabell_lag = notisdata.elementer["tabell-rad-lag"]
    tabell_rader = notisdata.elementer["tabell-rad"]

    data = tabell_lag.map((l, i) => [tabell_rader[i][1], tabell_rader[i][0], l[1] + (l[2] == "1" ? "" : " " + l[2]+ ". lag"), tabell_rader[i][2], tabell_rader[i][3], tabell_rader[i][4], 0, tabell_rader[i][5], parseInt(l[0])])
    
    return lag_utsnitt_tabell(kjønn, divisjon, data).outerHTML;
}

const placeholdere = {
  "<lag>":                             formater_lag,
  "<lag-2>":                           formater_lag_2,
  "<nye-stevner>":                     formater_nye_stevner,
  "<nye-resultater>":                  formater_nye_resultater,
  "<forbedrede-lag>":                  formater_forbedrede_lag,
  "<ett-to-eller-flere-lag>":          formater_ett_to_eller_flere_lag,
  "<ett-to-eller-flere-nye-lag>":      formater_ett_to_eller_flere_nye_lag,
  "<klubb>":                           formater_klubb,
  "<utøvere>":                         formater_utøvere,
  "<utøvere-juniorpoeng>":             formater_utøvere_juniorpoeng,
  "<utsnitt-tabell>":                  formater_tabell,
  "<stevne>":                          formater_stevne,
  "<stevne-antall-resultater>":        (x) => x.elementer.stevne[0][3],
  "<stevne-antall-klubbforbedringer>": (_) => 29,
  "<utøver>":                          formater_utøver,
  "<topp-3-rangering-allroundere>":    (x) => formater_topp_3_rangering(som_ideallag_data(x), "allroundere"),
  "<topp-3-rangering-nøkkelutøvere>":  (x) => formater_topp_3_rangering(som_nøkkelutøver_data(x), "nøkkelutøvere"),
  "<topp-3-rangering-nykommere>":      (x) => formater_topp_3_rangering(som_nykommer_data(x), "nykommere"),
  "<topp-3-rangering-ideallag>":       (x) => formater_topp_3_rangering(som_ideallag_data(x), "ideallag"),
  //"<topp-3-rangering-kommersterke>":   (x) => formater_topp_3_kopi('kommersterke'),
  "<topp-3-rangering-juniorlag>":      (x) => formater_topp_3_rangering(som_juniorlag_data(x), "juniorlag"),
  //"<topp-3-rangering-vekstklubber>":   (x) => formater_topp_3_kopi('vekstklubber'),
  //"<topp-3-rangering-storklubber>":    (x) => formater_topp_3_kopi('juniorlag')
};

function erstatt_placeholders(s, notisdata) {
    const container = document.createElement("div");
    container.innerHTML = s.replace(/<([\wæøåÆØÅ-]+)>/g, (match, key) => {
        return placeholdere[match](notisdata);
    });
    return container;
}

function joinWithOg(arr) {
  const fragment = document.createElement("span");

  arr.forEach((el, i) => {
    fragment.appendChild(el);

    if (i < arr.length - 2) {
      fragment.appendChild(document.createTextNode(", "));
    } else if (i === arr.length - 2) {
      fragment.appendChild(document.createTextNode(" og "));
    }
  });

  return fragment;
}


document.getElementById("notis-scroll-knapp-høyre").addEventListener("click", () => {
    notisbar = document.getElementById("notisbar");

    notisbar.scrollBy({
        left: notisbar.clientWidth,
        behavior: "smooth"
    });
})

document.getElementById("notis-scroll-knapp-venstre").addEventListener("click", () => {
    notisbar = document.getElementById("notisbar");

    notisbar.scrollBy({
        left: -notisbar.clientWidth,
        behavior: "smooth"
    });
})

vis_notiser()
