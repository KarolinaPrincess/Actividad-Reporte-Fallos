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
* 1.FOR EACH ROW:
*   Se utiliza este nivel de ejecución porque el trigger necesita
*   capturar el valor específico de id_pizarra que se acaba de
*   insertar. Al ser "por cada fila", el trigger puede leer la
*   variable especial NEW, la cual contiene los datos exactos del 
*   reporte que está entrando en ese instante.
*
* 2.AFTER INSERT:
*   El timing AFTER es preferible aquí porque necesitamos que la fila
*   en reportes_fallos ya esté confirmada en la tabla antes de
*   propagar el cambio a pizarras. Usar BEFORE podría generar
*   inconsistencias si la inserción fallara después del UPDATE.
*   Con AFTER, ambas operaciones forman parte de la misma transacción
*   y se revierten juntas ante cualquier error.
*/