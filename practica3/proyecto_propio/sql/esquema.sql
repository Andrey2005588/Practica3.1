DROP TABLE IF EXISTS asiste CASCADE;
DROP TABLE IF EXISTS acceso CASCADE;
DROP TABLE IF EXISTS pago CASCADE;
DROP TABLE IF EXISTS membresia CASCADE;
DROP TABLE IF EXISTS clase CASCADE;
DROP TABLE IF EXISTS horario CASCADE;
DROP TABLE IF EXISTS sala CASCADE;
DROP TABLE IF EXISTS entrenador CASCADE;
DROP TABLE IF EXISTS empleado CASCADE;
DROP TABLE IF EXISTS socio CASCADE;

CREATE TABLE socio (
    id_socio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    calle VARCHAR(100),
    colonia VARCHAR(100),
    cp VARCHAR(10),
    nivel_entrenamiento VARCHAR(50) CHECK (nivel_entrenamiento IN ('principiante','intermedio','avanzado')),
    objetivo_fisico VARCHAR(100)
);

CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    turno VARCHAR(20) CHECK (turno IN ('matutino','vespertino','nocturno'))
);

CREATE TABLE entrenador (
    id_entrenador SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50)
);

CREATE TABLE sala (
    id_sala SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    capacidad INT NOT NULL CHECK (capacidad > 0)
);

CREATE TABLE horario (
    id_horario SERIAL PRIMARY KEY,
    dia VARCHAR(15) NOT NULL CHECK (dia IN ('lunes','martes','miercoles','jueves','viernes','sabado','domingo')),
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    CHECK (hora_fin > hora_inicio)
);

CREATE TABLE clase (
    id_clase SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    cupo_maximo INT NOT NULL CHECK (cupo_maximo > 0),
    id_entrenador INT NOT NULL,
    id_sala INT NOT NULL,
    id_horario INT NOT NULL,
    CONSTRAINT fk_clase_entrenador FOREIGN KEY (id_entrenador)
        REFERENCES entrenador(id_entrenador) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_clase_sala FOREIGN KEY (id_sala)
        REFERENCES sala(id_sala) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_clase_horario FOREIGN KEY (id_horario)
        REFERENCES horario(id_horario) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE membresia (
    id_membresia SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    costo DECIMAL(10,2) NOT NULL CHECK (costo >= 0),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    id_socio INT NOT NULL,
    CONSTRAINT fk_membresia_socio FOREIGN KEY (id_socio)
        REFERENCES socio(id_socio) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (fecha_fin > fecha_inicio)
);

CREATE TABLE pago (
    id_pago SERIAL PRIMARY KEY,
    monto DECIMAL(10,2) NOT NULL CHECK (monto > 0),
    fecha DATE NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL CHECK (metodo_pago IN ('efectivo','tarjeta','transferencia')),
    id_socio INT NOT NULL,
    CONSTRAINT fk_pago_socio FOREIGN KEY (id_socio)
        REFERENCES socio(id_socio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE acceso (
    id_acceso SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_socio INT NOT NULL,
    CONSTRAINT fk_acceso_socio FOREIGN KEY (id_socio)
        REFERENCES socio(id_socio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE asiste (
    id_socio INT NOT NULL,
    id_clase INT NOT NULL,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT pk_asiste PRIMARY KEY (id_socio, id_clase, fecha),
    CONSTRAINT fk_asiste_socio FOREIGN KEY (id_socio)
        REFERENCES socio(id_socio) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_asiste_clase FOREIGN KEY (id_clase)
        REFERENCES clase(id_clase) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO socio (nombre, telefono, calle, colonia, cp, nivel_entrenamiento, objetivo_fisico)
VALUES ('Juan Pérez', '5512345678', 'Av. Reforma 123', 'Centro', '06000', 'intermedio', 'Bajar de peso');

INSERT INTO empleado (nombre, puesto, turno) VALUES ('Ana López', 'Recepcionista', 'matutino');
INSERT INTO entrenador (nombre, especialidad) VALUES ('Carlos Ruiz', 'Crossfit');
INSERT INTO sala (nombre, capacidad) VALUES ('Sala A', 20);
INSERT INTO horario (dia, hora_inicio, hora_fin) VALUES ('lunes', '07:00', '08:00');
INSERT INTO clase (nombre, cupo_maximo, id_entrenador, id_sala, id_horario)
VALUES ('Crossfit Básico', 15, 1, 1, 1);
INSERT INTO membresia (tipo, costo, fecha_inicio, fecha_fin, id_socio)
VALUES ('Mensual', 500.00, '2026-10-01', '2026-10-31', 1);
INSERT INTO pago (monto, fecha, metodo_pago, id_socio)
VALUES (500.00, '2026-10-01', 'efectivo', 1);
INSERT INTO acceso (fecha, hora, id_socio) VALUES ('2026-10-14', '08:30', 1);
INSERT INTO asiste (id_socio, id_clase, fecha) VALUES (1, 1, '2026-10-14');