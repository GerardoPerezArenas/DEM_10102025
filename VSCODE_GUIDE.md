# Guía Rápida para VS Code

Esta guía te ayudará a configurar y ejecutar la aplicación Flexia18 directamente desde VS Code.

## 📦 Requisitos Previos

1. **Java JDK 8+** instalado y en el PATH
2. **VS Code** instalado
3. **(Opcional)** Extensiones recomendadas:
   - Extension Pack for Java (Microsoft)
   - Tomcat for Java (Wei Shen)

## 🚀 Opción 1: Usar el Script Automatizado (Recomendado)

### Paso 1: Abrir Terminal Integrada en VS Code

Presiona `` Ctrl+` `` (o `Cmd+` en Mac) para abrir la terminal integrada.

### Paso 2: Ejecutar el Script

**En Linux/macOS/WSL:**
```bash
./build-and-run.sh
```

**En Windows (PowerShell o CMD):**
```batch
build-and-run.bat
```

### Paso 3: Acceder a la Aplicación

Abre tu navegador y ve a: **http://localhost:8080/Flexia18/**

### Paso 4: Detener Tomcat

Presiona `Ctrl+C` en la terminal o ejecuta:
```bash
./stop-tomcat.sh      # Linux/macOS
```

---

## ⚙️ Opción 2: Configurar Tareas de VS Code

Para una mejor integración con VS Code, crea archivos de configuración:

### 1. Crear `.vscode/tasks.json`

Crea el archivo `.vscode/tasks.json` con este contenido:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "🚀 Build and Run Flexia18",
      "type": "shell",
      "command": "./build-and-run.sh",
      "windows": {
        "command": ".\\build-and-run.bat"
      },
      "problemMatcher": [],
      "presentation": {
        "reveal": "always",
        "panel": "new"
      },
      "group": {
        "kind": "build",
        "isDefault": true
      }
    },
    {
      "label": "🔨 Compile Only",
      "type": "shell",
      "command": "./compile.sh",
      "problemMatcher": ["$javac"],
      "group": "build"
    },
    {
      "label": "▶️ Start Tomcat",
      "type": "shell",
      "command": "./start-tomcat.sh",
      "problemMatcher": [],
      "presentation": {
        "reveal": "always",
        "panel": "new"
      }
    },
    {
      "label": "⏹️ Stop Tomcat",
      "type": "shell",
      "command": "./stop-tomcat.sh",
      "problemMatcher": []
    }
  ]
}
```

### 2. Usar las Tareas

- Presiona `Ctrl+Shift+B` para ejecutar "Build and Run Flexia18"
- O presiona `Ctrl+Shift+P` y escribe "Tasks: Run Task"

---

## 🎯 Opción 3: Usar la Extensión "Tomcat for Java"

### Instalación

1. Abre VS Code
2. Ve a Extensiones (`Ctrl+Shift+X`)
3. Busca "Tomcat for Java" por Wei Shen
4. Haz clic en "Install"

### Configuración

1. Descarga Tomcat manualmente desde https://tomcat.apache.org/download-90.cgi
2. Extráelo en algún lugar (por ejemplo, `C:\tomcat9` o `~/tomcat9`)
3. En VS Code:
   - Presiona `Ctrl+Shift+P`
   - Escribe "Tomcat: Add Tomcat Server"
   - Selecciona la carpeta donde extrajiste Tomcat

### Desplegar la Aplicación

1. Primero compila la aplicación:
   ```bash
   ./compile.sh
   ```

2. Copia el directorio `build/` al directorio webapps de Tomcat:
   ```bash
   cp -r build/ ~/tomcat9/webapps/Flexia18/
   ```

3. En VS Code:
   - Click derecho en tu servidor Tomcat en la vista "Tomcat Servers"
   - Selecciona "Start Tomcat Server"

4. Abre http://localhost:8080/Flexia18/

---

## 🐛 Depuración (Debug)

### Configuración de Debug Remoto

1. Crea `.vscode/launch.json`:

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

2. Modifica el archivo `start-tomcat.sh` para añadir opciones de debug:

Añade esta línea antes de `exec`:
```bash
export CATALINA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"
```

3. Inicia Tomcat con el script modificado
4. En VS Code, ve a la vista "Run and Debug" (`Ctrl+Shift+D`)
5. Selecciona "Debug Tomcat" y presiona F5
6. Coloca breakpoints en tu código Java

---

## 📂 Estructura del Proyecto en VS Code

```
DEM_10102025/
├── .vscode/                    # Configuración de VS Code
│   ├── tasks.json             # Tareas automáticas
│   └── launch.json            # Configuración de debug
├── java/                       # Código fuente Java
├── web/                        # Archivos JSP, CSS, JavaScript
├── build/                      # Compilación (generado)
├── apache-tomcat-9.0.93/      # Tomcat (descargado)
├── build-and-run.sh           # Script principal (Linux/Mac)
├── build-and-run.bat          # Script principal (Windows)
├── compile.sh                 # Solo compilar
├── start-tomcat.sh            # Iniciar Tomcat
├── stop-tomcat.sh             # Detener Tomcat
└── README.md                  # Documentación
```

---

## 🔧 Solución de Problemas

### "Java no está instalado"

Verifica la instalación:
```bash
java -version
javac -version
```

Si no está instalado:
- Windows: https://adoptium.net/
- Mac: `brew install openjdk`
- Linux: `sudo apt install default-jdk`

### "Permission denied" al ejecutar scripts

En Linux/macOS, da permisos de ejecución:
```bash
chmod +x *.sh
```

### Puerto 8080 ya está en uso

1. Encuentra qué proceso usa el puerto:
   ```bash
   # Linux/Mac
   lsof -i :8080
   
   # Windows
   netstat -ano | findstr :8080
   ```

2. Detén el proceso o cambia el puerto de Tomcat en:
   `apache-tomcat-9.0.93/conf/server.xml`

### La aplicación no carga

1. Verifica los logs de Tomcat:
   ```bash
   tail -f apache-tomcat-9.0.93/logs/catalina.out
   ```

2. Verifica que la aplicación esté en:
   `apache-tomcat-9.0.93/webapps/Flexia18/`

### Cambios no se reflejan

1. Detén Tomcat
2. Limpia y recompila:
   ```bash
   rm -rf build/
   ./compile.sh
   ```
3. Vuelve a iniciar Tomcat

---

## 💡 Consejos Pro para VS Code

### Atajos de Teclado Útiles

- `` Ctrl+` ``: Abrir/cerrar terminal
- `Ctrl+Shift+B`: Ejecutar tarea de build por defecto
- `Ctrl+Shift+P`: Command Palette
- `F5`: Iniciar debugging
- `Ctrl+Shift+D`: Vista de Debug

### Configuración Recomendada

Añade a tu `.vscode/settings.json`:

```json
{
  "java.configuration.updateBuildConfiguration": "automatic",
  "files.encoding": "utf8",
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000,
  "editor.formatOnSave": true
}
```

### Snippets Útiles

Crea `.vscode/java.code-snippets` para snippets personalizados:

```json
{
  "JSP Page": {
    "prefix": "jsp",
    "body": [
      "<%@ page contentType=\"text/html; charset=UTF-8\" language=\"java\" %>",
      "<!DOCTYPE html>",
      "<html>",
      "<head>",
      "    <meta charset=\"UTF-8\">",
      "    <title>${1:Title}</title>",
      "</head>",
      "<body>",
      "    $0",
      "</body>",
      "</html>"
    ],
    "description": "Create JSP page template"
  }
}
```

---

## 🎉 ¡Listo!

Ahora deberías poder compilar y ejecutar Flexia18 directamente desde VS Code sin problemas.

Para más información, consulta:
- [SCRIPTS_README.md](SCRIPTS_README.md) - Documentación completa de los scripts
- [README.md](README.md) - Documentación del proyecto

¿Problemas? Revisa los logs o contacta al equipo de desarrollo.
