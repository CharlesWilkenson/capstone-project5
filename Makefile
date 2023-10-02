## The Makefile includes instructions on environment setup and lint tests

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops
	chmod +x scripts/docker/*.sh
	chmod +x scripts/kubernetes/*.sh

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		   pip install -r requirements.txt 
	pip install pylint	   

hadolint:
	echo "Installing hadolint"
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && chmod +x /bin/hadolint


test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


docker:
	./scripts/docker/install-docker.sh

docker:
	./scripts/docker/build-docker.sh

run-docker:
	./scripts/docker/run-docker.sh

build-docker:
	./scripts/docker/build-docker.sh

upload-docker:
	./scripts/docker/upload-docker.sh

kubectl:
	./scripts/kubernetes/install-kubectl.sh

eskctl:
	./scripts/kubernetes/install-eksctl.sh

create-cluster:
	./scripts/kubernetes/create-cluster.sh

deployment:
	./scripts/kubernetes/deployment.sh

rolling:
	./scripts/kubernetes/rolling.sh

rollback:
	./scripts/kubernetes/rollback.sh

forwarding:
	kubectl port-forward "service/$DEPLOYMENT_NAME" 80:80

cleanup:
	./scripts/kubernetes/cleanup.sh


lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

all: hadolint install lint test