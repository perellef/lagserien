import subprocess
import sys
import os

from datetime import date

argv = sys.argv

uttrekksdato = None
serieår = os.environ.get("LAGSERIEN_SERIEAR")
try:
    arg_i = 1
    while arg_i < len(argv):
        if argv[arg_i] == "--uttrekksdato":
            uttrekksdato = argv[arg_i+1]
            if date.fromisoformat(uttrekksdato) > date.today():
                print(f"OBS: Uttrekksdato kan ikke være etter i dag: {uttrekksdato}")
                sys.exit(1)
            arg_i += 2
            continue
        elif argv[arg_i] == "--serieår":
            serieår = int(argv[arg_i+1])
            if serieår > date.today().year:
                print(f"OBS: Serieår kan ikke være etter i år: {serieår}")
                sys.exit(1)
            arg_i += 2
            continue
        else:
            raise ValueError

except Exception as e:
    print("\nBruk følgende format:\n")
    print(f"{argv[0]} [--serieår --uttrekksdato]")
    sys.exit(1)

command = ["python", "srcc/main/applikasjon/run.py", serieår]
if uttrekksdato != None:
    command.append(uttrekksdato)

print(' '.join(command), end="\n\n")
subprocess.run(command)
