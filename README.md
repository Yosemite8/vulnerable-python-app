# Vulnerable Python App (for SCA & SAST Workshop)

This simple Python/Flask app contains intentionally vulnerable code.  
You will analyze it using [Datadog Code Security](https://docs.datadoghq.com/code_security/) via GitHub Actions.

---

## 🚀 Workshop Steps

### 1. Fork & Clone this repository

```bash
git clone https://github.com/YOUR_USERNAME/vulnerable-python-app.git
cd vulnerable-python-app
```

---

### 2. Set GitHub Secrets

In your forked repository, go to **Settings > Secrets and variables > Actions**  
Create the following secrets using your Datadog credentials:

- `DD_API_KEY`
- `DD_APP_KEY`

---

### 3. Push a commit

This will trigger GitHub Actions and run Datadog SCA & SAST.

---

### 4. View Results in Datadog

Go to **Security > Code Security** in your Datadog UI.

You should see findings such as:

- OS Command Injection (via `os.popen`)
- SQL Injection (via string interpolation)
- Vulnerable dependency (`requests==2.19.0`)

---

### 5. Fix the Issues

Try fixing the issues in the code:

- Replace `os.popen(cmd)` with `subprocess.run(...)` and sanitize input
- Replace raw SQL with parameterized queries
- Update `requests` in `requirements.txt` to a safe version

Then push your changes again and observe the results in Datadog.

---

## ✅ Purpose

This hands-on experience will help you understand how SCA and SAST tools work during CI, and how to use Datadog Code Security for real-world analysis.

---

Happy Hacking! 🐶
