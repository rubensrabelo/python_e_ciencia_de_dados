from http import HTTPStatus
from fastapi.testclient import TestClient

from main import app


def test_create_user():
    client = TestClient(app)

    response = client.post(
        "/users/",
        json={
            "username": "Alice",
            "email": "alice@example.com",
            "password": "secret",
        },
    )
    assert response.status_code == HTTPStatus.CREATED
    assert response.json() == {
        "username": "Alice",
        "email": "alice@example.com",
        "id": 1,
    }
