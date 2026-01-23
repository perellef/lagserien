import json
import os

def les_json(filnavn):
    streng = ""
    with open(filnavn, encoding='utf-8') as fil:
        for linje in fil:
            streng += linje.strip()

    return json.loads(streng)

hovedmappe = "konfig"
filer = ("øvelsesinfo", "resultatavvik", "settinger")

def les_konfigdata():
    serieår = [name for name in os.listdir(hovedmappe)]
    return {år: {f: les_json(f"{hovedmappe}/{år}/{f}.json") for f in filer} for år in serieår}

konfigdata = les_konfigdata()