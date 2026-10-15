-- Cambio de esquema por Andrey2005588
-- Propuesta: almacenar resultados de modelo ML de detección de anomalías

CREATE TABLE modelo_ml (
    id_modelo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    version VARCHAR(20) NOT NULL,
    fecha_entrenamiento DATE NOT NULL,
    algoritmo VARCHAR(50)
);

CREATE TABLE prediccion_anomalia (
    id_prediccion SERIAL PRIMARY KEY,
    id_sismo INT NOT NULL,
    id_modelo INT NOT NULL,
    es_anomalia BOOLEAN NOT NULL,
    probabilidad DECIMAL(5,4) CHECK (probabilidad BETWEEN 0 AND 1),
    fecha_prediccion TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_prediccion_sismo FOREIGN KEY (id_sismo)
        REFERENCES dim_sismos(id_sismo) ON DELETE CASCADE,
    CONSTRAINT fk_prediccion_modelo FOREIGN KEY (id_modelo)
        REFERENCES modelo_ml(id_modelo) ON DELETE RESTRICT
);

INSERT INTO modelo_ml (nombre, version, fecha_entrenamiento, algoritmo)
VALUES ('Detector Sismos', 'v1.0', '2026-10-01', 'Isolation Forest');

INSERT INTO prediccion_anomalia (id_sismo, id_modelo, es_anomalia, probabilidad)
VALUES (1, 1, TRUE, 0.8732);

SELECT s.id_sismo, s.magnitud, s.estado, p.es_anomalia, p.probabilidad, m.version
FROM dim_sismos s
JOIN prediccion_anomalia p ON s.id_sismo = p.id_sismo
JOIN modelo_ml m ON p.id_modelo = m.id_modelo
WHERE p.es_anomalia = TRUE;