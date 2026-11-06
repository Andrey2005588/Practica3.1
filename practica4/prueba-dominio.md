# Pruebas de restricciones de dominio

1. **NOT NULL (nombre):** `INSERT INTO socio (nombre) VALUES (NULL);` -> *ERROR: null value in column "nombre" violates not-null constraint.* Regla protegida: El socio debe tener nombre.
2. **CHECK (costo negativo):** `INSERT INTO membresia (costo) VALUES (-50);` -> *ERROR: violates check constraint.* Regla protegida: No hay costos negativos.
3. **UNIQUE (sala duplicada):** `INSERT INTO sala (nombre) VALUES ('Sala A');` -> *ERROR: duplicate key value.* Regla protegida: Los nombres de salas son únicos.
4. **CHECK (cp formato):** `INSERT INTO socio (cp) VALUES ('123');` -> *ERROR: new row violates check constraint "chk_cp_formato".* Regla protegida: El CP debe tener 5 dígitos.
5. **CHECK (entre columnas):** `INSERT INTO membresia (fecha_inicio, fecha_fin) VALUES ('2026-01-01', '2025-01-01');` -> *ERROR: violates check constraint.* Regla protegida: Fecha fin mayor a inicio.