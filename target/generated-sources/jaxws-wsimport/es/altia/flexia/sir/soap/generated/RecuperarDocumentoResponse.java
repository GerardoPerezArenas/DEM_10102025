
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
 *         &lt;element name="anexo" type="{http://altiasir.es/flexia-interno-soap-ws}Anexo"/>
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
    "anexo"
})
@XmlRootElement(name = "recuperarDocumentoResponse")
public class RecuperarDocumentoResponse {

    @XmlElement(required = true)
    protected Anexo anexo;

    /**
     * Obtiene el valor de la propiedad anexo.
     * 
     * @return
     *     possible object is
     *     {@link Anexo }
     *     
     */
    public Anexo getAnexo() {
        return anexo;
    }

    /**
     * Define el valor de la propiedad anexo.
     * 
     * @param value
     *     allowed object is
     *     {@link Anexo }
     *     
     */
    public void setAnexo(Anexo value) {
        this.anexo = value;
    }

}
