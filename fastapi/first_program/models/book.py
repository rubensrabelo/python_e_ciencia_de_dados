from sqlalchemy import Column, Integer, String, Text, Date

from database import Base


class Book(Base):
    __tablename__ = "books"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(100), unique=True, nullable=False)
    author = Column(String(100))
    description = Column(Text)
    rating = Column(Integer, nullable=False)
    published_date = Column(Date)
