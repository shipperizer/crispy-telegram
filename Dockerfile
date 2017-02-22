FROM python:3.6

RUN apt-get update && apt-get -y install build-essential wget git nano supervisor

WORKDIR /var/app

COPY Makefile requirements.txt app.py supervisor.conf /var/app/

RUN make install

CMD ["supervisord", "-c supervisor.conf"]
