#!/bin/bash

# Script de demostración que muestra cómo funcionaría build-and-run.sh
# Este script simula el proceso sin necesidad de descargar Tomcat

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Demostración Build and Run${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Paso 1: Verificar Java
echo -e "${GREEN}[1/6]${NC} Verificando Java..."
java -version 2>&1 | head -n 1
echo ""

# Paso 2: Crear estructura de build
echo -e "${GREEN}[2/6]${NC} Creando estructura de directorios..."
rm -rf demo-build
mkdir -p demo-build/WEB-INF/classes
mkdir -p demo-build/WEB-INF/lib
echo "✓ Estructura creada"
echo ""

# Paso 3: Copiar archivos web
echo -e "${GREEN}[3/6]${NC} Copiando archivos web..."
if [ -d "web" ]; then
    cp -r web/* demo-build/
    echo "✓ $(find web -type f | wc -l) archivos copiados"
else
    echo "⚠ No se encontró directorio web/"
fi
echo ""

# Paso 4: Copiar propiedades
echo -e "${GREEN}[4/6]${NC} Copiando archivos de configuración..."
if [ -f "java/MELANBIDE11.properties" ]; then
    cp java/MELANBIDE11.properties demo-build/WEB-INF/classes/
    echo "✓ MELANBIDE11.properties copiado"
fi
echo ""

# Paso 5: Crear web.xml
echo -e "${GREEN}[5/6]${NC} Creando web.xml..."
cat > demo-build/WEB-INF/web.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                             http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">
    <display-name>Flexia18 - MELANBIDE11 Module</display-name>
    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>
</web-app>
EOF
echo "✓ web.xml creado"
echo ""

# Paso 6: Crear index.jsp
echo -e "${GREEN}[6/6]${NC} Creando página de inicio..."
cat > demo-build/index.jsp << 'EOF'
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flexia18 - MELANBIDE11</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h1 { color: #007bff; border-bottom: 3px solid #007bff; padding-bottom: 10px; }
        .success { background-color: #d4edda; border-left: 4px solid #28a745; color: #155724; padding: 15px; margin: 20px 0; }
        ul { line-height: 1.8; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 Flexia18 - MELANBIDE11 Module</h1>
        <div class="success">
            <strong>✓ ¡Aplicación desplegada correctamente!</strong>
        </div>
        <p>Este es el módulo de integración con Lanbide (servicio de empleo del País Vasco)</p>
        <h2>Información Técnica</h2>
        <ul>
            <li><strong>Servidor:</strong> <%= application.getServerInfo() %></li>
            <li><strong>Context Path:</strong> <%= request.getContextPath() %></li>
        </ul>
    </div>
</body>
</html>
EOF
echo "✓ index.jsp creado"
echo ""

# Resumen
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Demostración Completada${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "Estructura de la aplicación web creada en: demo-build/"
echo ""
echo "Contenido:"
find demo-build -type f | sort | while read file; do
    echo "  - $file"
done
echo ""
echo -e "${GREEN}La aplicación está lista para ser desplegada en Tomcat${NC}"
echo ""

# Mostrar el index.jsp creado
echo -e "${YELLOW}Vista previa del index.jsp:${NC}"
echo "========================================"
head -20 demo-build/index.jsp
echo "..."
echo "========================================"
echo ""

echo -e "${GREEN}✓ Todo listo!${NC}"
echo ""
echo "Para desplegar en Tomcat real:"
echo "1. Descarga Tomcat desde https://tomcat.apache.org/"
echo "2. Copia demo-build/ a {TOMCAT_HOME}/webapps/Flexia18/"
echo "3. Inicia Tomcat y accede a http://localhost:8080/Flexia18/"
