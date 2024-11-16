from fastapi import APIRouter
from fastapi.responses import JSONResponse
from starlette import status
from csv_management.hash_manager import HashManager

router = APIRouter()


@router.get("/hash256/", status_code=status.HTTP_200_OK)
async def get_csv_sha256():
    hash_sha256 = HashManager.generate_hash256()
    return JSONResponse(content={"sha256": hash_sha256})
