FROM python:3.12-slim

# Working directory
WORKDIR /app

# 1. System dependencies + Build tools install karo
# Pillow ane tgcrypto mate gcc, musl-dev ane libjpeg jaruri chhe
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    python3-dev \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Files copy karo
COPY . .

# 3. Pip upgrade ane requirements install
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Port
EXPOSE 8080

# Bot start
CMD ["python", "bot.py"]
