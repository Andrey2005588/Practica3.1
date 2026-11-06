# Pruebas de Integridad Referencial

1. **INSERT con FK inexistente:** Insertar pago con `id_socio = 9999`. 
   *Resultado:* `ERROR: insert or update on table "pago" violates foreign key constraint.`
2. **Prueba de ON DELETE CASCADE:** Había 5 pagos del socio 1. Se ejecutó `DELETE FROM socio WHERE id_socio = 1;`. 
   *Resultado:* Se borraron los 5 pagos. Quedaron 0.
3. **Prueba de ON DELETE RESTRICT:** Se intentó borrar la sala 1 que tiene una clase.
   *Resultado:* `ERROR: update or delete on table "sala" violates foreign key constraint.`
4. **Comprobación de huérfanos:** `SELECT * FROM pago WHERE id_socio NOT IN (SELECT id_socio FROM socio);` 
   *Resultado:* 0 filas (vacío, todo está íntegro).