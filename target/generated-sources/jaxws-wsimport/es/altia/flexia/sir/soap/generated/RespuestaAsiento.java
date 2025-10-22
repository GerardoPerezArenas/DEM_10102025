
package es.altia.flexia.sir.soap.generated;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;


/**
 * <p>Clase Java para RespuestaAsiento complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="RespuestaAsiento">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="codIntercambio" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codEntidadRegistralProcesa" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codUnidadTramitadoraDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="descripcionUnidadTramitadoraDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codEntidadRegistralDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="descripcionEntidadRegistralDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="motivo" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="appVersion" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="nombreUsuario" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="contactoUsuario" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="tipoRespuesta" type="{http://altiasir.es/flexia-interno-soap-ws}TipoRespuesta"/>
 *         &lt;element name="feEntradaDestino" type="{http://www.w3.org/2001/XMLSchema}date"/>
 *         &lt;element name="nuRgEntradaDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codAsiento" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RespuestaAsiento", propOrder = {
    "codIntercambio",
    "codEntidadRegistralProcesa",
    "codUnidadTramitadoraDestino",
    "descripcionUnidadTramitadoraDestino",
    "codEntidadRegistralDestino",
    "descripcionEntidadRegistralDestino",
    "motivo",
    "appVersion",
    "nombreUsuario",
    "contactoUsuario",
    "tipoRespuesta",
    "feEntradaDestino",
    "nuRgEntradaDestino",
    "codAsiento"
})
public class RespuestaAsiento {

    @XmlElement(required = true)
    protected String codIntercambio;
    @XmlElement(required = true)
    protected String codEntidadRegistralProcesa;
    @XmlElement(required = true)
    protected String codUnidadTramitadoraDestino;
    @XmlElement(required = true)
    protected String descripcionUnidadTramitadoraDestino;
    @XmlElement(required = true)
    protected String codEntidadRegistralDestino;
    @XmlElement(required = true)
    protected String descripcionEntidadRegistralDestino;
    @XmlElement(required = true)
    protected String motivo;
    @XmlElement(required = true)
    protected String appVersion;
    @XmlElement(required = true)
    protected String nombreUsuario;
    @XmlElement(required = true)
    protected String contactoUsuario;
    @XmlElement(required = true)
    protected TipoRespuesta tipoRespuesta;
    @XmlElement(required = true)
    @XmlSchemaType(name = "date")
    protected XMLGregorianCalendar feEntradaDestino;
    @XmlElement(required = true)
    protected String nuRgEntradaDestino;
    protected int codAsiento;

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
     * Obtiene el valor de la propiedad codUnidadTramitadoraDestino.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodUnidadTramitadoraDestino() {
        return codUnidadTramitadoraDestino;
    }

    /**
     * Define el valor de la propiedad codUnidadTramitadoraDestino.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodUnidadTramitadoraDestino(String value) {
        this.codUnidadTramitadoraDestino = value;
    }

    /**
     * Obtiene el valor de la propiedad descripcionUnidadTramitadoraDestino.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionUnidadTramitadoraDestino() {
        return descripcionUnidadTramitadoraDestino;
    }

    /**
     * Define el valor de la propiedad descripcionUnidadTramitadoraDestino.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionUnidadTramitadoraDestino(String value) {
        this.descripcionUnidadTramitadoraDestino = value;
    }

    /**
     * Obtiene el valor de la propiedad codEntidadRegistralDestino.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodEntidadRegistralDestino() {
        return codEntidadRegistralDestino;
    }

    /**
     * Define el valor de la propiedad codEntidadRegistralDestino.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodEntidadRegistralDestino(String value) {
        this.codEntidadRegistralDestino = value;
    }

    /**
     * Obtiene el valor de la propiedad descripcionEntidadRegistralDestino.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionEntidadRegistralDestino() {
        return descripcionEntidadRegistralDestino;
    }

    /**
     * Define el valor de la propiedad descripcionEntidadRegistralDestino.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionEntidadRegistralDestino(String value) {
        this.descripcionEntidadRegistralDestino = value;
    }

    /**
     * Obtiene el valor de la propiedad motivo.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMotivo() {
        return motivo;
    }

    /**
     * Define el valor de la propiedad motivo.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMotivo(String value) {
        this.motivo = value;
    }

    /**
     * Obtiene el valor de la propiedad appVersion.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAppVersion() {
        return appVersion;
    }

    /**
     * Define el valor de la propiedad appVersion.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAppVersion(String value) {
        this.appVersion = value;
    }

    /**
     * Obtiene el valor de la propiedad nombreUsuario.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    /**
     * Define el valor de la propiedad nombreUsuario.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreUsuario(String value) {
        this.nombreUsuario = value;
    }

    /**
     * Obtiene el valor de la propiedad contactoUsuario.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContactoUsuario() {
        return contactoUsuario;
    }

    /**
     * Define el valor de la propiedad contactoUsuario.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContactoUsuario(String value) {
        this.contactoUsuario = value;
    }

    /**
     * Obtiene el valor de la propiedad tipoRespuesta.
     * 
     * @return
     *     possible object is
     *     {@link TipoRespuesta }
     *     
     */
    public TipoRespuesta getTipoRespuesta() {
        return tipoRespuesta;
    }

    /**
     * Define el valor de la propiedad tipoRespuesta.
     * 
     * @param value
     *     allowed object is
     *     {@link TipoRespuesta }
     *     
     */
    public void setTipoRespuesta(TipoRespuesta value) {
        this.tipoRespuesta = value;
    }

    /**
     * Obtiene el valor de la propiedad feEntradaDestino.
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public XMLGregorianCalendar getFeEntradaDestino() {
        return feEntradaDestino;
    }

    /**
     * Define el valor de la propiedad feEntradaDestino.
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setFeEntradaDestino(XMLGregorianCalendar value) {
        this.feEntradaDestino = value;
    }

    /**
     * Obtiene el valor de la propiedad nuRgEntradaDestino.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNuRgEntradaDestino() {
        return nuRgEntradaDestino;
    }

    /**
     * Define el valor de la propiedad nuRgEntradaDestino.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNuRgEntradaDestino(String value) {
        this.nuRgEntradaDestino = value;
    }

    /**
     * Obtiene el valor de la propiedad codAsiento.
     * 
     */
    public int getCodAsiento() {
        return codAsiento;
    }

    /**
     * Define el valor de la propiedad codAsiento.
     * 
     */
    public void setCodAsiento(int value) {
        this.codAsiento = value;
    }

}
