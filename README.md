<div align="center">

<img src="https://img.shields.io/badge/PostgreSQL-17-39FF14?style=for-the-badge&logo=postgresql&logoColor=black" />
<img src="https://img.shields.io/badge/Docker-Compose-FF69B4?style=for-the-badge&logo=docker&logoColor=white" />
<img src="https://img.shields.io/badge/pgAdmin-4-BF00FF?style=for-the-badge&logo=adminer&logoColor=white" />
<img src="https://img.shields.io/badge/PL%2FpgSQL-Triggers-39FF14?style=for-the-badge&logo=postgresql&logoColor=black" />

<br/><br/>

# 🖥️ Sistema de Gestión de Reportes de Fallos
### **Universitat Jaume I — UJI**

> *Infraestructura de base de datos automatizada para el control de incidencias en dispositivos tecnológicos*

---

👤 **Integrante:** Carlos Vicente Álvarez Pérez  
📚 **Asignatura:** Diplomado de Administración de Base de Datos e Inteligencia de Negocios  
🛢️ **Motor:** PostgreSQL 17 · Docker · PL/pgSQL

</div>

---

## 🗂️ Estructura de la Base de Datos

<table>
<thead>
<tr>
<th>🟩 Tabla</th>
<th>📋 Descripción</th>
<th>🔑 Clave</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>pizarras</code></td>
<td>Almacena los activos tecnológicos y su estado de disponibilidad.<br/>Estados: <code>Operativa</code> · <code>En Reparación</code> · <code>Fuera de Servicio</code></td>
<td>PK: <code>id_pizarra</code></td>
</tr>
<tr>
<td><code>tecnicos</code></td>
<td>Registro del personal técnico especializado encargado de atender incidencias.</td>
<td>PK: <code>id_tecnico</code></td>
</tr>
<tr>
<td><code>reportes_fallos</code></td>
<td>Entidad transaccional donde se registran las incidencias reportadas en los dispositivos.</td>
<td>PK: <code>id_reporte</code> · FK: pizarras, tecnicos</td>
</tr>
</tbody>
</table>

---

## ⚙️ Integridad Referencial

| Relación | Regla | Comportamiento |
|---|---|---|
| `reportes_fallos` → `pizarras` | **Propagar** | `ON DELETE CASCADE` — elimina reportes al retirar la pizarra |
| `reportes_fallos` → `tecnicos` | **Anular** | `ON DELETE SET NULL` — conserva reportes si el técnico es dado de baja |

---

## ⚡ Automatización con Triggers

```sql
-- Se activa automáticamente con cada INSERT en reportes_fallos
AFTER INSERT → FOR EACH ROW
  UPDATE pizarras SET estado = 'En Reparación'
  WHERE id_pizarra = NEW.id_pizarra;
```

> **¿Por qué `AFTER INSERT` y `FOR EACH ROW`?**  
> `AFTER` garantiza que la fila ya fue confirmada antes de propagar el cambio.  
> `FOR EACH ROW` permite acceder a `NEW.id_pizarra` de cada registro individualmente.

---

## 🚀 Ejecución y Despliegue

### 1️⃣ Levantar Contenedores

```bash
docker compose up -d
```

### 2️⃣ Verificar servicios activos

```bash
docker ps
```

### 3️⃣ Ejecutar Script Principal (MAIN)

```bash
docker exec -it postgres17 psql -U postgres -d db_reporte_fallos \
  -f docker-entrypoint-initdb.d/MAIN.sql
```

---

## 🧹 Mantenimiento Rutinario

```sql
-- Limpieza de tuplas muertas + actualización de estadísticas
VACUUM ANALYZE reportes_fallos;
```

| Comando | Función |
|---|---|
| `VACUUM` | Reclama espacio físico de registros obsoletos eliminados |
| `ANALYZE` | Actualiza estadísticas para que el planificador elija la ruta óptima |

---

## 🛠️ Stack Tecnológico

<div align="center">

| 🟪 Componente | 🟩 Tecnología |
|:---:|:---:|
| 🐘 Motor de Base de Datos | **PostgreSQL 17** |
| 🖥️ Gestión Visual | **pgAdmin 4** |
| 🐳 Contenedores | **Docker & Docker Compose** |
| 💾 Lenguaje | **SQL / PL/pgSQL** |
| 🔀 Control de Versiones | **Git & GitHub** |

</div>

---

<div align="center">

*Diplomado de Administración de Base de Datos e Inteligencia de Negocios*  
**Universitat Jaume I — UJI** 🎓

</div>