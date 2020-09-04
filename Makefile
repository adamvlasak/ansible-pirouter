all: build playbook

build:
	docker build -t ansible-node:latest -f Dockerfile .

playbook:
	docker run ansible-node ansible-playbook --check --diff /src/playbook.yml
