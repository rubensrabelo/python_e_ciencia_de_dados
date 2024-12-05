from fastapi import APIRouter
from fastapi import HTTPException, Depends
from sqlmodel import Session, select
from starlette import status

from models import Post
from database import get_session

router = APIRouter()


@router.post("/", response_model=Post)
def create(post: Post, session: Session = Depends(get_session)) -> Post:
    session.add(post)
    session.commit()
    session.refresh(post)
    return post


@router.get("/", response_model=list[Post])
def find_all(skip: int = 0, limit: int = 10,
             session: Session = Depends(get_session)) -> list[Post]:
    posts = session.exec(select(Post).offset(skip).limit(limit)).all()
    return posts


@router.get("/{post_id}", response_model=Post)
def find_by_id(post_id: int,
               updated_post: Post,
               session: Session = Depends(get_session)) -> Post:
    post = session.get(Post, post_id)
    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail="Post not found")
    return post


@router.put("/{post_id}", response_model=dict)
def update(post_id: int,
           update_post: Post,
           session: Session = Depends(get_session)) -> dict:
    post = session.get(Post, post_id)
    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail="Post not found")
    for key, value in update_post.dict(exclude_unset=True).items():
        setattr(post, key, value)
    session.add(post)
    session.commit()
    session.refresh(post)
    return post


@router.delete("/{post_id}", response_model=dict)
def delete(post_id: int, session: Session = Depends(get_session)) -> dict:
    post = session.get(Post, post_id)
    if not post:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail="Post not found")
    session.delete(post)
    session.commit()
    return {"message": "Post successfully deleted"}
