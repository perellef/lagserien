**Notater til brukeren**

I enhetstestene er det lagt opp til at alle tabell-objekter opprettes med default-verdier, med mindre noe annet er spesifisert. Disse default-verdiene vil alltid være de samme, helt uavhengig av hvorfra objektene blir opprettet. For eksempel vil en klubb opprettet med:
```
klubb = en_klubb()
```
være lik en klubb opprettet gjennom Overklubb med:
```
overklubb = en_overklubb()
```
Med andre ord vil følgende være sant:
```
assert klubb == overklubb.klubb
```
I testene oppgis attributtene eksplisitt kun hvis man trenger ulike typer tabellobjekter. 