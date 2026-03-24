-- ============================================================
-- PASO 1: INSERTAR DATOS EN TABLAS PRINCIPALES
-- ============================================================

-- Insertamos 3 pizarras con estado inicial 'Operativa'
INSERT INTO pizarras (ubicacion, estado) VALUES
    ('Aula 101 - Edificio A', 'Operativa'),
    ('Aula 102 - Edificio A', 'Operativa'),
    ('Aula 201 - Edificio B', 'Operativa');

-- Insertamos 2 técnicos encargados de las reparaciones
INSERT INTO tecnicos (nombre, especialidad) VALUES
    ('Ana Gómez', 'Hardware y Pantallas'),
    ('Carlos Ruiz', 'Conectividad y Redes');

INSERT INTO reportes_fallos (fecha, descripcion, id_pizarra, id_tecnico, nivel_prioridad) VALUES
    (CURRENT_DATE, 'Pantalla no enciende', 1, 1, 5),          
    (CURRENT_DATE, 'Fallo puerto HDMI', 2, 1, 3),         
    (CURRENT_DATE, 'Descalibración táctil', 1, 2, 2),         
    (CURRENT_DATE - INTERVAL '1 day', 'Píxeles muertos', 3, 1, 4), 
    (CURRENT_DATE, 'No hay conexión de red', 2, 2, 5);        