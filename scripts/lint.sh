#!/usr/bin/env bash

set -e
set -x

mypy app
# ¿Qué hace?: Mypy es un verificador de tipos estático. Revisa tu código en busca de errores de tipo sin ejecutarlo. Por ejemplo, si tienes una función que espera un número (int) y accidentalmente le pasas un texto (str), mypy detectará este error potencial.

# Propósito: Aumentar la correctitud del código y prevenir bugs antes de que ocurran en producción.

ruff check app
# ¿Qué hace?: Es el linter de ruff. Busca problemas de calidad, posibles errores lógicos, código muerto (inútil) y violaciones de buenas prácticas.

# Propósito: Asegurar la calidad y mantenibilidad del código. Es importante notar que aquí se usa sin el flag --fix, por lo que solo reporta los problemas, no los arregla.

ruff format app --check
# ¿Qué hace?: Ejecuta el formateador de ruff en modo de "solo verificación".

# Propósito: En lugar de reformatear el código, simplemente comprueba si el código ya está formateado correctamente. Si algún archivo necesitara ser reformateado, este comando fallará.