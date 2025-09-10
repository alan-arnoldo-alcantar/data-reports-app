# Objetivo de la Carpeta scripts

El propósito principal de esta carpeta es separar el código de la aplicación del código de utilidad o mantenimiento. En otras palabras, aquí no va la lógica de negocio de tu API, sino scripts que te ayudan a gestionar el ciclo de vida de la aplicación.

Las ventajas de esta separación son:
* Organización: Mantiene tu código fuente (generalmente en una carpeta como app/) limpio y enfocado exclusivamente en la funcionalidad de la API.
* Automatización: Centraliza las tareas repetitivas de desarrollo, como iniciar la aplicación, ejecutar migraciones de base de datos o crear datos iniciales.
* Claridad: Cualquiera que se una al proyecto puede ir a esta carpeta para entender cómo realizar tareas operativas estándar.

### format.sh (El Estilista 🎨)
Este script es como un editor que se encarga del diseño y la apariencia del documento.
Acción: Modifica activamente los archivos.
Comandos clave: ruff check --fix y ruff format.
Pregunta que responde: "¿Cómo puedo hacer que este código se vea limpio y consistente según nuestras reglas?"
Uso típico: Lo ejecutas tú como desarrollador en tu máquina para limpiar tu trabajo antes de subirlo.

### lint.sh (El Inspector 🕵️)
Este script es como un inspector de calidad que revisa el documento final para darle el visto bueno.

Acción: No modifica los archivos, solo los verifica. Falla si encuentra un problema.

Comandos clave: mypy, ruff check (sin --fix), ruff format --check.

Pregunta que responde: "¿Este código es correcto, de alta calidad y ya sigue las reglas de estilo?"

Uso típico: Se ejecuta en un sistema de Integración Continua (CI/CD) para asegurarse de que el código que se va a integrar al proyecto principal es perfecto.

### test.sh (Test Coverage 🧪)
¿Qué es la "Cobertura de Pruebas" (Test Coverage)?

La cobertura de pruebas es una métrica que te dice qué porcentaje de tu código es ejecutado por tus pruebas automáticas.

Imagina que tu código tiene 100 líneas. Si tus pruebas solo ejecutan 85 de esas líneas, tienes una cobertura del 85%. El 15% restante es código que podría tener un bug sin que tus pruebas lo detecten.

Este script no solo te da el porcentaje, sino que te dice exactamente cuáles son las líneas faltantes (--show-missing), para que sepas dónde necesitas añadir más pruebas. El objetivo no es siempre llegar al 100%, sino asegurarse de que toda la lógica crítica del negocio esté bien probada.

### tests-start.sh

¿Por Qué Tener Dos Scripts de Prueba?
Esta estructura separa las responsabilidades, lo cual es una excelente práctica de software:

test-start.sh: Se encarga de la configuración del entorno.

test.sh: Se encarga de la ejecución de las pruebas y la generación de reportes.

Esta modularidad hace que el proceso sea más claro y fácil de mantener. El script test-start.sh es el punto de entrada principal para ejecutar todo el proceso de pruebas desde un estado completamente limpio.