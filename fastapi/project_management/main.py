from typing import Optional
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from datetime import date
from starlette import status
import pandas as pd
import os

app = FastAPI()

CSV_FILE = "db.csv"


class ProjectRequest(BaseModel):
    id: Optional[int] = Field(default=None)
    name: str = Field(..., min_length=3, max_length=100)
    description: str = Field(..., max_length=250)
    start_date: date = Field(...)
    end_date: Optional[date] = Field(default=None)
    completion_prediction: date = Field(...)
    status: str = Field(default="Planned")


header_project = ["id", "name", "description", "start_date",
                  "end_date", "completion_prediction", "status"]


def create_csv_file():
    if not os.path.exists(CSV_FILE):
        df = pd.DataFrame(columns=header_project)
        df["id"] = df["id"].astype(int)
        df.to_csv(CSV_FILE, index=False)


def read_csv():
    return pd.read_csv(CSV_FILE, index_col="id", dtype={"id": int})


def append_csv(data):
    df = read_csv()
    data["id"] = len(df) + 1 if not df.empty else 1
    new_df = pd.DataFrame([data], columns=header_project)
    new_df["id"] = new_df["id"].astype(int)
    df = pd.concat([df, new_df], ignore_index=True)
    df.to_csv(CSV_FILE, index=False)


def update_csv(data_id, updated_data):
    df = read_csv()
    if data_id in df.index:
        df.loc[data_id, header_project[1:]] = [
            updated_data["name"],
            updated_data["description"],
            updated_data["start_date"],
            updated_data["end_date"],
            updated_data["completion_prediction"],
            updated_data["status"]
        ]
        df.to_csv(CSV_FILE, index=True)
    else:
        raise ValueError("Project not found")


def delete_csv(data_id):
    df = read_csv()
    if data_id in df.index:
        df = df.drop(index=data_id)
        df.to_csv(CSV_FILE, index=True)
    else:
        raise ValueError("Project not found")


create_csv_file()


@app.get("/projects/", status_code=status.HTTP_200_OK)
async def get_all_projects():
    df = read_csv()
    return df.reset_index().to_dict(orient="records")


@app.get("/projects/{project_id}", status_code=status.HTTP_200_OK)
async def get_project_by_id(project_id: int):
    df = read_csv()
    if project_id not in df.index:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Project not found")
    project = df.loc[project_id]
    return project.to_dict()


@app.post("/projects/", status_code=status.HTTP_201_CREATED)
async def post_project(project_request: ProjectRequest):
    project_data = project_request.model_dump()
    append_csv(project_data)
    return project_data


@app.put("/projects/{project_id}", status_code=status.HTTP_200_OK)
async def update_project(project_id: int, project_request: ProjectRequest):
    try:
        update_csv(project_id, project_request.model_dump())
        updated_data = project_request.model_dump()
        updated_data["id"] = project_id
        return updated_data
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, 
                            detail=str(e))


@app.delete("/projects/{project_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_project(project_id: int):
    try:
        delete_csv(project_id)
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, 
                            detail=str(e))
