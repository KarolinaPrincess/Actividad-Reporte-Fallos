-- ============================================================
-- MÓDULO 4: DOCUMENTACIÓN Y METADATOS DEL CATÁLOGO
-- ============================================================

-- Metadatos de entidad: Define el rol del personal tecnico y la politica de borrado.
COMMENT ON TABLE tecnicos IS
    'Almacena el personal técnico habilitado para atender incidencias
    de hardware en las aulas de la UJI. Permite reasignación de reportes
    ante baja de un técnico (ON DELETE SET NULL).';

-- Documentacion de dominio: Describe estados validos y logica de automatizacion.
COMMENT ON COLUMN pizarras.estado IS
    'Estado operativo actual de la pizarra electrónica.
    Valores permitidos: Operativa | En Reparación | Fuera de Servicio.
    Se actualiza automáticamente mediante el trigger
    trg_reporte_actualiza_estado al registrar un nuevo fallo.';