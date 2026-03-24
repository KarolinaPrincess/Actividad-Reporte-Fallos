-- ============================================================
-- MÓDULO 3: MANTENIMIENTO RUTINARIO

-- ============================================================

VACUUM ANALYZE reportes_fallos;

/*
* JUSTIFICACIÓN:
*
* VACUUM:
*   En PostgreSQL, los DELETE y UPDATE no eliminan físicamente las filas
*   antiguas; las marcan como "tuplas muertas". VACUUM recorre la tabla
*   y libera ese espacio para reutilización, evitando el crecimiento
*   indefinido del fichero de datos en disco (bloat).
*
* ANALYZE:
*   Actualiza las estadísticas de distribución de datos en el catálogo
*   del sistema (pg_statistic). El planificador usa estos metadatos para
*   estimar la selectividad de las condiciones WHERE y decidir si conviene
*   un Index Scan (pocos registros) o un Sequential Scan (tabla completa).
*
* VACUUM ANALYZE combina ambas operaciones en un solo comando,
* siendo la práctica recomendada tras cargas masivas o purgas de históricos.
*/