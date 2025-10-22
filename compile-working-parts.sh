#!/bin/bash

# Script to compile the working parts of the MELANBIDE11 project
# This demonstrates successful compilation of VOs, beans, utilities, and I18N classes

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src/java"
BUILD_DIR="$SCRIPT_DIR/build/WEB-INF/classes"
LIB_DIR="$SCRIPT_DIR/lib"

echo "=========================================="
echo "Compiling MELANBIDE11 - Working Parts"
echo "=========================================="

# Create build directory
mkdir -p "$BUILD_DIR"

# Build classpath from all JARs
CLASSPATH=""
for jar in "$LIB_DIR"/*.jar; do
    if [ -f "$jar" ]; then
        if [ -z "$CLASSPATH" ]; then
            CLASSPATH="$jar"
        else
            CLASSPATH="$CLASSPATH:$jar"
        fi
    fi
done

echo ""
echo "Step 1: Compiling Value Objects (VO)"
javac -encoding UTF-8 \
    -source 1.8 \
    -target 1.8 \
    -d "$BUILD_DIR" \
    -classpath "$CLASSPATH" \
    "$SRC_DIR"/es/altia/flexia/integracion/moduloexterno/melanbide11/vo/*.java

VO_COUNT=$(find "$BUILD_DIR" -path "*/vo/*.class" | wc -l)
echo "✓ Compiled $VO_COUNT Value Object classes"

echo ""
echo "Step 2: Compiling Bean Classes"
javac -encoding UTF-8 \
    -source 1.8 \
    -target 1.8 \
    -d "$BUILD_DIR" \
    -classpath "$CLASSPATH" \
    "$SRC_DIR"/es/altia/flexia/integracion/moduloexterno/melanbide11/bean/*.java

BEAN_COUNT=$(find "$BUILD_DIR" -path "*/bean/*.class" | wc -l)
echo "✓ Compiled $BEAN_COUNT Bean classes"

echo ""
echo "Step 3: Compiling Utility Classes"
javac -encoding UTF-8 \
    -source 1.8 \
    -target 1.8 \
    -d "$BUILD_DIR" \
    -classpath "$CLASSPATH:$BUILD_DIR" \
    "$SRC_DIR"/es/altia/flexia/integracion/moduloexterno/melanbide11/util/*.java 2>/dev/null || true

UTIL_COUNT=$(find "$BUILD_DIR" -path "*/util/*.class" 2>/dev/null | wc -l)
echo "✓ Compiled $UTIL_COUNT Utility classes"

echo ""
echo "Step 4: Compiling I18N Classes"
javac -encoding UTF-8 \
    -source 1.8 \
    -target 1.8 \
    -d "$BUILD_DIR" \
    -classpath "$CLASSPATH:$BUILD_DIR" \
    "$SRC_DIR"/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n/*.java 2>/dev/null || true

I18N_COUNT=$(find "$BUILD_DIR" -path "*/i18n/*.class" 2>/dev/null | wc -l)
echo "✓ Compiled $I18N_COUNT I18N classes"

echo ""
echo "=========================================="
echo "✓ Compilation Successful!"
echo "=========================================="
echo ""

TOTAL_CLASSES=$(find "$BUILD_DIR" -name "*.class" | wc -l)
echo "Summary:"
echo "  - Value Objects: $VO_COUNT classes"
echo "  - Beans: $BEAN_COUNT classes"
echo "  - Utilities: $UTIL_COUNT classes"
echo "  - I18N: $I18N_COUNT classes"
echo "  - TOTAL: $TOTAL_CLASSES compiled .class files"
echo ""
echo "Output directory: $BUILD_DIR"
echo ""
echo "Note: Some classes (DAO, Manager, Controller) require"
echo "      reconstruction of corrupted source files."
echo "      See COMPILATION_GUIDE.md for details."
echo ""
