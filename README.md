# Práctica 3 - Bases de Datos

## Integrantes
- Serna Villa Jurgen Andrey 

## Proyecto propio
Sistema de Gestión para Gimnasio

## Proyecto asignado
Seismic Data Visualization System
Fork: https://github.com/Andrey2005588/Seismic-Data-Visualization-System

## Gestor utilizado
PostgreSQL 17 en Docker

## Issue individual
- Andrey2005588: https://github.com/Andrey2005588/practica2-individual-gym-sismos.git

## Enlace al sitio (Práctica 3.1)
https://Andrey2005588.github.io/Practica3.1/

## Estructura
- `docs/` → sitio de la Práctica 3.1
- `practica3/proyecto-propio/` → SQL, diagrama y evidencias del gimnasio
- `practica3/proyecto-asignado/` → análisis del proyecto sismos
- `levantamiento.md` → cómo se levantó el proyecto asignado
- `compose.yaml` → Docker del proyecto propio

## Cómo levantar el proyecto propio
docker compose up -d
docker exec -i gimnasio-db psql -U admin -d gimnasio < practica3/proyecto-propio/sql/esquema.sql


##Bibliografía:
Elmasri, R., & Navathe, S. B. (2016). Fundamentals of Database Systems (7th ed.). Pearson.

Silberschatz, A., Korth, H. F., & Sudarshan, S. (2019). Database System Concepts (7th ed.). McGraw-Hill.
