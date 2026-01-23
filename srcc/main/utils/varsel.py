import time

class Varsel:

    @staticmethod
    def loggfør(batch, feilmelding):
        with open("./varsler.txt","a") as f:
            f.write(f"[{batch}] {time.time()}: {feilmelding}\n")