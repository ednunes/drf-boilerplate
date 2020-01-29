FROM python:3.8-alpine
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /app
WORKDIR /app
COPY . /app

CMD python manage.py runserver 0.0.0.0:8000
