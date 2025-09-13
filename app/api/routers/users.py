from fastapi import APIRouter

from app.schemas.users import UserCreate, UserRead

router = APIRouter(prefix="/users",tags=["users"])

@router.post("/")
def create_user(user_in: UserCreate) -> UserRead:
    """
    Create new user.
    """
    obj = user
