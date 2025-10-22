# TLD Scanning Optimization

## Problem

When deploying the MELANBIDE11 module to Tomcat, JSP compilation was experiencing significant performance delays due to Tag Library Descriptor (TLD) scanning. The application contains over 430 JAR files in the lib directory, and Tomcat was scanning all of them for TLD files during JSP compilation.

The warning message observed was:
```
oct 22, 2025 2:45:17 PM org.apache.jasper.compiler.TldLocationsCache tldScanJar
INFORMACI├ôN: Al menos un JAR, que se ha explorado buscando TLDs, a├║n no conten├¡a TLDs. 
Activar historial de depuraci├│n para este historiador para una completa lista de los JARs 
que fueron explorados y de los que nos se hall├│ TLDs. Saltarse JARs no necesarios durante 
la exploraci├│n puede dar lugar a una mejora de tiempo significativa en el arranque y 
compilaci├│n de JSP.
```

## Solution

Created a `META-INF/context.xml` file that configures Tomcat's JAR scanner to skip most JARs during TLD scanning, scanning only the JARs that are known to contain tag libraries.

### Files Added/Modified

1. **src/web/META-INF/context.xml** (NEW)
   - Configures JarScanner to skip all JARs except those containing tag libraries
   - Only scans: jstl*.jar, standard*.jar, taglibs*.jar
   - These are the only JARs in the lib directory that contain TLD files

### How It Works

The context.xml file uses Tomcat's JarScanFilter to configure which JARs to scan:

```xml
<JarScanFilter 
    defaultTldScan="false"
    defaultPluggabilityScan="false"
    pluggabilitySkip="*.jar"
    tldSkip="*.jar"
    tldScan="jstl*.jar,standard*.jar,taglibs*.jar" />
```

- `defaultTldScan="false"` - Don't scan JARs for TLDs by default
- `tldSkip="*.jar"` - Skip all JARs for TLD scanning
- `tldScan="jstl*.jar,standard*.jar,taglibs*.jar"` - Explicitly scan only these patterns

### Expected Benefits

1. **Faster Application Startup** - Significantly reduced time spent scanning JARs
2. **Faster JSP Compilation** - First-time JSP access will be much faster
3. **Better Performance** - Overall improved responsiveness during development and deployment

### Tag Library JARs in Project

The following JARs contain TLD files and are still scanned:
- jstl-1.0-LANBIDE.jar / jstl.jar (JSTL Core)
- standard-1.0-LANBIDE.jar / standard.jar (JSTL Standard Tag Library)
- taglibs-log-1.0-LANBIDE.jar / taglibs-log.jar (Apache Taglibs)
- taglibs-string.jar / taglibs_string-1.0.jar (Apache Taglibs String)

All other JARs (400+ files) are now excluded from TLD scanning.

### Deployment

The context.xml file should be included in the WAR file's META-INF directory. It will be automatically read by Tomcat when the application is deployed.

To build and include this file:
1. The file is located in `src/web/META-INF/context.xml`
2. The build process should copy it to the WAR's META-INF directory
3. Alternatively, it can be added manually: `jar uf MELANBIDE11.war -C src/web META-INF/context.xml`

### Testing

After deployment with this configuration:
1. Monitor Tomcat logs during startup - the TLD scanning warning should no longer appear
2. Measure application startup time - should be significantly faster
3. Access JSP pages for the first time - compilation should be faster
4. Verify all tag libraries still work correctly

### References

- Apache Tomcat Configuration Reference: https://tomcat.apache.org/tomcat-8.5-doc/config/jar-scanner.html
- TLD Scanning Best Practices: https://tomcat.apache.org/tomcat-8.5-doc/config/jar-scan-filter.html
