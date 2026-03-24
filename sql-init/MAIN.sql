-- ============================================================
-- ORQUESTADOR DE INICIALIZACIÓN 
-- ============================================================

-- CREACIÓN DE ESQUEMA Y LÓGICA
\i /docker-entrypoint-initdb.d/V1_23032026_CREATE_TABLES.sql
\i /docker-entrypoint-initdb.d/V1_23032026_Funtions_triggers.sql
\i /docker-entrypoint-initdb.d/V1_23032026_ALTER_TABLES.sql
\i /docker-entrypoint-initdb.d/V1_23032026_CREATE_INDEX.sql

-- CARGA DE DATOS DE PRUEBA
\i /docker-entrypoint-initdb.d/V1_24032026_INSERTS.sql

-- MANTENIMIENTO Y METADATOS
\i /docker-entrypoint-initdb.d/V1_24032026_VACUUM_ANALYZE.sql
\i /docker-entrypoint-initdb.d/V1_24042026_COMMENT_ON.sql

-- VALIDACIÓN VISUAL DE RESULTADOS
\i /docker-entrypoint-initdb.d/V1_24032026_SELECTS.sql