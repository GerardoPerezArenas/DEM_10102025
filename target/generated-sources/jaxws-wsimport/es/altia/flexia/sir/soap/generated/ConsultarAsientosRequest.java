
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
 *         &lt;element name="codEntidadRegistral" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="maxResults" type="{http://www.w3.org/2001/XMLSchema}int"/>
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
    "codEntidadRegistral",
    "maxResults"
})
@XmlRootElement(name = "consultarAsientosRequest")
public class ConsultarAsientosRequest {

    @XmlElement(required = true)
    protected String codEntidadRegistral;
    protected int maxResults;

    /**
     * Obtiene el valor de la propiedad codEntidadRegistral.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodEntidadRegistral() {
        return codEntidadRegistral;
    }

    /**
     * Define el valor de la propiedad codEntidadRegistral.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodEntidadRegistral(String value) {
        this.codEntidadRegistral = value;
    }

    /**
     * Obtiene el valor de la propiedad maxResults.
     * 
     */
    public int getMaxResults() {
        return maxResults;
    }

    /**
     * Define el valor de la propiedad maxResults.
     * 
     */
    public void setMaxResults(int value) {
        this.maxResults = value;
    }

}
