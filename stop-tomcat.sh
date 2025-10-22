#!/bin/bash

# Script para detener Apache Tomcat
# Uso: ./stop-tomcat.sh

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

TOMCAT_DIR="apache-tomcat-9.0.93"

echo -e "${BLUE}===========================================${NC}"
echo -e "${BLUE}  Deteniendo Apache Tomcat${NC}"
echo -e "${BLUE}===========================================${NC}"
echo ""

# Verificar que Tomcat está instalado
if [ ! -d "$TOMCAT_DIR" ]; then
    echo -e "${RED}❌ ERROR: Tomcat no está instalado${NC}"
    exit 1
fi

# Verificar si Tomcat está ejecutándose
if [ ! -f "$TOMCAT_DIR/temp/catalina.pid" ]; then
    echo -e "${YELLOW}⚠️  Tomcat no parece estar ejecutándose${NC}"
    exit 0
fi

PID=$(cat $TOMCAT_DIR/temp/catalina.pid)
if ! ps -p $PID > /dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  Tomcat no está ejecutándose (PID obsoleto)${NC}"
    rm -f $TOMCAT_DIR/temp/catalina.pid
    exit 0
fi

# Detener Tomcat
echo -e "${YELLOW}🛑 Deteniendo Tomcat (PID: $PID)...${NC}"
cd $TOMCAT_DIR/bin
./catalina.sh stop
cd ../..

# Esperar a que Tomcat se detenga
echo -e "${YELLOW}⏳ Esperando a que Tomcat se detenga...${NC}"
sleep 2

echo ""
echo -e "${GREEN}✅ Tomcat detenido correctamente!${NC}"
echo ""
