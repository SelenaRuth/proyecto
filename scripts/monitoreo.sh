#!/bin/bash

# --- Configuración ---
LOG_FILE="/home/ruu/monitoreo_recursos.log"
FECHA=$(date +"%Y-%m-%d %H:%M:%S")

# --- Nueva forma de capturar CPU (más robusta) ---
# Buscamos el valor de 'id' (idle), lo limpiamos de letras y restamos de 100
IDLE=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $4}' | awk '{print $1}' | cut -d. -f1 | cut -d, -f1)
CPU_USO=$((100 - IDLE))

# Si por algo sale vacío, ponemos 0
if test -z "$CPU_USO"; then CPU_USO=0; fi

# --- Alerta de CPU (Usamos 1 para la prueba) ---
if test $CPU_USO -gt 1; then
    # Buscamos el proceso que más consume
    PROCESO=$(ps -eo %cpu,command --sort=-%cpu | head -2 | tail -1)
    echo "[$FECHA] ALERTA: CPU excedido - Uso actual: $CPU_USO% - Proceso: $PROCESO" >> $LOG_FILE
fi

# --- Alerta de Disco ---
DISCO_USO=$(df / | grep / | awk '{print $5}' | sed 's/%//')
if test $DISCO_USO -gt 90; then
    echo "[$FECHA] ALERTA: DISCO casi lleno - Uso: $DISCO_USO%" >> $LOG_FILE
fi