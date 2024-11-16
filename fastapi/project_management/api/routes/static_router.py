from fastapi import APIRouter
from fastapi.responses import JSONResponse
from starlette import status
from csv_management.csv_manager import CSVManager

router = APIRouter()


@router.get("/count/", status_code=status.HTTP_200_OK)
async def count_quantity():
    df = CSVManager.read_csv()
    quantity = len(df)
    return JSONResponse(content={"count": quantity})
