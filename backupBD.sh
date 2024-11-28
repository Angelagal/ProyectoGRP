#!/bin/bash
# Script para realizar respaldo automático de una base de datos PostgreSQL.
# Autor: Alfonso (Alias: Zero)

# Variables de configuración
PG_HOST="30.0.0.70"         # Dirección IP del servidor PostgreSQL.
PG_DB="contable"            # Nombre de la base de datos a respaldar.
PG_USER="postgres"          # Usuario de PostgreSQL con permisos de acceso.
PG_PASS="admin1234"         # Contraseña del usuario PostgreSQL.
BACKUP_DIR="/home/grp_bd/respaldos" # Ruta donde se guardará el respaldo.
DATE=$(date +"%Y%m%d_%H%M%S") # Fecha y hora actual en formato YYYYMMDD_HHMMSS.
BACKUP_FILE="${BACKUP_DIR}/contable_backup_${DATE}.sql" # Nombre completo del archivo de respaldo.

# Configuración del entorno
export PGPASSWORD=$PG_PASS  # Exporta la contraseña para que pg_dump pueda usarla sin solicitarla.

# Realiza el backup de la base de datos usando pg_dump
pg_dump -h $PG_HOST -U $PG_USER -F c -b -v -f $BACKUP_FILE $PG_DB
# -h: Especifica el host del servidor.
# -U: Usuario de la base de datos.
# -F c: Genera el archivo en formato comprimido personalizado.
# -b: Incluye datos binarios en el respaldo.
# -v: Modo verbose para mostrar detalles de la operación.
# -f: Especifica el archivo de salida.

# Verifica el resultado del comando pg_dump
if [ $? -eq 0 ]; then
    # Código de salida 0 indica éxito.
    echo "Backup exitoso: $BACKUP_FILE"
else
    # Código de salida distinto de 0 indica error.
    echo "Error en el backup"
fi

# Limpia la variable de entorno para evitar exposición de la contraseña
unset PGPASSWORD
