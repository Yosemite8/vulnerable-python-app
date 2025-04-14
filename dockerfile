FROM python:3.9-slim

WORKDIR /app

COPY app.py .
COPY requirements.txt .

# Install Python dependencies (intentionally using vulnerable versions)
RUN pip install --no-cache-dir -r requirements.txt

# Initialize SQLite database with sample data
RUN python -c "\
import sqlite3; \
conn = sqlite3.connect('test.db'); \
c = conn.cursor(); \
c.execute('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)'); \
c.execute(\"INSERT INTO users (name) VALUES ('admin'), ('guest')\"); \
conn.commit(); conn.close()"

CMD ["python", "app.py"]
