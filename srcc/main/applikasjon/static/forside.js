
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

function fyll_inn_nyheter() {
    nyheter_div = document.getElementById("nyheter"); 
    nyheter_div.innerHTML = "";

    artikler = cached_data.artikler;
    for (i = 0; i < artikler.length; i+=3) {

        if (i > 12) {
            break;
        }

        nyhetstriplett = document.createElement("div");
        nyhetstriplett.classList.add("carousel-item");

        container = document.createElement("div");
        container.classList.add("mt-3")
        container.style.padding = "0 50px 0 50px";
        container.style.width = "100%";

        row = document.createElement("div");
        row.classList.add("row");

        nyheter_div.appendChild(nyhetstriplett);
        nyhetstriplett.appendChild(container);
        container.appendChild(row);

        for (j = 0; j < 3; j++) {
            
            col = document.createElement("div");
            col.classList.add("col-4");
            row.appendChild(col);

            nyhetselement = document.createElement("div");
            nyhetselement.classList.add("card");
            nyhetselement.classList.add("my-1");

            if (artikler.length <= i + j) {
                col.appendChild(nyhetselement);
            } else {
                artikkel = artikler[i+j];
                a = document.createElement("a");
                a.classList.add("custom-link");
                a.href = "/nyhetsarkiv/" + artikkel[2]; 
                img = document.createElement("img");
                body = document.createElement("div");
                nyhetselement.appendChild(img);
                nyhetselement.appendChild(body);

                img.classList.add("card-img-top");
                img.src = `${window.location.origin}/static/assets/artikler/${artikkel[3]}`;
                body.classList.add("card-body")
                
                h6 = document.createElement("h6");
                h6.classList.add("card-title");
                h6.textContent = artikkel[2];
                body.appendChild(h6);

                a.appendChild(nyhetselement);
                col.appendChild(a);
            }
        };
    };

    if (artikler.length == 0) {
        carousel = document.getElementById("carouselExample");
        carousel.style.display = "none";
    } else {
        nyheter_div.firstChild.classList.add("active");
    }
}

window.onload = vis_topp_5("menn");
window.onload = vis_topp_5("kvinner");
window.onload = fyll_inn_nyheter();