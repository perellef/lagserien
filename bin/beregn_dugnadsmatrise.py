import sys
sys.path.append('./')

import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import minimize
from collections import defaultdict

from srcc.main.kontrollsenter.seriedata import Seriedata
from srcc.main.kontrollsenter.database import Database
from srcc.main.utils.orm._resultat import Resultat
from srcc.main.utils.orm._mann_uttrekksresultat import MannUttrekksresultat
from srcc.main.batch_3_utdeling.poengberegner import Poengberegner

print("Initialiserer")
DATABASE = Database.PRODUKSJON
seriedata = Seriedata(DATABASE)
seriedata.initier()
seriedata.åpne()

print("Leser inn data")
menn_resultater = set(e.resultat_id for e in seriedata.hent(MannUttrekksresultat).all())
kjønn = lambda x: "menn" if x.resultat_id in menn_resultater else "kvinner" 

poengberegnet = defaultdict(lambda: defaultdict(list))
for i,res in enumerate(seriedata.hent(Resultat).all()):
    try:
        poeng = Poengberegner.beregn_resultat(kjønn(res), res)
    except ValueError:
        continue

    poengberegnet[(res.utøver_id, res.dato.year)][res.øvelseskode].append(poeng)


print("Legger inn overganger (ikke alle!)")

menn_10kamp_ute = set(("100", "lengde", "kule", "høyde", "400", "110h", "diskos", "stav", "spyd", "1500"))
menn_7kamp_inne = set(("60", "lengde", "kule", "høyde", "60h", "stav", "1000"))
kvinner_7kamp_ute = set(("100h", "høyde", "kule", "200", "lengde", "spyd", "800"))
kvinner_5kamp_inne = set(("60h", "høyde", "kule", "lengde", "800m"))

x = []
y = []

poenger_per_øvelse = defaultdict(list)
for _, øvelsesres in poengberegnet.items():
    øvelser = set(e[0] for e in øvelsesres)
    
    if any(( # er mangekjemper
        len(menn_10kamp_ute.difference(øvelser)) <= 3,
        len(menn_7kamp_inne.difference(øvelser)) <= 2,
        len(kvinner_7kamp_ute.difference(øvelser)) <= 2,
        len(kvinner_5kamp_inne.difference(øvelser)) <= 1,
    )):
        continue
    
    øvelseskode1, poenger1 = max(øvelsesres.items(), key=lambda x: len(x[1]))
    if len(poenger1) < 3:
        continue
    
    for øvelseskode2, poenger2 in øvelsesres.items():
        if len(poenger2) > 1:
            continue
        
        poenger_per_øvelse[(øvelseskode1, øvelseskode2)].append((round(poenger2[0]), round(max(poenger1))))

def lineær_regresjon(ø1, ø2, xs, ys, exs, eys):
    x = np.array(xs)
    y = np.array(ys)

    def objective(params, x, y):
        slope, intercept = params
        y_pred = slope * x + intercept

        if slope >= 0.96:
            return np.sum((y - y_pred) ** 2) + 10000000
        return np.sum((y - y_pred) ** 2)

    def constraint_intercept(params):
        slope, intercept = params
        return -intercept  # intercept should be <= 0, so return intercept itself

    initial_guess = [0.0, 0.0]
    cons = (
        {'type': 'ineq', 'fun': constraint_intercept},
    )
    result = minimize(objective, initial_guess, args=(x, y), constraints=cons)

    slope = result.x[0]
    intercept = result.x[1]

    y_pred_optimized = slope * x + intercept

    #plt.plot(x, y, linestyle="", marker=".", color="black")  # Plot original data
    #plt.plot(exs, eys, linestyle="", marker=".", color="red")  # Plot original data
    #plt.plot(x, y_pred_optimized, color='red', label='Fitted line')  # Plot the regression line
    #plt.title(f"Linear Regression {ø1}, {ø2}: y = {slope:.2f}x + {intercept:.2f}  (f(1300) = {slope * 1300 + intercept})")
    #plt.show()

    std = np.sqrt(np.sum((y - y_pred_optimized)**2) / (len(y) - 2))
    return slope, intercept, std

øvelser = ["60", "100", "200", "400", "800", "1500", "3000", "5000", "10000", "3000H", "60h", "100h", "110h", "200h", "400h", "3000K", "5000K", "10000K", "20000K", "høyde", "stav", "lengde", "tresteg", "hut", "lut", "kule", "diskos", "slegge", "spyd"]

print("Finner primæroverganger")
funksjoner = {}
for øvelse1 in øvelser:
    for øvelse2 in øvelser:
        if øvelse1 == øvelse2:
            continue
        
        nokkel = (øvelse1, øvelse2)
        if nokkel not in poenger_per_øvelse or len(poenger_per_øvelse[nokkel]) < 4:
            continue
        
        xs = [e[1] for e in poenger_per_øvelse[nokkel]]
        ys = [e[0] for e in poenger_per_øvelse[nokkel]]

        slope, intercept, std = lineær_regresjon(øvelse1, øvelse2, xs, ys, [], [])
        
        avstander = list(sorted(poenger_per_øvelse[nokkel], key=lambda x: x[0]-(slope*x[1]+intercept), reverse=True))

        ny_xs = [e[1] for e in avstander[int(len(avstander)*0.3):]]
        ny_ys = [e[0] for e in avstander[int(len(avstander)*0.3):]]
        exs = [e[1] for e in avstander[:int(len(avstander)*0.3)]]
        eys = [e[0] for e in avstander[:int(len(avstander)*0.3)]]
        
        slope, intercept, std = lineær_regresjon(øvelse1, øvelse2, ny_xs, ny_ys, exs, eys)

        totalt_fra = sum((len(poenger_per_øvelse[(øvelse1,til)]) if (øvelse1,til) in poenger_per_øvelse else 0) for til in øvelser)
        funksjoner[nokkel] = (slope, intercept, len(poenger_per_øvelse[nokkel]), totalt_fra)


terskel = 0.05
print(f"Fjerner de under {100*terskel}% av overgangene fra øvelsen")
from collections import defaultdict
overganger = defaultdict(dict)
for k,v in funksjoner.items():
    fra,til = k
    a,b,n,s = v
    
    if n/s < 0.05:
        continue
    overganger[fra][til] = (v)

print("Utleder transitive overganger")
while True:
    før = sum(len(v.values()) for v in overganger.values())

    overganger_kopi = {k: dict(v) for k,v in overganger.items()}
    for fra,v in overganger_kopi.items():
        for til in list(v):
            (a1,b1,_,_) = overganger_kopi[fra][til]
            if til not in overganger_kopi:
                continue
            for til2,(a2,b2,_,_) in overganger_kopi[til].items():
                if til2 == fra:
                    continue
                
                ny_a = a1*a2*0.9
                ny_b = a1*b2+b1

                if til2 in overganger[fra]:
                    a,b,_,_ = overganger[fra][til2]
                    if ny_a*1300+ny_b > a*1300+b:
                        overganger[fra][til2] = ny_a,ny_b,0,0
                else:
                    overganger[fra][til2] = ny_a,ny_b,0,0

    etter = sum(len(v.values()) for v in overganger.values())

    if før == etter:
        break

with open("EKSTRA/dugnadsmuligheter.txt", "w") as f:
    printout = "{\n"
    for fra in øvelser:
        if fra not in overganger:
            printout += f"   \"{fra}\": {{" + "},\n"
            continue
        v = overganger[fra]  
        printout += f"   \"{fra}\": {{\n"
        for til,(a,b,n,s) in sorted(v.items(), key=lambda x: øvelser.index(x[0])):
            f.write(f"{fra};{til};{round(a,4)};{round(b,4)};{n};{s};\n")
            printout += f"      \"{til}\": [{round(a,4)}, {round(b,4)}],\n"
        printout = printout[:-2] + "\n   },\n"
    printout = printout[:-2] + "\n}"
    print(printout)