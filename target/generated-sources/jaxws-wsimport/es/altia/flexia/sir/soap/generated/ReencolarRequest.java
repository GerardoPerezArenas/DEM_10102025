
package es.altia.flexia.sir.soap.generated;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlList;
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
 *         &lt;element name="cdEnRgProcesa" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codIntercambio" type="{http://altiasir.es/flexia-interno-soap-ws}StringList"/>
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
    "cdEnRgProcesa",
    "codIntercambio"
})
@XmlRootElement(name = "reencolarRequest")
public class ReencolarRequest {

    @XmlElement(required = true)
    protected String cdEnRgProcesa;
    @XmlList
    @XmlElement(required = true)
    protected List<String> codIntercambio;

    /**
     * Obtiene el valor de la propiedad cdEnRgProcesa.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCdEnRgProcesa() {
        return cdEnRgProcesa;
    }

    /**
     * Define el valor de la propiedad cdEnRgProcesa.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCdEnRgProcesa(String value) {
        this.cdEnRgProcesa = value;
    }

    /**
     * Gets the value of the codIntercambio property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the codIntercambio property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getCodIntercambio().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getCodIntercambio() {
        if (codIntercambio == null) {
            codIntercambio = new ArrayList<String>();
        }
        return this.codIntercambio;
    }

}
