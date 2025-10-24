# Database Scripts - MELANBIDE11_SUBVENCION_REF

## Overview

This directory contains SQL scripts for creating and populating the `MELANBIDE11_SUBVENCION_REF` table, which stores subsidy amount calculation rules for the DEM50 program.

## Table Purpose

The `MELANBIDE11_SUBVENCION_REF` table stores reference data for automatically calculating subsidy amounts based on various applicant profiles, including:
- Education level (FP2, University degree, or general)
- Gender (higher amounts for women to promote equality)
- Age (higher amounts for workers over 55)
- Disability status
- Contract type

## Scripts Execution Order

Execute the scripts in numerical order:

1. **001_CREATE_MELANBIDE11_SUBVENCION_REF.sql**
   - Creates the table structure
   - Adds constraints and indexes
   - Includes documentation comments

2. **002_INSERT_MELANBIDE11_SUBVENCION_REF_DATA.sql**
   - Inserts sample data for years 2024-2025
   - Covers various profile combinations
   - Includes verification queries

## Table Structure

```sql
CREATE TABLE MELANBIDE11_SUBVENCION_REF (
    ANIO NUMBER(4) NOT NULL,              -- Year (e.g., 2025)
    TITULACION VARCHAR2(50),              -- Education: 'FP2', 'UNIVERSIDAD', or empty
    MUJER CHAR(1),                        -- Gender: 'S'=Woman, 'N'=Man
    MAYOR_55 CHAR(1),                     -- Age: 'S'=Over 55, 'N'=Under 55
    DISCAPACIDAD CHAR(1),                 -- Disability: 'S'=Yes, 'N'=No
    TIPO_CONTRATO VARCHAR2(50),           -- Contract type (empty = all types)
    IMPORTE NUMBER(10,2) NOT NULL,        -- Subsidy amount in euros
    BASE_12_MESES CHAR(1),                -- 'S'=Annual amount, 'N'=Prorated
    ...
);
```

## Usage Example

### Query for specific profile:
```sql
SELECT IMPORTE
FROM MELANBIDE11_SUBVENCION_REF
WHERE ANIO = 2025
  AND TITULACION = 'FP2'
  AND MUJER = 'S'
  AND MAYOR_55 = 'N'
  AND DISCAPACIDAD = 'N'
  AND (TIPO_CONTRATO = '' OR TIPO_CONTRATO = 'INDEFINIDO');
```

### View all 2025 rules:
```sql
SELECT TITULACION,
       CASE MUJER WHEN 'S' THEN 'Mujer' ELSE 'Hombre' END AS SEXO,
       CASE MAYOR_55 WHEN 'S' THEN '>55' ELSE '<55' END AS EDAD,
       IMPORTE
FROM MELANBIDE11_SUBVENCION_REF
WHERE ANIO = 2025
ORDER BY IMPORTE DESC;
```

## Integration with Application

The table is accessed via:
- **Backend**: `MELANBIDE11.getSubvencionRef()` method
- **Frontend**: `cargarTablaCuantias()` function in `nuevaContratacion.jsp`
- **Configuration**: `MELANBIDE11.properties` - `MELANBIDE11_SUBVENCION_REF` property

## Maintenance

### Adding New Year Data
```sql
-- Copy previous year and adjust amounts
INSERT INTO MELANBIDE11_SUBVENCION_REF 
SELECT 2026, TITULACION, MUJER, MAYOR_55, DISCAPACIDAD, TIPO_CONTRATO,
       IMPORTE * 1.02,  -- 2% increase
       BASE_12_MESES, SYSDATE, USER, NULL, NULL
FROM MELANBIDE11_SUBVENCION_REF
WHERE ANIO = 2025;
```

### Updating Amounts
```sql
UPDATE MELANBIDE11_SUBVENCION_REF
SET IMPORTE = IMPORTE * 1.05,  -- 5% increase
    FECHA_MODIFICACION = SYSDATE,
    USUARIO_MODIFICACION = USER
WHERE ANIO = 2025;
```

## Deployment Notes

1. Run scripts in a transaction for safety:
   ```sql
   BEGIN
       @001_CREATE_MELANBIDE11_SUBVENCION_REF.sql
       @002_INSERT_MELANBIDE11_SUBVENCION_REF_DATA.sql
       COMMIT;
   EXCEPTION
       WHEN OTHERS THEN
           ROLLBACK;
           RAISE;
   END;
   ```

2. Verify data after insertion:
   ```sql
   SELECT ANIO, COUNT(*) AS TOTAL_REGLAS
   FROM MELANBIDE11_SUBVENCION_REF
   GROUP BY ANIO
   ORDER BY ANIO DESC;
   ```

3. Adjust permissions according to your organization's security policy.

## Troubleshooting

### Error: Table already exists
```sql
-- Drop and recreate
DROP TABLE MELANBIDE11_SUBVENCION_REF CASCADE CONSTRAINTS;
-- Then run 001_CREATE script again
```

### Error: Constraint violation
- Check that MUJER, MAYOR_55, DISCAPACIDAD, BASE_12_MESES values are 'S' or 'N'
- Ensure IMPORTE is >= 0
- Verify ANIO is a 4-digit year

### Performance Issues
```sql
-- Rebuild indexes
ALTER INDEX IDX_MELANBIDE11_SR_ANIO REBUILD;

-- Gather statistics
EXEC DBMS_STATS.GATHER_TABLE_STATS(USER, 'MELANBIDE11_SUBVENCION_REF');
```
