from fastapi import APIRouter

from .routes.posts import router as post_router
from .routes.reviews import router as review_router

api_router = APIRouter()

api_router.include_router(post_router, prefix="/posts", tags=["Posts"])
api_router.include_router(review_router, prefix="/reviews", tags=["Reviews"])
