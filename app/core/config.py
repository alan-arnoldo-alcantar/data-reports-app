from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    model_config = SettingsConfigDict(
        # la ruta de .env es relativa al directorio donde se ejecuta el comando
        # si se ejecuta desde la raíz del proyecto (uv run fastapi app/main.py),
        # entonces .env está bien
        # si se ejecuta desde dentro del directorio app, entonces debería ser ../.env
        env_file=".env",
        env_ignore_empty=True,
        extra="ignore",
    )

    API_V1_STR: str = "/api/v1"
    PROJECT_NAME: str

settings = Settings()  # type: ignore