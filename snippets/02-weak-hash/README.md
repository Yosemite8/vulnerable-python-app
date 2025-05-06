# CWE-327: Use of a Broken or Risky Cryptographic Algorithm

This snippet demonstrates the use of a weak cryptographic hash function (`MD5`) which is known to be insecure and prone to collision attacks. It simulates a scenario where a user-supplied input is hashed using MD5.

## 🛠 How to Use

Start the Flask application, then issue a GET request like below:

```bash
curl "http://[Your Service Public IP Address]/hash?input=hello"
```

You should see output similar to:

```
MD5 hash of 'hello' is: 5d41402abc4b2a76b9719d911017c592
```

## 🔍 Example Payloads

```bash
curl "http://[Your Service Public IP Address]/hash?input=admin"
curl "http://[Your Service Public IP Address]/hash?input=password123"
```

## 💣 What Makes It Vulnerable

- This application uses the MD5 hash function, which is broken due to known collision vulnerabilities.
- An attacker can craft inputs that produce the same MD5 hash, undermining integrity checks or signature schemes.

## ✅ Fix Suggestion

- Replace MD5 with a secure hashing algorithm such as SHA-256 or use cryptographic libraries that are actively maintained (e.g., hashlib with `sha256`, or external libraries like `cryptography`).
