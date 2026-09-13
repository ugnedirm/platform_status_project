from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def home():
    with open("logs/visits.log", "a") as f:
        f.write(f"{datetime.now()} - visit\n")
    return "Hello from inside a container"

@app.route("/status")
def status():
    try:
        with open("logs/monitor.log", "r") as f:
            lines = f.readlines()
        last_line = lines[-1].strip() if lines else "No status yet"
    except FileNotFoundError:
        last_line = "Monitor log not found"
    return last_line

app.run(host="0.0.0.0", port=8000)