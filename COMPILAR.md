# ¿Cómo Compilar? / How to Compile?

## Respuesta Rápida / Quick Answer

**✅ SÍ, puedes compilar desde aquí / YES, you can compile from here**

## Comando Principal / Main Command

```bash
ant -f build-local.xml compile
```

## Comandos Disponibles / Available Commands

```bash
# Compilar
ant -f build-local.xml compile

# Limpiar y compilar
ant -f build-local.xml clean compile

# Ver ayuda
ant -f build-local.xml help
```

## Requisitos / Requirements

- Java JDK 8+ (actualmente usando Java 17)
- Apache Ant
- 410 librerías JAR en directorio `lib/` ✅ (incluidas)

## Estado / Status

- ✅ Sistema de build funcional con Ant
- ✅ 32 archivos fuente Java
- ✅ 410 JARs de dependencias locales
- ⚠️ ~20 errores por stubs incompletos (normal en modo standalone)
- ❌ Maven requiere VPN a nexus.lanbide.eus

## Más Información / More Information

Ver `COMPILATION_GUIDE.md` para:
- Guía completa bilingüe (ES/EN)
- Solución de problemas
- Detalles de errores conocidos
- Configuración avanzada

## Testing

```bash
./test-direct.sh
```

---

**Creado:** 2025-10-23  
**Build System:** Apache Ant con librerías locales
