let draggedFromTable = null;
let draggedItem = null;
let highlightedItem = null;
let selectedItem = null;
let hoveredItem = null;

const HOVER_BRIGHTNESS = "brightness(95%)";
const NORMAL_BRIGHTNESS = "brightness(100%)";

function lag_tabeller(obl, val, reserver) {

    const tabeller = ["verktøy-lag-oppstiller-obl", "verktøy-lag-oppstiller-val", "verktøy-lag-oppstiller-reserve"]

    const oppstillinger = [obl, val, reserver]
        oppstillinger.forEach((rows, index) => {
        const tbody = document.getElementById(tabeller[index])
        
        rows.forEach(row => {
            tbody.appendChild(createItem(row, tbody.parentElement.parentElement));
        });
    });

    oppdater_oversikt()
}

function highlightRow(tr) {
    tr.querySelectorAll("td").forEach(td => {
        td.style.filter = HOVER_BRIGHTNESS;
    });
}

function resetRow(tr) {
    tr.querySelectorAll("td").forEach(td => {
        td.style.filter = NORMAL_BRIGHTNESS;
    });
}

function createItem(row, dropArea) {
  const item = document.createElement("tr");

  item.className = "item";
  item.style.cursor = "grab";
  item.draggable = true;

  td1 = document.createElement("td");
  td1.style.backgroundColor = "transparent";
  td1.style.borderRight = "1px solid #999";
  td1.style.fontSize = "0.6rem";
  td1.style.textAlign = "right";
  item.appendChild(td1);

  row.forEach(v => {
    const td = document.createElement("td");

    
    td.style.borderTop = "1px solid #999";
    td.style.borderBottom = "1px solid #999";
    td.style.background = "#eee";
    td.textContent = v;
    td.style.paddingTop = "0";
    td.style.paddingBottom = "0";
    td.style.whiteSpace = "nowrap";
    td.style.overflow = "hidden";
    td.style.textOverflow = "ellipsis";

    item.appendChild(td);
  });

  const tableId = dropArea.querySelector("tbody")?.id;

  // --------------------------------------------------
  // Button
  // --------------------------------------------------

  if (
    tableId === "verktøy-lag-oppstiller-obl" ||
    tableId === "verktøy-lag-oppstiller-val" ||
    tableId === "verktøy-lag-oppstiller-reserve"
  ) {
    const td = document.createElement("td");
    item.appendChild(td);

    td.style.whiteSpace = "nowrap";
    td.style.textAlign = "right";
    td.style.verticalAlign = "middle";
    td.style.borderTop = "1px solid #999";
    td.style.borderBottom = "1px solid #999";
    td.style.borderRight = "1px solid #999";
    td.style.background = "#eee";

    const div = document.createElement("div");

    if (row[0] == "‎") div.style.visibility = "hidden";

    if (tableId === "verktøy-lag-oppstiller-reserve") {
        div.textContent = "×";
        div.style.fontSize = "12px";
        div.style.lineHeight = "10px";
    } else {
        div.textContent = "-";
        div.style.fontSize = "15px";
        div.style.lineHeight = "8px";
    }
    
    div.style.display = "inline-block";
    div.style.cursor = "pointer";
    div.style.height = "15px";
    div.style.width = "15px";
    div.style.border = "1.5px #bbb solid";
    div.style.textAlign = "center";
    div.style.margin = "1px 2px 1px 0px";
    div.style.backgroundColor = "#eee";

    div.addEventListener("click", e => {
        e.stopPropagation();

        if (item.children[4].lastChild.textContent === "×" || item.children[4].lastChild.textContent === "+") {

            if (item.dataset.removed === "true") {
                item.dataset.removed = "false";
                item.children[1].style.backgroundColor = "#eee";
                item.children[2].style.backgroundColor = "#eee";
                item.children[3].style.backgroundColor = "#eee";
                item.children[4].style.backgroundColor = "#eee";
                item.children[4].lastChild.textContent = "×";
            } else {
                item.dataset.removed = "true";
                item.children[1].style.backgroundColor = "#ffd7d7";
                item.children[2].style.backgroundColor = "#ffd7d7";
                item.children[3].style.backgroundColor = "#ffd7d7";
                item.children[4].style.backgroundColor = "#ffd7d7";
                item.children[4].lastChild.textContent = "+";
            }

            oppdater_oversikt();
            return;
        }

        
        dropArea.children[1].children[1].appendChild(
            createItem(["‎","",""], dropArea)
        )

        if (item.children[4].children.length > 1) {
            item.children[4].firstChild.remove();
        }

        item.children[4].lastChild.textContent = "×";
        item.children[4].lastChild.style.fontSize = "12px";
        item.children[4].lastChild.style.lineHeight = "10px";

        const reserveTbody = document.getElementById("verktøy-lag-oppstiller-reserve");

        reserveTbody.prepend(item);

        oppdater_oversikt();
    });

    td.appendChild(div);
  }

  // --------------------------------------------------
  // CLICK TO SELECT / SWAP
  // --------------------------------------------------

  item.addEventListener("click", e => {

    // Don't treat button clicks as row clicks
    if (e.target === item.children[4]?.lastChild) {
        return;
    }

    // --------------------------------------------
    // First click -> select row
    // --------------------------------------------

    if (selectedItem === null) {
        selectedItem = item;

        // Selected row is WHITE
        
        highlightRow(item)
        return;
    }

    // --------------------------------------------
    // Click selected row again -> cancel
    // --------------------------------------------

    if (selectedItem === item) {
        resetRow(selectedItem);
        selectedItem = null;

        return;
    }

    if (selectedItem.closest("tbody") !== item.closest("tbody") && selectedItem.dataset.removed === "true") {
        return;
    }
    if (selectedItem.closest("tbody") !== item.closest("tbody") && item.dataset.removed === "true") {
        return;
    }

    // --------------------------------------------
    // Swap values
    for (let i = 0; i < 4; i++) {
        const selectedValue = selectedItem.children[i+1].textContent;
        const targetValue = item.children[i+1].textContent;

        if (i != 3) {
            selectedItem.children[i+1].textContent = targetValue;
            item.children[i+1].textContent = selectedValue;
        } else if (selectedItem.closest("tbody") === item.closest("tbody")) {
            item.children[4].children[item.children[4].children.length - 1].textContent = selectedValue;
            selectedItem.children[4].children[item.children[4].children.length - 1].textContent = targetValue;
        }

        const selectedColor = selectedItem.children[i+1].style.backgroundColor;
        const targetColor = item.children[i+1].style.backgroundColor;
        
        selectedItem.children[i+1].style.backgroundColor = targetColor;
        item.children[i+1].style.backgroundColor = selectedColor;
    }
    const selectedRemoved = selectedItem.dataset.removed;
    const targetRemoved = item.dataset.removed;
    selectedItem.dataset.removed = targetRemoved;
    item.dataset.removed = selectedRemoved;

    item.children[4].children[item.children[4].children.length - 1].style.visibility = "hidden";
    if (item.children[1].textContent != "‎") {
        item.children[4].children[item.children[4].children.length - 1].style.visibility = "visible";
    }
    selectedItem.children[4].children[selectedItem.children[4].children.length - 1].style.visibility = "hidden";
    if (selectedItem.children[1].textContent != "‎") {
        selectedItem.children[4].children[selectedItem.children[4].children.length - 1].style.visibility = "visible";
    }

    if (selectedItem.closest("tbody") !== item.closest("tbody")) {
        if (item.children[1].textContent == "‎" && item.closest("tbody").id == "verktøy-lag-oppstiller-reserve") item.remove()
        if (selectedItem.children[1].textContent == "‎" && selectedItem.closest("tbody").id == "verktøy-lag-oppstiller-reserve") selectedItem.remove()
    }

    // --------------------------------------------
    // Reset colors
    // --------------------------------------------

    
    resetRow(selectedItem);
    resetRow(item)
    
    selectedItem = null;
    hoveredItem = null;

    oppdater_oversikt();
    });

    item.addEventListener("mouseenter", () => {

        // Nothing selected -> normal hover
        if (selectedItem === null) {
            return;
        }

        // Don't highlight the selected row itself
        if (item === selectedItem) {
            return;
        }

        if (selectedItem.closest("tbody") !== item.closest("tbody") && selectedItem.dataset.removed === "true") {
            return;
        }
        if (selectedItem.closest("tbody") !== item.closest("tbody") && item.dataset.removed === "true") {
            return;
        }

        // Remove red from previous hovered row
        if (hoveredItem && hoveredItem !== item) {
            resetRow(hoveredItem)
        }

        hoveredItem = item;

        // Second row becomes RED
        
        highlightRow(item)
    });


    item.addEventListener("mouseleave", () => {

        // Don't reset the selected row
        if (item === selectedItem) {
            return;
        }

        // Reset this row
        if (item === hoveredItem) {
            resetRow(item)
            hoveredItem = null;
        }
    });

  // --------------------------------------------------
  // DRAG START
  // --------------------------------------------------
  

  item.addEventListener("dragstart", e => {

    // Cancel click selection if there is one
    if (selectedItem) {
      resetRow(selectedItem)
      selectedItem = null;
    }

    draggedFrom = dropArea.children[dropArea.children.length - 1];

    draggedItem = item;

    resetRow(item)
    
    e.dataTransfer.setData(
      "text/plain",
      JSON.stringify(row)
    );

    e.dataTransfer.effectAllowed = "move";
  });

  // --------------------------------------------------
  // DROP ON ROW
  // --------------------------------------------------

  item.addEventListener("drop", e => {
    e.preventDefault();
    e.stopPropagation();

    if (item === draggedItem) {
      return;
    }

    if (draggedItem.closest("tbody") !== item.closest("tbody") && draggedItem.dataset.removed === "true") {
        return;
    }
    if (draggedItem.closest("tbody") !== item.closest("tbody") && item.dataset.removed === "true") {
        return;
    }

    // Swap values
    for (let i = 0; i < 4; i++) {
        const draggedValue = draggedItem.children[i+1].textContent;
        const targetValue = item.children[i+1].textContent;

        if (i != 3) {
            draggedItem.children[i+1].textContent = targetValue;
            item.children[i+1].textContent = draggedValue;
        } else if (draggedItem.closest("tbody") === item.closest("tbody")) {
            item.children[4].children[item.children[4].children.length - 1].textContent = draggedValue;
            draggedItem.children[4].children[item.children[4].children.length - 1].textContent = targetValue;
        }
        const draggedColor = draggedItem.children[i+1].style.backgroundColor;
        const targetColor = item.children[i+1].style.backgroundColor;
        
        draggedItem.children[i+1].style.backgroundColor = targetColor;
        item.children[i+1].style.backgroundColor = draggedColor;
    }
    const draggedRemoved = draggedItem.dataset.removed;
    const targetRemoved = item.dataset.removed;
    draggedItem.dataset.removed = targetRemoved;
    item.dataset.removed = draggedRemoved;

    item.children[4].children[item.children[4].children.length - 1].style.visibility = "hidden";
    if (item.children[1].textContent != "‎") {
        item.children[4].children[item.children[4].children.length - 1].style.visibility = "visible";
    }
    draggedItem.children[4].children[draggedItem.children[4].children.length - 1].style.visibility = "hidden";
    if (draggedItem.children[1].textContent != "‎") {
        draggedItem.children[4].children[draggedItem.children[4].children.length - 1].style.visibility = "visible";
    }

    if (draggedItem.closest("tbody") !== item.closest("tbody")) {
        if (item.children[1].textContent == "‎" && item.closest("tbody").id == "verktøy-lag-oppstiller-reserve") item.remove()
        if (draggedItem.children[1].textContent == "‎" && draggedItem.closest("tbody").id == "verktøy-lag-oppstiller-reserve") draggedItem.remove()
    }

    // Reset highlighting
    if (highlightedItem) {
      resetRow(highlightedItem)
      highlightedItem = null;
    }

    resetRow(draggedItem)
    resetRow(item)
    
    draggedItem = null;
    draggedFrom = null;

    oppdater_oversikt();
  });

  // --------------------------------------------------
  // HOVER WHILE DRAGGING
  // --------------------------------------------------

  // --------------------------------------------------
// HOVER WHILE DRAGGING
// --------------------------------------------------

item.addEventListener("dragenter", e => {

    if (item === draggedItem) {
        return;
    }

    if (draggedItem.closest("tbody") !== item.closest("tbody") && draggedItem.dataset.removed === "true") {
        return;
    }
    if (draggedItem.closest("tbody") !== item.closest("tbody") && item.dataset.removed === "true") {
        return;
    }

    e.preventDefault();

    // Remove highlighting from previous row
    if (highlightedItem && highlightedItem !== item) {
        resetRow(highlightedItem)    
    }

    highlightedItem = item;

    // Highlight current row
    highlightRow(item)
});


item.addEventListener("dragleave", e => {

    // If we're still inside this row, don't remove the highlight
    if (item.contains(e.relatedTarget)) {
        return;
    }

    // Remove highlight
    if (item === highlightedItem) {
        resetRow(item)
        highlightedItem = null;
    }
});


item.addEventListener("dragover", e => {

    if (item === draggedItem) {
        return;
    }

    if (draggedItem.closest("tbody") !== item.closest("tbody") && draggedItem.dataset.removed === "true") {
        return;
    }
    if (draggedItem.closest("tbody") !== item.closest("tbody") && item.dataset.removed === "true") {
        return;
    }

    // Necessary to allow dropping
    e.preventDefault();

    // Keep it highlighted
    if (highlightedItem !== item) {

        if (highlightedItem) {
            resetRow(highlightedItem)
        }

        highlightedItem = item;
        highlightRow(item)
    }
});

  // --------------------------------------------------
  // DRAG END
  // --------------------------------------------------

  item.addEventListener("dragend", () => {

    if (highlightedItem) {
      resetRow(highlightedItem)
      highlightedItem = null;
    }
    
    resetRow(item)
    
    draggedFrom = null;
    draggedItem = null;
  });

  return item;
}

function vurder_feil() {    
    let problemtrs = [] 
    
    let obligatoriske = []
    obltrs = document.getElementById("verktøy-lag-oppstiller-obl").children;
    for (let i = 0; i < obltrs.length; i++) {
        if (obltrs[i].children[1].textContent == "‎") {continue;}
        if (obltrs[i].children[4].children.length == 2) {
            obltrs[i].children[4].firstChild.remove();
        }
        obligatoriske.push([obltrs[i].children[1].textContent, obltrs[i].children[2].textContent, obltrs[i].children[3].textContent])
    }

    let valgfrie = []
    valtrs = document.getElementById("verktøy-lag-oppstiller-val").children;
    for (let i = 0; i < valtrs.length; i++) {
        if (valtrs[i].children[1].textContent == "‎") {continue;}
        if (valtrs[i].children[4].children.length == 2) {
            valtrs[i].children[4].firstChild.remove();
        }
        valgfrie.push([valtrs[i].children[1].textContent, valtrs[i].children[2].textContent, valtrs[i].children[3].textContent])
    }

    let momenter = []
    if (obligatoriske.length > antall_obl) {
        problemtrs = problemtrs.concat([...obltrs])
        momenter.push("Obligatorisk oppstilling kan ikke ha flere enn "+antall_obl+" resultater, men har <strong>"+obligatoriske.length+"</strong>.")
    }

    obl_løp = obligatoriske.filter(e => løpsøvelser.has(e[1])).length
    if (obl_løp > maks_antall_obl_løp) {
        problemtrs = problemtrs.concat([...obltrs].filter(e => løpsøvelser.has(e.children[2].textContent)))
        momenter.push("Obligatorisk oppstilling kan maks ha "+maks_antall_obl_løp+" løpsresultater, men har <strong>"+obl_løp+"</strong>.")
    }

    // samme øvelse to ganger i obl
    const øvelsesantall = {};

    obligatoriske.forEach(rad => {øvelsesantall[rad[1]] = (øvelsesantall[rad[1]] || 0) + 1;});
    
    const øvelser_gjentatt = Object.keys(øvelsesantall).filter(verdi => øvelsesantall[verdi] > 1);
    
    if (øvelser_gjentatt.length > 0) {
        problemtrs = problemtrs.concat([...obltrs].filter(e => øvelser_gjentatt.includes(e.children[2].textContent)))
        momenter.push("Obligatorisk oppstilling kan ikke ha flere resultater i samme øvelse: " +øvelser_gjentatt.map(e => "<strong>" + e + "</strong>").join(", ")+".")
    }
    
    // øvelse som ikke er obligatorisk i obl
    ikke_obl = obligatoriske.filter(e => !tillatte_obl_øvelser.has(e[1])).map(e => e[1])
    if (ikke_obl.length > 0) {
        problemtrs = problemtrs.concat([...obltrs].filter(e => ikke_obl.includes(e.children[2].textContent)))
        momenter.push("Obligatorisk oppstilling kan ikke ha en ikke-obligatorisk øvelse: "+[...(new Set(ikke_obl))].map(e => "<strong>" + e + "</strong>").join(", ")+".")
    }

    if (valgfrie.length > antall_val) {
        problemtrs = problemtrs.concat([...valtrs])
        momenter.push("Valgfri oppstilling kan ikke ha flere enn "+antall_val+" resultater, men har <strong>"+valgfrie.length+"</strong>.")
    }

    val_løp = valgfrie.filter(e => løpsøvelser.has(e[1])).length
    if (val_løp > maks_antall_val_løp) {
        problemtrs = problemtrs.concat([...valtrs].filter(e => løpsøvelser.has(e.children[2].textContent)))
        momenter.push("Valgfri oppstilling kan maks ha "+maks_antall_val_løp+" løpsresultater, men har <strong>"+val_løp+"</strong>.")
    }

    // utøver har over 5 resultater
    const utøverantall = {};

    valgfrie.forEach(rad => {utøverantall[rad[2]] = (utøverantall[rad[2]] || 0) + 1;});
    obligatoriske.forEach(rad => {utøverantall[rad[2]] = (utøverantall[rad[2]] || 0) + 1;});
    
    const over_5_resultater = Object.keys(utøverantall).filter(verdi => utøverantall[verdi] > maks_res_per_utøver);
    if (over_5_resultater.length > 0) {
        problemtrs = problemtrs.concat([...obltrs, ...valtrs].filter(e => over_5_resultater.includes(e.children[3].textContent)))
        momenter.push("En utøver kan ikke ha flere enn "+maks_res_per_utøver+" resultater benyttet: "+over_5_resultater.map(e => "<strong>" + e + "</strong>")+".");
    }

    oppstillingsfeil = document.getElementById("oppstillingsfeil");

    oppstillingsfeil.style.backgroundColor = (momenter.length == 0) ? "#d8ffce" : "#F8E0E0";

    score = beregn_lagscore()
    if (opprinnelig_score === null) opprinnelig_score = score;
    document.getElementById("poengoppsummering").textContent = "Poeng: "+score+" ("+(score>opprinnelig_score ? "+" : "") +(score-opprinnelig_score)+")";

    if (momenter.length > 0) {
        oppstillingsfeil.innerHTML = "Ugyldig oppstilling:\n"
    } else if (score <= opprinnelig_score) {
        oppstillingsfeil.innerHTML = "Gyldig oppstilling."
    } else {
        oppstillingsfeil.innerHTML = "Gyldig og forbedret oppstilling! Kontakt serieutvalget for å få rettet feilen."
    }

    for (let i = 0; i < momenter.length; i++) {
        oppstillingsfeil.innerHTML += " - " + momenter[i] + "\n";
    }

    for (let i = 0; i < problemtrs.length; i++) {
        if (problemtrs[i].children[4].children.length == 1) {
            icon = document.createElement("i");
            icon.style.fontSize = "0.7rem";
            icon.style.color = "#e89f00";
            icon.classList = "bi bi-exclamation-triangle-fill"
            problemtrs[i].children[4].prepend(icon);
        }
    }
}

function beregn_lagscore() {
    let poeng = 0
    trs = document.getElementById("verktøy-lag-oppstiller-obl").children;
    for (let i = 0; i < trs.length; i++) {
        if (trs[i].children[1].textContent != "‎") {
            poeng += parseInt(trs[i].children[1].textContent);
        }
    }
    trs = document.getElementById("verktøy-lag-oppstiller-val").children;
    for (let i = 0; i < trs.length; i++) {
        if (trs[i].children[1].textContent != "‎") {
            poeng += parseInt(trs[i].children[1].textContent);
        }
    }
    return poeng;
}

function fargelegg_overganger() {
    const obltrs = document.getElementById("verktøy-lag-oppstiller-obl").children;
    const valtrs = document.getElementById("verktøy-lag-oppstiller-val").children;
    const restrs = document.getElementById("verktøy-lag-oppstiller-reserve").children;

    const match = (tr, list) =>
        list.some(r =>
            [...tr.children].slice(1, 4).every((v, i) => v.textContent == r[i])
        );

    for (const tr of obltrs) {
        if (tr.children[1].textContent == "‎") continue;
        tr.children[0].innerHTML = "";
        if (match(tr, val)) tr.children[0].appendChild(create_icon(270, "#ffcc00"));
        if (match(tr, reserver)) tr.children[0].appendChild(create_icon(0, "green"));
    }

    for (const tr of valtrs) {
        if (tr.children[1].textContent == "‎") continue;
        tr.children[0].innerHTML = "";
        if (match(tr, obl)) tr.children[0].appendChild(create_icon(90, "#ffcc00"));
        if (match(tr, reserver)) tr.children[0].appendChild(create_icon(0, "green"));
    }

    for (const tr of restrs) {
        tr.children[0].innerHTML = "";
        if (match(tr, obl) || match(tr, val)) tr.children[0].appendChild(create_icon(180, "red"));
    }
}

function create_icon(deg, color) {
    i = document.createElement("i")
    i.classList = "bi bi-play-fill";
    i.style.marginLeft = "-2px";
    i.style.display = "inline-block";
    i.style.transform = "rotate("+deg+"deg)";
    i.style.color = color;
    return i;
}

function vis_kun_beste_reserveresultat_per_øvelse() {
    vis_kun_beste = document.getElementById('vis-beste-per-øvelse').checked
    vis_fjernede = document.getElementById('vis-fjernede-resultater').checked

    const øvelser = new Set()
    trs = document.getElementById("verktøy-lag-oppstiller-reserve").children;
    for (let i = 0; i < trs.length; i++) {
        if (!vis_fjernede && trs[i].dataset.removed === "true") {
            trs[i].style.display = "none";
            continue;
        }
        if (!vis_kun_beste || !øvelser.has(trs[i].children[2].textContent)) {
            trs[i].style.display = "table-row";
        } else {
            trs[i].style.display = "none";
        }
        øvelser.add(trs[i].children[2].textContent);
    }
}

function oppdater_oversikt() {
    vurder_feil();
    vis_kun_beste_reserveresultat_per_øvelse();
    fargelegg_overganger();
}

document.getElementById('vis-beste-per-øvelse').addEventListener('change', function () {
    vis_kun_beste_reserveresultat_per_øvelse();
});

document.getElementById('vis-fjernede-resultater').addEventListener('change', function () {
    vis_kun_beste_reserveresultat_per_øvelse();
});

resultater = klubbresultater.map(r => [r[0], r[1], r[3]])

const obl = lagresultater["OBLIGATORISK"].filter(e => !e[10].startsWith("ut")).map(e => [(e[2] == 0 ? "‎" : e[2]), e[3], e[5]]);
const val = lagresultater["VALGFRI"].filter(e => !e[10].startsWith("ut")).map(e => [(e[2] == 0 ? "‎" : e[2]), e[3], e[5]]);

const reserver = resultater.filter(e => !obl.some(o => e[0]==o[0] && e[1]==o[1] && e[2]==o[2]) && !val.some(o => e[0]==o[0] && e[1]==o[1] && e[2]==o[2]))

antall_obl = krav["antall-obl"]
antall_val = krav["antall-val"]
maks_antall_obl_løp = krav["maks-obl-løp"]
maks_antall_val_løp = krav["maks-val-løp"]
maks_res_per_utøver = krav["maks-resultater-per-utøver"]
løpsøvelser = new Set(krav["løpsøvelser"])
tillatte_obl_øvelser = new Set(krav["obl-øvelser"])

opprinnelig_score = null;
lag_tabeller(obl, val, reserver)
