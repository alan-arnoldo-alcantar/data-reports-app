from fastapi import FastAPI
from fastapi.routing import APIRoute
from app.api.main import api_router
from app.core.config import settings
# import sentry_sdk
# from starlette.middleware.cors import CORSMiddleware

# Esta función estandariza los operationId en la documentación de openapi
def custom_generate_unique_id(route: APIRoute) -> str:
    return f"{route.tags[0]}-{route.name}"

# El objetivo de esa función es configurar Sentry, una herramienta para monitorear 
# errores y el rendimiento de tu aplicación en tiempo real
# if settings.SENTRY_DSN and settings.ENVIRONMENT != "local":
#     sentry_sdk.init(dsn=str(settings.SENTRY_DSN), enable_tracing=True)

# Ese código configura el CORS (Cross-Origin Resource Sharing) para tu API.
# En pocas palabras, le da permiso a tu frontend (que vive en un dominio diferente)
# para que pueda hacerle peticiones a tu backend (tu API).
# Set all CORS enabled origins
# if settings.all_cors_origins:
#     app.add_middleware(
#         CORSMiddleware,
#         allow_origins=settings.all_cors_origins,
#         allow_credentials=True,
#         allow_methods=["*"],
#         allow_headers=["*"],
#     )

app = FastAPI(
    title=settings.PROJECT_NAME,
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
    generate_unique_id_function=custom_generate_unique_id,
)

app.include_router(api_router, prefix=settings.API_V1_STR)