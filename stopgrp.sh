#!/bin/sh

######
# Script para detener OFBiz utilizando el PID del proceso, si está en ejecución.
######

# Ubicación del ejecutable de Java
if [ -f "$JAVA_HOME/bin/java" ]; then
  JAVA=$JAVA_HOME/bin/java
else
  JAVA=java
fi

# Configuración para apagar OFBiz
ADMIN_PORT=10523
ADMIN_KEY=so3du5kasd5dn

# Función para encontrar el PID del proceso de OFBiz
get_ofbiz_pid() {
  pgrep -f "ofbiz.jar"  # Busca el PID del proceso que incluye "ofbiz.jar"
}

# Detener OFBiz
echo "Deteniendo OFBiz..."

# Intentar encontrar y detener el proceso mediante su PID
PID=$(get_ofbiz_pid)

if [ -n "$PID" ]; then
  echo "OFBiz está en ejecución con el PID: $PID. Intentando detenerlo..."
  kill $PID  # Mata el proceso usando su PID
  if [ $? -eq 0 ]; then
    echo "OFBiz se detuvo correctamente."
  else
    echo "Error al detener OFBiz. Verifique los permisos o el estado del proceso."
  fi
else
  echo "OFBiz no está en ejecución. No se encontró ningún proceso para detener."
fi
