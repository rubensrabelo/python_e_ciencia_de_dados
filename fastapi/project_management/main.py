from typing import Optional
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from datetime import date
from starlette import status
import pandas as pd
import os

app = FastAPI()

CSV_FILE = "db.csv"


class Project:
    id: int
    name: str
    description: str
    start_date: date
    end_date: date
    completion_prediction: date
    status: str


class ProjectRequest(BaseModel):
    id: Optional[int] = Field(default=None)
    name: str = Field(..., min_length=3, max_length=100)
    description: str = Field(..., max_length=250)
    start_date: date = Field(..., description)
    end_date: date = Field(default=None)
    completion_prediction: date = Field(...)
    status: str = Field(default="Planned")


header_project = ["id", "name", "description", "start_date",
                  "end_date", "completion_prediction", "status"]


def create_csv_file():
    if not os.path.exists(CSV_FILE):
        df = pd.DataFrame(columns=header_project)
        df.index += 1
        df.index.name = "id"
        df.to_csv(CSV_FILE)


def read_csv():
    return pd.read_csv(CSV_FILE, index_col="id")


def append_csv(data):
    df = read_csv()
    new_df = pd.DataFrame([data], columns=header_project)
    df = pd.concat([df, new_df], ignore_index=True)
    df.index += 1
    df.index.name = "id"
    df.to_csv(CSV_FILE)


def update_csv(data_id, updated_data):
    df = pd.read_csv()
    if data_id in df.index:
        df.loc[data_id, [header_project]] = [
            updated_data["name"],
            updated_data["description"],
            updated_data["start_date"],
            updated_data["end_date"],
            updated_data["completion_prediction"],
            updated_data["status"]
        ]
        df.to_csv(CSV_FILE)


def delete_csv(data_id):
    df = pd.read_csv()
    df = df.drop(index=data_id)
    df.to_csv()


create_csv_file()


@app.get("/projets/", status_code=status.HTTP_200_OK)
async def get_all_projects():
    ...


@app.get("/projects/{project_id}", status_code=status.HTTP_200_OK)
async def get_project_by_id(project_id: int):
    ...


@app.post("/projects/", status_code=status.HTTP_201_CREATED)
async def post_project(project_request: ProjectRequest):
    ...


@app.put("/projects/", status_code=status.HTTP_200_OK)
async def put_project(project_request: ProjectRequest):
    ...


@app.delete("/projects/{project_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_project(project_id):
    ...
