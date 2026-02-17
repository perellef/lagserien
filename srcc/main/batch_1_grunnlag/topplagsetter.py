from srcc.main.utils.orm._klubb import Klubb
from srcc.main.utils.orm._kvinne_topplag import KvinneTopplag
from srcc.main.utils.orm._mann_topplag import MannTopplag

class Topplagsetter:

    @staticmethod
    def sett_topplag(serieår, seriedata):

        kjernenavn_fra_klubb_id = {klubb.klubb_id: klubb.kjernenavn for klubb in seriedata.hent(Klubb).all()}

        # for 2021, skal bruke forrige års avsluttede tabell for år etter 2021
        if serieår == 2021:
            menn_div1lag = [(34, "Tjalve", 1), (83, "Sandnes", 1), (75, "Gneist", 1), (25, "Tyrving", 1), (44, "Tønsberg", 1), (61, "Norna-Salhus", 1), (16, "BUL", 1), (181, "Stord", 1), (10, "Nittedal", 1), (15, "Ullensaker/Kisa", 1), (34, "Tjalve", 2), (93, "Dimna", 1), (109, "Fana", 1), (13, "Vidar", 1)]
            menn_div2lag = [(65, "Gular", 1), (89, "Skjalg", 1), (51, "Steinkjer", 1), (145, "Ask", 1), (104, "Osterøy", 1), (171, "Ranheim", 1), (100, "Fri", 1), (50, "Bækkelagets", 1), (27, "Sturla", 1), (53, "Haugesund", 1), (134, "Gloppen", 1), (7, "Ås", 1), (83, "Sandnes", 2), (121, "Sarpsborg", 1)]
            kvinner_div1lag = [(34, "Tjalve", 1), (25, "Tyrving", 1), (89, "Skjalg", 1), (16, "BUL", 1), (61, "Norna-Salhus", 1), (196, "Stjørdal", 1), (31, "Fredrikstad", 1), (171, "Ranheim", 1), (10, "Nittedal", 1), (93, "Dimna", 1), (69, "Sørild", 1), (13, "Vidar", 1), (75, "Gneist", 1), (63, "Bergens", 1)]
            kvinner_div2lag = [(83, "Sandnes", 1), (53, "Haugesund", 1), (44, "Tønsberg", 1), (109, "Fana", 1), (15, "Ullensaker/Kisa", 1), (25, "Tyrving", 2), (71, "Laksevåg", 1), (28, "Moss", 1), (68, "Runar", 1), (70, "Larvik", 1), (34, "Tjalve", 2), (51, "Steinkjer", 1), (50, "Bækkelagets", 1), (107, "Selsbakk", 1)]
        elif serieår == 2022:
            menn_div1lag = [(34, "Tjalve", 1), (83, "Sandnes", 1), (61, "Norna-Salhus", 1), (75, "Gneist", 1), (15, "Ullensaker/Kisa", 1), (25, "Tyrving", 1), (16, "BUL", 1), (89, "Skjalg", 1), (44, "Tønsberg", 1), (51, "Steinkjer", 1), (145, "Ask", 1), (181, "Stord", 1), (65, "Gular", 1), (10, "Nittedal", 1)]
            menn_div2lag = [(109, "Fana", 1), (13, "Vidar", 1), (171, "Ranheim", 1), (104, "Osterøy", 1), (34, "Tjalve", 2), (53, "Haugesund", 1), (28, "Moss", 1), (8, "Sandvin", 1), (27, "Sturla", 1), (259, "Hind", 1), (93, "Dimna", 1), (105, "Lillehammer", 1), (100, "Fri", 1), (50, "Bækkelagets", 1)]
            kvinner_div1lag = [(34, "Tjalve", 1), (83, "Sandnes", 1), (25, "Tyrving", 1), (61, "Norna-Salhus", 1), (16, "BUL", 1), (89, "Skjalg", 1), (171, "Ranheim", 1), (31, "Fredrikstad", 1), (53, "Haugesund", 1), (93, "Dimna", 1), (196, "Stjørdal", 1), (44, "Tønsberg", 1), (10, "Nittedal", 1), (109, "Fana", 1)]
            kvinner_div2lag = [(13, "Vidar", 1), (15, "Ullensaker/Kisa", 1), (69, "Sørild", 1), (75, "Gneist", 1), (73, "Kristiansands", 1), (25, "Tyrving", 2), (28, "Moss", 1), (176, "BUL Tromsø", 1), (27, "Sturla", 1), (63, "Bergens", 1), (71, "Laksevåg", 1), (24, "Asker", 1), (70, "Larvik", 1), (68, "Runar", 1)]
        elif serieår == 2023:
            menn_div1lag = [(34, "Tjalve", 1), (83, "Sandnes", 1), (61, "Norna-Salhus", 1), (16, "BUL", 1), (75, "Gneist", 1), (109, "Fana", 1), (15, "Ullensaker/Kisa", 1), (25, "Tyrving", 1), (13, "Vidar", 1), (89, "Skjalg", 1), (44, "Tønsberg", 1), (171, "Ranheim", 1), (104, "Osterøy", 1), (51, "Steinkjer", 1)]
            menn_div2lag = [(69, "Sørild", 1), (34, "Tjalve", 2), (62, "Moelven", 1), (8, "Sandvin", 1), (73, "Kristiansands", 1), (53, "Haugesund", 1), (181, "Stord", 1), (145, "Ask", 1), (2180, "Fyllingen", 1), (259, "Hind", 1), (27, "Sturla", 1), (28, "Moss", 1), (65, "Gular", 1), (10, "Nittedal", 1)]
            kvinner_div1lag = [(34, "Tjalve", 1), (61, "Norna-Salhus", 1), (25, "Tyrving", 1), (83, "Sandnes", 1), (31, "Fredrikstad", 1), (16, "BUL", 1), (15, "Ullensaker/Kisa", 1), (171, "Ranheim", 1), (93, "Dimna", 1), (89, "Skjalg", 1), (53, "Haugesund", 1), (13, "Vidar", 1), (69, "Sørild", 1), (75, "Gneist", 1)]
            kvinner_div2lag = [(34, "Tjalve", 2), (109, "Fana", 1), (25, "Tyrving", 2), (73, "Kristiansands", 1), (44, "Tønsberg", 1), (121, "Sarpsborg", 1), (27, "Sturla", 1), (176, "BUL Tromsø", 1), (63, "Bergens", 1), (10, "Nittedal", 1), (145, "Ask", 1), (51, "Steinkjer", 1), (196, "Stjørdal", 1), (28, "Moss", 1)]
        elif serieår == 2024:
            menn_div1lag = [(34, "Tjalve", 1), (83, "Sandnes", 1), (13, "Vidar", 1), (16, "BUL", 1), (15, "Ullensaker/Kisa", 1), (61, "Norna-Salhus", 1), (75, "Gneist", 1), (34, "Tjalve", 2), (25, "Tyrving", 1), (109, "Fana", 1), (89, "Skjalg", 1), (8, "Sandvin", 1), (69, "Sørild", 1), (62, "Moelven", 1)]
            menn_div2lag = [(16, "BUL", 2), (171, "Ranheim", 1), (73, "Kristiansands", 1), (2180, "Fyllingen", 1), (44, "Tønsberg", 1), (181, "Stord", 1), (259, "Hind", 1), (145, "Ask", 1), (16, "BUL", 3), (53, "Haugesund", 1), (104, "Osterøy", 1), (93, "Dimna", 1), (51, "Steinkjer", 1), (24, "Asker", 1)]
            kvinner_div1lag = [(61, "Norna-Salhus", 1), (34, "Tjalve", 1), (83, "Sandnes", 1), (25, "Tyrving", 1), (15, "Ullensaker/Kisa", 1), (16, "BUL", 1), (34, "Tjalve", 2), (89, "Skjalg", 1), (31, "Fredrikstad", 1), (171, "Ranheim", 1), (93, "Dimna", 1), (109, "Fana", 1), (25, "Tyrving", 2), (73, "Kristiansands", 1)]
            kvinner_div2lag = [(13, "Vidar", 1), (75, "Gneist", 1), (53, "Haugesund", 1), (69, "Sørild", 1), (2180, "Fyllingen", 1), (50, "Bækkelagets", 1), (61, "Norna-Salhus", 2), (27, "Sturla", 1), (44, "Tønsberg", 1), (10, "Nittedal", 1), (121, "Sarpsborg", 1), (176, "BUL Tromsø", 1), (63, "Bergens", 1), (72, "Urædd", 1)]
        elif serieår == 2025:
            menn_div1lag = [(34, "Tjalve", 1), (83, "Sandnes", 1), (13, "Vidar", 1), (15, "Ullensaker/Kisa", 1), (16, "BUL", 1), (61, "Norna-Salhus", 1), (75, "Gneist", 1), (25, "Tyrving", 1), (34, "Tjalve", 2), (109, "Fana", 1), (16, "BUL", 2), (171, "Ranheim", 1), (73, "Kristiansands", 1), (2180, "Fyllingen", 1)]
            menn_div2lag = [(8, "Sandvin", 1), (89, "Skjalg", 1), (62, "Moelven", 1), (69, "Sørild", 1), (44, "Tønsberg", 1), (181, "Stord", 1), (259, "Hind", 1), (145, "Ask", 1), (93, "Dimna", 1), (16, "BUL", 3), (65, "Gular", 1), (2067, "Hattfjelldal", 1), (28, "Moss", 1), (25, "Tyrving", 2)]
            kvinner_div1lag = [(34, "Tjalve", 1), (61, "Norna-Salhus", 1), (83, "Sandnes", 1), (25, "Tyrving", 1), (16, "BUL", 1), (15, "Ullensaker/Kisa", 1), (34, "Tjalve", 2), (89, "Skjalg", 1), (31, "Fredrikstad", 1), (171, "Ranheim", 1), (13, "Vidar", 1), (75, "Gneist", 1), (53, "Haugesund", 1), (69, "Sørild", 1)]
            kvinner_div2lag = [(93, "Dimna", 1), (109, "Fana", 1), (25, "Tyrving", 2), (73, "Kristiansands", 1), (50, "Bækkelagets", 1), (61, "Norna-Salhus", 2), (2180, "Fyllingen", 1), (10, "Nittedal", 1), (27, "Sturla", 1), (44, "Tønsberg", 1), (91, "Sem", 1), (60, "Orion", 1), (51, "Steinkjer", 1), (71, "Laksevåg", 1)]
        elif serieår == 2026:
            menn_div1lag = [(34, "Tjalve", 1), (83, "Sandnes", 1), (13, "Vidar", 1), (15, "Ullensaker/Kisa", 1), (16, "BUL", 1), (61, "Norna-Salhus", 1), (75, "Gneist", 1), (25, "Tyrving", 1), (34, "Tjalve", 2), (16, "BUL", 2), (8, "Sandvin", 1), (62, "Moelven", 1), (69, "Sørild", 1), (181, "Stord", 1)]
            menn_div2lag = [(109, "Fana", 1), (171, "Ranheim", 1), (73, "Kristiansands", 1), (2180, "Fyllingen", 1), (89, "Skjalg", 1), (44, "Tønsberg", 1), (259, "Hind", 1), (145, "Ask", 1), (16, "BUL", 3), (28, "Moss", 1), (104, "Osterøy", 1), (176, "BUL Tromsø", 1), (13, "Vidar", 2), (31, "Fredrikstad", 1)]
            kvinner_div1lag = [(34, "Tjalve", 1), (61, "Norna-Salhus", 1), (83, "Sandnes", 1), (25, "Tyrving", 1), (16, "BUL", 1), (15, "Ullensaker/Kisa", 1), (34, "Tjalve", 2), (171, "Ranheim", 1), (53, "Haugesund", 1), (13, "Vidar", 1), (2180, "Fyllingen", 1), (73, "Kristiansands", 1), (50, "Bækkelagets", 1), (93, "Dimna", 1)]
            kvinner_div2lag = [(75, "Gneist", 1), (69, "Sørild", 1), (31, "Fredrikstad", 1), (89, "Skjalg", 1), (109, "Fana", 1), (25, "Tyrving", 2), (10, "Nittedal", 1), (27, "Sturla", 1), (44, "Tønsberg", 1), (91, "Sem", 1), (13, "Vidar", 2), (6, "Lambertseter", 1), (174, "Hareid", 1), (318, "Hamar", 1)]
        else:
            raise ValueError

        for divlag in [menn_div1lag, menn_div2lag, kvinner_div1lag, kvinner_div2lag]:
            for klubb_id, kjernenavn, lagnummer in divlag:
                if kjernenavn_fra_klubb_id[klubb_id] != kjernenavn:
                    raise ValueError(f"Topplagets klubb_id {klubb_id} ({kjernenavn_fra_klubb_id[klubb_id]}) matchet ikke oppgitt kjernenavn {kjernenavn}.")
        menn_topplag = list(seriedata.hent(MannTopplag).filter((MannTopplag.serieår != serieår)).all())
        for klubb_id, _, lagnummer in menn_div1lag:
            menn_topplag.append(MannTopplag(serieår=serieår, divisjon=1, klubb_id=klubb_id, lagnummer=lagnummer))
        for klubb_id, _, lagnummer in menn_div2lag:
            menn_topplag.append(MannTopplag(serieår=serieår, divisjon=2, klubb_id=klubb_id, lagnummer=lagnummer))
        
        kvinner_topplag = list(seriedata.hent(KvinneTopplag).filter((KvinneTopplag.serieår != serieår)).all())
        for klubb_id, _, lagnummer in kvinner_div1lag:
            kvinner_topplag.append(KvinneTopplag(serieår=serieår, divisjon=1, klubb_id=klubb_id, lagnummer=lagnummer))
        for klubb_id, _, lagnummer in kvinner_div2lag:
            kvinner_topplag.append(KvinneTopplag(serieår=serieår, divisjon=2, klubb_id=klubb_id, lagnummer=lagnummer))

        seriedata.slett_og_bulkinnsett(menn_topplag)
        seriedata.slett_og_bulkinnsett(kvinner_topplag)
        
        