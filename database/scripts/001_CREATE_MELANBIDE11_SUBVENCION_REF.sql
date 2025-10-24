-- =====================================================
-- Tabla: MELANBIDE11_SUBVENCION_REF
-- Descripción: Tabla de referencia para cálculo automático 
--              de cuantías de subvención DEM50 según perfil
-- =====================================================

CREATE TABLE MELANBIDE11_SUBVENCION_REF (
    -- Año de convocatoria
    ANIO NUMBER(4) NOT NULL,
    
    -- Titulación requerida (FP2, UNIVERSIDAD, vacío para general)
    TITULACION VARCHAR2(50),
    
    -- Indicadores de perfil (S/N o 1/0)
    MUJER CHAR(1) DEFAULT 'N',
    MAYOR_55 CHAR(1) DEFAULT 'N',
    DISCAPACIDAD CHAR(1) DEFAULT 'N',
    
    -- Tipo de contrato (opcional, vacío = aplica a todos)
    TIPO_CONTRATO VARCHAR2(50),
    
    -- Importe de subvención en euros
    IMPORTE NUMBER(10,2) NOT NULL,
    
    -- Indica si el importe es base anual (S) o ya prorrateado (N)
    BASE_12_MESES CHAR(1) DEFAULT 'S',
    
    -- Auditoría
    FECHA_CREACION DATE DEFAULT SYSDATE,
    USUARIO_CREACION VARCHAR2(50),
    FECHA_MODIFICACION DATE,
    USUARIO_MODIFICACION VARCHAR2(50),
    
    -- Constraints
    CONSTRAINT PK_MELANBIDE11_SUBVENCION_REF PRIMARY KEY (ANIO, TITULACION, MUJER, MAYOR_55, DISCAPACIDAD, TIPO_CONTRATO),
    CONSTRAINT CHK_MELANBIDE11_SR_MUJER CHECK (MUJER IN ('S', 'N', '0', '1')),
    CONSTRAINT CHK_MELANBIDE11_SR_MAYOR55 CHECK (MAYOR_55 IN ('S', 'N', '0', '1')),
    CONSTRAINT CHK_MELANBIDE11_SR_DISCAP CHECK (DISCAPACIDAD IN ('S', 'N', '0', '1')),
    CONSTRAINT CHK_MELANBIDE11_SR_BASE12M CHECK (BASE_12_MESES IN ('S', 'N', '0', '1')),
    CONSTRAINT CHK_MELANBIDE11_SR_IMPORTE CHECK (IMPORTE >= 0)
);

-- Índices para mejorar performance
CREATE INDEX IDX_MELANBIDE11_SR_ANIO ON MELANBIDE11_SUBVENCION_REF(ANIO);

-- Comentarios
COMMENT ON TABLE MELANBIDE11_SUBVENCION_REF IS 'Tabla de cuantías de referencia para cálculo automático de subvenciones DEM50';
COMMENT ON COLUMN MELANBIDE11_SUBVENCION_REF.ANIO IS 'Año de convocatoria (ej: 2025)';
COMMENT ON COLUMN MELANBIDE11_SUBVENCION_REF.TITULACION IS 'Código de titulación requerida: FP2, UNIVERSIDAD, o vacío para general';
COMMENT ON COLUMN MELANBIDE11_SUBVENCION_REF.MUJER IS 'S/1 si aplica a mujeres, N/0 si aplica a hombres';
COMMENT ON COLUMN MELANBIDE11_SUBVENCION_REF.MAYOR_55 IS 'S/1 si aplica a mayores de 55 años, N/0 en caso contrario';
COMMENT ON COLUMN MELANBIDE11_SUBVENCION_REF.DISCAPACIDAD IS 'S/1 si aplica a personas con discapacidad, N/0 en caso contrario';
COMMENT ON COLUMN MELANBIDE11_SUBVENCION_REF.TIPO_CONTRATO IS 'Tipo de contrato específico o vacío si aplica a todos';
COMMENT ON COLUMN MELANBIDE11_SUBVENCION_REF.IMPORTE IS 'Cuantía de subvención en euros';
COMMENT ON COLUMN MELANBIDE11_SUBVENCION_REF.BASE_12_MESES IS 'S/1 si el importe es base anual (12 meses), N/0 si ya está prorrateado';

-- Conceder permisos (ajustar según roles de la organización)
-- GRANT SELECT, INSERT, UPDATE, DELETE ON MELANBIDE11_SUBVENCION_REF TO MELANBIDE11_USER;
-- GRANT SELECT ON MELANBIDE11_SUBVENCION_REF TO MELANBIDE11_READER;
