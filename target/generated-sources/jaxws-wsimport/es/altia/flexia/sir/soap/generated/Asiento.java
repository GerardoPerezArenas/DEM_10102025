
package es.altia.flexia.sir.soap.generated;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;


/**
 * <p>Clase Java para Asiento complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="Asiento">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="codEntidadRegistralOrigen" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="descripcionEntidadRegistralOrigen" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="numeroRegistroEntrada" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="timestampEntrada" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codUnidadTramitadoraOrigen" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="descripcionUnidadTramitadoraOrigen" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codEntidadRegistralDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="descripcionEntidadRegistralDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codUnidadTramitadoraDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="descripcionUnidadTramitadoraDestino" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="descripcionAsunto" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codAsunto" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="referenciaExterna" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="numExpediente" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codTipoTransporte" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="numTransporte" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="nombreUsuario" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="contactoUsuario" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codIntercambio" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="appVersion" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codTipoAnotacion" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="tipoAnotacion" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codTipoRegistro" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codDocFisica" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="observaciones" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="codEntidadRegistralInicio" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="descripcionEntidadRegistralInicio" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="expone" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="solicita" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="estado" type="{http://altiasir.es/flexia-interno-soap-ws}EstadoAsiento"/>
 *         &lt;element name="ListInteresado" type="{http://altiasir.es/flexia-interno-soap-ws}Interesado" maxOccurs="unbounded"/>
 *         &lt;element name="ListAnexo" type="{http://altiasir.es/flexia-interno-soap-ws}Anexo" maxOccurs="unbounded"/>
 *         &lt;element name="fechaEntrada" type="{http://www.w3.org/2001/XMLSchema}date"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Asiento", propOrder = {
    "codEntidadRegistralOrigen",
    "descripcionEntidadRegistralOrigen",
    "numeroRegistroEntrada",
    "timestampEntrada",
    "codUnidadTramitadoraOrigen",
    "descripcionUnidadTramitadoraOrigen",
    "codEntidadRegistralDestino",
    "descripcionEntidadRegistralDestino",
    "codUnidadTramitadoraDestino",
    "descripcionUnidadTramitadoraDestino",
    "descripcionAsunto",
    "codAsunto",
    "referenciaExterna",
    "numExpediente",
    "codTipoTransporte",
    "numTransporte",
    "nombreUsuario",
    "contactoUsuario",
    "codIntercambio",
    "appVersion",
    "codTipoAnotacion",
    "tipoAnotacion",
    "codTipoRegistro",
    "codDocFisica",
    "observaciones",
    "codEntidadRegistralInicio",
    "descripcionEntidadRegistralInicio",
    "expone",
    "solicita",
    "estado",
    "listInteresado",
    "listAnexo",
    "fechaEntrada"
})
public class Asiento {

    @XmlElement(required = true)
    protected String codEntidadRegistralOrigen;
    @XmlElement(required = true)
    protected String descripcionEntidadRegistralOrigen;
    @XmlElement(required = true)
    protected String numeroRegistroEntrada;
    @XmlElement(required = true)
    protected String timestampEntrada;
    @XmlElement(required = true)
    protected String codUnidadTramitadoraOrigen;
    @XmlElement(required = true)
    protected String descripcionUnidadTramitadoraOrigen;
    @XmlElement(required = true)
    protected String codEntidadRegistralDestino;
    @XmlElement(required = true)
    protected String descripcionEntidadRegistralDestino;
    @XmlElement(required = true)
    protected String codUnidadTramitadoraDestino;
    @XmlElement(required = true)
    protected String descripcionUnidadTramitadoraDestino;
    @XmlElement(required = true)
    protected String descripcionAsunto;
    @XmlElement(required = true)
    protected String codAsunto;
    @XmlElement(required = true)
    protected String referenciaExterna;
    @XmlElement(required = true)
    protected String numExpediente;
    @XmlElement(required = true)
    protected String codTipoTransporte;
    @XmlElement(required = true)
    protected String numTransporte;
    @XmlElement(required = true)
    protected String nombreUsuario;
    @XmlElement(required = true)
    protected String contactoUsuario;
    @XmlElement(required = true)
    protected String codIntercambio;
    @XmlElement(required = true)
    protected String appVersion;
    @XmlElement(required = true)
    protected String codTipoAnotacion;
    @XmlElement(required = true)
    protected String tipoAnotacion;
    @XmlElement(required = true)
    protected String codTipoRegistro;
    @XmlElement(required = true)
    protected String codDocFisica;
    @XmlElement(required = true)
    protected String observaciones;
    @XmlElement(required = true)
    protected String codEntidadRegistralInicio;
    @XmlElement(required = true)
    protected String descripcionEntidadRegistralInicio;
    @XmlElement(required = true)
    protected String expone;
    @XmlElement(required = true)
    protected String solicita;
    @XmlElement(required = true)
    protected EstadoAsiento estado;
    @XmlElement(name = "ListInteresado", required = true)
    protected List<Interesado> listInteresado;
    @XmlElement(name = "ListAnexo", required = true)
    protected List<Anexo> listAnexo;
    @XmlElement(required = true)
    @XmlSchemaType(name = "date")
    protected XMLGregorianCalendar fechaEntrada;

    /**
     * Obtiene el valor de la propiedad codEntidadRegistralOrigen.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodEntidadRegistralOrigen() {
        return codEntidadRegistralOrigen;
    }

    /**
     * Define el valor de la propiedad codEntidadRegistralOrigen.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodEntidadRegistralOrigen(String value) {
        this.codEntidadRegistralOrigen = value;
    }

    /**
     * Obtiene el valor de la propiedad descripcionEntidadRegistralOrigen.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionEntidadRegistralOrigen() {
        return descripcionEntidadRegistralOrigen;
    }

    /**
     * Define el valor de la propiedad descripcionEntidadRegistralOrigen.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionEntidadRegistralOrigen(String value) {
        this.descripcionEntidadRegistralOrigen = value;
    }

    /**
     * Obtiene el valor de la propiedad numeroRegistroEntrada.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNumeroRegistroEntrada() {
        return numeroRegistroEntrada;
    }

    /**
     * Define el valor de la propiedad numeroRegistroEntrada.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNumeroRegistroEntrada(String value) {
        this.numeroRegistroEntrada = value;
    }

    /**
     * Obtiene el valor de la propiedad timestampEntrada.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTimestampEntrada() {
        return timestampEntrada;
    }

    /**
     * Define el valor de la propiedad timestampEntrada.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTimestampEntrada(String value) {
        this.timestampEntrada = value;
    }

    /**
     * Obtiene el valor de la propiedad codUnidadTramitadoraOrigen.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodUnidadTramitadoraOrigen() {
        return codUnidadTramitadoraOrigen;
    }

    /**
     * Define el valor de la propiedad codUnidadTramitadoraOrigen.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodUnidadTramitadoraOrigen(String value) {
        this.codUnidadTramitadoraOrigen = value;
    }

    /**
     * Obtiene el valor de la propiedad descripcionUnidadTramitadoraOrigen.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionUnidadTramitadoraOrigen() {
        return descripcionUnidadTramitadoraOrigen;
    }

    /**
     * Define el valor de la propiedad descripcionUnidadTramitadoraOrigen.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionUnidadTramitadoraOrigen(String value) {
        this.descripcionUnidadTramitadoraOrigen = value;
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
     * Obtiene el valor de la propiedad descripcionAsunto.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionAsunto() {
        return descripcionAsunto;
    }

    /**
     * Define el valor de la propiedad descripcionAsunto.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionAsunto(String value) {
        this.descripcionAsunto = value;
    }

    /**
     * Obtiene el valor de la propiedad codAsunto.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodAsunto() {
        return codAsunto;
    }

    /**
     * Define el valor de la propiedad codAsunto.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodAsunto(String value) {
        this.codAsunto = value;
    }

    /**
     * Obtiene el valor de la propiedad referenciaExterna.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReferenciaExterna() {
        return referenciaExterna;
    }

    /**
     * Define el valor de la propiedad referenciaExterna.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReferenciaExterna(String value) {
        this.referenciaExterna = value;
    }

    /**
     * Obtiene el valor de la propiedad numExpediente.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNumExpediente() {
        return numExpediente;
    }

    /**
     * Define el valor de la propiedad numExpediente.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNumExpediente(String value) {
        this.numExpediente = value;
    }

    /**
     * Obtiene el valor de la propiedad codTipoTransporte.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodTipoTransporte() {
        return codTipoTransporte;
    }

    /**
     * Define el valor de la propiedad codTipoTransporte.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodTipoTransporte(String value) {
        this.codTipoTransporte = value;
    }

    /**
     * Obtiene el valor de la propiedad numTransporte.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNumTransporte() {
        return numTransporte;
    }

    /**
     * Define el valor de la propiedad numTransporte.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNumTransporte(String value) {
        this.numTransporte = value;
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
     * Obtiene el valor de la propiedad codTipoAnotacion.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodTipoAnotacion() {
        return codTipoAnotacion;
    }

    /**
     * Define el valor de la propiedad codTipoAnotacion.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodTipoAnotacion(String value) {
        this.codTipoAnotacion = value;
    }

    /**
     * Obtiene el valor de la propiedad tipoAnotacion.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTipoAnotacion() {
        return tipoAnotacion;
    }

    /**
     * Define el valor de la propiedad tipoAnotacion.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTipoAnotacion(String value) {
        this.tipoAnotacion = value;
    }

    /**
     * Obtiene el valor de la propiedad codTipoRegistro.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodTipoRegistro() {
        return codTipoRegistro;
    }

    /**
     * Define el valor de la propiedad codTipoRegistro.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodTipoRegistro(String value) {
        this.codTipoRegistro = value;
    }

    /**
     * Obtiene el valor de la propiedad codDocFisica.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodDocFisica() {
        return codDocFisica;
    }

    /**
     * Define el valor de la propiedad codDocFisica.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodDocFisica(String value) {
        this.codDocFisica = value;
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
     * Obtiene el valor de la propiedad codEntidadRegistralInicio.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodEntidadRegistralInicio() {
        return codEntidadRegistralInicio;
    }

    /**
     * Define el valor de la propiedad codEntidadRegistralInicio.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodEntidadRegistralInicio(String value) {
        this.codEntidadRegistralInicio = value;
    }

    /**
     * Obtiene el valor de la propiedad descripcionEntidadRegistralInicio.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescripcionEntidadRegistralInicio() {
        return descripcionEntidadRegistralInicio;
    }

    /**
     * Define el valor de la propiedad descripcionEntidadRegistralInicio.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescripcionEntidadRegistralInicio(String value) {
        this.descripcionEntidadRegistralInicio = value;
    }

    /**
     * Obtiene el valor de la propiedad expone.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExpone() {
        return expone;
    }

    /**
     * Define el valor de la propiedad expone.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExpone(String value) {
        this.expone = value;
    }

    /**
     * Obtiene el valor de la propiedad solicita.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSolicita() {
        return solicita;
    }

    /**
     * Define el valor de la propiedad solicita.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSolicita(String value) {
        this.solicita = value;
    }

    /**
     * Obtiene el valor de la propiedad estado.
     * 
     * @return
     *     possible object is
     *     {@link EstadoAsiento }
     *     
     */
    public EstadoAsiento getEstado() {
        return estado;
    }

    /**
     * Define el valor de la propiedad estado.
     * 
     * @param value
     *     allowed object is
     *     {@link EstadoAsiento }
     *     
     */
    public void setEstado(EstadoAsiento value) {
        this.estado = value;
    }

    /**
     * Gets the value of the listInteresado property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the listInteresado property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getListInteresado().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Interesado }
     * 
     * 
     */
    public List<Interesado> getListInteresado() {
        if (listInteresado == null) {
            listInteresado = new ArrayList<Interesado>();
        }
        return this.listInteresado;
    }

    /**
     * Gets the value of the listAnexo property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the listAnexo property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getListAnexo().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Anexo }
     * 
     * 
     */
    public List<Anexo> getListAnexo() {
        if (listAnexo == null) {
            listAnexo = new ArrayList<Anexo>();
        }
        return this.listAnexo;
    }

    /**
     * Obtiene el valor de la propiedad fechaEntrada.
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public XMLGregorianCalendar getFechaEntrada() {
        return fechaEntrada;
    }

    /**
     * Define el valor de la propiedad fechaEntrada.
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setFechaEntrada(XMLGregorianCalendar value) {
        this.fechaEntrada = value;
    }

}
