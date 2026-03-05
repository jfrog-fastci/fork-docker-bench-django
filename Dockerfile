FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl postgresql-client libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --no-cache-dir django psycopg2-binary gunicorn djangorestframework celery redis whitenoise boto3

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
