from fastapi import APIRouter
from fastapi import HTTPException, Depends
from sqlmodel import Session, select
from starlette import status

from models import Post, Review
from database import get_session

router = APIRouter()


@router.post("/post/{post_id}", response_model=Review)
def create(post_id: int,
           review: Review, session: Session = Depends(get_session)) -> Review:
    post = session.get(Post, post_id)
    if not post:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Post not found"
        )
    review.post_id = post_id
    session.add(review)
    session.commit()
    session.refresh(review)
    return review


@router.get("/posts/{post_id}", response_model=list[Review])
def find_all_reviews_by_post(post_id: int,
                             session: Session = Depends(get_session)
                             ) -> list[Review]:
    reviews = session.exec(select(Review)
                           .where(Review.post_id == post_id)).all()
    return reviews


@router.get("/{review_id}", response_model=Review)
def find_by_id(review_id: int,
               session: Session = Depends(get_session)) -> Review:
    review = session.get(Review, review_id)
    if not review:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Review not found"
        )
    return Review


@router.delete("/{review_id}", response_model=dict)
def delete(review_id: int,
           session: Session = Depends(get_session)) -> dict:
    review = session.get(Review, review_id)
    if not review:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Review not found"
        )
    session.delete(review)
    session.commit()
    return {"message": "Review successfully deleted"}
