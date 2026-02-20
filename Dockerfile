FROM python:3.12-slim

# Working directory set karo
WORKDIR /app

# 1. Pehla system dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 2. Tamari badhi files copy karo (HAVE . /app/ ke . . banne chale)
COPY . .

# 3. Pip upgrade ane requirements install (Have file mali jase)
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["python", "bot.py"]
