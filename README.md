# automated-e2e-tests
Automated e2e tests using protractor-cucumber-typscript

- Crear una carpeta dentro de proyecto para las pruebas (Ejemplo: e2e-tests)
- Agregar el repositorio como submodulo dentro de esta carpeta
- Crear una sub-carpeta con el nombre tests, dentro de ésta estarán las pruebas


- Para correr las pruebas: estando dentro de la carpeta del ambiente (e2e-tests) ejecutar:

- docker-compose -f automated-e2e-tests/docker-compose.local.yaml up --build
