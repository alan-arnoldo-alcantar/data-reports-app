from sqlalchemy.ext.asyncio import create_async_engine
from .config import settings

if settings.DATABASE_URL:
    asyncio_engine = create_async_engine(settings.DATABASE_URL, echo=True)
else:
    print('DBAPI not found in system to create a DataBase engine')