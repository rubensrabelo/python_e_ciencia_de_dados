from typing import Optional
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from datetime import date
from starlette import status
import os
import csv

app = FastAPI()

# Variável para guardar o nome do arquivo csv
CSV_FILE = "db.csv"


# Classes para representar a entidade projeto
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


# Cabeçalho do csv projeto
header_project = ["id", "name", "description", "start_date", 
                  "end_date", "completion_prediction", "status"]


# Funcionalidades de manipulação do arquivo csv
def create_csv_file():
    if not os.path.exists(CSV_FILE):
        with open(CSV_FILE, mode="w", newline="") as file:
            writer = csv.DictWriter(file, fieldnames=header_project)
            writer.writeheader()


def read_csv():
    with open(CSV_FILE, mode="r", newline="") as file:
        reader = csv.DictReader(file)
        return [row for row in reader]


def write_csv(data):
    with open(CSV_FILE, mode="a", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=header_project)
        writer.writerow(data)


def generate_id():
    rows = read_csv()
    if not rows:
        return 1
    max_id = max(int(row["id"]) for row in rows)
    return max_id + 1


def update_csv(updated_data):
    rows = read_csv()
    for row in rows:
        if int(row["id"]) == updated_data.id:
            row["name"] = updated_data["name"]
            row["description"] = updated_data["description"]
            row["start_date"] = updated_data["start_date"]
            row["end_date"] = updated_data["end_date"]
            row["completion_prediction"] = updated_data["completion_prediction"]
            row["status"] = updated_data["status"]
            break
    with open(CSV_FILE, mode="w", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=header_project)
        writer.writeheader()
        writer.writerows(rows)


def delete_csv(data_id):
    rows = read_csv()
    rows = [row for row in rows if int(row["id"]) != data_id]
    with open(CSV_FILE, mode="w", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=header_project)
        writer.writeheader()
        writer.writerows(rows)


create_csv_file()


# Funcionalidades relacionadas aos métodos HTTP
@app.get("/projets/", status_code=status.HTTP_200_OK)
async def get_all_projects():
    datas = read_csv()
    return datas


@app.get("/projects/{project_id}", status_code=status.HTTP_200_OK)
async def get_project_by_id(project_id: int):
    datas = read_csv()
    data = next((data for data in datas if int(data["id"]) == project_id), None)
    if data is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Project not found")
    return data


@app.post("/projects/", status_code=status.HTTP_201_CREATED)
async def post_project(project_request: ProjectRequest):
    ...


@app.put("/projects/", status_code=status.HTTP_200_OK)
async def put_project(project_request: ProjectRequest):
    ...


@app.delete("/projects/{project_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_project(project_id):
    ...
