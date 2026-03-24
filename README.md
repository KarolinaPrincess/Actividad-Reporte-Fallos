# Sistema de Gestión de Reportes de Fallos (UJI)

Este proyecto implementa una infraestructura de base de datos en **PostgreSQL 17** para el control automatizado de incidencias en dispositivos tecnológicos.

---

## 👥 Integrante

- **Carlos Vicente Álvarez Pérez**

---

## Estructura de la Base de Datos

### 1. Tabla: `pizarras`
Almacena los activos tecnológicos y su estado de disponibilidad.

### 2. Tabla: `tecnicos`
Contiene el registro del personal técnico especializado encargado de atender incidencias.

### 3. Tabla: `reportes_fallos`
Entidad transaccional donde se registran las incidencias reportadas en los dispositivos.

---

## Ejecución y Despliegue

### 1. Levantar Contenedores

Asegúrate de tener **Docker** en ejecución y levanta los servicios definidos en tu entorno.

docker-compose up -d

Ejecución del Script Principal (MAIN)

Para inicializar la base de datos, crear las tablas, triggers e insertar datos de prueba, ejecuta:

```bash
docker exec -it postgres17 psql -U postgres -d db_reporte_fallos -f docker-entrypoint-initdb.d/MAIN.sql
```
---

Stack Tecnológico 🐳
Motor de Base de Datos: PostgreSQL 17
Gestión: pgAdmin 4
Contenedores: Docker & Docker Compose
Lenguaje: SQL / PL/pgSQL