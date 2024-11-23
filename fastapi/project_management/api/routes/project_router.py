from fastapi import APIRouter, HTTPException
from starlette import status
import pandas as pd

from csv_management.csv_manager import CSVManager
from models import ProjectRequest

router = APIRouter()
CSVManager.create_csv_file()


@router.get("/", status_code=status.HTTP_200_OK)
async def find_all_projects():
    df = CSVManager.read_csv()
    df["end_date"] = df["end_date"].apply(lambda x: None if pd.isna(x) else x)
    return df.reset_index().to_dict(orient="records")


@router.get("/{project_id}", status_code=status.HTTP_200_OK)
async def find_project_by_id(project_id: int):
    df = CSVManager.read_csv()
    df["end_date"] = df["end_date"].apply(lambda x: None if pd.isna(x) else x)
    if project_id not in df.index:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Project not found")
    project = df.loc[project_id]
    return project.to_dict()


@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_project(project_request: ProjectRequest):
    project_data = project_request.model_dump()
    project_data = CSVManager.append_csv(project_data)
    project_data["id"] = int(project_data["id"])
    return project_data


@router.put("/{project_id}", status_code=status.HTTP_200_OK)
async def update_project(project_id: int, project_request: ProjectRequest):
    try:
        CSVManager.update_csv(project_id, project_request.model_dump())
        updated_data = project_request.model_dump()
        updated_data["id"] = project_id
        return updated_data
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=str(e))


@router.delete("/{project_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_project(project_id: int):
    try:
        CSVManager.delete_csv(project_id)
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=str(e))
