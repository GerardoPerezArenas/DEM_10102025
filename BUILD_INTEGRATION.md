# Build Integration Guide

## Overview

This document explains how to ensure the `context.xml` file is included in the WAR during the build process.

## Maven Build

The context.xml file is located in `src/web/META-INF/context.xml` and should be automatically included when building with Maven.

### Standard Maven Build

```bash
mvn clean package
```

The Maven WAR plugin will automatically include all files from `src/web/` in the WAR file, including the META-INF directory.

### Verify in Built WAR

After building, verify the context.xml is included:

```bash
unzip -l target/flexia19.war | grep context.xml
```

Expected output:
```
1260  2025-10-22 12:54   META-INF/context.xml
```

## Ant Build

If using Ant build (build.xml), you may need to ensure the META-INF directory is copied. The standard web resource copy task should include it automatically.

### Manual Addition (if needed)

If the context.xml is not being included automatically, you can add it manually to an existing WAR:

```bash
jar uf MELANBIDE11.war -C src/web META-INF/context.xml
```

## Build Verification Checklist

Before deploying to any environment, verify:

- [ ] context.xml exists in `src/web/META-INF/context.xml`
- [ ] WAR file contains `META-INF/context.xml`
- [ ] context.xml has correct XML syntax
- [ ] context.xml has correct JarScanFilter configuration
- [ ] Tag library JARs (jstl, standard, taglibs) are in WEB-INF/lib

## Continuous Integration

### Jenkins/CI Build

Add a verification step to your CI pipeline:

```bash
# After build
echo "Verifying context.xml in WAR..."
unzip -l target/*.war | grep "META-INF/context.xml" || exit 1
echo "✓ context.xml found in WAR"
```

### Automated Testing

Include in automated tests:

```bash
# Extract WAR
unzip -q target/*.war -d target/war-contents/

# Verify context.xml exists
if [ ! -f target/war-contents/META-INF/context.xml ]; then
    echo "ERROR: context.xml not found in WAR"
    exit 1
fi

# Verify context.xml is valid XML
xmllint --noout target/war-contents/META-INF/context.xml
if [ $? -eq 0 ]; then
    echo "✓ context.xml is valid XML"
else
    echo "ERROR: context.xml is invalid XML"
    exit 1
fi
```

## Environment-Specific Configuration

If different TLD scanning configurations are needed for different environments:

### Option 1: Profile-Based Configuration

Create environment-specific context.xml files:

```
src/web/META-INF/context.xml.dev
src/web/META-INF/context.xml.test
src/web/META-INF/context.xml.prod
```

Use Maven profiles to select the correct one during build.

### Option 2: Tomcat-Level Configuration

Override the context.xml at Tomcat level:

```
$TOMCAT_HOME/conf/Catalina/localhost/MELANBIDE11.xml
```

This overrides the context.xml packaged in the WAR.

## Troubleshooting

### context.xml not in WAR

**Cause**: Build process not including src/web directory

**Solution**:
1. Check Maven WAR plugin configuration
2. Verify src/web is not excluded in build config
3. Manually add: `jar uf app.war -C src/web META-INF/context.xml`

### context.xml ignored by Tomcat

**Cause**: Conflicting configuration at Tomcat level

**Solution**:
1. Check `$TOMCAT_HOME/conf/context.xml` (global)
2. Check `$TOMCAT_HOME/conf/Catalina/localhost/*.xml` (app-specific)
3. Remove conflicting configurations or merge settings

### Wrong context.xml used

**Cause**: Multiple context.xml files in different locations

**Solution**:
Tomcat looks for context.xml in this order (first found wins):
1. `$TOMCAT_HOME/conf/Catalina/[host]/[app].xml`
2. WAR's `META-INF/context.xml`
3. `$TOMCAT_HOME/conf/context.xml` (global defaults)

## Best Practices

1. **Version Control**: Always commit context.xml to version control
2. **Documentation**: Document any environment-specific changes
3. **Testing**: Test the WAR in a dev environment before production
4. **Backup**: Keep a backup of the previous configuration
5. **Monitoring**: Monitor Tomcat logs after deployment to verify optimization is working

## Related Files

- Source: `src/web/META-INF/context.xml`
- Documentation: `TLD_SCANNING_OPTIMIZATION.md`
- Testing Guide: `TLD_SCANNING_TEST_GUIDE.md`
