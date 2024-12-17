#!/bin/bash

# Mensaje inicial
echo "=== Verificando la conexión SSH con GitHub ==="

# Verificar la conexión SSH con GitHub
ssh -T git@github.com

# Mensaje indicando que se cambiará al directorio del proyecto
echo "Cambiando al directorio del proyecto /home/grp_app/MotorContable/..."

# Navegar al directorio del proyecto
cd /home/grp_app/MotorContable/ || { echo "Error: No se pudo acceder al directorio del proyecto."; exit 1; }

# Descartar cambios locales
echo "Descartando cambios locales..."
git reset --hard  # Restaura todos los archivos rastreados al último commit
git clean -fd     # Elimina archivos y directorios sin seguimiento
echo "Cambios locales descartados exitosamente."

# Mensaje indicando que se actualizará el repositorio
echo "Actualizando el repositorio local con los últimos cambios del repositorio remoto..."
git pull origin main || { echo "Error: No se pudo actualizar el repositorio."; exit 1; }

# Limpiar el sistema
echo "Limpiando el sistema..."
ant clean || { echo "Error: Falló el proceso de limpieza con 'ant clean'."; exit 1; }
echo "Sistema limpiado exitosamente."

# Construir el sistema
echo "Construyendo el sistema..."
ant build || { echo "Error: Falló el proceso de construcción con 'ant build'."; exit 1; }
echo "Sistema construido exitosamente."

# Levantar el sistema
echo "Levantando el sistema..."
./startgrp.sh || { echo "Error: Falló al intentar levantar el sistema con 'startgrp.sh'."; exit 1; }
echo "Sistema levantado exitosamente."

# Mensaje final
echo "=== Proceso completado exitosamente ==="
