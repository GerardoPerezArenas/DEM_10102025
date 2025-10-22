
package es.altia.flexia.sir.soap.generated;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para TipoRespuesta.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * <p>
 * <pre>
 * &lt;simpleType name="TipoRespuesta">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="RECHAZO"/>
 *     &lt;enumeration value="CONFIRMACION"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "TipoRespuesta")
@XmlEnum
public enum TipoRespuesta {

    RECHAZO,
    CONFIRMACION;

    public String value() {
        return name();
    }

    public static TipoRespuesta fromValue(String v) {
        return valueOf(v);
    }

}
