-- ============================================================
-- ORQUESTADOR DE INICIALIZACIÓN 
-- ============================================================

\i /docker-entrypoint-initdb.d/V1_23032026_CREATE_TABLES.sql
\i /docker-entrypoint-initdb.d/V1_23032026_Funtions_triggers.sql
\i /docker-entrypoint-initdb.d/V1_23032026_ALTER_TABLES.sql
\i /docker-entrypoint-initdb.d/V1_23032026_CREATE_INDEX.sql

\i /docker-entrypoint-initdb.d/V1_24032026_VACUUM_ANALYZE.sql
\i /docker-entrypoint-initdb.d/V1_24042026_COMMENT_ON.sql