.PHONY=install run reload build

install:
	pip install -r requirements.txt

run:
	FLASK_DEBUG=1 FLASK_APP=app.py gunicorn -w 4 -b 127.0.0.1:5000 app:app

reload:
	wget --no-check-certificate https://raw.githubusercontent.com/shipperizer/crispy-telegram/master/app.py

build:
	docker build . --tag shipperizer/crispy-telegram
