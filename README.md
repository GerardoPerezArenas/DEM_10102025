# MELANBIDE11 - Módulo de Integración con Lanbide

## Descripción del Proyecto

Este módulo Java es parte del framework Flexia de Altia y gestiona la integración con el sistema Lanbide (servicio de empleo del País Vasco) para:

- Registro y gestión de contratos de subsidios de empleo
- Seguimiento de subsidios de minimis
- Cálculos de desglose salarial (RSB - Retribuciones Salariales y Beneficios)
- Integración con bases de datos de empleo externas

## Requisitos del Sistema

- **Java**: Java 6 o superior (compatible hasta Java 17+)
- **Servidor de Aplicaciones**: Tomcat, WebLogic o similar (contenedor de servlets)
- **Base de Datos**: Oracle Database
- **Framework**: Flexia (framework empresarial de Altia)

## 🚀 Inicio Rápido - Compilar y Lanzar con Tomcat

**¿Solo quieres compilar y ejecutar la aplicación?** ¡Usa el script automatizado!

### Linux / macOS / WSL:
```bash
./build-and-run.sh
```

### Windows:
```batch
build-and-run.bat
```

La aplicación estará disponible en: **http://localhost:8080/Flexia18/**

Para más información sobre los scripts disponibles, consulta [SCRIPTS_README.md](SCRIPTS_README.md)

---

## Compilación Manual

### Codificación de Archivos

**IMPORTANTE**: Todos los archivos Java deben estar codificados en **UTF-8**. 

Los siguientes archivos fueron convertidos de ISO-8859-1 a UTF-8 para corregir errores de compilación:

- `MeLanbide11Manager.java`
- `MinimisVO.java`
- `MeLanbide11I18n.java`
- `ConstantesMeLanbide11.java`
- `DesgloseRSBParser.java`
- `MeLanbide11MappingUtils.java`

### Compilación con javac

Para compilar el proyecto manualmente (requiere las dependencias del framework Flexia):

```bash
javac -encoding UTF-8 -d build -sourcepath java $(find java -name "*.java" -type f)
```

### Notas sobre Java 6

Aunque el proyecto fue diseñado originalmente para Java 6, los compiladores Java modernos (17+) ya no soportan la compilación con `-source 6 -target 6`. Sin embargo, el código es compatible con Java 6+ y se puede compilar con versiones más recientes.

Si necesita compatibilidad binaria con Java 6, considere usar:
- OpenJDK 8 o anterior que aún soporta `-source 6 -target 6`
- Maven/Gradle con configuración de compatibilidad apropiada

## Problemas Comunes

### Error: "unmappable character for encoding UTF-8"

**Causa**: Los archivos Java estaban codificados en ISO-8859-1 en lugar de UTF-8.

**Solución**: Ya corregido en este repositorio. Todos los archivos ahora están en UTF-8.

Si encuentra este error en el futuro, convierta los archivos usando:

```bash
iconv -f ISO-8859-1 -t UTF-8 archivo.java -o archivo_utf8.java
mv archivo_utf8.java archivo.java
```

### Dependencias Faltantes

Este módulo depende de bibliotecas del framework Flexia de Altia que no están incluidas en este repositorio:

- `es.altia.flexia.integracion.moduloexterno.plugin.*`
- `es.altia.agora.*`
- `es.altia.common.exception.*`
- `es.altia.util.conexion.*`
- Servlet API (`javax.servlet.*`)
- Log4j (`org.apache.log4j.*`)

Para compilar completamente el proyecto, necesita acceso al framework Flexia y sus dependencias.

## Estructura del Proyecto

```
java/es/altia/flexia/integracion/moduloexterno/melanbide11/
├── MELANBIDE11.java              # Controlador principal
├── dao/                          # Objetos de Acceso a Datos
│   └── MeLanbide11DAO.java
├── manager/                      # Lógica de Negocio
│   └── MeLanbide11Manager.java
├── vo/                           # Objetos de Valor (DTOs)
│   ├── ContratacionVO.java
│   ├── MinimisVO.java
│   ├── DesgloseRSBVO.java
│   └── ...
├── util/                         # Utilidades
│   ├── ConstantesMeLanbide11.java
│   ├── MeLanbide11MappingUtils.java
│   └── ...
└── i18n/                         # Internacionalización
    └── MeLanbide11I18n.java

web/
├── jsp/extension/melanbide11/    # Vistas JSP
├── scripts/extension/melanbide11/ # JavaScript
└── css/extension/melanbide11/     # Estilos CSS
```

## Idiomas Soportados

- Español (Castellano) - Identificador: `0`
- Euskera (Vasco) - Identificador: `1`

Los recursos de texto están en `java/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n/text/`

## Configuración

La configuración del módulo se encuentra en:
- `java/MELANBIDE11.properties`

## Desarrollo

Al desarrollar para este proyecto:

1. **Asegúrese de que todos los archivos nuevos estén en UTF-8**
2. Use las constantes definidas en `ConstantesMeLanbide11`
3. Siga los patrones de nomenclatura existentes:
   - Objetos de Valor: terminar en `VO`
   - DAOs: terminar en `DAO`
   - Managers: terminar en `Manager`
   - Utilidades: terminar en `Utils` o `Util`

4. Use Log4j para registro de eventos
5. Maneje excepciones apropiadamente (`TechnicalException`, `BDException`)
6. Cierre siempre los recursos de base de datos

## Licencia

Este proyecto es propiedad de Altia y está sujeto a sus términos de licencia.
