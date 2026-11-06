#!/bin/bash
echo "Iniciando carga de datos..."
docker exec -i gimnasio-db psql -U admin -d gimnasio < ../poblar/poblar.sql
echo "Carga finalizada."