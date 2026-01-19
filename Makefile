# Docker image configuration
IMAGE_NAME := space4y/nxapi-s3s
VERSION := 0.7.0
FULL_IMAGE := $(IMAGE_NAME):$(VERSION)

# Local data directory
DATA_DIR := $(PWD)/data

# Default target
.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: build
build: ## Build the Docker image
	docker build -t $(FULL_IMAGE) .
	@echo "Built image: $(FULL_IMAGE)"

.PHONY: build-no-cache
build-no-cache: ## Build the Docker image without cache
	docker build --no-cache -t $(FULL_IMAGE) .
	@echo "Built image: $(FULL_IMAGE)"

.PHONY: run
run: ## Run the container (English)
	@mkdir -p $(DATA_DIR)
	docker run --rm -it -v $(DATA_DIR):/data $(FULL_IMAGE)

.PHONY: run-zh
run-zh: ## Run the container (Chinese)
	@mkdir -p $(DATA_DIR)
	docker run --rm -it -v $(DATA_DIR):/data -e S3S_LANG=zh $(FULL_IMAGE)

.PHONY: shell
shell: ## Start a shell in the container
	docker run --rm -it -v $(DATA_DIR):/data --entrypoint /bin/bash $(FULL_IMAGE)

.PHONY: push
push: ## Push the image to Docker registry
	docker push $(FULL_IMAGE)

.PHONY: pull
pull: ## Pull the image from Docker registry
	docker pull $(FULL_IMAGE)

.PHONY: clean
clean: ## Remove the Docker image
	docker rmi $(FULL_IMAGE)

.PHONY: clean-data
clean-data: ## Clean the data directory
	rm -rf $(DATA_DIR)/*

.PHONY: tag-latest
tag-latest: ## Tag current version as latest
	docker tag $(FULL_IMAGE) $(IMAGE_NAME):latest

.PHONY: inspect
inspect: ## Inspect the Docker image
	docker inspect $(FULL_IMAGE)

.PHONY: history
history: ## Show image build history
	docker history $(FULL_IMAGE)
