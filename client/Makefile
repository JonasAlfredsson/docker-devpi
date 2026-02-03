all: build

build: Makefile Dockerfile
	docker build -t jonasal/devpi-client:local .
	@echo "Done!  Use docker run jonasal/devpi-client:local to run"

build-alpine: Makefile Dockerfile
	docker build -t jonasal/devpi-client:local-alpine -f ./Dockerfile-alpine .
	@echo "Done!  Use docker run jonasal/devpi-client:local-alpine to run"

# Ssee link for more info about how these work:
# https://github.com/JonasAlfredsson/docker-nginx-certbot/issues/28
dev: Makefile Dockerfile
	docker buildx build --platform linux/amd64,linux/386,linux/arm64,linux/arm/v7,linux/riscv64 --tag jonasal/devpi-client:dev -f ./Dockerfile ./

dev-alpine: Makefile Dockerfile
	docker buildx build --platform linux/amd64,linux/386,linux/arm64,linux/arm/v7,linux/riscv64 --tag jonasal/devpi-client:dev-alpine -f ./Dockerfile-alpine ./
