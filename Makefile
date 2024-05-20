# Variables
APP_NAME=app
VENV=venv
PYTHON=$(VENV)/bin/python
PIP=$(VENV)/bin/pip
UVICORN=$(VENV)/bin/uvicorn
TEST_DIR=tests

# Targets
.PHONY: all setup run test clean

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
