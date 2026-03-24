-- ============================================================
-- MÓDULO 1: AUTOMATIZACIÓN CON TRIGGER + PL/pgSQL
-- ============================================================

-- Función que ejecuta el trigger
CREATE OR REPLACE FUNCTION fn_actualizar_estado_pizarra()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE pizarras
    SET estado = 'En Reparación'
    WHERE id_pizarra = NEW.id_pizarra;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Disparador asociado a la función
CREATE TRIGGER trg_reporte_actualiza_estado
    AFTER INSERT
    ON reportes_fallos
    FOR EACH ROW
    EXECUTE FUNCTION fn_actualizar_estado_pizarra();

/*
* JUSTIFICACIÓN TÉCNICA:
*
* 1. FOR EACH ROW:
*    Se utiliza porque necesitamos acceder a los datos de CADA fila
*    insertada individualmente (NEW.id_pizarra). Un trigger FOR EACH
*    STATEMENT no expone la variable NEW y no permitiría identificar
*    qué pizarra específica fue afectada.
*
* 2. AFTER INSERT:
*    El timing AFTER es preferible aquí porque necesitamos que la fila
*    en reportes_fallos ya esté confirmada en la tabla antes de
*    propagar el cambio a pizarras. Usar BEFORE podría generar
*    inconsistencias si la inserción fallara después del UPDATE.
*    Con AFTER, ambas operaciones forman parte de la misma transacción
*    y se revierten juntas ante cualquier error.
*/