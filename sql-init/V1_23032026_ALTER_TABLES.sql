-- ============================================================
-- MÓDULO 2: ALTERACIÓN DE TABLA E ÍNDICES
-- ============================================================

-- Extension de esquema: Agrega nivel de prioridad con validacion de rango (1-5).
ALTER TABLE reportes_fallos
    ADD COLUMN nivel_prioridad NUMERIC(1,0)
    CONSTRAINT chk_prioridad CHECK (nivel_prioridad BETWEEN 1 AND 5);