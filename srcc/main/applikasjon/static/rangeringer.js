const mann_svg = `${window.location.origin}/static/assets/ikoner/mann-ikon.svg`;
const kvinne_svg = `${window.location.origin}/static/assets/ikoner/kvinne-ikon.svg`;

function removeSuffix(str, suffix) {
  return str.endsWith(suffix) ? str.slice(0, -suffix.length) : str;
}

function vis_data(data, tbody_id, utoverhrefer, laghrefer, klubbhrefer, forbedringer, mothoyre) {
    tbody = document.getElementById(tbody_id);

    forrige_poeng = 0
    forrige_indeks = 0

    data.forEach(function(rad, i) {
        var tr = document.createElement('tr');

        indeks = i;
        if (rad[0] == forrige_poeng) {
            indeks = forrige_indeks;
        }
        forrige_indeks = indeks;
        forrige_poeng = rad[0]

        var indekscelle = document.createElement('td')
        indekscelle.textContent = indeks+1;
        indekscelle.style.whiteSpace = "nowrap";
        indekscelle.style.paddingTop = "2px";
        indekscelle.style.paddingBottom = "2px";
        indekscelle.style.fontSize = "8px"
        indekscelle.style.color = "gray"
        tr.appendChild(indekscelle);

        rad.forEach(function(verdi, vi) {
            if (utoverhrefer.includes(vi-1)) {return;}
            if (laghrefer.includes(vi+1)) {return;}
            if (klubbhrefer.includes(vi+1)) {return;}

            var celle = document.createElement('td')
            
            celle.style.whiteSpace = "nowrap";
            celle.style.paddingTop = "2px";
            celle.style.paddingBottom = "2px";
            
            if (mothoyre.includes(vi)) {
                celle.style.textAlign = "right";
            } else {
                celle.style.overflow = "hidden";
                celle.style.textOverflow = "ellipsis";
            }

            if (utoverhrefer.includes(vi)) {
                var anchor = document.createElement('a');   
                anchor.href = "/utovere/" + rad[vi+1];
                anchor.style.textDecoration = "none";
                anchor.textContent = verdi;
                celle.appendChild(anchor);
            } else if (laghrefer.includes(vi) || klubbhrefer.includes(vi)) {
                celle.style.display = "flex";
                
                var ramme = document.createElement("div");
                
                ramme.style.display = "flex";
                ramme.style.flexShrink = "0";
                ramme.style.justifyContent = "center";
                ramme.style.height = "18px"; 
                ramme.style.width = "18px"; 
                ramme.style.padding = "0";
                ramme.style.margin = "0 10px 0 0";

                if (cached_data.klubblogoer.includes(rad[vi-1])) {
                    klubblogo = logo = `${window.location.origin}/static/assets/klubblogo/${rad[vi-1]}.png`;
                    var img = document.createElement('img');
                    img.src = logo;
                    img.style.maxWidth = "100%"; 
                    img.style.maxHeight = "100%";
                    img.style.width = "auto";
                    img.style.height = "auto";
                    img.style.objectFit = "contain"; 
                    ramme.appendChild(img);
                }
                celle.appendChild(ramme);

                var anchor = document.createElement('a');   
                anchor.href = "/livetabell/" + verdi;
                anchor.textContent = removeSuffix(removeSuffix(verdi, ' (menn)'), ' (kvinner)') + (verdi.endsWith(" (kvinner)") ? " (K)" : (verdi.endsWith(" (menn)") ? " (M) " : ""))
                anchor.style.textDecoration = "none";
                celle.appendChild(anchor);

                if (verdi.endsWith(" (kvinner)") || verdi.endsWith(" (menn)")) {
                    span = document.createElement("span");
                    span.textContent = verdi.endsWith(" (kvinner)") ? " (K)" : " (M)";
                }
            } else if (forbedringer.includes(vi)) {
                celle.style.fontSize = "0.75rem";
                celle.style.paddingRight = "30px";
                celle.style.verticalAlign = "middle";
                celle.textContent = (verdi == 0 ? "" : (verdi > 0 ? "+" + verdi : verdi));
            } else {
                celle.textContent = verdi;
            }
            
            tr.appendChild(celle);
        });
        

        var tom_celle = document.createElement('td')
        tr.appendChild(tom_celle);
    
        tbody.appendChild(tr);
    });
}

alle_utmerkelser = [
    ["utøvere", "allroundere", [2], [], [], [1,6], [0,1,5,6]],
    ["utøvere", "nøkkelutøvere", [2], [8], [], [1,6], [0,1,5,6]],
    ["utøvere", "nykommere", [2], [], [], [1], [0,1,5,6]],
    ["lag", "ideallag", [], [3], [], [1,6], [0,1,5,6]],
    ["lag", "kommersterke", [], [3], [], [1,6], [0,1,5,6]],
    ["lag", "juniorlag", [], [3], [], [1,5], [0,1,4,5]],
    ["klubber", "vekstklubber", [], [3], [], [1], [0,1]],
    ["klubber", "storklubber", [], [], [3], [1,5], [0,1,4,5]],
    ["kretser", "største-krets", [], [], [], [1], [0,1]]
]

alle_utmerkelser.forEach(function(verdi) {
    const [kategori, tittel, utoverhrefer, laghrefer, klubbhrefer, forbedringer, mothoyre] = verdi;

    vis_data(cached_data.rangeringer[kategori][tittel], tittel, utoverhrefer, laghrefer, klubbhrefer, forbedringer, mothoyre);

    document.getElementById(tittel + "-knapp").addEventListener('click', function() {
        document.querySelectorAll(".selected").forEach(knapp => {
            document.getElementById(removeSuffix(knapp.id, "-knapp") + "-visning").style.display = "none";
            knapp.classList.remove("selected");
        });
        document.getElementById(tittel + "-visning").style.display = "block";
        document.getElementById(tittel + "-knapp").classList.add("selected");
    });
});
