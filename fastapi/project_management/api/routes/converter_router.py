from fastapi import APIRouter
from fastapi.responses import JSONResponse
from starlette import status
from csv_management.converter_manager import ZipManager

router = APIRouter()


@router.get("/zip/", status_code=status.HTTP_200_OK)
async def convert_csv_to_zip():
    ZipManager.csv_to_zip()
    return JSONResponse(content={"message": "Arquivo CSV compactado com sucesso."})
