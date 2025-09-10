from fastapi import APIRouter
from app.api.routers import root, users

# En la variable api_rputer incluimos todos los routers
api_router = APIRouter()
api_router.include_router(root.router)
api_router.include_router(users.router)