from fastapi import FastAPI
from http import HTTPStatus

from schemas import UserPublic, UserPrivate, UserDB

app = FastAPI()

database = []


@app.post("/users/",
          status_code=HTTPStatus.CREATED, response_model=UserPublic)
def create_user(user: UserPrivate):
    user_with_id = UserDB(**user.model_dump(), id=len(database)+1)

    database.append(user_with_id)

    return user_with_id
