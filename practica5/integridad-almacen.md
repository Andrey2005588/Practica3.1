# Integridad en el Almacén Asignado (Sismos)

1. **Tabla de hechos:** `fact_impacto_sismos_imputed`
2. **Dimensiones:** `dim_sismos`, `dim_tiempo`, `dim_zonas`, `dim_economia`.
3. **Granularidad:** Un renglón de hechos representa el impacto de un sismo específico (id_sismo) en un tiempo y zona determinados.
4. **Revisión de FKs:** El esquema original del data warehouse no declara todas las FKs entre hechos y dimensiones por razones de rendimiento en la carga ETL. Al hacer un LEFT JOIN, encontramos 0 registros huérfanos en los datos cargados.
5. **Propuesta de 3 restricciones:**
   - `CHECK (magnitud >= 0)` en `dim_sismos`.
   - `CHECK (latitud BETWEEN 14.0 AND 33.0)` en `dim_sismos` (para delimitar México).
   - `CHECK (profundidad >= 0)`.