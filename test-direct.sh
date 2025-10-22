#!/bin/bash

# Script para acceder directamente a las pruebas MELANBIDE11
# Uso: ./test-direct.sh

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

TOMCAT_DIR="apache-tomcat-9.0.93"

clear
echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║                                                        ║${NC}"
echo -e "${CYAN}║       🧪 MELANBIDE11 - Acceso Directo a Pruebas       ║${NC}"
echo -e "${CYAN}║                                                        ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Verificar que Tomcat está instalado
if [ ! -d "$TOMCAT_DIR" ]; then
    echo -e "${RED}❌ ERROR: Tomcat no está instalado${NC}"
    echo -e "${YELLOW}Por favor, ejecuta primero: ./build-and-run.sh${NC}"
    exit 1
fi

# Verificar si Tomcat está ejecutándose
TOMCAT_RUNNING=false
if [ -f "$TOMCAT_DIR/temp/catalina.pid" ]; then
    PID=$(cat $TOMCAT_DIR/temp/catalina.pid)
    if ps -p $PID > /dev/null 2>&1; then
        TOMCAT_RUNNING=true
    fi
fi

if [ "$TOMCAT_RUNNING" = false ]; then
    echo -e "${YELLOW}⚠️  Tomcat no está ejecutándose${NC}"
    echo -e "${YELLOW}📝 Iniciando Tomcat...${NC}"
    echo ""
    ./start-tomcat.sh
    echo ""
    echo -e "${GREEN}✅ Tomcat iniciado${NC}"
    sleep 2
else
    echo -e "${GREEN}✅ Tomcat ya está ejecutándose${NC}"
fi

echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Opciones de Prueba Disponibles                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}1.${NC} Índice de Pruebas (recomendado)"
echo -e "   ${CYAN}http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_melanbide11.jsp${NC}"
echo ""
echo -e "${GREEN}2.${NC} Pruebas CRUD Automatizadas"
echo -e "   ${CYAN}http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_crud_automatizado.html${NC}"
echo ""
echo -e "${GREEN}3.${NC} Módulo Principal MELANBIDE11"
echo -e "   ${CYAN}http://localhost:8080/Flexia18/jsp/extension/melanbide11/melanbide11.jsp${NC}"
echo ""
echo -e "${GREEN}4.${NC} Nueva Contratación"
echo -e "   ${CYAN}http://localhost:8080/Flexia18/jsp/extension/melanbide11/nuevaContratacion.jsp${NC}"
echo ""
echo -e "${GREEN}5.${NC} Desglose RSB"
echo -e "   ${CYAN}http://localhost:8080/Flexia18/jsp/extension/melanbide11/desglose/m11Desglose.jsp${NC}"
echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Comandos Útiles                                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}📖 Ver logs en tiempo real:${NC}"
echo -e "   tail -f $TOMCAT_DIR/logs/catalina.out"
echo ""
echo -e "${YELLOW}🛑 Detener Tomcat:${NC}"
echo -e "   ./stop-tomcat.sh"
echo ""
echo -e "${YELLOW}🔄 Reiniciar Tomcat:${NC}"
echo -e "   ./stop-tomcat.sh && ./start-tomcat.sh"
echo ""
echo -e "${GREEN}🚀 Presiona Enter para abrir el Índice de Pruebas en el navegador...${NC}"
read -r

# Intentar abrir en el navegador
if command -v xdg-open > /dev/null 2>&1; then
    xdg-open "http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_melanbide11.jsp" &
elif command -v open > /dev/null 2>&1; then
    open "http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_melanbide11.jsp" &
else
    echo -e "${YELLOW}⚠️  No se pudo abrir el navegador automáticamente${NC}"
    echo -e "${YELLOW}Por favor, abre manualmente:${NC}"
    echo -e "${CYAN}http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_melanbide11.jsp${NC}"
fi

echo ""
echo -e "${GREEN}✨ ¡Listo para probar! Accede a las URLs anteriores${NC}"
echo ""
