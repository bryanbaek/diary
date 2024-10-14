from fastapi import FastAPI
from src.routes import chat

app = FastAPI()

app.include_router(chat.router)

@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI AI API integration"}
