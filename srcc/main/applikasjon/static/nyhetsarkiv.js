
function fyll_inn_nyheter() {
    nyheter_div = document.getElementById("nyheter"); 
    nyheter_div.innerHTML = "";

    artikler = cached_data.artikler;
    for (i = 0; i < artikler.length; i+=3) {
        rad = document.createElement("div");
        rad.classList.add("row");
        
        for (j = 0; j < 3; j++) {
            kol = document.createElement("div");
            kol.classList.add("col-4");
            rad.appendChild(kol);

            nyhetselement = document.createElement("div");
            nyhetselement.classList.add("card");
            nyhetselement.classList.add("my-1");

            if (artikler.length <= i + j) {
                rad.appendChild(nyhetselement);
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
                
                h5 = document.createElement("h5");
                h5.classList.add("card-title");
                h5.textContent = artikkel[2];
                body.appendChild(h5);

                a.appendChild(nyhetselement);
                kol.appendChild(a);
            }
        }

        nyheter_div.appendChild(rad);
    }
}

window.onload = fyll_inn_nyheter();