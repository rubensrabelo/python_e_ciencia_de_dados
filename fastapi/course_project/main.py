from fastapi import FastAPI
from http import HTTPStatus

from schemas import Message

app = FastAPI()


@app.get("/", status_code=HTTPStatus.OK, response_model=Message)
async def read_root():
    return {"message": "Hello world!"}
