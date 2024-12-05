from datetime import datetime
from sqlmodel import SQLModel, Field


class Review(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    text: str
    date: datetime = Field(default_factory=datetime.now)
    post_id: int = Field(foreign_key="post.id")


class Post(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    title: str
    description: str
    date: datetime = Field(default_factory=datetime.now)
