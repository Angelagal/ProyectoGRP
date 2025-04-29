#!/bin/bash

# Ruta del log de OfBiz
OFBIZ_LOG="runtime/logs/console.log"

# Eliminar el archivo de log anterior
rm -f "$OFBIZ_LOG"

# Ajustes de memoria
MEMIF="-Xms2048M -Xmx8192M"  # Asignación de 2 GB mínimo y 8 GB máximo de memoria
DEBUG="-Dsun.rmi.server.exceptionTrace=true"
MISC="-Duser.language=es -noverify"

# Desactivar el límite de overhead de GC
GC_OPTS="-XX:-UseGCOverheadLimit"

# Argumentos adicionales de la JVM
VMARGS="$MEMIF $MISC $DEBUG $GC_OPTS"

# Configuración de biblioteca criptográfica
VMARGS="-Xbootclasspath/p:applications/accounting/lib/cryptix.jar $VMARGS"

# Ejecutar GRP en segundo plano con nohup
echo "Iniciando GRP en segundo plano..."
nohup java $VMARGS -jar ofbiz.jar > "$OFBIZ_LOG" 2>&1 &
echo "Proceso iniciado. Revisa los logs en $OFBIZ_LOG"

# Opcional: Mostrar el PID del proceso iniciado
echo "PID del proceso: $!"