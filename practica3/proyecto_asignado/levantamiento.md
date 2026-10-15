# Levantamiento del proyecto asignado: Sismos

## Requisitos
- Docker Desktop
- Git
- GitHub Desktop
- Navegador web

## Pasos exactos
1. Fork del repositorio: https://github.com/Andrey2005588/Seismic-Data-Visualization-System
2. Clonación con GitHub Desktop en: C:\Users\HP\Documents\GitHub\sismos\Seismic-Data-Visualization-System
3. Commit puesto en funcionamiento: 8569667cf4f46fab640dba3f82a7b324ca7efaf7
4. Ejecución de `docker-compose up -d`.
5. Docker descargó las imágenes `postgres:17` y `php:8.2-apache`.
6. Los contenedores `seismic-data-visualization-system-db-1` y `seismic-data-visualization-system-web-1` se iniciaron.
7. PostgreSQL quedó expuesto en el puerto 5433.
8. La base de datos `datawarehouse` se pobló con los 6 archivos SQL (176 MB).
9. Acceso a la aplicación en http://localhost/sismos.php
10. Conexión a PostgreSQL: `docker exec -it seismic-data-visualization-system-db-1 psql -U postgres -d datawarehouse`
11. Consulta SQL ejecutada sobre la tabla `dim_sismos`.

## Errores y soluciones
- Advertencia: "version is obsolete". No es error.
- Error 403 Forbidden en http://localhost. 
  Solución: no hay index.php; se debe acceder a http://localhost/sismos.php
- Error "Is a directory" en la carga SQL. 
  Solución: la clonación anterior estaba corrupta; se re clonó el repositorio.
- Error: puerto 5432 ocupado. 
  Solución: Docker expone PostgreSQL en 5433.
- Error: la clonación inicial estaba corrupta (archivos SQL como carpetas). 
  Solución: se eliminó y se volvió a clonar en una ruta corta.

## Evidencias
- captura_terminal.png
- captura_app.png
- captura_consulta.png