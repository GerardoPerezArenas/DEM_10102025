Java y build

JDK 8 compilando para 1.6: -source 1.6 -target 1.6 -bootclasspath <JRE6>\lib\rt.jar.

Encoding fuentes: ISO-8859-1 → javac -encoding ISO-8859-1.

Ant hoy (procedimientos sueltos). Maven más adelante (proyecto completo).

Sin sintaxis/APIs > Java 6: sin lambdas, streams, diamond, try-with-resources, java.time, StandardCharsets, etc.

Dependencias externas en classpath: Flexia (es.altia.*), Servlet API, Log4j, Oracle JDBC. No añadir frameworks nuevos.

Internacionalización (i18n)

.properties en ISO-8859-1 con \uXXXX. Generar con native2ascii si hace falta.

Dos bundles por idioma. Mantener clave única y estable: modulo.seccion.campo[.accion].

Orden y uso: ES = TXT_1, EU = TXT_4 (o el que use vuestro framework).

JSP: nunca texto literal. Siempre i18n.getMensaje(idiomaUsuario,"clave").

Validar que todas las claves existen en ambos idiomas antes de integrar.

Codificación web

JSP: <%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>.

Filtro en web.xml con SetCharacterEncodingFilter a ISO-8859-1.

Tomcat: URIEncoding="UTF-8" useBodyEncodingForURI="true" en el conector HTTP.

Estilo y patrón de código

Respetar capas: DAO solo SQL/CRUD, Manager lógica, Controlador flujo web. VO para datos.

Reusar utilidades y constantes existentes. No inventar nombres nuevos si ya hay patrón.

Firmas y nombres como el resto: getters/setters, sufijos VO, DAO, Manager.

Cierre de recursos al estilo 6: try { ... } finally { cerrar(...) }. Nada de TWR.

Logging y comentarios

Log4j. Niveles: error para fallos, warn para degradaciones, info para hitos, debug para diagnóstico.

Prohibido System.out/err.

Logs temporales de tarea marcados TEMP_LOG y TODO-REMOVE. Se eliminan al cerrar la tarea.

Comentarios nuestros marcados // TASK:<ID> <fecha> <autor>. También se retiran al cierre.

Comentarios legacy previos no se tocan salvo causa justificada.

Front/JSP y UI legacy

Misma maquetación, CSS y clases que el resto. No introducir nuevos estilos globales.

Nada de HTML5/JS modernos que rompan IE viejos si aún existen restricciones.

Sin texto duro; todo por i18n. Longitudes y formatos validados en cliente y servidor.

Modos: Alta/Edición/Consulta con la lógica visual ya usada. Campos históricos: solo lectura, con aviso.

SQL y BD

SQL compatible con la versión de Oracle del sistema. Sin funciones modernas si no están en uso.

Validar NLS y charset BD. Ideal AL32UTF8, pero no mezclar codificaciones en los datos.

Transacciones desde Manager. DAO sin gestionar commit/rollback salvo patrón existente.

Evitar cambios de esquema sin script controlado.

Gestión de cambios

Cambios mínimos y localizados. No refactors “de mejora”.

Verificar dependencias cruzadas antes de tocar “código aparentemente muerto”.

Commits atómicos. Mensaje: [M11][Tarea XX] <cambio conciso>.

Si se añade clave i18n/campo nuevo, checklist: propiedades ES/EU, Constantes, VO, DAO, Manager, JSP, validaciones, tests manuales.

Pruebas mínimas por tarea

Compilación Ant con target 1.6 y encoding correcto.

Navegación completa: lista → alta → guardar → vuelta a tabla con datos actualizados sin recargar; edición; eliminación.

Idiomas: alternar ES/EU y revisar todas las etiquetas nuevas.

Logs: sin TEMP_LOG a nivel info o superior; debug permitido solo en entorno dev.

Revisión de .properties: sin claves huérfanas, sin duplicadas.

Entrega de tarea

Código siguiendo patrón legacy y sin romper compatibilidad Java 6.

Sin dependencias nuevas. Sin estilos globales nuevos.

Sin TEMP_LOG ni comentarios TASK: si se marca como cerrada.

Registro de claves i18n añadidas y de ficheros tocados.
