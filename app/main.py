from fastapi import FastAPI
from contextlib import asynccontextmanager
from sqlalchemy import text
from .core.database import asyncio_engine

@asynccontextmanager
async def lifespan(app: FastAPI):
    try:
        async with asyncio_engine.connect() as conn:
            await conn.execute(text("SELECT 1"))
        print("✅ DataBase connected successfully")
    except Exception as e:
        print("❌ Could not connect to DataBase:", e)
    yield
    await asyncio_engine.dispose()
    print("🔒 Connection closed")


app = FastAPI(lifespan=lifespan)

@app.get("/")
async def root():
    return {"message": "Hello World"}