# Testing Guide for TLD Scanning Optimization

## Overview

This guide explains how to verify that the TLD scanning optimization is working correctly and that the application still functions properly after the changes.

## Pre-requisites

- Access to a Tomcat server (version 7.0+)
- MELANBIDE11 WAR file built with the new context.xml
- Permission to view Tomcat logs

## Test Steps

### 1. Verify context.xml is included in WAR

```bash
# Extract and check the WAR file structure
unzip -l MELANBIDE11.war | grep context.xml

# Expected output:
# 1260  2025-10-22 12:54   META-INF/context.xml
```

### 2. Deploy to Tomcat

```bash
# Copy WAR to Tomcat webapps directory
cp MELANBIDE11.war $TOMCAT_HOME/webapps/

# Start Tomcat if not running
$TOMCAT_HOME/bin/catalina.sh run
```

### 3. Monitor Tomcat Logs During Startup

Watch the Tomcat logs during application deployment and startup:

```bash
tail -f $TOMCAT_HOME/logs/catalina.out
```

**Expected Results:**

✅ **PASS**: No TLD scanning warning messages appear
✅ **PASS**: Application deploys successfully without errors
✅ **PASS**: Deployment time is significantly reduced compared to before

❌ **FAIL**: If you still see this message:
```
INFORMACI├ôN: Al menos un JAR, que se ha explorado buscando TLDs, a├║n no conten├¡a TLDs.
```

### 4. Test Application Functionality

#### 4.1 Access the Main Page

Navigate to: `http://localhost:8080/MELANBIDE11/`

**Expected Results:**
- Page loads successfully
- No errors in browser console
- No errors in Tomcat logs

#### 4.2 Test JSP Pages with Tag Libraries

Access various JSP pages that use JSTL tags:

- Main listing page: `/MELANBIDE11/jsp/extension/melanbide11/melanbide11.jsp`
- New contract form: `/MELANBIDE11/jsp/extension/melanbide11/nuevaContratacion.jsp`
- Minimis page: `/MELANBIDE11/jsp/extension/melanbide11/minimis.jsp`

**Expected Results:**
- All pages render correctly
- JSTL tags work properly (c:if, c:forEach, c:out, etc.)
- No JSP compilation errors
- No tag library errors

#### 4.3 Check First-Time JSP Compilation

On first access to a JSP page after deployment:

**Expected Results:**
- JSP compiles much faster than before
- No delays related to TLD scanning
- Page loads within reasonable time

#### 4.4 Test Language Switching

Test both Spanish (Castilian) and Basque (Euskera) interfaces:

**Expected Results:**
- Both languages work correctly
- No issues with internationalized text
- Tag libraries function in both languages

### 5. Performance Comparison

If possible, compare startup times before and after the change:

#### Before (Without context.xml):
- Record application deployment time
- Record first JSP access time
- Note TLD scanning warnings in logs

#### After (With context.xml):
- Record application deployment time (should be faster)
- Record first JSP access time (should be faster)
- Verify no TLD scanning warnings

**Expected Improvement:**
- Startup time: 30-60% faster (depending on number of JARs)
- First JSP compilation: 20-40% faster
- No TLD scanning log messages

### 6. Verify Tag Library Functionality

Test specific JSTL features:

```jsp
<!-- Core tags -->
<c:if test="${condition}">...</c:if>
<c:forEach items="${list}" var="item">...</c:forEach>
<c:out value="${variable}"/>

<!-- Formatting tags -->
<fmt:formatDate value="${date}" pattern="dd/MM/yyyy"/>
<fmt:formatNumber value="${number}" pattern="#,##0.00"/>

<!-- String manipulation tags -->
<string:trim>...</string:trim>
```

**Expected Results:**
- All tag libraries function correctly
- No ClassNotFoundException for tag handlers
- No TLD not found errors

### 7. Check for Side Effects

Verify that the optimization doesn't cause any issues:

- Database connections work correctly
- File uploads function properly
- Reports generate successfully
- All business logic executes normally

## Troubleshooting

### Issue: TLD scanning warnings still appear

**Solution:**
1. Verify context.xml is in META-INF directory of the WAR
2. Check Tomcat version (must be 7.0+)
3. Verify the JarScanFilter syntax is correct
4. Ensure no conflicting context.xml in Tomcat conf directory

### Issue: Tag library errors

**Solution:**
1. Check that jstl*.jar, standard*.jar, taglibs*.jar are in WEB-INF/lib
2. Verify the tldScan pattern in context.xml matches the JAR names
3. Review Tomcat logs for ClassNotFoundException

### Issue: Application won't deploy

**Solution:**
1. Check for XML syntax errors in context.xml
2. Verify context.xml is well-formed (use XML validator)
3. Review Tomcat logs for deployment errors
4. Try removing context.xml temporarily to isolate the issue

## Success Criteria

The optimization is successful if:

1. ✅ No TLD scanning warning messages in Tomcat logs
2. ✅ Application deployment time is reduced
3. ✅ JSP compilation time is faster
4. ✅ All JSP pages render correctly
5. ✅ All tag libraries function properly
6. ✅ No new errors or exceptions appear
7. ✅ Application functionality is unchanged

## Notes

- The context.xml configuration is specific to Tomcat
- Other servlet containers (JBoss, WebLogic, etc.) may have different configuration
- Keep the original logs for comparison
- Test in a development environment before production deployment

## Contact

For issues or questions about this optimization, refer to:
- TLD_SCANNING_OPTIMIZATION.md
- Apache Tomcat documentation
- Project team leads
