from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel, Field
from datetime import date
from starlette import status

app = FastAPI()


class Project:
    id: int
    name: str
    description: str
    start_date: date
    end_date: date
    completion_prediction: date
    status: str


class ProjectRequest(BaseModel):
    id: Optional[int] = Field(default=None, description="ID do projeto")
    name: str = Field(..., min_length=3, max_length=100, description="Nome do projeto, deve ter entre 3 e 100 caracteres.")
    description: str = Field(..., max_length=250, description="Descrição do projeto, com no máximo 250 caracteres.")
    start_date: date = Field(..., description="Data de início do projeto")
    end_date: date = Field(default=None, description="Data de término do projeto")
    completion_prediction: date = Field(..., description="Data prevista para a conclusão do projeto")
    status: str = Field(default="Planned", description="Status do projeto (Ex: 'Planejado', 'Em andamento', 'Concluído')")


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
