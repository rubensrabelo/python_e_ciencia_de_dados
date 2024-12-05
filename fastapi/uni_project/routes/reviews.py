from fastapi import APIRouter
from fastapi import HTTPException, Depends
from sqlmodel import Session
from starlette import status

from models import Post, Review
from database import get_session

router = APIRouter(
    prefix="/reviews",
    tags=["Reviews"]
)


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
def find_all() -> list[Review]:
    ...
