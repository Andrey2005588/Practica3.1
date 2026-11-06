# Usuarios y Permisos

Se crearon tres roles:
- `rol_app`: Para que el sistema de software del gimnasio lea y escriba. Solo tiene permisos de INSERT, SELECT, UPDATE.
- `rol_consulta`: Solo lectura (SELECT) para gerentes o auditorías.
- `rol_admin`: Control total de la base de datos.

**Matriz de permisos:**
| Tabla | rol_app | rol_consulta | rol_admin |
|---|---|---|---|
| socio | SELECT, INSERT, UPDATE | SELECT | ALL |
| pago | SELECT, INSERT | SELECT | ALL |
| membresia| SELECT, INSERT, UPDATE | SELECT | ALL |

**Prueba de permisos:**
- `rol_consulta` intentando borrar un socio: *ERROR: permission denied for table socio.*
- Se usó `REVOKE INSERT ON socio FROM rol_app;` y se demostró que ya no puede insertar.