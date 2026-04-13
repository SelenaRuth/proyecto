#!/bin/bash

# 1. Actualizar los repositorios del sistema
echo "Actualizando índices de paquetes..."
sudo apt update -y

# 2. Instalar Apache2
echo "Instalando Apache2..."
sudo apt install apache2 -y

# 3. Asegurar que el servicio inicie automáticamente al arrancar el sistema
echo "Habilitando el servicio Apache"
sudo systemctl start apache2 -y