from pydantic import BaseModel, EmailStr


class UserPublic(BaseModel):
    username: str
    email: EmailStr


class UserPrivate(UserPublic):
    password: str


class UserDB():
    id: int
