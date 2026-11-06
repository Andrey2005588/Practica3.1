# Edición de Valores y Transacciones

**1. INSERT desde SELECT:**
\```sql
INSERT INTO acceso (fecha, hora, id_socio) 
SELECT CURRENT_DATE, CURRENT_TIME, id_socio FROM socio WHERE id_socio = 5;
\```

**2. UPDATE con CASE:**
\```sql
UPDATE socio 
SET nivel_entrenamiento = CASE 
    WHEN nivel_entrenamiento = 'principiante' THEN 'intermedio'
    WHEN nivel_entrenamiento = 'intermedio' THEN 'avanzado'
    ELSE nivel_entrenamiento END;
\```

**3. DELETE con subconsulta:**
\```sql
DELETE FROM acceso WHERE id_socio IN (SELECT id_socio FROM socio WHERE nombre = 'Socio 10');
\```

**4. Transacción con SAVEPOINT:**
\```sql
BEGIN;
UPDATE socio SET nombre = 'Juan Modificado' WHERE id_socio = 2;
SAVEPOINT mi_punto;
UPDATE pago SET monto = monto * 1.10 WHERE id_socio = 2;
ROLLBACK TO mi_punto; -- Revierte el pago, pero mantiene el nombre
COMMIT;
\```