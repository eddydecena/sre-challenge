FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update -y && \
    apt-get -y install gcc
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

ENV PORT 80
EXPOSE $PORT

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 server:app --worker-class uvicorn.workers.UvicornWorker