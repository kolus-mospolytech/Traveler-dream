# syntax=docker/dockerfile:1
FROM python:3.9
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY deploy/web/requirements.txt /code/
RUN pip install -r requirements.txt
COPY src/ /code/
