# Claves Foráneas y Acciones Referenciales

| FK | Relación EER | Referencia a | Nulos | ON DELETE | Justificación (Regla) |
|---|---|---|---|---|---|
| membresia.id_socio | Socio - Membresia (1:N) | socio(id_socio) | No (Min 1) | CASCADE | Si el socio se elimina, sus membresías no tienen sentido. |
| pago.id_socio | Socio - Pago (1:N) | socio(id_socio) | No (Min 1) | CASCADE | Los pagos pertenecen al socio. |
| clase.id_sala | Sala - Clase (1:N) | sala(id_sala) | No (Min 1) | RESTRICT | No puedes borrar una sala si hay clases asignadas ahí. |