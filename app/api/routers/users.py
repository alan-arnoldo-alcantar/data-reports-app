from fastapi import APIRouter

router = APIRouter(prefix="/users",tags=["users"])

@router.post("/signup")
def register_user():
    """
    Create new user without the need to be logged in.
    """