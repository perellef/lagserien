const mann_svg = `${window.location.origin}/static/assets/ikoner/mann-ikon.svg`;
const kvinne_svg = `${window.location.origin}/static/assets/ikoner/kvinne-ikon.svg`;

function removeSuffix(str, suffix) {
  return str.endsWith(suffix) ? str.slice(0, -suffix.length) : str;
}

const rangeringsinfo = {
    "allroundere": ["utøvere", [2], [], [], [1,6], [0,1,5,6]],
    "nøkkelutøvere": ["utøvere", [2], [8], [], [1,6], [0,1,5,6]],
    "nykommere": ["utøvere", [2], [], [], [1], [0,1,5,6]],
    "ideallag": ["lag", [], [3], [], [1,6], [0,1,5,6]],
    "kommersterke": ["lag", [], [3], [], [1,6], [0,1,5,6]],
    "juniorlag": ["lag", [], [3], [], [1,5], [0,1,4,5]],
    "vekstklubber": ["klubber", [], [3], [], [1], [0,1]],
    "storklubber": ["klubber", [], [], [3], [1,5], [0,1,4,5]],
    "største-krets": ["kretser", [], [], [], [1], [0,1]],
}

function vis_data(tbody, data, tittel) {
    const [kategori, utoverhrefer, laghrefer, klubbhrefer, forbedringer, mothoyre] = rangeringsinfo[tittel];

    forrige_poeng = -1;
    forrige_indeks = -1;

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

Object.entries(rangeringsinfo).forEach(([tittel, verdier]) => {
    const rangering = cached_data.rangeringer[rangeringsinfo[tittel][0]][tittel];
    vis_data(document.getElementById(tittel), rangering, tittel);
});
