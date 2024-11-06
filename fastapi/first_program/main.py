from fastapi import Body, FastAPI

app = FastAPI()

BOOKS = [
    {'title': 'Title One', 'author': 'Author One', 'category': 'science'},
    {'title': 'Title Two', 'author': 'Author Two', 'category': 'science'},
    {'title': 'Title Three', 'author': 'Author Three', 'category': 'history'},
    {'title': 'Title Four', 'author': 'Author Four', 'category': 'math'},
    {'title': 'Title Five', 'author': 'Author Five', 'category': 'math'},
    {'title': 'Title Six', 'author': 'Author Two', 'category': 'math'}
]


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
