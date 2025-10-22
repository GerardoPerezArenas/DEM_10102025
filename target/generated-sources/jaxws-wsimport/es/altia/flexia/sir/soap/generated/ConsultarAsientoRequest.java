
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
 *         &lt;element name="codEntidadRegistralProcesa" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codIntercambio" type="{http://www.w3.org/2001/XMLSchema}string"/>
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
    "codEntidadRegistralProcesa",
    "codIntercambio"
})
@XmlRootElement(name = "consultarAsientoRequest")
public class ConsultarAsientoRequest {

    @XmlElement(required = true)
    protected String codEntidadRegistralProcesa;
    @XmlElement(required = true)
    protected String codIntercambio;

    /**
     * Obtiene el valor de la propiedad codEntidadRegistralProcesa.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodEntidadRegistralProcesa() {
        return codEntidadRegistralProcesa;
    }

    /**
     * Define el valor de la propiedad codEntidadRegistralProcesa.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodEntidadRegistralProcesa(String value) {
        this.codEntidadRegistralProcesa = value;
    }

    /**
     * Obtiene el valor de la propiedad codIntercambio.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodIntercambio() {
        return codIntercambio;
    }

    /**
     * Define el valor de la propiedad codIntercambio.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodIntercambio(String value) {
        this.codIntercambio = value;
    }

}
