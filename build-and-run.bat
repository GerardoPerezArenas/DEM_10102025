@echo off
REM Script para compilar y lanzar Flexia18 con Tomcat en Windows
REM Autor: Copilot Assistant

echo ========================================
echo   Flexia18 - Build and Run Script
echo ========================================
echo.

REM Configuracion
set TOMCAT_VERSION=9.0.93
set TOMCAT_DIR=apache-tomcat-%TOMCAT_VERSION%
set TOMCAT_ARCHIVE=apache-tomcat-%TOMCAT_VERSION%.zip
set TOMCAT_URL=https://archive.apache.org/dist/tomcat/tomcat-9/v%TOMCAT_VERSION%/bin/%TOMCAT_ARCHIVE%
set APP_NAME=Flexia18
set BUILD_DIR=build
set WEBAPP_DIR=%TOMCAT_DIR%\webapps\%APP_NAME%

REM Verificar Java
echo [INFO] Verificando instalacion de Java...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Java no esta instalado. Por favor instale Java JDK 8 o superior.
    pause
    exit /b 1
)

javac -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] javac ^(Java compiler^) no esta instalado. Por favor instale Java JDK.
    pause
    exit /b 1
)

echo [INFO] Java encontrado
echo.

REM Descargar Tomcat si no existe
if not exist "%TOMCAT_DIR%" (
    echo [INFO] Tomcat no encontrado. Descargando Tomcat %TOMCAT_VERSION%...
    
    if not exist "%TOMCAT_ARCHIVE%" (
        echo [INFO] Descargando desde %TOMCAT_URL%...
        powershell -Command "Invoke-WebRequest -Uri '%TOMCAT_URL%' -OutFile '%TOMCAT_ARCHIVE%'"
        if %errorlevel% neq 0 (
            echo [ERROR] Error al descargar Tomcat
            pause
            exit /b 1
        )
    ) else (
        echo [INFO] Archivo de Tomcat ya existe, usando copia local...
    )
    
    echo [INFO] Extrayendo Tomcat...
    powershell -Command "Expand-Archive -Path '%TOMCAT_ARCHIVE%' -DestinationPath '.'"
    if %errorlevel% neq 0 (
        echo [ERROR] Error al extraer Tomcat
        pause
        exit /b 1
    )
    
    echo [INFO] Tomcat %TOMCAT_VERSION% instalado correctamente
) else (
    echo [INFO] Tomcat ya esta instalado en %TOMCAT_DIR%
)
echo.

REM Detener Tomcat si esta corriendo
echo [INFO] Deteniendo Tomcat si esta corriendo...
if exist "%TOMCAT_DIR%\bin\shutdown.bat" (
    call "%TOMCAT_DIR%\bin\shutdown.bat" >nul 2>&1
    timeout /t 3 /nobreak >nul
)
echo.

REM Limpiar build anterior
echo [INFO] Limpiando compilacion anterior...
if exist "%BUILD_DIR%" rd /s /q "%BUILD_DIR%"
if exist "%WEBAPP_DIR%" rd /s /q "%WEBAPP_DIR%"
mkdir "%BUILD_DIR%\WEB-INF\classes"
mkdir "%BUILD_DIR%\WEB-INF\lib"
echo.

REM Compilar Java
echo [INFO] Compilando codigo Java...
echo [WARN] NOTA: Este proyecto requiere librerias del framework Flexia que no estan incluidas.
echo [WARN] La compilacion puede fallar debido a dependencias faltantes.
echo.

REM Verificar si existe directorio lib
if exist "lib\*.jar" (
    echo [INFO] Encontradas librerias en directorio lib/, incluyendolas en el classpath...
    
    REM Construir classpath
    setlocal enabledelayedexpansion
    set CLASSPATH=
    for %%i in (lib\*.jar) do (
        set CLASSPATH=!CLASSPATH!%%i;
    )
    
    REM Compilar
    dir /s /b java\es\*.java > sources.txt
    javac -encoding UTF-8 -d "%BUILD_DIR%\WEB-INF\classes" -cp "!CLASSPATH!" @sources.txt 2>&1 | tee compile.log
    del sources.txt
    endlocal
) else (
    echo [WARN] No se encontraron librerias en lib/
    echo [INFO] Creando estructura de aplicacion web sin compilar...
)
echo.

REM Copiar archivos web
echo [INFO] Copiando archivos web...
if exist "web" (
    xcopy /E /I /Y "web\*" "%BUILD_DIR%\" >nul
)

REM Copiar propiedades
if exist "java\MELANBIDE11.properties" (
    copy "java\MELANBIDE11.properties" "%BUILD_DIR%\WEB-INF\classes\" >nul
)

REM Copiar recursos i18n
if exist "java\es\altia\flexia\integracion\moduloexterno\melanbide11\i18n" (
    mkdir "%BUILD_DIR%\WEB-INF\classes\es\altia\flexia\integracion\moduloexterno\melanbide11\i18n"
    xcopy /E /I /Y "java\es\altia\flexia\integracion\moduloexterno\melanbide11\i18n\*" "%BUILD_DIR%\WEB-INF\classes\es\altia\flexia\integracion\moduloexterno\melanbide11\i18n\" >nul
)
echo.

REM Crear web.xml si no existe
if not exist "%BUILD_DIR%\WEB-INF\web.xml" (
    echo [INFO] Creando web.xml basico...
    (
        echo ^<?xml version="1.0" encoding="UTF-8"?^>
        echo ^<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
        echo          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        echo          xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
        echo                              http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
        echo          version="3.1"^>
        echo     ^<display-name^>Flexia18 - MELANBIDE11 Module^</display-name^>
        echo     ^<welcome-file-list^>
        echo         ^<welcome-file^>index.jsp^</welcome-file^>
        echo         ^<welcome-file^>index.html^</welcome-file^>
        echo     ^</welcome-file-list^>
        echo ^</web-app^>
    ) > "%BUILD_DIR%\WEB-INF\web.xml"
)
echo.

REM Crear index.jsp si no existe
if not exist "%BUILD_DIR%\index.jsp" (
    if not exist "%BUILD_DIR%\index.html" (
        echo [INFO] Creando pagina de inicio...
        (
            echo ^<%%@ page contentType="text/html; charset=UTF-8" language="java" %%^>
            echo ^<!DOCTYPE html^>
            echo ^<html^>
            echo ^<head^>
            echo     ^<meta charset="UTF-8"^>
            echo     ^<title^>Flexia18 - MELANBIDE11^</title^>
            echo     ^<style^>
            echo         body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
            echo         .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; }
            echo         h1 { color: #007bff; }
            echo         .success { background-color: #d4edda; color: #155724; padding: 15px; }
            echo     ^</style^>
            echo ^</head^>
            echo ^<body^>
            echo     ^<div class="container"^>
            echo         ^<h1^>Flexia18 - MELANBIDE11 Module^</h1^>
            echo         ^<div class="success"^>^<strong^>Aplicacion funcionando correctamente^</strong^>^</div^>
            echo         ^<p^>Modulo de integracion con Lanbide para gestion de contratos de empleo.^</p^>
            echo     ^</div^>
            echo ^</body^>
            echo ^</html^>
        ) > "%BUILD_DIR%\index.jsp"
    )
)
echo.

REM Copiar aplicacion a Tomcat webapps
echo [INFO] Desplegando aplicacion en Tomcat...
if not exist "%TOMCAT_DIR%\webapps" mkdir "%TOMCAT_DIR%\webapps"
xcopy /E /I /Y "%BUILD_DIR%" "%WEBAPP_DIR%" >nul
echo [INFO] Aplicacion desplegada en %WEBAPP_DIR%
echo.

REM Lanzar Tomcat
echo [INFO] Iniciando Tomcat...
echo.
echo ========================================
echo   Tomcat se esta iniciando...
echo ========================================
echo.
echo La aplicacion estara disponible en:
echo   http://localhost:8080/%APP_NAME%/
echo.
echo Para detener Tomcat, presione Ctrl+C o ejecute:
echo   %TOMCAT_DIR%\bin\shutdown.bat
echo.
echo Logs de Tomcat:
echo ----------------------------------------
echo.

REM Ejecutar Tomcat
call "%TOMCAT_DIR%\bin\catalina.bat" run

pause
