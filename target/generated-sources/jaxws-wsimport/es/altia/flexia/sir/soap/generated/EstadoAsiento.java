
package es.altia.flexia.sir.soap.generated;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para EstadoAsiento.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * <p>
 * <pre>
 * &lt;simpleType name="EstadoAsiento">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="PENDIENTE"/>
 *     &lt;enumeration value="RECHAZADO"/>
 *     &lt;enumeration value="ACEPTADO"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "EstadoAsiento")
@XmlEnum
public enum EstadoAsiento {

    PENDIENTE,
    RECHAZADO,
    ACEPTADO;

    public String value() {
        return name();
    }

    public static EstadoAsiento fromValue(String v) {
        return valueOf(v);
    }

}
