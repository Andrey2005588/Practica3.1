BEGIN;

-- Limpiar por si se corre dos veces (Repetible)
TRUNCATE TABLE asiste, acceso, pago, membresia, clase, horario, sala, entrenador, empleado, socio RESTART IDENTITY CASCADE;

-- Insertar 200 socios
INSERT INTO socio (nombre, telefono, calle, colonia, cp, nivel_entrenamiento, objetivo_fisico)
SELECT 
    'Socio ' || i, 
    '55' || LPAD(i::text, 8, '0'),
    'Calle ' || i,
    'Colonia ' || i,
    LPAD((10000 + i)::text, 5, '0'),
    CASE WHEN i % 3 = 0 THEN 'principiante' WHEN i % 3 = 1 THEN 'intermedio' ELSE 'avanzado' END,
    'Objetivo ' || i
FROM generate_series(1, 200) AS i;

-- Insertar 200 membresias
INSERT INTO membresia (tipo, costo, fecha_inicio, fecha_fin, id_socio)
SELECT 'Mensual', 500.00, CURRENT_DATE, CURRENT_DATE + 30, i
FROM generate_series(1, 200) AS i;

-- Insertar 200 pagos
INSERT INTO pago (monto, fecha, metodo_pago, id_socio)
SELECT 500.00, CURRENT_DATE, 'efectivo', i
FROM generate_series(1, 200) AS i;

COMMIT;