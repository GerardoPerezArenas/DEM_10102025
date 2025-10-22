#!/bin/bash

# Script para lanzar Tomcat (asume que ya está instalado y la app desplegada)

TOMCAT_VERSION="9.0.93"
TOMCAT_DIR="apache-tomcat-${TOMCAT_VERSION}"
APP_NAME="Flexia18"

if [ ! -d "${TOMCAT_DIR}" ]; then
    echo "ERROR: Tomcat no está instalado."
    echo "Ejecute primero ./build-and-run.sh para instalar y configurar Tomcat."
    exit 1
fi

echo "Iniciando Tomcat..."
echo ""
echo "La aplicación estará disponible en:"
echo "  http://localhost:8080/${APP_NAME}/"
echo ""
echo "Para detener Tomcat:"
echo "  ./stop-tomcat.sh"
echo "  o presione Ctrl+C"
echo ""

exec "${TOMCAT_DIR}/bin/catalina.sh" run
