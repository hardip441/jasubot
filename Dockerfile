FROM python:3.12-slim

# Working directory set karo
WORKDIR /app

# 1. Pehla system packages (git) install karo
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# 2. HAVE tamari badhi files (requirements.txt sathe) Docker ma copy karo
# Aa step khub j agatyano che
COPY . .

# 3. Have pip install karo (jyare files copy thai gai che)
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Port expose karo
EXPOSE 8080

# Bot start karo
CMD ["python", "bot.py"]
