
package es.altia.flexia.sir.soap.generated;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para Interesado complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="Interesado">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="tipoDocumentoIdentificacion" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="documentoIdentificacion" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="nombreRazonSocial" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="correoElectronico" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="telefono" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="direccionElectronicaHabilitada" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="canalPreferenteComunicacion" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="observaciones" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="primerApellido" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="segundoApellido" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="domicilio" type="{http://altiasir.es/flexia-interno-soap-ws}Domicilio"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Interesado", propOrder = {
    "tipoDocumentoIdentificacion",
    "documentoIdentificacion",
    "nombreRazonSocial",
    "correoElectronico",
    "telefono",
    "direccionElectronicaHabilitada",
    "canalPreferenteComunicacion",
    "observaciones",
    "primerApellido",
    "segundoApellido",
    "domicilio"
})
public class Interesado {

    @XmlElement(required = true)
    protected String tipoDocumentoIdentificacion;
    @XmlElement(required = true)
    protected String documentoIdentificacion;
    @XmlElement(required = true)
    protected String nombreRazonSocial;
    @XmlElement(required = true)
    protected String correoElectronico;
    @XmlElement(required = true)
    protected String telefono;
    @XmlElement(required = true)
    protected String direccionElectronicaHabilitada;
    @XmlElement(required = true)
    protected String canalPreferenteComunicacion;
    @XmlElement(required = true)
    protected String observaciones;
    @XmlElement(required = true)
    protected String primerApellido;
    @XmlElement(required = true)
    protected String segundoApellido;
    @XmlElement(required = true)
    protected Domicilio domicilio;

    /**
     * Obtiene el valor de la propiedad tipoDocumentoIdentificacion.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTipoDocumentoIdentificacion() {
        return tipoDocumentoIdentificacion;
    }

    /**
     * Define el valor de la propiedad tipoDocumentoIdentificacion.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTipoDocumentoIdentificacion(String value) {
        this.tipoDocumentoIdentificacion = value;
    }

    /**
     * Obtiene el valor de la propiedad documentoIdentificacion.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDocumentoIdentificacion() {
        return documentoIdentificacion;
    }

    /**
     * Define el valor de la propiedad documentoIdentificacion.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDocumentoIdentificacion(String value) {
        this.documentoIdentificacion = value;
    }

    /**
     * Obtiene el valor de la propiedad nombreRazonSocial.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreRazonSocial() {
        return nombreRazonSocial;
    }

    /**
     * Define el valor de la propiedad nombreRazonSocial.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreRazonSocial(String value) {
        this.nombreRazonSocial = value;
    }

    /**
     * Obtiene el valor de la propiedad correoElectronico.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCorreoElectronico() {
        return correoElectronico;
    }

    /**
     * Define el valor de la propiedad correoElectronico.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCorreoElectronico(String value) {
        this.correoElectronico = value;
    }

    /**
     * Obtiene el valor de la propiedad telefono.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * Define el valor de la propiedad telefono.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTelefono(String value) {
        this.telefono = value;
    }

    /**
     * Obtiene el valor de la propiedad direccionElectronicaHabilitada.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDireccionElectronicaHabilitada() {
        return direccionElectronicaHabilitada;
    }

    /**
     * Define el valor de la propiedad direccionElectronicaHabilitada.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDireccionElectronicaHabilitada(String value) {
        this.direccionElectronicaHabilitada = value;
    }

    /**
     * Obtiene el valor de la propiedad canalPreferenteComunicacion.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCanalPreferenteComunicacion() {
        return canalPreferenteComunicacion;
    }

    /**
     * Define el valor de la propiedad canalPreferenteComunicacion.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCanalPreferenteComunicacion(String value) {
        this.canalPreferenteComunicacion = value;
    }

    /**
     * Obtiene el valor de la propiedad observaciones.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * Define el valor de la propiedad observaciones.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setObservaciones(String value) {
        this.observaciones = value;
    }

    /**
     * Obtiene el valor de la propiedad primerApellido.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPrimerApellido() {
        return primerApellido;
    }

    /**
     * Define el valor de la propiedad primerApellido.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPrimerApellido(String value) {
        this.primerApellido = value;
    }

    /**
     * Obtiene el valor de la propiedad segundoApellido.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSegundoApellido() {
        return segundoApellido;
    }

    /**
     * Define el valor de la propiedad segundoApellido.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSegundoApellido(String value) {
        this.segundoApellido = value;
    }

    /**
     * Obtiene el valor de la propiedad domicilio.
     * 
     * @return
     *     possible object is
     *     {@link Domicilio }
     *     
     */
    public Domicilio getDomicilio() {
        return domicilio;
    }

    /**
     * Define el valor de la propiedad domicilio.
     * 
     * @param value
     *     allowed object is
     *     {@link Domicilio }
     *     
     */
    public void setDomicilio(Domicilio value) {
        this.domicilio = value;
    }

}
