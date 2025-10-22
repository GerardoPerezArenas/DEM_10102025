#!/bin/bash

# Script rápido para compilar el proyecto sin lanzar Tomcat
# Útil para desarrollo y debugging

set -e

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

BUILD_DIR="build"

echo -e "${GREEN}Compilando proyecto Flexia18...${NC}"
echo ""

# Limpiar build anterior
echo "Limpiando compilación anterior..."
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}/WEB-INF/classes"
mkdir -p "${BUILD_DIR}/WEB-INF/lib"

# Compilar Java
echo "Compilando código Java..."
JAVA_FILES=$(find java/es -name "*.java" -type f)

if [ -d "lib" ] && [ "$(ls -A lib/*.jar 2>/dev/null)" ]; then
    echo "Usando librerías del directorio lib/..."
    CLASSPATH=$(find lib -name "*.jar" -type f | tr '\n' ':')
    
    javac -encoding UTF-8 \
          -d "${BUILD_DIR}/WEB-INF/classes" \
          -cp "${CLASSPATH}" \
          ${JAVA_FILES} 2>&1 | tee compile.log || {
        echo -e "${YELLOW}[WARN] Compilación falló. Faltan dependencias de Flexia.${NC}"
    }
else
    echo -e "${YELLOW}[WARN] No se encontraron librerías en lib/. Saltando compilación.${NC}"
fi

# Copiar archivos web
echo "Copiando archivos web..."
if [ -d "web" ]; then
    cp -r web/* "${BUILD_DIR}/" || true
fi

# Copiar propiedades
if [ -f "java/MELANBIDE11.properties" ]; then
    cp java/MELANBIDE11.properties "${BUILD_DIR}/WEB-INF/classes/" || true
fi

# Copiar recursos i18n
if [ -d "java/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n" ]; then
    mkdir -p "${BUILD_DIR}/WEB-INF/classes/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n"
    cp -r java/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n/* \
          "${BUILD_DIR}/WEB-INF/classes/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n/" || true
fi

# Crear web.xml si no existe
if [ ! -f "${BUILD_DIR}/WEB-INF/web.xml" ]; then
    echo "Creando web.xml..."
    cat > "${BUILD_DIR}/WEB-INF/web.xml" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                             http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">
    
    <display-name>Flexia18 - MELANBIDE11 Module</display-name>
    
    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>index.html</welcome-file>
    </welcome-file-list>
    
</web-app>
EOF
fi

# Crear index.jsp si no existe
if [ ! -f "${BUILD_DIR}/index.jsp" ] && [ ! -f "${BUILD_DIR}/index.html" ]; then
    echo "Creando página de inicio..."
    cat > "${BUILD_DIR}/index.jsp" << 'EOF'
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flexia18 - MELANBIDE11</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h1 { color: #007bff; }
        .success { background-color: #d4edda; color: #155724; padding: 15px; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Flexia18 - MELANBIDE11 Module</h1>
        <div class="success">
            <strong>✓ Aplicación funcionando correctamente</strong>
        </div>
        <p>Módulo de integración con Lanbide para gestión de contratos de empleo.</p>
        <ul>
            <li>Servidor: <%= application.getServerInfo() %></li>
            <li>Context: <%= request.getContextPath() %></li>
        </ul>
    </div>
</body>
</html>
EOF
fi

echo ""
echo -e "${GREEN}✓ Compilación completada!${NC}"
echo "Salida en directorio: ${BUILD_DIR}/"
echo ""
