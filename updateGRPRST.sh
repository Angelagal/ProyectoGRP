#!/bin/bash

# Modificar el datasource en el archivo entityengine.xml
echo "Modificando el archivo /framework/entity/config/entityengine.xml para actualizar el datasource..."

# Ruta al archivo entityengine.xml
entity_engine_file="/framework/entity/config/entityengine.xml"

# Validar que el archivo entityengine.xml existe
if [[ ! -f "$entity_engine_file" ]]; then
  echo "Error: El archivo $entity_engine_file no existe."
  exit 1
fi

# Eliminar el datasource existente y agregar el nuevo
sed -i '/<datasource name="localpostgres">/,/<\/datasource>/d' "$entity_engine_file"

# Insertar el nuevo datasource
cat <<EOL >> "$entity_engine_file"
<datasource name="localpostgres"
        helper-class="org.ofbiz.entity.datasource.GenericHelperDAO"
        schema-name="public"
        field-type-name="postgres"
        check-on-start="true"
        add-missing-on-start="true"
        use-fk-initially-deferred="false"
        alias-view-columns="false"
        join-style="ansi"
        use-binary-type-for-blob="true">
        <!-- use this attribute to make the EntityListIterator more effective for pgjdbc 7.5devel and later:
            result-fetch-size="50"
        -->
    <read-data reader-name="seed"/>
    <read-data reader-name="seed-initial"/>
    <read-data reader-name="demo"/>
    <read-data reader-name="ext"/>
    <inline-jdbc
            jdbc-driver="org.postgresql.Driver"
            jdbc-uri="jdbc:postgresql://172.16.10.2:5434/contable"
            jdbc-username="postgres"
            jdbc-password="admin123"
            isolation-level="ReadCommitted"
            pool-minsize="2"
            pool-maxsize="250"
            time-between-eviction-runs-millis="600000"/>
    <!-- <jndi-jdbc jndi-server-name="default" jndi-name="java:comp/env/jdbc/localpostgres" isolation-level="ReadCommitted"/>-->
    <!-- <jndi-jdbc jndi-server-name="default" jndi-name="comp/env/jdbc/xa/localpostgres" isolation-level="ReadCommitted"/> --> <!-- Orion Style JNDI name -->
    <!-- <jndi-jdbc jndi-server-name="localweblogic" jndi-name="PostgresDataSource"/> --> <!-- Weblogic Style JNDI name -->
    <!-- <jndi-jdbc jndi-server-name="default" jndi-name="jdbc/localpostgres" isolation-level="ReadCommitted"/> --> <!-- JRun4 Style JNDI name -->
    <!-- <tyrex-dataSource dataSource-name="localpostgres" isolation-level="ReadCommitted"/> -->
</datasource>
EOL

echo "El archivo /framework/entity/config/entityengine.xml se ha modificado exitosamente."

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
