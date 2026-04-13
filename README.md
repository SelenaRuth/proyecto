# Implementación de Servidor Web

---

Este proyecto documenta la instalación y configuración de un servidor web Apache en una máquina virtual (Ubuntu) para alojar dos sitios web independientes utilizando el concepto de **Virtual Hosting**.

## 🚀 Requisitos del Proyecto
* Servidor Apache instalado.
* Configuración de dos dominios locales: `trespatitos.com` y `fundacion-uisil.com`.
* Sitios con contenido HTML y estilos CSS básicos.

---

## 🛠️ Paso 1: Instalación de Apache
Se procedió con la actualización de los repositorios y la instalación del paquete de servidor web:

```bash
sudo apt update
sudo apt install apache2
```

---

## 📂 Paso 2: Estructura de Directorios
Se crearon directorios independientes para cada sitio web con el fin de mantener la autonomía de los contenidos:

```Bash
sudo mkdir -p /var/www/empresa.local/html
sudo mkdir -p /var/www/curso.local/html
Se ajustaron los permisos de propiedad con chown para permitir la edición de archivos por parte del usuario actual.
```

---

# Implementación de Base de Datos
Se utilizó **MariaDB** para gestionar la base de datos `gestion_escolar`.

---

## Sistema de Gestión, Respaldo y Monitoreo en Linux

Este parte del proyecto consiste en la implementación de una base de datos MariaDB, la automatización de respaldos mediante Bash y un sistema de monitoreo de recursos del servidor.


* **Tablas creadas:** `estudiantes`, `cursos` e `inscripciones`.
* **Motor:** InnoDB.

---

# Automatización de Respaldos


Se desarrolló el script `respaldo.sh` que realiza las siguientes funciones:
* Verifica la existencia de la carpeta de destino.
* Realiza un dump de la base de datos.
* Comprime el archivo resultante en formato `.sql.gz`.
* Nombra el archivo con la fecha y hora actual: `backup_db_YYYY-MM-DD_HH-MM.sql.gz`.

## 2. 📚 Monitoreo de Recursos
El script `monitoreo.sh` supervisa el estado del servidor:
* **CPU:** Alerta si supera el 80%.
* **Disco:** Alerta si supera el 90%.
* Identifica el proceso que más recursos consume y lo registra en `monitoreo_recursos.log`.

## 3. 🤖 Automatización con Cron
Se configuraron las tareas programadas en el `crontab` del usuario:
```bash
# Respaldo cada 12 horas
0 */12 * * * /home/ruu/respaldo.sh

# Monitoreo de recursos cada minuto
* * * * * /home/ruu/monitoreo.sh
```
---

# Sistema de Monitoreo de Recursos

Se implementó un script de supervisión continua para garantizar la disponibilidad y el rendimiento del servidor.

## 🔎 Parámetros de Monitoreo:
* **CPU:** Límite de alerta al **80%**. Se utiliza `top` y `awk` para procesar el porcentaje de carga.
* **Disco:** Límite de alerta al **90%**. Se utiliza `df` para supervisar el espacio en la partición raíz.
* **Memoria RAM:** Supervisión mediante el comando `free`.

## ⚠️ Lógica de Alerta y Registro:
Cuando un recurso supera el umbral establecido, el script realiza automáticamente:
1. **Identificación:** Ejecuta `ps` para localizar el proceso con mayor consumo.
2. **Estampa de tiempo:** Registra la fecha y hora exacta del evento.
3. **Persistencia:** Guarda la alerta en el archivo `/home/ruu/proyecto_servidores/logs/monitoreo_recursos.log`.

**Ejemplo de salida en el Log:**
```text
[2026-04-13 01:29:15] ALERTA: CPU excedido - Uso actual: 85% - Proceso: 1100 apache2
```

### 🔁 Ejecución Automática
Para cumplir con el monitoreo en tiempo real, el script se programó en el demonio Cron para ejecutarse cada minuto:

Fragmento de código
``` 
* * * * * /home/ruu/proyecto_servidores/scripts/monitoreo.sh
```