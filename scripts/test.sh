#!/usr/bin/env bash

set -e
set -x

coverage run --source=app -m pytest
# Esta es la línea principal que ejecuta las pruebas.

# coverage run: Inicia la herramienta coverage, que monitorea qué líneas de tu código se ejecutan.

# --source=app: Le dice a coverage que solo se fije en el código dentro de la carpeta app. Esto es clave para no medir la cobertura de las librerías externas o del propio código de las pruebas.

# -m pytest: Le indica a coverage que el programa que debe ejecutar es el módulo pytest. Pytest se encargará de descubrir y correr todas tus pruebas automáticamente.

coverage report --show-missing
# Una vez que las pruebas han terminado, este comando genera un reporte de resumen en la terminal.

# coverage report: Toma los datos recolectados por coverage run y muestra una tabla con el porcentaje de cobertura para cada archivo.

# --show-missing: Esta es una opción muy útil. Además del porcentaje, le pide al reporte que indique qué números de línea no fueron cubiertos por las pruebas.

coverage html --title "${@-coverage}"
# Este comando genera un reporte mucho más detallado en formato HTML.

# coverage html: Crea una carpeta (usualmente htmlcov/) que contiene archivos HTML interactivos. Puedes abrir el archivo index.html en un navegador para explorar los resultados de la cobertura. El reporte visual te marca en verde las líneas cubiertas y en rojo las que no.

# --title "${@-coverage}": Establece un título para el reporte HTML. La variable ${@} se expande a cualquier argumento que le pases al script. Por ejemplo, si ejecutas bash scripts/test.sh CI, el título del reporte será "CI-coverage".