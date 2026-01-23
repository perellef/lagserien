function autocomplete(input, options) {
    var currentFocus;

    input.addEventListener("input", function() {
        var listContainer, item, val = this.value;
        closeAllLists();
    
        if (!val) return false;
        currentFocus = -1;
    
        // Create dropdown container
        listContainer = document.createElement("div");
        listContainer.setAttribute("id", this.id + "-autocomplete-list");
        listContainer.setAttribute("class", "autocomplete-items");
    
        // Position it correctly
        listContainer.style.position = "absolute";
        listContainer.style.top = (input.offsetHeight + 5) + "px";
        listContainer.style.left = "0";
        listContainer.style.width = input.offsetWidth + "px";
    
        this.parentNode.appendChild(listContainer);
    
        options.forEach(function(option) {
            index = option.toUpperCase().indexOf(val.toUpperCase())
            if (index == 0) {
                listContainer.appendChild(createItem(option, val, index));
            }
        });
    
        options.forEach(function(option) {
            index = option.toUpperCase().indexOf(val.toUpperCase())
            if (index > 0) {
                listContainer.appendChild(createItem(option, val, index));
            }
        });
    
        // Automatically mark the first item as active if the list isn't empty
        var items = listContainer.getElementsByTagName("div");
        if (items.length > 0) {
            // Safely add 'autocomplete-active' class to the first item
            items[0].classList.add("autocomplete-active");
            currentFocus = 0;  // Set currentFocus to the first item
        }
    });

    // Keyboard navigation
    input.addEventListener("keydown", function(e) {
        var items = document.getElementById(this.id + "-autocomplete-list");
        if (items) items = items.getElementsByTagName("div");

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

    function createItem(option, val, index) {
        item = document.createElement("div");
        item.className = "autocomplete-item";
        item.innerHTML = option.substr(0, index);
        item.innerHTML += "<strong>" + option.substr(index, val.length) + "</strong>";
        item.innerHTML += option.substr(index+val.length);
        item.innerHTML += "<input type='hidden' value='" + option + "'>";

        // Click event to select item
        item.addEventListener("click", function() {
            input.value = this.getElementsByTagName("input")[0].value;
            closeAllLists();
        });
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
            if (elmnt != items[i] && elmnt != input) {
                items[i].parentNode.removeChild(items[i]);
            }
        }
    }

    // Close list on document click
    document.addEventListener("click", function(e) {
        closeAllLists(e.target);
    });

}
