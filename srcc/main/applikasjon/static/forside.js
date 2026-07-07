
function vis_topp_5(kjønn) {
    lagplasseringer = cached_data.livetabell[kjønn][1]
    noteringer = cached_data.noteringer[1]

    tbody = document.getElementById(kjønn+'-topp-5');
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }

    lagplasseringer.slice(0, 5).forEach(function(lagplassering) {
        var lag = document.createElement('tr');

        celler = [
            td_med("plassering", lagplassering[1]),
            td_med("logo", ""),
            td_med("lag", ""),
            td_med("seriepoeng", lagplassering[3]),
        ]

        var anchor = document.createElement('a');
        anchor.href = "/livetabell/" + lagplassering[2] + " (" + kjønn + ")";
        anchor.style.textDecoration = "none";
        anchor.textContent = lagplassering[2];
        celler[2].appendChild(anchor)

        if (cached_data["klubblogoer"].includes(lagplassering[8])) {
            logo = `${window.location.origin}/static/assets/klubblogo/${lagplassering[8]}.png`;
            var img = document.createElement('img');
            img.src = logo;
            img.style.maxHeight = "100%"; 
            
            var anchor = document.createElement('a');
            anchor.href = "/livetabell/" + lagplassering[2].replace(/\s\d\. lag$/, '');
            anchor.append(img)

            celler[1].appendChild(anchor)
            celler[1].style.textAlign = "center";
        }
        
        celler.forEach(function(celle) {
            celle.style.whiteSpace = "nowrap";
            celle.style.overflow = "hidden";
            celle.style.textOverflow = "ellipsis";

            lag.appendChild(celle)
        });

        tbody.appendChild(lag)
    });
}

function td_med(klasse, verdi) {
    td = document.createElement('td');
    td.className = klasse;
    td.textContent = verdi;
    return td;
}

vis_topp_5("kvinner");
vis_topp_5("menn");