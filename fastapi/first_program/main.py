from fastapi import FastAPI

from models.book import Book
from database import Base, engine
from routers import book

app = FastAPI()

Base.metadata.create_all(bind=engine)

app.include_router(book.router)
