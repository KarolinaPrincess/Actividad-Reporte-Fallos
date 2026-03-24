-- ============================================================
-- MODULO 2: ALTERACION DE TABLA E INDICES
-- ============================================================

--Indice sobre la columna fecha
CREATE INDEX idx_reportes_fecha
    ON reportes_fallos (fecha);

--Indice sobre el tecnico asignado
CREATE INDEX idx_reportes_tecnico
    ON reportes_fallos (id_tecnico);

/* 
* ANÁLISIS DE RENDIMIENTO — IMPACTO EN EL PLANIFICADOR (Query Planner):
*
* 1. OPTIMIZACIÓN DE LECTURA (BENEFICIO):
* PostgreSQL utiliza estos índices como estructuras de búsqueda rápida (B-Tree). 
*
* idx_reportes_fecha: Evita recorrer toda la tabla (Sequential Scan) al filtrar 
* por rangos de tiempo, reduciendo drásticamente el tiempo de respuesta.
*
* idx_reportes_tecnico: Agiliza los JOINs con otras tablas y las búsquedas 
* específicas por empleado, optimizando la carga del servidor.
*
* 2. COSTO DE ESCRITURA (I/O):
* Cada INSERT o UPDATE obliga a la base de datos 
* a actualizar también los índices asociados. En sistemas con miles de registros 
* nuevos por minuto, un exceso de índices puede ralentizar la escritura. 
*
* Se debe equilibrar la velocidad de consulta con la penalización en 
* la inserción, indexando solo las columnas con alta frecuencia de filtrado.
*/