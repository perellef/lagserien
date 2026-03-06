window.addEventListener('load', () => {
  const currentURL = window.location.pathname;
  deaktiverNav(currentURL)
  aktiverNav(currentURL);
});

function aktiverNav(url) {
  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
      if ((url.startsWith(link.getAttribute('href')) && (link.getAttribute('href') !== '/')) || link.getAttribute('href') == url) {
          link.classList.add('active');
      }
  });
}

function deaktiverNav(url) {
  const navLinks = document.querySelectorAll('.nav-link');
  navLinks.forEach(link => {
      if (!(url.startsWith(link.getAttribute('href')) && (link.getAttribute('href') !== '/')) || link.getAttribute('href') == url) {
          link.classList.add('deactive');
      }
  });
}

function søkefelt_autocomplete() {
    var currentFocus;

    søkefelt = document.getElementById("søkefelt")

    søkefelt.addEventListener("input", function() {
        var listContainer, item, val = this.value;
        closeAllLists();
        console.log("!!");
    
        if (!val) return false;
        currentFocus = -1;
    
        // Create dropdown container
        listContainer = document.createElement("div");
        listContainer.setAttribute("id", this.id + "-autocomplete-list");
        listContainer.setAttribute("class", "autocomplete-items");
    
        // Position it correctly
        var rect = søkefelt.getBoundingClientRect();
        listContainer.style.position = "absolute";
        listContainer.style.top = (rect.bottom + window.scrollY + 5) + "px"; // Position below the input
        listContainer.style.left = rect.left + "px"; // Align with the left of the input field
        listContainer.style.width = rect.width + "px"; // Match the input width

        this.parentNode.appendChild(listContainer);

        cached_data.klubber.forEach(function(klubb) {
            index = klubb[0].toUpperCase().indexOf(val.toUpperCase())
            if (index == 0) {
                listContainer.appendChild(lagKlubbItem(klubb, val, index));
            }
        });
    
        cached_data.klubber.forEach(function(klubb) {
            index = klubb[0].toUpperCase().indexOf(val.toUpperCase())
            if (index > 0) {
                listContainer.appendChild(lagKlubbItem(klubb, val, index));
            }
        });

        cached_data.utøvere.forEach(function(utøver) {
            index = utøver[0].toUpperCase().indexOf(val.toUpperCase())
            if (index == 0) {
                listContainer.appendChild(lagUtøverItem(utøver, val, index));
            }
        });
    
        cached_data.utøvere.forEach(function(utøver) {
            index = utøver[0].toUpperCase().indexOf(val.toUpperCase())
            if (index > 0) {
                listContainer.appendChild(lagUtøverItem(utøver, val, index));
            }
        });
    
        // Automatically mark the first item as active if the list isn't empty
        var items = listContainer.getElementsByTagName("div");
        if (items.length > 0) {
            items[0].classList.add("autocomplete-active");
            currentFocus = 0;  // Set currentFocus to the first item
        }
    });

    // Keyboard navigation
    søkefelt.addEventListener("keydown", function(e) {
        var items = document.getElementById(this.id + "-autocomplete-list");
        if (items) items = items.children;

        if (e.keyCode == 40) { // Down arrow
            currentFocus++;
            addActive(items);
        } else if (e.keyCode == 38) { // Up arrow
            currentFocus--;
            addActive(items);
        } else if (e.keyCode == 13) { // Enter key
            e.preventDefault();
            if (currentFocus > -1 && items) {
                items[currentFocus].click();
            }
        }
    });

    function lagKlubbItem(klubb, val, index) {
        const item = document.createElement("div");
        item.className = "autocomplete-item";
        item.style.padding = "0 15px 0 0px";

        var anchor = document.createElement('a');
        anchor.href = "/livetabell/" + klubb[0];
        anchor.style.color = "inherit";
        anchor.style.textDecoration = "none";
        item.appendChild(anchor);

        var div = document.createElement("div");
        div.style.display = "flex";
        div.style.width = "100%";
        anchor.appendChild(div);

        var ramme = document.createElement("div");
        ramme.style.display = "flex";
        ramme.style.justifyContent = "center";
        ramme.style.height = "40x"; 
        ramme.style.width = "50px"; 
        ramme.style.padding = "7px 7px 7px 7px";

        if (cached_data.klubblogoer.includes(klubb[1])) {
          klubblogo = logo = `${window.location.origin}/static/assets/klubblogo/${klubb[1]}.png`;
          var img = document.createElement('img');
          img.src = logo;
          img.style.maxWidth = "100%"; 
          img.style.maxHeight = "100%";
          img.style.width = "auto";
          img.style.height = "auto";
          img.style.objectFit = "contain"; 
          ramme.appendChild(img);
        }
        div.appendChild(ramme);

        const span = document.createElement("span");
        span.style.whiteSpace = "nowrap";
        span.style.overflow = "hidden";
        span.style.textOverflow = "ellipsis";
        span.style.display = "inline-block";
        span.style.maxWidth = "100%";
        span.style.fontSize = "15px"

        const textBefore = document.createTextNode(klubb[0].substr(0, index));
        const strong = document.createElement("strong");
        strong.textContent = klubb[0].substr(index, val.length);
        const textAfter = document.createTextNode(klubb[0].substr(index + val.length));
        
        span.appendChild(textBefore);
        span.appendChild(strong);
        span.appendChild(textAfter);

        const tekstområde = document.createElement("div");
        tekstområde.appendChild(span);

        const klubbnotis = document.createElement("div");
        klubbnotis.style.marginTop = "-7px";
        klubbnotis.style.color = "#666666"
        klubbnotis.style.fontSize = "12px"
        klubbnotis.textContent = "Klubb";
        tekstområde.appendChild(klubbnotis); 

        const overdiv = document.createElement("div");
        
        overdiv.style.display = "flex";
        overdiv.style.justifyContent = "space-between";
        overdiv.style.width = "100%";
        overdiv.appendChild(tekstområde);

        const arrow = document.createElement("span");
        arrow.textContent = "→";
        arrow.style.fontSize = "18px";
        arrow.style.marginLeft = "5px";
        arrow.style.color = "#007bff";

        overdiv.appendChild(arrow);

        div.appendChild(overdiv);
        return item;
    }

    function lagUtøverItem(utøver, val, index) {
        const item = document.createElement("div");
        item.className = "autocomplete-item";
        item.style.padding = "0 15px 0 20px";

        var anchor = document.createElement('a');
        anchor.href = "/utovere/" + utøver[2];
        anchor.style.color = "inherit";
        anchor.style.textDecoration = "none";
        item.appendChild(anchor);

        var div = document.createElement("div");
        div.style.display = "flex";
        div.style.width = "95%";
        anchor.appendChild(div);

        const span = document.createElement("span");
        span.style.whiteSpace = "nowrap";
        span.style.overflow = "hidden";
        span.style.textOverflow = "ellipsis";
        span.style.display = "inline-block";
        span.style.width = "100%";
        span.style.fontSize = "15px"

        const textBefore = document.createTextNode(utøver[0].substr(0, index));
        const strong = document.createElement("strong");
        strong.textContent = utøver[0].substr(index, val.length);
        const textAfter = (utøver[1] === null)
              ? document.createTextNode(utøver[0].substr(index + val.length))
              : document.createTextNode(utøver[0].substr(index + val.length) + " (" + utøver[1] + ")");

        span.appendChild(textBefore);
        span.appendChild(strong);
        span.appendChild(textAfter);

        const tekstområde = document.createElement("div");
        tekstområde.appendChild(span);

        const klubbnotis = document.createElement("div");
        klubbnotis.style.marginTop = "-7px";
        klubbnotis.style.color = "#666666"
        klubbnotis.style.fontSize = "12px"
        klubbnotis.textContent = "Utøver";
        tekstområde.appendChild(klubbnotis); 

        const overdiv = document.createElement("div");
        
        overdiv.style.display = "flex";
        overdiv.style.justifyContent = "space-between";
        overdiv.style.width = "100%";
        overdiv.appendChild(tekstområde);

        const arrow = document.createElement("span");
        arrow.textContent = "→";
        arrow.style.marginLeft = "10px";
        arrow.style.fontSize = "18px";
        arrow.style.color = "#007bff";

        overdiv.appendChild(arrow);

        div.appendChild(overdiv);
        return item;
    }


    // Highlight active item
    function addActive(items) {
        if (!items) return false;
        removeActive(items);
        if (currentFocus >= items.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = items.length - 1;
        items[currentFocus].classList.add("autocomplete-active");
    }
    // Remove active class from all items
    function removeActive(items) {
        for (var i = 0; i < items.length; i++) {
            items[i].classList.remove("autocomplete-active");
        }
    }

    // Close all lists except the current one
    function closeAllLists(elmnt) {
        var items = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < items.length; i++) {
            if (elmnt != items[i] && elmnt != søkefelt) {
                items[i].parentNode.removeChild(items[i]);
            }
        }
    }

    // Close list on document click
    document.addEventListener("click", function(e) {
        closeAllLists(e.target);
    });

}

window.addEventListener("load", søkefelt_autocomplete);
