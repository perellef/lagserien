import sys
sys.path.append('./')

from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._utøver import Utøver
from srcc.main.utils.orm._øvelse import Øvelse
from srcc.main.utils.orm._mann_serieresultat import MannSerieresultat
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._resultatbytte import Resultatbytte
from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.utils.orm._kvinne_uttrekksresultat import KvinneUttrekksresultat
from srcc.main.utils.orm._serie import Serie
from srcc.main.utils.orm._stevne import Stevne

from datetime import date

from srcc.main.utils.testverktøy._testobjekter import AliasID

defaultverdier = {
    (Serie, "avsluttet"): lambda _: None,
    (Klubb, "klubb_id"): lambda x: AliasID.til_id(x['klubbnavn']),
    (Klubb, "kjernenavn"): lambda _: "irrelevant",
    (Utøver, "utøver_id"): lambda x: AliasID.til_id(x['navn']),
    (Stevne, "stevne_id"): lambda x: AliasID.til_id(x['sted']),
    (Stevne, "dato"): lambda _: date.fromisoformat("9999-01-01"),
    (Stevne, "stevnetittel"): lambda _: "irrelevant",
    (Stevne, "arena"): lambda _: "irrelevant",
    (Stevne, "er_nasjonalt"): lambda _: False,
    (Stevne, "rapportert"): lambda _: date.fromisoformat("9999-01-01"),
    (Øvelse, "øvelseskode"): lambda x: x['øvelsesnavn'],
    (Resultat, "statistikk_resultat_id"): lambda x: x['resultat_id'],
    (Resultatbytte, "notat"): lambda _: "irrelevant",
    (MannSerieresultat, "poeng"): lambda _: None,
    (MannSerieresultat, "forløp"): lambda _: "Innlastet.",
    (MannUttrekksresultat, "klubb_id"): lambda _: 1234,
    (KvinneUttrekksresultat, "klubb_id"): lambda _: 1234,
}

    