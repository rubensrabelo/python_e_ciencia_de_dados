from typing import Optional

from fastapi import FastAPI, Path, Query, HTTPException, Body
from pydantic import BaseModel, Field
from starlette import status

app = FastAPI()


class Book:
    id: int
    title: str
    author: str
    description: str
    rating: int
    published_date: int

    def __init__(self, id: int, title: str, author: str, description: str, rating: int, published_date: int):
        self.id: int = id
        self.title: str = title
        self.author: str = author
        self.description: str = description
        self.rating: int = rating
        self.published_date: int = published_date


class BookRequest(BaseModel):
    id: Optional[int] = Field(description="ID is not needed on create", default=None)
    title: str = Field(min_length=3)
    author: str = Field(min_length=1)
    description: str = Field(min_length=1, max_length=100)
    rating: int = Field(gt=0, lt=6)
    published_date: int = Field(gt=1999, lt=2031)


BOOKS = [
    Book(1, 'Computer Science Pro', 'codingwithroby', 'A very nice book!', 5, 2030),
    Book(2, 'Be Fast with FastAPI', 'codingwithroby', 'A great book!', 5, 2030),
    Book(3, 'Master Endpoints', 'codingwithroby', 'A awesome book!', 5, 2029),
    Book(4, 'HP1', 'Author 1', 'Book Description', 2, 2028),
    Book(5, 'HP2', 'Author 2', 'Book Description', 3, 2027),
    Book(6, 'HP3', 'Author 3', 'Book Description', 1, 2026)
]

# Finalizei aqui


@app.get("/books")
async def read_all_books():
    return BOOKS


@app.get("/books/{book_title}")
async def read_book(book_title: str):
    for book in BOOKS:
        if book_title.casefold() == book.get("title").casefold():
            return book
    return {"message": "The book is not registered in the database"}


@app.get("/books/by-category/")
async def read_category_by_query(category: str):
    books_to_return = []
    for book in BOOKS:
        if category.casefold() == book.get("category").casefold():
            books_to_return.append(book)
    return books_to_return


@app.get("/books/by-author/")
async def read_books_by_author_path(author: str):
    books_to_return = []
    for book in BOOKS:
        if author.casefold() == book.get("author").casefold():
            books_to_return.append(book)
    return books_to_return


@app.post("/books/create-book")
async def create_book(book=Body()):
    BOOKS.append(book)
    return book


@app.put("/books/update-book")
async def update_book(book=Body()):
    for i in range(len(BOOKS)):
        if BOOKS[i].get("title").casefold() == book.get("title").casefold():
            BOOKS[i] = book
    return book


@app.delete("/books/delete-book/{book_title}")
async def delete_book(book_title: str):
    for i in range(len(BOOKS)):
        if BOOKS[i].get("title").casefold() == book_title.casefold():
            BOOKS.pop(i)
            break
