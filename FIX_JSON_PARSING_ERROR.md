# Fix for JSON Parsing Error in Subsidy Calculation

## Problem Description

The application was experiencing a `SyntaxError: Unexpected end of JSON input` when trying to load the subsidy amounts table (`tablaCuantias`) from the database. The error occurred because:

1. Frontend code attempted to parse empty or incomplete JSON responses
2. No backend endpoint existed to serve the subsidy data
3. No database table existed to store the reference data
4. No error handling was in place for failed AJAX requests

## Error Messages (Before Fix)

```
=== INICIANDO RECÁLCULO DE SUBVENCIÓN ===
Tabla de cuantías no disponible - cargando...
Cargando tabla de cuantías desde MELANBIDE11_SUBVENCION_REF...
Error parseando respuesta de cuantías: SyntaxError: Unexpected end of JSON input
    at JSON.parse (<anonymous>)
    at xhr.onreadystatechange (...)
```

## Solution Overview

The fix implements a complete three-tier solution:

### 1. Frontend (JavaScript/JSP)
- **File**: `src/web/jsp/extension/melanbide11/nuevaContratacion.jsp`
- **Changes**:
  - Renamed hardcoded table to `tablaCuantiasFallback`
  - Added `cargarTablaCuantias()` function for async AJAX loading
  - Implemented comprehensive error handling:
    - Empty response validation
    - JSON.parse() error catching
    - Automatic fallback to hardcoded data
    - Callback queue management
  - Updated `recalcularImporteSubvencion()` to trigger loading when needed

### 2. Backend (Java)
- **Files Modified**:
  - `MELANBIDE11.java` - Added `getSubvencionRef()` method
  - `ConstantesMeLanbide11.java` - Added table name constant
  - `MELANBIDE11.properties` - Added table configuration

- **New Functionality**:
  - `getSubvencionRef()` - Queries database and returns JSON
  - `escapeJson()` - Safely escapes JSON strings
  - `enviarErrorJSON()` - Sends error responses in JSON format

### 3. Database (Oracle SQL)
- **Scripts Created**:
  - `001_CREATE_MELANBIDE11_SUBVENCION_REF.sql` - Table DDL
  - `002_INSERT_MELANBIDE11_SUBVENCION_REF_DATA.sql` - Sample data
  - `README.md` - Documentation

- **Table Structure**:
  ```sql
  MELANBIDE11_SUBVENCION_REF (
    ANIO,           -- Year (2024, 2025, etc.)
    TITULACION,     -- Education level
    MUJER,          -- Gender
    MAYOR_55,       -- Age category
    DISCAPACIDAD,   -- Disability status
    TIPO_CONTRATO,  -- Contract type
    IMPORTE,        -- Subsidy amount
    BASE_12_MESES   -- Proration flag
  )
  ```

## Error Handling Flow

```
User Action → recalcularImporteSubvencion()
                ↓
         tablaCuantias === null?
                ↓ (yes)
         cargarTablaCuantias()
                ↓
         AJAX Request → Backend
                ↓
         Response Check:
           - Empty? → Use fallback
           - Valid JSON? → Parse
           - Invalid JSON? → Catch error → Use fallback
           - HTTP Error? → Use fallback
                ↓
         Execute callbacks
                ↓
         Retry calculation with loaded data
```

## Key Features

### Robust Error Handling
- ✅ Empty response detection
- ✅ JSON parsing error catching
- ✅ HTTP error handling
- ✅ Automatic fallback to hardcoded data
- ✅ Detailed console logging

### Performance Optimizations
- ✅ Callback queue prevents duplicate requests
- ✅ Single load per session (cached in memory)
- ✅ Database indexes for fast queries
- ✅ No page reloads required

### Maintainability
- ✅ Centralized configuration in properties file
- ✅ Comprehensive documentation
- ✅ SQL scripts for easy deployment
- ✅ Helper functions for common operations

## Testing Procedures

### 1. Database Verification
```sql
-- Check table exists
SELECT * FROM USER_TABLES WHERE TABLE_NAME = 'MELANBIDE11_SUBVENCION_REF';

-- Verify data
SELECT ANIO, COUNT(*) FROM MELANBIDE11_SUBVENCION_REF GROUP BY ANIO;

-- Test query
SELECT * FROM MELANBIDE11_SUBVENCION_REF 
WHERE ANIO = 2025 AND TITULACION = 'FP2' AND MUJER = 'S';
```

### 2. Backend Verification
```bash
# Test endpoint (adjust URL as needed)
curl -X POST "http://localhost:8080/PeticionModuloIntegracion.do" \
  -d "tarea=preparar&modulo=MELANBIDE11&operacion=getSubvencionRef"
```

Expected response:
```json
[
  {"anio":2025,"tit":"FP2","mujer":true,"ge55":false,...},
  ...
]
```

### 3. Frontend Verification
1. Open browser developer console (F12)
2. Navigate to contratación form
3. Check console for:
   ```
   Cargando tabla de cuantías desde MELANBIDE11_SUBVENCION_REF...
   Tabla de cuantías cargada desde BD: 14 reglas disponibles
   ```
4. Verify no errors appear
5. Change form fields and verify subsidy recalculation

### 4. Error Scenario Testing

**Test empty response:**
- Temporarily return empty string from backend
- Verify fallback is used
- Check console shows appropriate warning

**Test malformed JSON:**
- Return invalid JSON from backend
- Verify error is caught and logged
- Verify fallback is used

**Test HTTP error:**
- Temporarily break database connection
- Verify error handling works
- Verify fallback is used

## Deployment Checklist

- [ ] Review and approve all code changes
- [ ] Execute database DDL script (001_CREATE_...)
- [ ] Execute database DML script (002_INSERT_...)
- [ ] Verify table has data (should be 14-16 rows)
- [ ] Build application: `mvn clean package`
- [ ] Deploy WAR file to application server
- [ ] Restart application server
- [ ] Test in development environment
- [ ] Test in staging environment
- [ ] Document any configuration changes
- [ ] Deploy to production
- [ ] Monitor logs for errors
- [ ] Verify subsidy calculations are correct

## Rollback Procedure

If issues arise after deployment:

1. **Database Rollback**:
   ```sql
   DROP TABLE MELANBIDE11_SUBVENCION_REF CASCADE CONSTRAINTS;
   ```

2. **Application Rollback**:
   - Deploy previous WAR version
   - The application will automatically use fallback data

3. **Verify**:
   - Check console shows "fallback" messages
   - Verify calculations still work with hardcoded data

## Maintenance

### Adding New Year Data
```sql
INSERT INTO MELANBIDE11_SUBVENCION_REF 
SELECT 2026, TITULACION, MUJER, MAYOR_55, DISCAPACIDAD, 
       TIPO_CONTRATO, IMPORTE * 1.02, BASE_12_MESES,
       SYSDATE, USER, NULL, NULL
FROM MELANBIDE11_SUBVENCION_REF
WHERE ANIO = 2025;
```

### Updating Amounts
```sql
UPDATE MELANBIDE11_SUBVENCION_REF
SET IMPORTE = IMPORTE * 1.05,
    FECHA_MODIFICACION = SYSDATE,
    USUARIO_MODIFICACION = USER
WHERE ANIO = 2025;
```

## Related Files

**Frontend:**
- `src/web/jsp/extension/melanbide11/nuevaContratacion.jsp`

**Backend:**
- `src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/MELANBIDE11.java`
- `src/java/es/altia/flexia/integracion/moduloexterno/melanbide11/util/ConstantesMeLanbide11.java`
- `src/java/MELANBIDE11.properties`

**Database:**
- `database/scripts/001_CREATE_MELANBIDE11_SUBVENCION_REF.sql`
- `database/scripts/002_INSERT_MELANBIDE11_SUBVENCION_REF_DATA.sql`
- `database/scripts/README.md`

## Support

For issues or questions:
1. Check console logs (browser and server)
2. Verify database table exists and has data
3. Check application server logs for errors
4. Review this document for troubleshooting steps
5. Contact development team if issue persists

---

**Last Updated**: 2025-10-24
**Version**: 1.0
**Author**: Copilot Agent
