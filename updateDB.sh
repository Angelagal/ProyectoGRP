#!/bin/bash

# Configuración
BACKUP_DIR="/home/grp_bd/respaldos"          # Carpeta donde se encuentra el respaldo
BACKUP_FILE="$BACKUP_DIR/contable_backup.dump" # Nombre del respaldo
DB_NAME="contable"                           # Nombre de la base de datos
DB_USER="postgres"                           # Usuario propietario de la base

# Verificar si el respaldo existe
if [ ! -f "$BACKUP_FILE" ]; then
  echo "Error: El archivo de respaldo $BACKUP_FILE no existe."
  exit 1
fi

# Eliminar la base de datos
echo "Eliminando la base de datos $DB_NAME..."	
psql -U "$DB_USER" -c "DROP DATABASE IF EXISTS $DB_NAME;"
if [ $? -ne 0 ]; then
  echo "Error al eliminar la base de datos."
  exit 1
fi

# Crear la base de datos nuevamente
echo "Creando la base de datos $DB_NAME..."
psql -U "$DB_USER" -c "CREATE DATABASE $DB_NAME;"
if [ $? -ne 0 ]; then
  echo "Error al crear la base de datos."
  exit 1
fi

# Restaurar el respaldo en la nueva base de datos
echo "Restaurando el respaldo en la base de datos $DB_NAME..."
pg_restore -U "$DB_USER" -d "$DB_NAME" "$BACKUP_FILE"
if [ $? -ne 0 ]; then
  echo "Error al restaurar el respaldo."
  exit 1
fi

echo "Proceso completado exitosamente."
