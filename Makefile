include .env
export

all: build

build: docker

docker: ##  Builds the application for amd64 and arm64
	docker build --build-arg K3S_VERSION=$(K3S_VERSION) --no-cache --pull --platform linux/amd64,linux/arm64 -t mheers/k3s-airgapped:$(K3S_VERSION) --push .

docker-local: ##  Builds the application for amd64 and arm64
	docker build --build-arg K3S_VERSION=$(K3S_VERSION) --build-arg NAME=MARCEL --platform linux/amd64 -t mheers/k3s-airgapped:$(K3S_VERSION) --load .

start:
	./start.sh
