import sys

sys.path.append('./')
sys.stdout.reconfigure(encoding='utf-8')

import waitress
from __init__ import create_app

app = create_app()

port = 8081

print(f"Applikasjonen er oppe på port {port}.")
waitress.serve(app, host="0.0.0.0", port=port)