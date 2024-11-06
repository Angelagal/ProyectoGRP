#!/bin/sh

if [ -f "$JAVA_HOME/bin/java" ]; then
  JAVA=$JAVA_HOME/bin/java
else
  JAVA=java
fi                                                                                                                                                                                         

ADMIN_PORT=10523
ADMIN_KEY=so3du5kasd5dn

RES=0
FIRST=1
echo "Stopping ofbiz"
while [ $RES -eq 0 ]; do
  if [ $FIRST -eq 1 ]; then
    FIRST=0
    $JAVA -Dofbiz.admin.port=$ADMIN_PORT -Dofbiz.admin.key=$ADMIN_KEY -jar ofbiz.jar -shutdown
  else
    sleep 2
    $JAVA -Dofbiz.admin.port=$ADMIN_PORT -Dofbiz.admin.key=$ADMIN_KEY -jar ofbiz.jar -shutdown > /dev/null 2> /dev/null
  fi
  RES=$?
done;