<<<<<<< HEAD
# Configuración de Servidor Web Apache con Virtual Hosts

Este proyecto documenta la instalación y configuración de un servidor web Apache en una máquina virtual (Ubuntu/Debian) para alojar dos sitios web independientes utilizando el concepto de **Virtual Hosting**.

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
=======
# proyecto
Diseño, implementación y administración de una infraestructura de servicios en Linux que incluye servidores web, base de datos, automatización de tareas, monitoreo del sistema y gestión de procesos mediante Bash scripting
>>>>>>> 7164574d290d8586af8a4554d8f6451395a0136d
