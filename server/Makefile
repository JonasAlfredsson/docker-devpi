all: build

build: Makefile Dockerfile
	docker build -t jonasal/devpi-server:local .
	@echo "Done!  Use docker run jonasal/devpi-server:local to run"

build-alpine: Makefile Dockerfile
	docker build -t jonasal/devpi-server:local-alpine -f ./Dockerfile-alpine .
	@echo "Done!  Use docker run jonasal/devpi-server:local-alpine to run"

# Ssee link for more info about how these work:
# https://github.com/JonasAlfredsson/docker-nginx-certbot/issues/28
dev: Makefile Dockerfile
	docker buildx build --platform linux/amd64,linux/386,linux/arm64,linux/arm/v7 --tag jonasal/devpi-server:dev -f ./Dockerfile ./

dev-alpine: Makefile Dockerfile
	docker buildx build --platform linux/amd64,linux/386,linux/arm64,linux/arm/v7 --tag jonasal/devpi-server:dev-alpine -f ./Dockerfile-alpine ./
