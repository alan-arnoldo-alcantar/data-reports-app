#! /usr/bin/env bash
set -e
set -x
# set -e y set -x
# Como ya hemos visto, estos comandos aseguran que el script se detenga si hay un error y que muestre cada comando antes de ejecutarlo.

python app/tests_pre_start.py
# La Preparación ⚙️
# Esta es la fase de configuración del entorno de pruebas. Este script de Python se ejecuta antes de las pruebas para garantizar que el entorno esté en un estado limpio y conocido. Sus responsabilidades típicas son:
# Conectarse a una base de datos de prueba: Es una muy buena práctica usar una base de datos completamente separada para las pruebas, para nunca arriesgar los datos de desarrollo o producción.
# Limpiar la base de datos: Borra y recrea todas las tablas para asegurar que los resultados de una ejecución anterior no afecten a la actual. Esto se conoce como aislamiento de pruebas (test isolation).
# Aplicar migraciones: Puede ejecutar alembic upgrade head para construir el esquema de la base de datos de prueba.

bash scripts/test.sh "$@"
# bash scripts/test.sh "$@" (La Ejecución 🚀)
# Una vez que el entorno está listo, esta línea ejecuta el script test.sh que analizamos anteriormente (el que usa pytest y coverage).
# "$@": Esta es una variable especial en bash. Significa "pasar todos los argumentos que recibió este script al siguiente script". Por ejemplo, si ejecutas bash scripts/test-start.sh --disable-warnings, la variable "$@" se convertirá en "--disable-warnings", y el comando que se ejecutará será bash scripts/test.sh "--disable-warnings". Esto hace que el script sea más flexible.