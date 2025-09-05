#!/bin/sh -e
# -e: Es un atajo para set -e. Asegura que el script se detenga inmediatamente si alguno de los comandos falla. Si ruff check encuentra un error que no puede arreglar y falla, el script no continuará con ruff format.

set -x
# set -x Activa el modo de depuración ("xtrace"). Imprime cada comando en la terminal justo antes de ejecutarlo. Es muy útil para ver el flujo exacto de lo que hace el script, lo que facilita la depuración si algo sale mal.

ruff check app scripts --fix
# ruff check: Es el comando que utiliza ruff para analizar el código en busca de errores, posibles bugs y violaciones de estilo (por ejemplo, importaciones no utilizadas, variables sin usar, complejidad innecesaria).

# app scripts: Le dice a ruff que analice todos los archivos de Python dentro de las carpetas app y scripts.

# --fix: Esta es la parte clave. Le ordena a ruff que intente arreglar automáticamente todos los problemas que encuentre. Esto ahorra una enorme cantidad de tiempo en correcciones manuales.

ruff format app scripts
# ruff format: Este comando se enfoca exclusivamente en el estilo visual del código, como un formateador tipo black. No busca errores lógicos, sino que reescribe el código para que cumpla con un estándar de formato consistente.

# app scripts: De nuevo, aplica el formateo a los directorios especificados.

# Acciones comunes: Ajusta la longitud de las líneas, estandariza el uso de comillas simples o dobles, asegura el espaciado correcto alrededor de operadores y paréntesis, etc.