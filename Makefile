install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C mylib/*.py

test:
	python -m pytest -vv --cov=mylib test_*.py

format:
	black *.py mylib/*.py

post-install:
	python -m textblob.download_corpora

build:
	#build container
	docker build -t deploy-fastapi .

run:
	#run container
	#docker run -p 127.0.0.1:8080:8080 3f80fa65c179

deploy:
	#deploy
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 863529406703.dkr.ecr.us-east-1.amazonaws.com
	docker build -t diktatorial .
	docker tag diktatorial:latest 863529406703.dkr.ecr.us-east-1.amazonaws.com/diktatorial:latest
	docker push 863529406703.dkr.ecr.us-east-1.amazonaws.com/diktatorial:latest

all: install post-install lint test format deploy