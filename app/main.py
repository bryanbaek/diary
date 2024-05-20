from fastapi import FastAPI
from app.routes import router as items_router

app = FastAPI()

app.include_router(items_router, prefix="/items")

@app.get("/")
def read_root():
    return {"message": "Hello, World!"}
