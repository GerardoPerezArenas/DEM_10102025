# 🚀 Inicio Rápido - Flexia18

¿Quieres compilar y lanzar la aplicación **AHORA MISMO**? Sigue estos pasos:

## Para usuarios de VS Code (Recomendado)

1. **Abre la terminal integrada** en VS Code (`` Ctrl+` ``)

2. **Ejecuta el script:**
   ```bash
   ./build-and-run.sh        # Linux/macOS/WSL
   build-and-run.bat         # Windows
   ```

3. **Espera** a que se descargue Tomcat y se compile (primera vez: ~2-3 minutos)

4. **Abre tu navegador** en: http://localhost:8080/Flexia18/

5. **Para detener**, presiona `Ctrl+C` en la terminal

**¡Eso es todo!** 🎉

---

## ¿Qué hace el script?

El script `build-and-run.sh` automáticamente:

✅ Descarga Apache Tomcat 9.0.93  
✅ Compila el código Java (si tienes las dependencias)  
✅ Crea la estructura WAR de la aplicación  
✅ Copia los archivos JSP, CSS y JavaScript  
✅ Despliega la aplicación en Tomcat  
✅ Inicia el servidor  

---

## Scripts Disponibles

| Script | Descripción |
|--------|-------------|
| `build-and-run.sh` | 🚀 TODO-EN-UNO: Compila, despliega y lanza |
| `compile.sh` | 🔨 Solo compila el proyecto |
| `start-tomcat.sh` | ▶️ Inicia Tomcat (requiere instalación previa) |
| `stop-tomcat.sh` | ⏹️ Detiene Tomcat limpiamente |
| `demo-build.sh` | 📦 Demo sin descargar Tomcat |

---

## Configuración de VS Code

El proyecto incluye configuración completa para VS Code:

- **Tareas automáticas** (`.vscode/tasks.json`)
  - Presiona `Ctrl+Shift+B` para compilar y ejecutar
  
- **Debug remoto** (`.vscode/launch.json`)
  - Depura código Java con breakpoints
  
- **Configuración optimizada** (`.vscode/settings.json`)
  - Codificación UTF-8, autoguardado, etc.

Ver [VSCODE_GUIDE.md](VSCODE_GUIDE.md) para guía completa.

---

## Solución de Problemas Comunes

### ❌ "Permission denied" al ejecutar script

```bash
chmod +x *.sh
```

### ❌ "Java not found"

Instala Java JDK 8 o superior:
- Windows: https://adoptium.net/
- macOS: `brew install openjdk`
- Linux: `sudo apt install default-jdk`

### ❌ "Port 8080 already in use"

Otro servicio está usando el puerto 8080. Opciones:

1. Detén el otro servicio
2. Cambia el puerto en `apache-tomcat-9.0.93/conf/server.xml`

### ❌ "Cannot download Tomcat"

Si no tienes internet o firewall bloquea la descarga:

1. Descarga manualmente: https://tomcat.apache.org/download-90.cgi
2. Coloca el archivo `.tar.gz` en la raíz del proyecto
3. Ejecuta el script nuevamente

### ❌ Compilación falla

**Esto es normal** si no tienes las librerías de Flexia. La aplicación web se creará de todas formas.

Si tienes las librerías:
1. Crea carpeta `lib/` en la raíz
2. Copia los `.jar` de Flexia ahí
3. Ejecuta `./compile.sh`

---

## Estructura del Proyecto

```
DEM_10102025/
├── 📂 .vscode/              # Configuración de VS Code
├── 📂 java/                 # Código fuente Java
│   └── es/altia/flexia/...
├── 📂 web/                  # Archivos web (JSP, CSS, JS)
│   ├── jsp/
│   ├── css/
│   └── scripts/
├── 📄 build-and-run.sh     # ⭐ Script principal (Linux/Mac)
├── 📄 build-and-run.bat    # ⭐ Script principal (Windows)
├── 📄 compile.sh           # Solo compilar
├── 📄 start-tomcat.sh      # Iniciar Tomcat
├── 📄 stop-tomcat.sh       # Detener Tomcat
├── 📄 QUICKSTART.md        # Este archivo
├── 📄 VSCODE_GUIDE.md      # Guía completa de VS Code
├── 📄 SCRIPTS_README.md    # Documentación de scripts
└── 📄 README.md            # Documentación del proyecto
```

---

## Próximos Pasos

Una vez que tengas la aplicación corriendo:

1. **Explora la aplicación**: http://localhost:8080/Flexia18/

2. **Revisa los archivos JSP**: `web/jsp/extension/melanbide11/`

3. **Modifica estilos**: `web/css/extension/melanbide11/`

4. **Edita JavaScript**: `web/scripts/extension/melanbide11/`

5. **Lee la documentación completa**: [README.md](README.md)

---

## Desarrollo Continuo

Para trabajar en el proyecto:

### Flujo de trabajo recomendado:

1. **Inicia Tomcat** una vez:
   ```bash
   ./start-tomcat.sh
   ```

2. **Edita archivos JSP/CSS/JS**
   - Los cambios se reflejan automáticamente
   - Solo refresca el navegador

3. **Si cambias código Java**:
   ```bash
   ./stop-tomcat.sh    # Detener
   ./compile.sh        # Compilar
   ./start-tomcat.sh   # Reiniciar
   ```

### Atajos de VS Code:

- `` Ctrl+` ``: Abrir terminal
- `Ctrl+Shift+B`: Compilar y ejecutar
- `Ctrl+P`: Búsqueda rápida de archivos
- `Ctrl+Shift+F`: Buscar en todos los archivos

---

## Recursos Adicionales

- 📘 [VSCODE_GUIDE.md](VSCODE_GUIDE.md) - Guía completa para VS Code
- 📗 [SCRIPTS_README.md](SCRIPTS_README.md) - Documentación de scripts
- 📕 [README.md](README.md) - Documentación técnica del proyecto

---

## ¿Necesitas Ayuda?

1. **Revisa los logs**:
   ```bash
   tail -f apache-tomcat-9.0.93/logs/catalina.out
   ```

2. **Verifica que Java está instalado**:
   ```bash
   java -version
   javac -version
   ```

3. **Limpia y vuelve a compilar**:
   ```bash
   rm -rf build/
   ./build-and-run.sh
   ```

---

¡Feliz desarrollo! 🎉

Si llevas dos horas intentándolo sin éxito, estos scripts deberían resolver tus problemas en menos de 5 minutos. 😊
