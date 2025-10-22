# 🧪 Guía de Pruebas MELANBIDE11

Esta guía explica cómo acceder y ejecutar las pruebas del módulo MELANBIDE11 de forma directa.

## 🚀 Inicio Rápido

### Opción 1: Script de Acceso Directo (Recomendado)

Ejecuta el script que inicia Tomcat automáticamente y muestra todas las URLs de prueba:

```bash
./test-direct.sh
```

Este script:
- ✅ Verifica si Tomcat está ejecutándose
- ✅ Inicia Tomcat automáticamente si es necesario
- ✅ Muestra todas las URLs disponibles para pruebas
- ✅ Intenta abrir el navegador automáticamente

### Opción 2: Manual

1. **Iniciar Tomcat:**
   ```bash
   ./start-tomcat.sh
   ```

2. **Acceder a las pruebas:**
   Abre tu navegador en:
   - **Índice de Pruebas:** http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_melanbide11.jsp
   - **Pruebas CRUD:** http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_crud_automatizado.html

3. **Detener Tomcat:**
   ```bash
   ./stop-tomcat.sh
   ```

## 📋 Páginas de Prueba Disponibles

### 1. Índice de Pruebas (`test_melanbide11.jsp`)
**URL:** http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_melanbide11.jsp

Página principal que proporciona acceso organizado a:
- 🔬 Pruebas CRUD Automatizadas
- 📋 Módulo Principal MELANBIDE11
- ➕ Nueva Contratación
- 💰 Desglose RSB
- 🇪🇺 Ayudas de Minimis

### 2. Pruebas CRUD Automatizadas (`test_crud_automatizado.html`)
**URL:** http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_crud_automatizado.html

Sistema completo de pruebas automatizadas que incluye:

#### Funcionalidades:
- ✅ **Pruebas CRUD de Contrataciones**
  - Crear nueva contratación
  - Leer contrataciones existentes
  - Modificar contratación
  - Eliminar contratación

- ✅ **Validaciones**
  - Validación de DNI
  - Validación de fechas
  - Campos obligatorios
  - Formatos y longitudes

- ✅ **Pruebas de Desglose RSB**
  - Tab 1: Carga de datos RSB, cálculo de totales, guardado
  - Tab 2: Crear, modificar, eliminar complementos

- ✅ **Pruebas de UI**
  - Modal de complementos
  - Dropdown de concepto
  - Eliminación de scrolls horizontales

#### Controles Disponibles:
- 🚀 **Ejecutar Todas las Pruebas:** Ejecuta la batería completa
- ⏸️ **Detener Pruebas:** Detiene la ejecución en curso
- 🧹 **Limpiar Log:** Limpia el área de registro
- 📥 **Exportar Resultados:** Descarga los resultados en JSON

#### Estadísticas en Tiempo Real:
- Pruebas totales ejecutadas
- Pruebas exitosas
- Pruebas fallidas
- Porcentaje de progreso

## 🎯 Casos de Uso

### Desarrollador: Probar nueva funcionalidad
```bash
# 1. Inicia Tomcat
./start-tomcat.sh

# 2. Abre el navegador en:
# http://localhost:8080/Flexia18/jsp/extension/melanbide11/test_crud_automatizado.html

# 3. Ejecuta las pruebas relacionadas con tu cambio

# 4. Detén Tomcat cuando termines
./stop-tomcat.sh
```

### QA: Ejecutar suite completa de pruebas
```bash
# 1. Accede directamente con el script
./test-direct.sh

# 2. En el navegador, ve a "Pruebas CRUD Automatizadas"

# 3. Haz clic en "Ejecutar Todas las Pruebas"

# 4. Revisa el log y las estadísticas

# 5. Exporta los resultados
```

### Demostración: Mostrar el módulo
```bash
# 1. Ejecuta el script de acceso directo
./test-direct.sh

# 2. Abre "Índice de Pruebas" en el navegador

# 3. Navega por las diferentes secciones desde la interfaz visual
```

## 🛠️ Scripts Disponibles

### `test-direct.sh`
Script principal para acceso directo a pruebas.
- Verifica e inicia Tomcat si es necesario
- Muestra todas las URLs de prueba
- Intenta abrir el navegador automáticamente

### `start-tomcat.sh`
Inicia el servidor Apache Tomcat.
- Verifica la instalación
- Configura permisos
- Inicia Tomcat
- Muestra URLs de acceso

### `stop-tomcat.sh`
Detiene el servidor Apache Tomcat de forma limpia.
- Verifica si Tomcat está ejecutándose
- Detiene el servidor
- Limpia archivos PID

## 📊 Estructura de URLs

```
http://localhost:8080/Flexia18/jsp/extension/melanbide11/
├── test_melanbide11.jsp              # Índice de pruebas
├── test_crud_automatizado.html       # Pruebas CRUD automatizadas
├── melanbide11.jsp                   # Módulo principal
├── nuevaContratacion.jsp             # Alta de contrataciones
├── minimis.jsp                       # Gestión de minimis
└── desglose/
    └── m11Desglose.jsp               # Desglose RSB
```

## 🔍 Verificación y Logs

### Ver logs en tiempo real:
```bash
tail -f apache-tomcat-9.0.93/logs/catalina.out
```

### Verificar si Tomcat está ejecutándose:
```bash
ps aux | grep tomcat
```

### Verificar puerto 8080:
```bash
netstat -tuln | grep 8080
# o
lsof -i :8080
```

## 🐛 Solución de Problemas

### Tomcat no inicia
1. Verifica que el puerto 8080 no esté en uso
2. Revisa los logs: `cat apache-tomcat-9.0.93/logs/catalina.out`
3. Verifica permisos: `chmod +x apache-tomcat-9.0.93/bin/*.sh`

### Página no se encuentra (404)
1. Verifica que Tomcat esté ejecutándose: `ps aux | grep tomcat`
2. Verifica que los archivos JSP existan en:
   `apache-tomcat-9.0.93/webapps/Flexia18/jsp/extension/melanbide11/`
3. Revisa los logs de Tomcat para errores de despliegue

### Puerto 8080 en uso
```bash
# Encontrar el proceso
lsof -i :8080

# Detener Tomcat si ya está corriendo
./stop-tomcat.sh

# O cambiar el puerto en: apache-tomcat-9.0.93/conf/server.xml
```

### Scripts no son ejecutables
```bash
chmod +x *.sh
```

## 📝 Notas Importantes

- **Compatibilidad:** Las pruebas están diseñadas para ser independientes de la base de datos
- **JavaScript:** Las pruebas CRUD automatizadas funcionan completamente en el cliente
- **ISO-8859-1:** Todos los archivos JSP usan codificación ISO-8859-1 (legacy)
- **Java 6:** El código está compilado para compatibilidad con Java 6
- **Tomcat 9:** Usa Apache Tomcat 9.0.93 para el servidor

## 🎨 Características de la UI de Pruebas

### Índice de Pruebas:
- ✨ Diseño visual atractivo con gradiente
- 🎯 Tarjetas interactivas para cada sección
- 📱 Diseño responsive
- 🖱️ Navegación intuitiva

### Pruebas CRUD:
- 📊 Estadísticas en tiempo real
- 📈 Barra de progreso visual
- 🎨 Log con código de colores
- 💾 Exportación de resultados a JSON
- ⚡ Ejecución asíncrona de pruebas

## 🚦 Estado de las Pruebas

El sistema de pruebas automatizadas verifica:

- ✅ CRUD de contrataciones (CREATE, READ, UPDATE, DELETE)
- ✅ Validaciones de formularios (DNI, fechas, campos obligatorios)
- ✅ Desglose RSB Tab1 (carga, cálculo, guardado)
- ✅ Desglose RSB Tab2 (complementos)
- ✅ Modal de complementos
- ✅ Dropdown de concepto
- ✅ Eliminación de scrolls horizontales

## 📚 Referencias

- **README Principal:** [README.md](README.md)
- **Scripts de Compilación:** [SCRIPTS_README.md](SCRIPTS_README.md)
- **Compatibilidad Java 6:** [JAVA6_COMPATIBILITY.md](JAVA6_COMPATIBILITY.md)

## 🎉 ¡Listo para Probar!

Ejecuta simplemente:
```bash
./test-direct.sh
```

Y accede a todas las pruebas de forma directa en tu navegador.
