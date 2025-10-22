
package es.altia.flexia.sir.soap.generated;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para Anexo complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="Anexo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="nombreFichero" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="identificadorFichero" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="validezDocuemento" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="tipoDocumento" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="certificado" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="firmaDocumento" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="timeStamp" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="validacionOCSPCertificado" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="hash" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="tipoMIME" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="identificadorDocumentoFirmado" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="observaciones" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="csv" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="contenido" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "Anexo", propOrder = {
    "nombreFichero",
    "identificadorFichero",
    "validezDocuemento",
    "tipoDocumento",
    "certificado",
    "firmaDocumento",
    "timeStamp",
    "validacionOCSPCertificado",
    "hash",
    "tipoMIME",
    "identificadorDocumentoFirmado",
    "observaciones",
    "csv",
    "contenido"
})
public class Anexo {

    @XmlElement(required = true)
    protected String nombreFichero;
    @XmlElement(required = true)
    protected String identificadorFichero;
    @XmlElement(required = true)
    protected String validezDocuemento;
    @XmlElement(required = true)
    protected String tipoDocumento;
    @XmlElement(required = true)
    protected String certificado;
    @XmlElement(required = true)
    protected String firmaDocumento;
    @XmlElement(required = true)
    protected String timeStamp;
    @XmlElement(required = true)
    protected String validacionOCSPCertificado;
    @XmlElement(required = true)
    protected String hash;
    @XmlElement(required = true)
    protected String tipoMIME;
    @XmlElement(required = true)
    protected String identificadorDocumentoFirmado;
    @XmlElement(required = true)
    protected String observaciones;
    @XmlElement(required = true)
    protected String csv;
    @XmlElement(required = true)
    protected byte[] contenido;

    /**
     * Obtiene el valor de la propiedad nombreFichero.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreFichero() {
        return nombreFichero;
    }

    /**
     * Define el valor de la propiedad nombreFichero.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreFichero(String value) {
        this.nombreFichero = value;
    }

    /**
     * Obtiene el valor de la propiedad identificadorFichero.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getIdentificadorFichero() {
        return identificadorFichero;
    }

    /**
     * Define el valor de la propiedad identificadorFichero.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIdentificadorFichero(String value) {
        this.identificadorFichero = value;
    }

    /**
     * Obtiene el valor de la propiedad validezDocuemento.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getValidezDocuemento() {
        return validezDocuemento;
    }

    /**
     * Define el valor de la propiedad validezDocuemento.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setValidezDocuemento(String value) {
        this.validezDocuemento = value;
    }

    /**
     * Obtiene el valor de la propiedad tipoDocumento.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTipoDocumento() {
        return tipoDocumento;
    }

    /**
     * Define el valor de la propiedad tipoDocumento.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTipoDocumento(String value) {
        this.tipoDocumento = value;
    }

    /**
     * Obtiene el valor de la propiedad certificado.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCertificado() {
        return certificado;
    }

    /**
     * Define el valor de la propiedad certificado.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCertificado(String value) {
        this.certificado = value;
    }

    /**
     * Obtiene el valor de la propiedad firmaDocumento.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFirmaDocumento() {
        return firmaDocumento;
    }

    /**
     * Define el valor de la propiedad firmaDocumento.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFirmaDocumento(String value) {
        this.firmaDocumento = value;
    }

    /**
     * Obtiene el valor de la propiedad timeStamp.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTimeStamp() {
        return timeStamp;
    }

    /**
     * Define el valor de la propiedad timeStamp.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTimeStamp(String value) {
        this.timeStamp = value;
    }

    /**
     * Obtiene el valor de la propiedad validacionOCSPCertificado.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getValidacionOCSPCertificado() {
        return validacionOCSPCertificado;
    }

    /**
     * Define el valor de la propiedad validacionOCSPCertificado.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setValidacionOCSPCertificado(String value) {
        this.validacionOCSPCertificado = value;
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
     * Obtiene el valor de la propiedad tipoMIME.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTipoMIME() {
        return tipoMIME;
    }

    /**
     * Define el valor de la propiedad tipoMIME.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTipoMIME(String value) {
        this.tipoMIME = value;
    }

    /**
     * Obtiene el valor de la propiedad identificadorDocumentoFirmado.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getIdentificadorDocumentoFirmado() {
        return identificadorDocumentoFirmado;
    }

    /**
     * Define el valor de la propiedad identificadorDocumentoFirmado.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIdentificadorDocumentoFirmado(String value) {
        this.identificadorDocumentoFirmado = value;
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

}
