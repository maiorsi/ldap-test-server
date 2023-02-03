# Project namespace: maiorsi by default
NAMESPACE ?= maiorsi
# Docker registry
REGISTRY ?= ghcr.io

IMAGE ?= ${REGISTRY}/${NAMESPACE}/ldap-test-server:latest


# Make sure recipes are always executed
.PHONY: build push clean

# Build and tag Docker image
build:
	@echo "Building Docker Images ..."
	docker build -t ${IMAGE} .

# Docker compose
up:
	@echo "Docker compose up ..."
	docker-compose up --build --force-recreate --detach

down:
	@echo "Docker compose down ..."
	docker-compose down

# Push Docker image
#push:
#	@echo "Pushing Docker images ..."
#	docker push ${IMAGE}

#release: build push clean

# Clean up the created images locally and remove rvm gemset
clean:
	@echo "Cleaning Docker images ..."
	docker rmi -f ${IMAGE}

purge:
	@echo "Cleaning Docker volumes ..."
	docker volume rm ldap-test-server_config ldap-test-server_data