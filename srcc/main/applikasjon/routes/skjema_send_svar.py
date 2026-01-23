from flask import request, render_template
from srcc.main.applikasjon.fellesinfo import cache

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

import os 

avsender_email = os.environ.get("AVSENDER_EMAIL")
mottaker_email = os.environ.get("MOTTAKER_EMAIL")
passord = os.environ.get("AVSENDER_EMAIL_PASSORD")

def skjema_send_svar():
    innsender_mail = request.form['innsender_email']
    tittel = request.form['tittel']
    tilbakemelding = request.form['tilbakemelding']

    print(f"'{innsender_mail}'")
    print(f"'{tittel}'")
    print(f"'{tilbakemelding}'")

    innhold = f"""Fra (valgfri): {innsender_mail}\nEmne: {tittel}\nTilbakemelding: {tilbakemelding}"""

    if tittel == "":
        return render_template("skjema.html", cache=cache.data, feilet=True, feilmelding="Tittel må fylles inn.")
    if tilbakemelding == "":
        return render_template("skjema.html", cache=cache.data, feilet=True, feilmelding="Tilbakemelding må fylles inn.")

    suksess = send_mail(tittel, innhold)
    if not suksess:
        return render_template("skjema.html", cache=cache.data, feilet=False, feilmelding="Noe gikk galt")

    return render_template("skjema_bekreftelse.html", cache=cache.data, innhold=innhold)

def send_mail(emne, innhold):
    msg = MIMEMultipart()
    msg["From"] = avsender_email
    msg["To"] = mottaker_email
    msg["Subject"] = emne
    msg.attach(MIMEText(innhold, "plain"))

    # Send email via Gmail SMTP
    try:
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.starttls()
        server.login(avsender_email, passord)
        server.sendmail(avsender_email, mottaker_email, msg.as_string())
        server.quit()
        return True
    except Exception as e:
        return False