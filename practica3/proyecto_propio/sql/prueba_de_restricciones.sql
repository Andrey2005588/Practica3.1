INSERT INTO membresia (tipo, costo, fecha_inicio, fecha_fin, id_socio)
VALUES ('Mensual', 500.00, '2026-10-01', '2026-10-31', 9999);

INSERT INTO membresia (tipo, costo, fecha_inicio, fecha_fin, id_socio)
VALUES ('Mensual', -100.00, '2026-10-01', '2026-10-31', 1);

INSERT INTO socio (nombre, telefono, calle, colonia, cp, nivel_entrenamiento, objetivo_fisico)
VALUES (NULL, '5500000000', 'Calle 1', 'Colonia 1', '01000', 'principiante', 'Tonificar');

INSERT INTO sala (nombre, capacidad) VALUES ('Sala A', 30);

INSERT INTO membresia (tipo, costo, fecha_inicio, fecha_fin, id_socio)
VALUES ('Mensual', 500.00, '2026-10-31', '2026-10-01', 1);