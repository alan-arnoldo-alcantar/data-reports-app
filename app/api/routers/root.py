from fastapi import APIRouter

router = APIRouter()

@router.get("/", tags=["Root"])
async def root():
    """
    Endpoint raíz para verificar que la API está funcionando.
    """
    return {"message": "Hello AIP Router"}