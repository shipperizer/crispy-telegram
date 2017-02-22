.PHONY=install run reload build

install:
	pip install -r requirements.txt

run:
	FLASK_DEBUG=1 FLASK_APP=app.py gunicorn -w 4 -b 0.0.0.0:5000 app:app
	pkill gunicorn

reload:
	wget --no-check-certificate https://raw.githubusercontent.com/shipperizer/crispy-telegram/master/app.py -O app.py

build:
	docker build . --tag shipperizer/crispy-telegram
