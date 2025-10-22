#!/bin/bash

# Simple compilation script using javac and the JARs in lib directory
# This bypasses Maven dependency resolution issues

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src/java"
BUILD_DIR="$SCRIPT_DIR/build/WEB-INF/classes"
LIB_DIR="$SCRIPT_DIR/lib"

echo "=========================================="
echo "Compiling MELANBIDE11 Project"
echo "=========================================="

# Create build directory if it doesn't exist
mkdir -p "$BUILD_DIR"

# Build classpath from all JARs in lib directory
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
echo "Found $(ls -1 "$LIB_DIR"/*.jar 2>/dev/null | wc -l) JAR files in lib directory"
echo "Compiling Java sources from: $SRC_DIR"
echo "Output directory: $BUILD_DIR"
echo ""

# Find all Java files
JAVA_FILES=$(find "$SRC_DIR" -name "*.java" -type f)
FILE_COUNT=$(echo "$JAVA_FILES" | wc -l)

echo "Found $FILE_COUNT Java source files"
echo ""

# Compile all Java files
echo "Compiling..."
javac -encoding UTF-8 \
    -source 1.8 \
    -target 1.8 \
    -d "$BUILD_DIR" \
    -classpath "$CLASSPATH" \
    -sourcepath "$SRC_DIR" \
    $JAVA_FILES 2>&1 | tee compile.log

if [ ${PIPESTATUS[0]} -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✓ Compilation successful!"
    echo "=========================================="
    echo ""
    echo "Compiled classes: $(find "$BUILD_DIR" -name "*.class" | wc -l)"
    echo "Output directory: $BUILD_DIR"
    echo ""
    exit 0
else
    echo ""
    echo "=========================================="
    echo "✗ Compilation failed"
    echo "=========================================="
    echo ""
    echo "Check compile.log for details"
    echo ""
    exit 1
fi
