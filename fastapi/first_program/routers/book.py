from typing import Annotated, Optional
from sqlalchemy.orm import Session
from fastapi import APIRouter, Depends, Path, Query, HTTPException
from pydantic import BaseModel, Field
from starlette import status
from datetime import date

from database import SessionLocal
from models import Book

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


db_dependency = Annotated[Session, Depends(get_db)]


class BookRequest(BaseModel):
    id: Optional[int] = Field(description="ID is not needed on create", default=None)
    title: str = Field(min_length=3)
    author: str = Field(min_length=1)
    description: str = Field(min_length=1, max_length=100)
    rating: int = Field(gt=0, lt=6)
    published_date: date


@router.get("/", status_code=status.HTTP_200_OK)
async def read_all(db: db_dependency):
    return db.query(Book).all()


@router.get("/books/{book_id}", status_code=status.HTTP_200_OK)
async def read_book(db: db_dependency, book_id: int = Path(gt=0)):
    book_model = db.query(Book).filter(Book.id == book_id).first()
    if book_model is not None:
        return book_model
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")


@router.get("/books/ratings/", status_code=status.HTTP_200_OK)
async def read_book_by_rating(db: db_dependency, book_rating: int = Query(gt=0, lt=6)):
    books_to_return = db.query(Book).filter(Book.rating == book_rating).all()
    return books_to_return


@router.post("/books", status_code=status.HTTP_201_CREATED)
async def create_book(db: db_dependency, book_request: BookRequest):
    book_model = Book(**book_request.model_dump())

    db.add(book_model)
    db.commit()
    db.refresh(book_model)

    return book_model


@router.put("/books/{book_id}", status_code=status.HTTP_200_OK)
async def update_book(db: db_dependency, book_request: BookRequest, book_id: int = Path(gt=0)):
    book_model = db.query(Book).filter(Book.id == book_id).first()
    if book_model is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")
    book_model.title = book_request.title
    book_model.author = book_request.author
    book_model.description = book_request.description
    book_model.rating = book_request.rating
    book_model.published_date = book_request.published_date

    db.add(book_model)
    db.commit()
    db.refresh(book_model)

    return book_model


@router.delete("/books/{book_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_book(db: db_dependency, book_id: int = Path(gt=0)):
    book_model = db.query(Book).filter(Book.id == book_id).first()
    if book_model is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")

    db.delete(book_model)
    db.commit()
