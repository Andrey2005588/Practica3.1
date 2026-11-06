# Fuente de datos del proyecto propio

**Búsqueda:** Se buscaron datasets públicos de gimnasios en el Portal de Datos Abiertos de la CDMX y el INEGI. 
**Conclusión:** No existe un conjunto de datos público oficial que refleje el funcionamiento interno de un gimnasio local (socios, clases, pagos). 

**Decisión:** Se generaron datos sintéticos mediante un script SQL (`generate_series`) para poblar la base. Los datos respetan todas las restricciones de dominio y generan más de 200 filas por tabla principal para permitir consultas interesantes.