from flask import Flask, request
import os
import sqlite3

app = Flask(__name__)

@app.route("/cmd")
def run_command():
    # Vulnerability: OS Command Injection
    cmd = request.args.get("cmd")
    result = os.popen(cmd).read()
    return result

@app.route("/user")
def get_user():
    # Vulnerability: SQL Injection
    username = request.args.get("username")
    conn = sqlite3.connect("test.db")
    cur = conn.cursor()
    query = f"SELECT * FROM users WHERE name = '{username}'"
    cur.execute(query)
    rows = cur.fetchall()
    conn.close()
    return str(rows)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
