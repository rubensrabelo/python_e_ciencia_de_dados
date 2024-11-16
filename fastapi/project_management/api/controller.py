from fastapi import APIRouter
from .routes.project_router import router as project_router
from .routes.static_router import router as static_router
from .routes.converter_router import router as converter_router
from .routes.hash_router import router as hash_router

api_router = APIRouter()

api_router.include_router(project_router, prefix="/projects", tags=["Projects"])
api_router.include_router(static_router, prefix="/static", tags=["Quantity"])
api_router.include_router(converter_router, prefix="/converter", tags=["Zip"])
api_router.include_router(hash_router, prefix="/hash", tags=["Hash"])
