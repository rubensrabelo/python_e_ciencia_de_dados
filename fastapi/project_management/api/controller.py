from fastapi import APIRouter
from .routes import project_routes

api_router = APIRouter()
api_router.include_router(project_routes.router,
                          prefix="/projects",
                          tags=["projects"])
