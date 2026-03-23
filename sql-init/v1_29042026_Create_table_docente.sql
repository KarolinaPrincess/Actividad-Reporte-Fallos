CREATE TABLE docentes (
    id_docente SERIAL PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE NOT NULL,
    apellido VARCHAR(255) NOT NULL
);
