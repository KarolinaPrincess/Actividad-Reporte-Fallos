-- ============================================================
-- VALIDACION DE RESULTADOS
-- ============================================================

-- Verificar los reportes creados
SELECT * FROM reportes_fallos;

-- Verificacion del Triggers: 
-- Comprobar que todas las pizarras pasaron a 'En Reparacion' automaticamente
SELECT 
    id_pizarra, 
    ubicacion, 
    estado 
FROM pizarras;

-- Vista general:
-- Una consulta unificada para ver el incidente completo con nombres reales en lugar de IDs
SELECT
    r.id_reporte,
    r.fecha,
    p.ubicacion AS ubicacion_pizarra,
    p.estado AS estado_actual,
    r.descripcion AS problema_reportado,
    t.nombre AS tecnico_asignado,
    r.nivel_prioridad
FROM reportes_fallos r
JOIN pizarras p ON r.id_pizarra = p.id_pizarra
JOIN tecnicos t ON r.id_tecnico = t.id_tecnico
ORDER BY r.nivel_prioridad DESC, r.fecha DESC;