from typing import Optional
from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse
from pydantic import BaseModel, Field
from datetime import date
from starlette import status
import pandas as pd
import os
import zipfile
import hashlib

app = FastAPI()

CSV_FILE = "db.csv"
ZIP_FILE = "db.zip"


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
        df.to_csv(CSV_FILE, index=False)


def read_csv():
    return pd.read_csv(CSV_FILE, index_col="id", dtype={"id": int})


def append_csv(data):
    df = read_csv()
    df_reset = df.reset_index()
    next_id = df_reset["id"].max() + 1 if not df_reset.empty else 1
    data["id"] = next_id
    new_df = pd.DataFrame([data], columns=header_project)
    df_reset = pd.concat([df_reset, new_df], ignore_index=True)
    df_reset = df_reset.set_index("id")
    df_reset.to_csv(CSV_FILE, index=True)


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


def csv_to_zip():
    with zipfile.ZipFile(ZIP_FILE, "w") as file:
        file.write(CSV_FILE, arcname=os.path.basename(CSV_FILE))


def generate_hash256():
    sha256_hash = hashlib.sha3_256()
    with open(CSV_FILE, "rb") as file:
        for byte_block in iter(lambda: file.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()


create_csv_file()


@app.get("/projects/", status_code=status.HTTP_200_OK)
async def find_all_projects():
    df = read_csv()
    return df.reset_index().to_dict(orient="records")


@app.get("/projects/quantity/", status_code=status.HTTP_200_OK)
async def count_quantity():
    df = read_csv()
    quantity = len(df)
    return JSONResponse(content={"count": quantity})


@app.get("/projects/convert-to-zip/", status_code=status.HTTP_200_OK)
async def convert_csv_to_zip():
    csv_to_zip()
    return JSONResponse(content={"message": "Arquivo CSV compactado com sucesso."})


@app.get("/projects/hash256/", status_code=status.HTTP_200_OK)
async def get_csv_sha256():
    hash_sha256 = generate_hash256()
    return JSONResponse(content={"sha256": hash_sha256})


@app.get("/projects/{project_id}", status_code=status.HTTP_200_OK)
async def find_project_by_id(project_id: int):
    df = read_csv()
    if project_id not in df.index:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Project not found")
    project = df.loc[project_id]
    return project.to_dict()


@app.post("/projects/", status_code=status.HTTP_201_CREATED)
async def create_project(project_request: ProjectRequest):
    project_data = project_request.model_dump()
    append_csv(project_data)
    project_data["id"] = int(project_data["id"])
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
