from flask import Flask, request
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def home():
    with open("logs/file.log", "a") as log_file:
        log_file.write(f"{datetime.now()} - this IP address {request.remote_addr} visited the website\n")
    return "This response was generated inside a container"

@app.route("/status")
def status():
    try:
        with open("logs/monitor.log", "r") as monitor_file:
            lines = monitor_file.readlines()
        last_line = lines[-1].strip() if lines else "No status yet"
    except FileNotFoundError:
        last_line = "Monitor log not found"
    return last_line

@app.route("/health")
def health():
    return "OK"

app.run(host="0.0.0.0", port=8000)
