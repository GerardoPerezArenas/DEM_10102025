#!/bin/bash

# Script para iniciar Apache Tomcat con la aplicación Flexia18
# Uso: ./start-tomcat.sh

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

TOMCAT_DIR="apache-tomcat-9.0.93"
CATALINA_HOME="$(pwd)/$TOMCAT_DIR"

echo -e "${BLUE}===========================================${NC}"
echo -e "${BLUE}  Iniciando Apache Tomcat con Flexia18${NC}"
echo -e "${BLUE}===========================================${NC}"
echo ""

# Verificar que Tomcat está instalado
if [ ! -d "$TOMCAT_DIR" ]; then
    echo -e "${RED}❌ ERROR: Tomcat no está instalado${NC}"
    echo -e "${YELLOW}Por favor, ejecuta primero: ./build-and-run.sh${NC}"
    exit 1
fi

# Dar permisos de ejecución a los scripts de Tomcat
echo -e "${YELLOW}📝 Configurando permisos...${NC}"
chmod +x $TOMCAT_DIR/bin/*.sh

# Verificar si Tomcat ya está ejecutándose
if [ -f "$TOMCAT_DIR/temp/catalina.pid" ]; then
    PID=$(cat $TOMCAT_DIR/temp/catalina.pid)
    if ps -p $PID > /dev/null 2>&1; then
        echo -e "${YELLOW}⚠️  Tomcat ya está ejecutándose (PID: $PID)${NC}"
        echo -e "${YELLOW}Para detenerlo, ejecuta: ./stop-tomcat.sh${NC}"
        exit 0
    fi
fi

# Iniciar Tomcat
echo -e "${GREEN}🚀 Iniciando Tomcat...${NC}"
cd $TOMCAT_DIR/bin
./catalina.sh start
cd ../..

# Esperar un momento para que Tomcat inicie
echo -e "${YELLOW}⏳ Esperando a que Tomcat inicie...${NC}"
sleep 3

echo ""
echo -e "${GREEN}✅ Tomcat iniciado correctamente!${NC}"
echo ""
echo -e "${BLUE}===========================================${NC}"
echo -e "${BLUE}  URLs de Acceso${NC}"
echo -e "${BLUE}===========================================${NC}"
echo ""
echo -e "${GREEN}📋 Aplicación Principal:${NC}"
echo -e "   http://localhost:8080/Flexia18/"
echo ""
echo -e "${GREEN}🧪 Página de Pruebas:${NC}"
echo -e "   http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_melanbide11.jsp"
echo ""
echo -e "${GREEN}🔬 Pruebas CRUD Automatizadas:${NC}"
echo -e "   http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_crud_automatizado.html"
echo ""
echo -e "${BLUE}===========================================${NC}"
echo ""
echo -e "${YELLOW}📖 Para ver los logs:${NC}"
echo -e "   tail -f $TOMCAT_DIR/logs/catalina.out"
echo ""
echo -e "${YELLOW}🛑 Para detener Tomcat:${NC}"
echo -e "   ./stop-tomcat.sh"
echo ""
