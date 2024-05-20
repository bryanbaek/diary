# Diary

## Overview

### 1. Core
The core directory typically contains code that is fundamental to your application and is not specific to any particular feature or functionality. It may include:

Configuration: Settings, constants, and configuration parameters used throughout the application.
Utilities: Helper functions, decorators, middleware, and other utility classes or functions.
Custom Exceptions: Custom exception classes that are used throughout the application.
### 2. Routes
The routes directory is where you define the HTTP routes (endpoints) for your FastAPI application. Each file in this directory usually corresponds to a specific API resource or feature. For example:

User Routes: Contains endpoints related to user management (e.g., registration, login, profile).
Item Routes: Contains endpoints related to item management (e.g., create, read, update, delete operations).
Each file typically contains route definitions using FastAPI decorators (@app.get, @app.post, etc.) and imports any necessary dependencies from other parts of your application, such as services or models.

### 3. Services
The services directory houses the business logic of your application. This is where you implement the actual functionality that your API endpoints provide. Services may include:

Database Operations: CRUD operations and other database-related logic.
Business Logic: Complex business logic that manipulates data, performs calculations, or enforces business rules.
Integration Services: Code for interacting with external services, APIs, or systems.


## Setup

### Install dependencies
```bash
pip install -r requirements.txt
```

## How to Run
```
$ uvicorn app.main:app --reload
```

## How to test 
```
$ pytest
```