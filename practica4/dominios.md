# Tipos de dato y dominios (Proyecto Propio: Gimnasio)

| Columna | Tipo de dato | Longitud/Precisión | Justificación |
|---|---|---|---|
| id_socio | SERIAL | 4 bytes | Identificador autoincremental, entero. |
| nombre | VARCHAR | 100 | Texto variable, nombre de persona. |
| costo | DECIMAL | 10,2 | **Regla:** Los montos NUNCA en flotante para evitar pérdida de precisión. |
| fecha_inicio | DATE | - | **Regla:** Fechas exactas sin hora. |
| telefono | VARCHAR | 20 | Texto de longitud fija/variable, admite guiones. |

**Conclusión:** Usar `DECIMAL` garantiza que los centavos de los pagos sean exactos, y `DATE` evita problemas de zonas horarias.