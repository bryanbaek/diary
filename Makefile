# Variables
APP_NAME=app
VENV=venv
PYTHON=$(VENV)/bin/python
PIP=$(VENV)/bin/pip
UVICORN=$(VENV)/bin/uvicorn
TEST_DIR=tests
DOCKERFILE_PATH=.

# Targets
.PHONY: all setup run test clean docker-build docker-run docker-clean

# Default target: setup environment
all: setup

# Setup virtual environment and install dependencies
setup: $(VENV)/bin/activate

$(VENV)/bin/activate: requirements.txt setup.py
	python3 -m venv $(VENV)
	$(PIP) install -r requirements.txt
	touch $(VENV)/bin/activate

# Run the application
run: setup
	$(UVICORN) $(APP_NAME).main:app --reload

# Run tests
test: setup
	$(PYTHON) -m pytest $(TEST_DIR)

# Clean up environment
clean:
	rm -rf $(VENV)
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete

docker-build:
	@echo "Building Docker image with name: $(IMAGE_NAME)"
	docker build -t $(IMAGE_NAME) $(DOCKERFILE_PATH)
	@echo "Deriving container name from image ID"
	$(eval CONTAINER_NAME=$(shell docker images --format '{{.ID}}' $(IMAGE_NAME) | head -n 1))

# Run Docker container
docker-run: docker-build
	@echo "Running Docker container with name: $(CONTAINER_NAME)"
	docker run --name $(CONTAINER_NAME) --env-file .env -d -p 8000:8000 $(IMAGE_NAME)

# Clean up Docker images and containers
docker-clean:
	@echo "Stopping and removing container: $(CONTAINER_NAME)"
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
	@echo "Removing image: $(IMAGE_NAME)"
	docker rmi $(IMAGE_NAME) || true
