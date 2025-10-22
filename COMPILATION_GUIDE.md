# MELANBIDE11 Compilation Guide

## Overview

This document provides instructions for compiling the MELANBIDE11 project. The project has been analyzed and compilation tools have been created to work around dependency and source code issues.

## Current Status

✅ **Successfully Compiling:**
- All Value Objects (VO classes) in `src/java/.../vo/`
- All Bean classes in `src/java/.../bean/`  
- Utility classes
- I18N resources

⚠️ **Requires Attention:**
- `MeLanbide11DAO.java` - Main Data Access Object (severely corrupted, needs reconstruction)
- `MELANBIDE11.java` - Main controller (depends on DAO)
- `MeLanbide11Manager.java` - Business logic layer (depends on DAO)

## Compilation Tools Created

### 1. install-local-dependencies.sh
Installs JAR files from the `lib/` directory to the local Maven repository.

```bash
./install-local-dependencies.sh
```

This script installs ~150+ dependencies from the lib directory, allowing Maven to find them locally.

### 2. compile.sh  
Direct compilation using javac with all JARs from the lib directory.

```bash
./compile.sh
```

This bypasses Maven entirely and compiles using javac directly.

## Quick Start

### Option 1: Compile Value Objects and Beans Only

These classes compile successfully:

```bash
mkdir -p build/classes
javac -encoding UTF-8 -source 1.8 -target 1.8 \
  -d build/classes \
  -classpath "$(find lib -name '*.jar' | tr '\n' ':')" \
  src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/vo/*.java \
  src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/bean/*.java \
  src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/util/*.java \
  src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n/*.java
```

### Option 2: Maven Compilation (with local dependencies)

1. Install local dependencies:
```bash
./install-local-dependencies.sh
```

2. Try Maven compilation:
```bash
mvn clean compile
```

Note: Maven may still fail due to missing dependencies from the private Nexus repository that aren't in the lib directory.

## Known Issues

### 1. Corrupted MeLanbide11DAO.java

The main DAO file has severe corruption where two code streams are merged on the same lines:

```java
// Example of corruption:
    }        return nz(salBase) + nz(pagExtra) + nz(comp);

        }

    public void eliminarContratacion(Long idContratacion) throws BDException {

        // Stub implementation    // Constructor
```

**Solution Required:** Manual reconstruction of the file by:
1. Reviewing the corrupted file to understand the two code streams
2. Separating and reorganizing the code
3. Using `MeLanbide11DAO_Java6.java` as a template for structure

### 2. Encoding Issues (FIXED)

The following files had ISO-8859-1 encoding and have been converted to UTF-8:
- ✅ `ComplementoSalarial.java`
- ✅ `OtraPercepcion.java`

### 3. Private Nexus Dependencies

Some dependencies require access to Lanbide's private Nexus repository:
- `nexus.lanbide.eus/repository/thirdparty/`

These are partially available in the `lib/` directory but not all of them.

## Files Modified

- Created: `install-local-dependencies.sh` - Installs local JARs to Maven
- Created: `compile.sh` - Direct javac compilation script
- Created: `fix_dao_file.py` - Attempted automated fix for corrupted DAO (partial success)
- Fixed: Encoding issues in bean classes

## Recommendations

To achieve full compilation:

1. **Immediate**: Use the partial compilation approach to compile VOs and beans
2. **Short-term**: Reconstruct `MeLanbide11DAO.java` using the backed-up version at `/tmp/backup/MeLanbide11DAO.java` and the `MeLanbide11DAO_Java6.java` template
3. **Long-term**: Consider using a version control system to prevent such corruption in the future

## Testing the Compilation

To verify successful compilation of the working parts:

```bash
# Clean build
rm -rf build/classes
mkdir -p build/classes

# Compile
javac -encoding UTF-8 -source 1.8 -target 1.8 \
  -d build/classes \
  -classpath "$(find lib -name '*.jar' | tr '\n' ':')" \
  src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/vo/*.java \
  src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/bean/*.java

# Count compiled classes
find build/classes -name "*.class" | wc -l
```

Expected output: 10+ compiled .class files

## Support

For questions about:
- **Compilation**: Refer to this guide
- **Dependency Issues**: Check `lib/` directory for required JARs
- **DAO Reconstruction**: Review the backed-up file and Java6 template
- **Maven Issues**: Use the install-local-dependencies.sh script first

## License

This project is property of Altia and subject to their licensing terms.
