# GitHub Copilot Instructions for MELANBIDE11

## Project Overview

This repository contains the MELANBIDE11 module, a Java web application that integrates with the Lanbide (Basque employment service) system for managing employment subsidies and hiring contracts (DEM50 program). The module is part of the Flexia framework and handles:

- Contract registration and management for employment subsidies
- Minimis subsidy tracking
- Salary breakdown calculations (RSB - Retribuciones Salariales y Beneficios)
- Integration with external employment databases

The primary users are administrative staff managing employment subsidy programs in the Basque Country.

## Tech Stack

### Backend
- **Java** (J2EE/Servlet-based)
- **Flexia Framework** - Custom enterprise integration framework by Altia
- **Oracle Database** - Primary data storage
- **JDBC/SQL** - Database connectivity
- **Log4j** - Logging framework

### Frontend
- **JSP (JavaServer Pages)** - Server-side rendering
- **JavaScript** - Client-side interactivity
- **CSS** - Styling
- **jQuery** (implied by code patterns) - DOM manipulation and AJAX

### Build and Deployment
- Java web application (WAR deployment assumed)
- Servlet container (Tomcat/WebLogic/similar)

## Code Organization

```
/
├── java/
│   └── es/altia/flexia/integracion/moduloexterno/melanbide11/
│       ├── MELANBIDE11.java          # Main controller/entry point
│       ├── dao/                       # Data Access Objects
│       ├── manager/                   # Business logic layer
│       ├── util/                      # Utility classes
│       ├── vo/                        # Value Objects (DTOs)
│       └── i18n/                      # Internationalization resources
└── web/
    ├── jsp/extension/melanbide11/     # View layer (JSP pages)
    ├── scripts/extension/melanbide11/ # JavaScript files
    └── css/extension/melanbide11/     # Stylesheets
```

## Coding Guidelines

### Java Code Standards

1. **Package Naming**: Follow the existing structure `es.altia.flexia.integracion.moduloexterno.melanbide11.*`
2. **Class Naming Conventions**:
   - Value Objects: End with `VO` (e.g., `ContratacionVO`, `MinimisVO`)
   - Data Access Objects: End with `DAO` (e.g., `MeLanbide11DAO`)
   - Managers: End with `Manager` (e.g., `MeLanbide11Manager`)
   - Utilities: End with `Utils` or `Util` (e.g., `MeLanbide11MappingUtils`)
   - Constants: End with `Constants` or use pattern `ConstantesMeLanbide11`

3. **Logging**: Use Log4j for logging
   ```java
   private static final Logger logger = Logger.getLogger(ClassName.class);
   ```

4. **Exception Handling**: 
   - Use `TechnicalException` for technical errors
   - Use `BDException` for database-related errors
   - Always log exceptions before throwing or handling

5. **Database Access**:
   - Use `AdaptadorSQLBD` for database connections
   - Use prepared statements to prevent SQL injection
   - Always close resources (Connection, Statement, ResultSet) in finally blocks or use try-with-resources

6. **Configuration**:
   - Properties are loaded from `.properties` files
   - Use `ConfigurationParameter` utility for accessing configuration
   - Constants are defined in `ConstantesMeLanbide11`

### JavaScript Code Standards

1. **File Organization**: Group related functions by domain (e.g., validation, table manipulation, utilities)
2. **Naming**: Use camelCase for functions and variables
3. **jQuery**: Use jQuery for DOM manipulation when present
4. **Input Masks**: Use existing `InputMask.js` utilities for form field formatting

### JSP Standards

1. **Encoding**: All JSP files should use UTF-8 encoding
2. **Tag Libraries**: Use standard JSTL and custom Flexia tags
3. **Scriptlets**: Minimize Java code in JSP; prefer tag libraries and EL expressions
4. **I18N**: Use resource bundles for all user-facing text

### CSS Standards

1. **Naming**: Use meaningful, descriptive class names
2. **Organization**: Group related styles together
3. **Browser Compatibility**: Ensure cross-browser compatibility for enterprise environments

## Important Domain Concepts

### Key Entities
- **Contratación (Contract)**: Employment contract information including worker details, position, salary
- **Minimis**: EU de minimis state aid tracking
- **Desglose RSB**: Salary breakdown into salarial and extra-salarial components
- **Desplegables**: Dropdown/select options from database tables

### Business Rules
1. Salary calculations distinguish between "salarial" (salary) and "extrasalarial" (non-salary) components
2. Contracts must reference valid BOP (Official Gazette) publications
3. Age thresholds matter (e.g., "MAY55CONT" - over 55 years old)
4. Integration with external databases (GEN_OCUPACS_ALTER, GEN_TITULACIONES, GEN_CERTIF_PROF)

## Common Patterns

### Database Query Pattern
```java
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
    conn = dataSource.getConnection();
    stmt = conn.createStatement();
    rs = stmt.executeQuery(sql);
    // Process results
} catch (SQLException e) {
    logger.error("Error executing query", e);
    throw new BDException(e);
} finally {
    // Close resources
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
    if (conn != null) try { conn.close(); } catch (SQLException e) {}
}
```

### Value Object Pattern
- All VOs should be JavaBeans with private fields and public getters/setters
- Implement `Serializable` for session storage
- Use descriptive Spanish field names matching database columns (e.g., `dniCont`, `nomCont`)

## Localization

- The application supports both Spanish (Castilian) and Basque (Euskera)
- Locale identifiers: `0` = Spanish, `1` = Basque  
- Property files follow pattern: `MELANBIDE11_TEXT_1.properties`, `MELANBIDE11_TEXT_4.properties`
- Use pipe character `|` to separate translations in dropdown values

## Security Considerations

1. **SQL Injection**: Always use prepared statements
2. **XSS Prevention**: Escape user input in JSP output
3. **Session Management**: Validate user sessions through UsuarioValueObject
4. **Special Characters**: Handle special characters defined in `CARACTERES_ESPECIALES` property

## Testing Considerations

- Test both Spanish and Basque language versions
- Validate calculations for salary breakdowns
- Test database transactions for rollback scenarios
- Verify integration with external tables

## Resources

- Configuration file: `java/MELANBIDE11.properties`
- I18N files: `java/es/altia/flexia/integracion/moduloexterno/melanbide11/i18n/text/`
- Database schema: Table prefix `MELANBIDE11_*`

## Additional Notes

- This is a legacy enterprise application; prioritize compatibility with existing code patterns
- Performance matters: minimize database queries and optimize for Oracle database
- User experience: Provide clear feedback messages in the user's language
- The module name "MELANBIDE11" combines "MeLanbide" (Lanbide employment service) with version indicator
