#!/bin/bash

# Variables simples sin llaves
DB=gestion_escolar
CARPETA=/home/ruu/mis_respaldos
FECHA=$(date +%F_%R)

# En lugar de paréntesis cuadrados [ ], usamos el comando 'test'
if test ! -d $CARPETA; then
    mkdir -p $CARPETA
    echo Carpeta creada en $CARPETA
fi

# El comando de respaldo (sin llaves en las variables)
sudo mysqldump -u root $DB | gzip > $CARPETA/backup_db_$FECHA.sql.gz

echo Respaldo terminado en $CARPETA