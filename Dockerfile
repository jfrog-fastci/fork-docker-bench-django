FROM python:3.12

RUN apt-get update && apt-get install -y vim less man-db wget telnet curl net-tools iputils-ping postgresql-client libpq-dev gcc g++ make

WORKDIR /app

COPY . .

RUN pip install django psycopg2-binary gunicorn djangorestframework celery redis whitenoise boto3

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
