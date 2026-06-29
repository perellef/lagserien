
visninger = ["oversikt", "tabell", "rangeringer", "kalender"];
rangeringer = ["allroundere", "nøkkelutøvere", "nykommere", "ideallag", "kommersterke", "juniorlag", "vekstklubber", "storklubber", "største-krets"]

function handleClickVisning(visning) {
  return function () {
    visninger.forEach(visning2 => {
      document.getElementById(visning2 + "-knapp").style.backgroundColor = "white";
      document.getElementById(visning2 + "-knapp").style.borderColor = "#cccccc";
      document.getElementById(visning2).style.display = "none";
    });

    document.getElementById(visning + "-knapp").style.backgroundColor = "#e4f2ff";
    document.getElementById(visning + "-knapp").style.borderColor = "#afbfff";
    document.getElementById(visning).style.display = "block";

    const notiser = document.getElementById('notiser');
    if (visning == "oversikt") {
      const spy = bootstrap.ScrollSpy.getOrCreateInstance(notiser, {
        target: '#notiser-liste'
      });
      spy.refresh();
    }
  };
}

function handleClickRangering(rangering) {
  return function() {
        document.querySelectorAll(".selected").forEach(knapp => {
            document.getElementById(removeSuffix(knapp.id, "-knapp") + "-visning").style.display = "none";
            knapp.classList.remove("selected");
        });
        document.getElementById(rangering + "-visning").style.display = "block";
        document.getElementById(rangering + "-knapp").classList.add("selected");
  }
}

function divisjonOver() {
    divisjon = document.getElementById('livetabell-divisjon');
    divisjon.textContent = ((divisjon.textContent + 1) % 3) + 1
    vis_lagplasseringer()
}

function divisjonUnder() {
    divisjon = document.getElementById('livetabell-divisjon');
    divisjon.textContent = (divisjon.textContent % 3) + 1
    vis_lagplasseringer()
}

function tilTabell(kjønn, divisjon) {
    return function() {
        kjønndiv = document.getElementById('livetabell-kjønn');
        kjønndiv.textContent = kjønn;
        divisjondiv = document.getElementById('livetabell-divisjon');
        divisjondiv.textContent = divisjon
        vis_lagplasseringer();
  }
}

function byttKjønn() {
    divisjon = document.getElementById('livetabell-kjønn');
    if (divisjon.textContent == "menn") {
        divisjon.textContent = "kvinner"
    } else {
        divisjon.textContent = "menn"
    }
    vis_lagplasseringer()
}

const handlers = {};
visninger.forEach(visning => {
  const handler = handleClickVisning(visning);
  handlers[visning] = handler;

  document
    .getElementById(visning + "-knapp")
    .addEventListener("click", handler);
});

rangeringer.forEach((rangering) => {
  const handler = handleClickRangering(rangering);
  handlers["rangering-"+rangering] = handler;

  document
    .getElementById(rangering + "-knapp")
    .addEventListener("click", handler);
});

document.getElementById('divisjon-venstre').addEventListener('click', divisjonOver);
document.getElementById('divisjon-høyre').addEventListener('click', divisjonUnder);
document.getElementById('kjønn-venstre').addEventListener('click', byttKjønn)
document.getElementById('kjønn-høyre').addEventListener('click', byttKjønn)

handlers["tabell-menn 1. divisjon"] = tilTabell("menn", 1);
handlers["tabell-menn 2. divisjon"] = tilTabell("menn", 2);
handlers["tabell-menn 3. divisjon"] = tilTabell("menn", 3);
handlers["tabell-kvinner 1. divisjon"] = tilTabell("kvinner", 1);
handlers["tabell-kvinner 2. divisjon"] = tilTabell("kvinner", 2);
handlers["tabell-kvinner 3. divisjon"] = tilTabell("kvinner", 3);
