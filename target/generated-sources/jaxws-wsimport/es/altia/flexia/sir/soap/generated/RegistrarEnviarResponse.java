
package es.altia.flexia.sir.soap.generated;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para anonymous complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="justificante" type="{http://altiasir.es/flexia-interno-soap-ws}Justificante"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "justificante"
})
@XmlRootElement(name = "registrarEnviarResponse")
public class RegistrarEnviarResponse {

    @XmlElement(required = true)
    protected Justificante justificante;

    /**
     * Obtiene el valor de la propiedad justificante.
     * 
     * @return
     *     possible object is
     *     {@link Justificante }
     *     
     */
    public Justificante getJustificante() {
        return justificante;
    }

    /**
     * Define el valor de la propiedad justificante.
     * 
     * @param value
     *     allowed object is
     *     {@link Justificante }
     *     
     */
    public void setJustificante(Justificante value) {
        this.justificante = value;
    }

}
