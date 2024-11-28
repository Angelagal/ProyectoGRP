#!/bin/bash

# Mensaje inicial
echo "Verificando la conexión SSH con GitHub..."

# Verificar la conexión SSH con GitHub
ssh -T git@github.com

# Mensaje indicando que se cambiará al directorio del proyecto
echo "Cambiando al directorio del proyecto /home/grp_app/MotorContable/..."

# Navegar al directorio del proyecto
cd /home/grp_app/MotorContable/

# Mensaje indicando que se actualizará el repositorio
echo "Actualizando el repositorio local con los últimos cambios del repositorio remoto..."

# Actualizar el repositorio local con los cambios remotos
git pull origin main

# Mensaje final
echo "Actualización completada exitosamente."