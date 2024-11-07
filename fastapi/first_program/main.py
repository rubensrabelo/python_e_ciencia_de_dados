from typing import Optional, List

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

    model_config = {
        "json_schema_extra": {
            "example": {
                "title": "A new book",
                "author": "codingwithroby",
                "description": "A new description of a book",
                "rating": 5,
                'published_date': 2029
            }
        }
    }


BOOKS = [
    Book(1, 'Computer Science Pro', 'codingwithroby', 'A very nice book!', 5, 2030),
    Book(2, 'Be Fast with FastAPI', 'codingwithroby', 'A great book!', 5, 2030),
    Book(3, 'Master Endpoints', 'codingwithroby', 'A awesome book!', 5, 2029),
    Book(4, 'HP1', 'Author 1', 'Book Description', 2, 2028),
    Book(5, 'HP2', 'Author 2', 'Book Description', 3, 2027),
    Book(6, 'HP3', 'Author 3', 'Book Description', 1, 2026)
]


@app.get("/books", status_code=status.HTTP_200_OK)
async def read_all_books():
    return BOOKS


@app.get("/books/{book_id}", status_code=status.HTTP_200_OK)
async def read_book(book_id: int = Path(gt=0)):
    for book in BOOKS:
        if book_id == book.id:
            return book
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")


@app.get("/books/ratings/", status_code=status.HTTP_200_OK)
async def read_book_by_rating(book_rating: int = Query(gt=0, lt=6)):
    books_to_return: List[BookRequest] = []
    for book in BOOKS:
        if book.rating == book_rating:
            books_to_return.append(book)
    return books_to_return


@app.get("/books/publish-date/", status_code=status.HTTP_200_OK)
async def red_book_by_publish_date(published_date: int = Query(gt=1999, lt=2031)):
    books_to_return: List[BookRequest] = []
    for book in BOOKS:
        if book.rating == published_date:
            books_to_return.append(book)
    return books_to_return


@app.post("/books/create-book", status_code=status.HTTP_201_CREATED)
async def create_book(book_request: BookRequest):
    new_book = Book(**book_request)
    BOOKS.append(find_book_id(new_book))
    return new_book


def find_book_id(book: Book):
    book.id = 1 if len(BOOKS) == 0 else BOOKS[-1].id + 1
    return book


@app.put("/books/update-book", status_code=status.HTTP_200_OK)
async def update_book(book_request: BookRequest):
    for i in range(len(BOOKS)):
        if book_request.id == BOOKS[i].id:
            BOOKS[i] = book_request
            return book_request
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")


@app.delete("/books/delete-book/{book_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_book(book_id: int = Path(gt=0)):
    for i in range(len(BOOKS)):
        if book_id == BOOKS[i].id:
            BOOKS.pop(i)
            break
            return None
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")