from flask import render_template
from srcc.main.applikasjon.fellesinfo import seriedata, cache
from srcc.main.applikasjon.spørringer import db_hent_besøksdata_antall_klikk, db_hent_besøksdata_antall_brukere

def se_oversikter():
    with seriedata.connect() as peker:
        klikk_per_dag = db_hent_besøksdata_antall_klikk(peker)
        brukere_per_dag = db_hent_besøksdata_antall_brukere(peker)

    klikk_per_dag_y = [e[1] for e in klikk_per_dag]
    brukere_per_dag_y = [e[1] for e in brukere_per_dag]

    gj_antall_klikk_y = [round(sum(klikk_per_dag_y[max(i-3,0):i+4])/len(klikk_per_dag_y[max(i-3,0):i+4]),1) for i in range(len(klikk_per_dag_y))]
    gj_antall_brukere_y = [round(sum(brukere_per_dag_y[max(i-3,0):i+4])/len(brukere_per_dag_y[max(i-3,0):i+4]),1) for i in range(len(brukere_per_dag_y))]
    
    return render_template(
        "se_oversikter.html",
        klikk_per_dag=klikk_per_dag,
        brukere_per_dag=brukere_per_dag,
        gj_klikk=gj_antall_klikk_y,
        gj_brukere=gj_antall_brukere_y,
        cache=cache.data
    )