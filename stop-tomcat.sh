#!/bin/bash

# Script para detener Tomcat de forma limpia

TOMCAT_VERSION="9.0.93"
TOMCAT_DIR="apache-tomcat-${TOMCAT_VERSION}"

if [ -f "${TOMCAT_DIR}/bin/shutdown.sh" ]; then
    echo "Deteniendo Tomcat..."
    "${TOMCAT_DIR}/bin/shutdown.sh"
    sleep 2
    echo "✓ Tomcat detenido"
else
    echo "Tomcat no está instalado o no se encuentra en ${TOMCAT_DIR}"
    exit 1
fi
