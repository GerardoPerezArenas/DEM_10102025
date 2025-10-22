
package es.altia.flexia.sir.soap.generated;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;


/**
 * <p>Clase Java para Justificante complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="Justificante">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="nombre" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="numeroRegistro" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="cdIntercambio" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="fechaHoraPresentacion" type="{http://www.w3.org/2001/XMLSchema}date"/>
 *         &lt;element name="fechaHoraRegistro" type="{http://www.w3.org/2001/XMLSchema}date"/>
 *         &lt;element name="hash" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="cdValidez" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="idFichero" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="cdTpDoc" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="dsCertificado" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="dsFirma" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="tsAnexo" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="dsValCerficado" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="dsHash" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="dsTpMime" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="contenido" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/>
 *         &lt;element name="csv" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="isFirmado" type="{http://www.w3.org/2001/XMLSchema}boolean"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Justificante", propOrder = {
    "nombre",
    "numeroRegistro",
    "cdIntercambio",
    "fechaHoraPresentacion",
    "fechaHoraRegistro",
    "hash",
    "cdValidez",
    "idFichero",
    "cdTpDoc",
    "dsCertificado",
    "dsFirma",
    "tsAnexo",
    "dsValCerficado",
    "dsHash",
    "dsTpMime",
    "contenido",
    "csv",
    "isFirmado"
})
public class Justificante {

    @XmlElement(required = true)
    protected String nombre;
    @XmlElement(required = true)
    protected String numeroRegistro;
    @XmlElement(required = true)
    protected String cdIntercambio;
    @XmlElement(required = true)
    @XmlSchemaType(name = "date")
    protected XMLGregorianCalendar fechaHoraPresentacion;
    @XmlElement(required = true)
    @XmlSchemaType(name = "date")
    protected XMLGregorianCalendar fechaHoraRegistro;
    @XmlElement(required = true)
    protected String hash;
    @XmlElement(required = true)
    protected String cdValidez;
    @XmlElement(required = true)
    protected String idFichero;
    @XmlElement(required = true)
    protected String cdTpDoc;
    @XmlElement(required = true)
    protected String dsCertificado;
    @XmlElement(required = true)
    protected String dsFirma;
    @XmlElement(required = true)
    protected String tsAnexo;
    @XmlElement(required = true)
    protected String dsValCerficado;
    @XmlElement(required = true)
    protected String dsHash;
    @XmlElement(required = true)
    protected String dsTpMime;
    @XmlElement(required = true)
    protected byte[] contenido;
    @XmlElement(required = true)
    protected String csv;
    protected boolean isFirmado;

    /**
     * Obtiene el valor de la propiedad nombre.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Define el valor de la propiedad nombre.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombre(String value) {
        this.nombre = value;
    }

    /**
     * Obtiene el valor de la propiedad numeroRegistro.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNumeroRegistro() {
        return numeroRegistro;
    }

    /**
     * Define el valor de la propiedad numeroRegistro.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNumeroRegistro(String value) {
        this.numeroRegistro = value;
    }

    /**
     * Obtiene el valor de la propiedad cdIntercambio.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCdIntercambio() {
        return cdIntercambio;
    }

    /**
     * Define el valor de la propiedad cdIntercambio.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCdIntercambio(String value) {
        this.cdIntercambio = value;
    }

    /**
     * Obtiene el valor de la propiedad fechaHoraPresentacion.
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public XMLGregorianCalendar getFechaHoraPresentacion() {
        return fechaHoraPresentacion;
    }

    /**
     * Define el valor de la propiedad fechaHoraPresentacion.
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setFechaHoraPresentacion(XMLGregorianCalendar value) {
        this.fechaHoraPresentacion = value;
    }

    /**
     * Obtiene el valor de la propiedad fechaHoraRegistro.
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public XMLGregorianCalendar getFechaHoraRegistro() {
        return fechaHoraRegistro;
    }

    /**
     * Define el valor de la propiedad fechaHoraRegistro.
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setFechaHoraRegistro(XMLGregorianCalendar value) {
        this.fechaHoraRegistro = value;
    }

    /**
     * Obtiene el valor de la propiedad hash.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getHash() {
        return hash;
    }

    /**
     * Define el valor de la propiedad hash.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setHash(String value) {
        this.hash = value;
    }

    /**
     * Obtiene el valor de la propiedad cdValidez.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCdValidez() {
        return cdValidez;
    }

    /**
     * Define el valor de la propiedad cdValidez.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCdValidez(String value) {
        this.cdValidez = value;
    }

    /**
     * Obtiene el valor de la propiedad idFichero.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getIdFichero() {
        return idFichero;
    }

    /**
     * Define el valor de la propiedad idFichero.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIdFichero(String value) {
        this.idFichero = value;
    }

    /**
     * Obtiene el valor de la propiedad cdTpDoc.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCdTpDoc() {
        return cdTpDoc;
    }

    /**
     * Define el valor de la propiedad cdTpDoc.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCdTpDoc(String value) {
        this.cdTpDoc = value;
    }

    /**
     * Obtiene el valor de la propiedad dsCertificado.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsCertificado() {
        return dsCertificado;
    }

    /**
     * Define el valor de la propiedad dsCertificado.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsCertificado(String value) {
        this.dsCertificado = value;
    }

    /**
     * Obtiene el valor de la propiedad dsFirma.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsFirma() {
        return dsFirma;
    }

    /**
     * Define el valor de la propiedad dsFirma.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsFirma(String value) {
        this.dsFirma = value;
    }

    /**
     * Obtiene el valor de la propiedad tsAnexo.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTsAnexo() {
        return tsAnexo;
    }

    /**
     * Define el valor de la propiedad tsAnexo.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTsAnexo(String value) {
        this.tsAnexo = value;
    }

    /**
     * Obtiene el valor de la propiedad dsValCerficado.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsValCerficado() {
        return dsValCerficado;
    }

    /**
     * Define el valor de la propiedad dsValCerficado.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsValCerficado(String value) {
        this.dsValCerficado = value;
    }

    /**
     * Obtiene el valor de la propiedad dsHash.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsHash() {
        return dsHash;
    }

    /**
     * Define el valor de la propiedad dsHash.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsHash(String value) {
        this.dsHash = value;
    }

    /**
     * Obtiene el valor de la propiedad dsTpMime.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsTpMime() {
        return dsTpMime;
    }

    /**
     * Define el valor de la propiedad dsTpMime.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsTpMime(String value) {
        this.dsTpMime = value;
    }

    /**
     * Obtiene el valor de la propiedad contenido.
     * 
     * @return
     *     possible object is
     *     byte[]
     */
    public byte[] getContenido() {
        return contenido;
    }

    /**
     * Define el valor de la propiedad contenido.
     * 
     * @param value
     *     allowed object is
     *     byte[]
     */
    public void setContenido(byte[] value) {
        this.contenido = value;
    }

    /**
     * Obtiene el valor de la propiedad csv.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCsv() {
        return csv;
    }

    /**
     * Define el valor de la propiedad csv.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCsv(String value) {
        this.csv = value;
    }

    /**
     * Obtiene el valor de la propiedad isFirmado.
     * 
     */
    public boolean isIsFirmado() {
        return isFirmado;
    }

    /**
     * Define el valor de la propiedad isFirmado.
     * 
     */
    public void setIsFirmado(boolean value) {
        this.isFirmado = value;
    }

}
