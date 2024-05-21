from fastapi import FastAPI
from app.routes import chat

app = FastAPI()

app.include_router(chat.router)

@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI Google API integration"}
