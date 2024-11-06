#!/bin/bash

OFBIZ_LOG="runtime/logs/console.log"
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

# Ejecutar OfBiz
java $VMARGS -jar ofbiz.jar | tee "$OFBIZ_LOG"

