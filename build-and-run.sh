#!/bin/bash

# Script para compilar y lanzar automáticamente la aplicación Flexia18 con Tomcat
# Autor: Copilot Assistant
# Descripción: Este script descarga Tomcat, compila el código Java y lanza la aplicación

set -e  # Salir si hay algún error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuración
TOMCAT_VERSION="9.0.93"
TOMCAT_DIR="apache-tomcat-${TOMCAT_VERSION}"
TOMCAT_ARCHIVE="apache-tomcat-${TOMCAT_VERSION}.tar.gz"
TOMCAT_URL="https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/${TOMCAT_ARCHIVE}"
APP_NAME="Flexia18"
BUILD_DIR="build"
WEBAPP_DIR="${TOMCAT_DIR}/webapps/${APP_NAME}"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Flexia18 - Build and Run Script${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Función para mostrar mensajes
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Paso 1: Verificar Java
log_info "Verificando instalación de Java..."
if ! command -v java &> /dev/null; then
    log_error "Java no está instalado. Por favor instale Java JDK 8 o superior."
    exit 1
fi

if ! command -v javac &> /dev/null; then
    log_error "javac (Java compiler) no está instalado. Por favor instale Java JDK."
    exit 1
fi

JAVA_VERSION=$(java -version 2>&1 | head -n 1)
log_info "Java encontrado: ${JAVA_VERSION}"
echo ""

# Paso 2: Descargar e instalar Tomcat si no existe
if [ ! -d "${TOMCAT_DIR}" ]; then
    log_info "Tomcat no encontrado. Descargando Tomcat ${TOMCAT_VERSION}..."
    
    if [ ! -f "${TOMCAT_ARCHIVE}" ]; then
        log_info "Descargando desde ${TOMCAT_URL}..."
        curl -L -o "${TOMCAT_ARCHIVE}" "${TOMCAT_URL}" || {
            log_error "Error al descargar Tomcat"
            exit 1
        }
    else
        log_info "Archivo de Tomcat ya existe, usando copia local..."
    fi
    
    log_info "Extrayendo Tomcat..."
    tar -xzf "${TOMCAT_ARCHIVE}" || {
        log_error "Error al extraer Tomcat"
        exit 1
    }
    
    # Dar permisos de ejecución a los scripts
    chmod +x "${TOMCAT_DIR}/bin/"*.sh
    
    log_info "Tomcat ${TOMCAT_VERSION} instalado correctamente"
else
    log_info "Tomcat ya está instalado en ${TOMCAT_DIR}"
fi
echo ""

# Paso 3: Detener Tomcat si está corriendo
log_info "Verificando si Tomcat está corriendo..."
if [ -f "${TOMCAT_DIR}/bin/shutdown.sh" ]; then
    "${TOMCAT_DIR}/bin/shutdown.sh" 2>/dev/null || true
    sleep 3
    log_info "Tomcat detenido (si estaba corriendo)"
fi
echo ""

# Paso 4: Limpiar build anterior
log_info "Limpiando compilación anterior..."
rm -rf "${BUILD_DIR}"
rm -rf "${WEBAPP_DIR}"
mkdir -p "${BUILD_DIR}/WEB-INF/classes"
mkdir -p "${BUILD_DIR}/WEB-INF/lib"
echo ""

# Paso 5: Compilar código Java
log_info "Compilando código Java..."

# Buscar todos los archivos .java
JAVA_FILES=$(find java/es -name "*.java" -type f)

# Nota: Este proyecto requiere dependencias de Flexia que no están disponibles
# Por ahora, intentaremos compilar lo que podamos
log_warn "NOTA: Este proyecto requiere librerías del framework Flexia que no están incluidas."
log_warn "La compilación puede fallar debido a dependencias faltantes."
log_warn "Si tiene las librerías de Flexia, colóquelas en el directorio 'lib/'."
echo ""

# Verificar si existe directorio lib con dependencias
if [ -d "lib" ] && [ "$(ls -A lib/*.jar 2>/dev/null)" ]; then
    log_info "Encontradas librerías en directorio lib/, incluyéndolas en el classpath..."
    CLASSPATH=$(find lib -name "*.jar" -type f | tr '\n' ':')
    
    javac -encoding UTF-8 \
          -d "${BUILD_DIR}/WEB-INF/classes" \
          -cp "${CLASSPATH}" \
          ${JAVA_FILES} 2>&1 | tee compile.log || {
        log_warn "La compilación falló. Esto es esperado si faltan las dependencias de Flexia."
        log_info "Continuando con la estructura de la aplicación web..."
    }
else
    log_warn "No se encontraron librerías en directorio lib/"
    log_info "Creando estructura de aplicación web sin compilar..."
fi
echo ""

# Paso 6: Copiar archivos web (JSP, CSS, JavaScript)
log_info "Copiando archivos web..."

# Copiar estructura web
if [ -d "web" ]; then
    cp -r web/* "${BUILD_DIR}/" || true
fi

# Copiar archivos de propiedades
if [ -f "java/MELANBIDE11.properties" ]; then
    cp java/MELANBIDE11.properties "${BUILD_DIR}/WEB-INF/classes/" || true
fi

# Copiar archivos de recursos i18n si existen
if [ -d "java/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n" ]; then
    mkdir -p "${BUILD_DIR}/WEB-INF/classes/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n"
    cp -r java/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n/* \
          "${BUILD_DIR}/WEB-INF/classes/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n/" || true
fi
echo ""

# Paso 7: Crear web.xml básico si no existe
if [ ! -f "${BUILD_DIR}/WEB-INF/web.xml" ]; then
    log_info "Creando web.xml básico..."
    cat > "${BUILD_DIR}/WEB-INF/web.xml" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                             http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">
    
    <display-name>Flexia18 - MELANBIDE11 Module</display-name>
    
    <description>
        Módulo de integración con Lanbide para gestión de contratos de empleo
    </description>
    
    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>index.html</welcome-file>
    </welcome-file-list>
    
    <!-- Configuración de encoding UTF-8 -->
    <filter>
        <filter-name>encodingFilter</filter-name>
        <filter-class>org.apache.catalina.filters.SetCharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
        <init-param>
            <param-name>ignore</param-name>
            <param-value>false</param-value>
        </init-param>
    </filter>
    
    <filter-mapping>
        <filter-name>encodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
    
</web-app>
EOF
fi
echo ""

# Paso 8: Crear página de inicio si no existe
if [ ! -f "${BUILD_DIR}/index.jsp" ] && [ ! -f "${BUILD_DIR}/index.html" ]; then
    log_info "Creando página de inicio..."
    cat > "${BUILD_DIR}/index.jsp" << 'EOF'
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flexia18 - MELANBIDE11</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 3px solid #007bff;
            padding-bottom: 10px;
        }
        .info-box {
            background-color: #e7f3ff;
            border-left: 4px solid #007bff;
            padding: 15px;
            margin: 20px 0;
        }
        .success {
            background-color: #d4edda;
            border-left: 4px solid #28a745;
            color: #155724;
            padding: 15px;
            margin: 20px 0;
        }
        ul {
            line-height: 1.8;
        }
        code {
            background-color: #f4f4f4;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: monospace;
        }
        .footer {
            margin-top: 30px;
            text-align: center;
            color: #666;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 Flexia18 - MELANBIDE11 Module</h1>
        
        <div class="success">
            <strong>✓ ¡Aplicación desplegada correctamente!</strong>
        </div>
        
        <div class="info-box">
            <h2>Información del Módulo</h2>
            <p>Este es el módulo de integración con Lanbide (servicio de empleo del País Vasco) para:</p>
            <ul>
                <li>Registro y gestión de contratos de subsidios de empleo</li>
                <li>Seguimiento de subsidios de minimis</li>
                <li>Cálculos de desglose salarial (RSB)</li>
                <li>Integración con bases de datos de empleo externas</li>
            </ul>
        </div>
        
        <h2>Información Técnica</h2>
        <ul>
            <li><strong>Servidor:</strong> <%= application.getServerInfo() %></li>
            <li><strong>Servlet API:</strong> <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %></li>
            <li><strong>Encoding:</strong> <%= response.getCharacterEncoding() %></li>
            <li><strong>Context Path:</strong> <%= request.getContextPath() %></li>
        </ul>
        
        <h2>Recursos Disponibles</h2>
        <ul>
            <li><a href="jsp/extension/melanbide11/">JSP Pages</a></li>
            <li><a href="scripts/extension/melanbide11/">JavaScript Resources</a></li>
            <li><a href="css/extension/melanbide11/">CSS Stylesheets</a></li>
        </ul>
        
        <div class="footer">
            <p>MELANBIDE11 Module - Altia Flexia Framework</p>
            <p>© 2025 - Sistema de Gestión de Empleo</p>
        </div>
    </div>
</body>
</html>
EOF
fi
echo ""

# Paso 9: Copiar aplicación a Tomcat webapps
log_info "Desplegando aplicación en Tomcat..."
mkdir -p "${TOMCAT_DIR}/webapps"
cp -r "${BUILD_DIR}" "${WEBAPP_DIR}"
log_info "Aplicación desplegada en ${WEBAPP_DIR}"
echo ""

# Paso 10: Lanzar Tomcat
log_info "Iniciando Tomcat..."
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Tomcat se está iniciando...${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "La aplicación estará disponible en:"
echo -e "${BLUE}  http://localhost:8080/${APP_NAME}/${NC}"
echo ""
echo -e "Para detener Tomcat, presione ${YELLOW}Ctrl+C${NC} o ejecute:"
echo -e "${YELLOW}  ./${TOMCAT_DIR}/bin/shutdown.sh${NC}"
echo ""
echo -e "${GREEN}Logs de Tomcat:${NC}"
echo -e "----------------------------------------"
echo ""

# Ejecutar Tomcat con logs en consola
exec "${TOMCAT_DIR}/bin/catalina.sh" run
