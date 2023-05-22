install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C mylib/*.py

test:
	#python -m pytest -vv --cov=mylib test_*.py

format:
	black *.py mylib/*.py

post-install:
	#python -m textblob.download_corpora

build:
	#build container
deploy:
	#deploy
	#aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 561744971673.dkr.ecr.us-east-1.amazonaws.com
	#docker build -t devops-may-2022 .
	#docker tag devops-may-2022:latest 561744971673.dkr.ecr.us-east-1.amazonaws.com/devops-may-2022:latest
	#docker push 561744971673.dkr.ecr.us-east-1.amazonaws.com/devops-may-2022:latest

all: install post-install lint test format deploy