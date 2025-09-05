import os

class Settings:
    DATABASE_URL = os.getenv("DB_URL")

settings = Settings()