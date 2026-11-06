-- Migración 001: Restricciones de dominio
ALTER TABLE socio ADD CONSTRAINT chk_cp_formato CHECK (cp ~ '^[0-9]{5}$');
ALTER TABLE socio ADD CONSTRAINT chk_tel_formato CHECK (telefono ~ '^[0-9]{10}$');
ALTER TABLE socio ADD CONSTRAINT chk_nombre_largo CHECK (char_length(nombre) >= 3);
ALTER TABLE pago ADD CONSTRAINT chk_metodo_pago CHECK (metodo_pago IN ('efectivo', 'tarjeta', 'transferencia', 'deposito'));
ALTER TABLE membresia ADD CONSTRAINT chk_costo_max CHECK (costo < 50000);
ALTER TABLE membresia ADD CONSTRAINT chk_fechas_membresia CHECK (fecha_fin > fecha_inicio);
ALTER TABLE clase ADD CONSTRAINT chk_cupo_max CHECK (cupo_maximo <= 100);
ALTER TABLE empleado ADD CONSTRAINT chk_turno_valido CHECK (turno IN ('matutino', 'vespertino', 'nocturno'));
ALTER TABLE sala ADD CONSTRAINT chk_capacidad_positiva CHECK (capacidad > 0);
ALTER TABLE horario ADD CONSTRAINT chk_hora_logica CHECK (hora_fin > hora_inicio);