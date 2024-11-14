from typing import Optional
from fastapi import APIRouter, HTTPException
from fastapi.responses import JSONResponse
from pydantic import BaseModel, Field
from datetime import date
from starlette import status
from csv_management.csv_utils import (
    create_csv_file, read_csv, append_csv, update_csv, delete_csv,
    csv_to_zip, generate_hash256
)

router = APIRouter()
create_csv_file()


class ProjectRequest(BaseModel):
    id: Optional[int] = Field(default=None)
    name: str = Field(..., min_length=3, max_length=100)
    description: str = Field(..., max_length=250)
    start_date: date = Field(...)
    end_date: Optional[date] = Field(default=None)
    completion_prediction: date = Field(...)
    status: str = Field(default="Planned")


@router.get("/", status_code=status.HTTP_200_OK)
async def find_all_projects():
    df = read_csv()
    return df.reset_index().to_dict(orient="records")


@router.get("/quantity/", status_code=status.HTTP_200_OK)
async def count_quantity():
    df = read_csv()
    quantity = len(df)
    return JSONResponse(content={"count": quantity})


@router.get("/convert-to-zip/", status_code=status.HTTP_200_OK)
async def convert_csv_to_zip():
    csv_to_zip()
    return JSONResponse(content={"message": "Arquivo CSV compactado com sucesso."})


@router.get("/hash256/", status_code=status.HTTP_200_OK)
async def get_csv_sha256():
    hash_sha256 = generate_hash256()
    return JSONResponse(content={"sha256": hash_sha256})


@router.get("/{project_id}", status_code=status.HTTP_200_OK)
async def find_project_by_id(project_id: int):
    df = read_csv()
    if project_id not in df.index:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Project not found")
    project = df.loc[project_id]
    return project.to_dict()


@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_project(project_request: ProjectRequest):
    project_data = project_request.model_dump()
    append_csv(project_data)
    project_data["id"] = int(project_data["id"])
    return project_data


@router.put("/{project_id}", status_code=status.HTTP_200_OK)
async def update_project(project_id: int, project_request: ProjectRequest):
    try:
        update_csv(project_id, project_request.model_dump())
        updated_data = project_request.model_dump()
        updated_data["id"] = project_id
        return updated_data
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, 
                            detail=str(e))


@router.delete("/{project_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_project(project_id: int):
    try:
        delete_csv(project_id)
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, 
                            detail=str(e))
