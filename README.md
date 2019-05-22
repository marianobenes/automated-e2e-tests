# automated-e2e-tests
Automated e2e tests using protractor-cucumber-typscript

- Crear una carpeta dentro de proyecto para el ambiente
- Crear una sub-carpeta con el nombre tests donde estaran las pruebas
- Agregar el repositorio como submodulo

Parado dentro de la carpeta del ambiente ejecutar

docker-compose -f automated-e2e-tests/docker-compose.local.yaml up --build
