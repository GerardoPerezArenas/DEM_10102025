# Scripts de Compilación y Despliegue

Este directorio contiene scripts automatizados para facilitar el desarrollo, compilación y despliegue de la aplicación Flexia18.

## 🚀 Script Principal: build-and-run.sh

Este es el script **TODO-EN-UNO** que hace todo automáticamente:
- ✅ Descarga e instala Apache Tomcat 9.0.93
- ✅ Compila el código Java
- ✅ Crea la estructura WAR
- ✅ Despliega la aplicación
- ✅ Lanza Tomcat

### Uso Rápido

```bash
./build-and-run.sh
```

La aplicación estará disponible en: **http://localhost:8080/Flexia18/**

Para detener: Presiona `Ctrl+C` o ejecuta `./stop-tomcat.sh`

## 📋 Scripts Adicionales

### compile.sh
Compila solo el código Java sin lanzar Tomcat. Útil para desarrollo.

```bash
./compile.sh
```

### start-tomcat.sh
Inicia Tomcat (asume que ya está instalado y la app desplegada).

```bash
./start-tomcat.sh
```

### stop-tomcat.sh
Detiene Tomcat de forma limpia.

```bash
./stop-tomcat.sh
```

## 📁 Estructura Generada

Después de ejecutar `build-and-run.sh`, se crearán estos directorios:

```
.
├── apache-tomcat-9.0.93/          # Instalación de Tomcat
│   └── webapps/
│       └── Flexia18/              # Tu aplicación desplegada
├── build/                          # Build temporal
└── apache-tomcat-9.0.93.tar.gz    # Archivo de Tomcat descargado
```

## ⚙️ Requisitos

- **Java JDK 8 o superior**: Para compilar y ejecutar
- **curl**: Para descargar Tomcat (normalmente ya instalado)
- **Sistema Operativo**: Linux, macOS, o WSL en Windows

## 🔧 Configuración

### Cambiar la versión de Tomcat

Edita las primeras líneas de `build-and-run.sh`:

```bash
TOMCAT_VERSION="9.0.93"  # Cambia a la versión deseada
```

### Añadir Dependencias del Framework Flexia

Si tienes acceso a las librerías del framework Flexia:

1. Crea un directorio `lib/` en la raíz del proyecto
2. Coloca todos los archivos `.jar` necesarios en `lib/`
3. Los scripts los detectarán automáticamente y los usarán en la compilación

```bash
mkdir lib
cp /ruta/a/flexia-*.jar lib/
cp /ruta/a/otras-dependencias.jar lib/
```

## 🐛 Solución de Problemas

### "Java no está instalado"

Instala Java JDK:

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install default-jdk

# macOS (con Homebrew)
brew install openjdk

# Windows
# Descarga desde https://adoptium.net/
```

### "La compilación falló"

Esto es **normal** si no tienes las dependencias del framework Flexia. La aplicación web se creará de todas formas y podrás:
- Ver los archivos JSP, CSS y JavaScript
- Probar la estructura de la aplicación
- Desarrollar el frontend

Para una compilación completa, necesitas las librerías de Flexia en el directorio `lib/`.

### Puerto 8080 ya está en uso

Si el puerto 8080 ya está siendo usado:

1. Detén el otro servicio que usa el puerto
2. O edita `apache-tomcat-9.0.93/conf/server.xml` y cambia el puerto:
   ```xml
   <Connector port="8081" protocol="HTTP/1.1" ... />
   ```

### Tomcat no arranca

Verifica los logs:
```bash
tail -f apache-tomcat-9.0.93/logs/catalina.out
```

## 💡 Consejos para VS Code

### Ejecutar desde VS Code

1. Abre la terminal integrada (`` Ctrl+` `` o `Cmd+` `)
2. Ejecuta: `./build-and-run.sh`

### Crear una tarea de VS Code

Crea `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Build and Run Flexia18",
      "type": "shell",
      "command": "./build-and-run.sh",
      "problemMatcher": [],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    },
    {
      "label": "Stop Tomcat",
      "type": "shell",
      "command": "./stop-tomcat.sh",
      "problemMatcher": []
    }
  ]
}
```

Luego: `Ctrl+Shift+B` para compilar y ejecutar.

### Lanzar configuración

Crea `.vscode/launch.json` para debugging remoto:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "java",
      "name": "Debug Tomcat",
      "request": "attach",
      "hostName": "localhost",
      "port": 8000
    }
  ]
}
```

Modifica `start-tomcat.sh` para añadir opciones de debug:
```bash
export CATALINA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"
```

## 📝 Notas Adicionales

- Los scripts están diseñados para ser ejecutados desde la raíz del proyecto
- Todos los scripts manejan errores y muestran mensajes informativos
- Los colores en la terminal ayudan a identificar información, advertencias y errores
- El script principal (`build-and-run.sh`) es idempotente: puedes ejecutarlo múltiples veces

## 🆘 Ayuda

Si encuentras problemas:

1. Verifica que Java está instalado: `java -version`
2. Verifica permisos de ejecución: `ls -la *.sh`
3. Revisa los logs de compilación en `compile.log`
4. Revisa los logs de Tomcat en `apache-tomcat-9.0.93/logs/`

¡Feliz desarrollo! 🎉
