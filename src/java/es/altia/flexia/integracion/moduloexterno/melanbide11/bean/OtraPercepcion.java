package es.altia.flexia.integracion.moduloexterno.melanbide11.bean;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Bean para representar otra percepci�n en el m�dulo MELANBIDE11
 */
public class OtraPercepcion implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private Long id;
    private BigDecimal importe;
    private String tipo;
    private String observaciones;
    private Long idContratacion;
    
    // Constructor por defecto
    public OtraPercepcion() {
    }
    
    // Constructor con par�metros
    public OtraPercepcion(Long id, BigDecimal importe, String tipo, String observaciones, Long idContratacion) {
        this.id = id;
        this.importe = importe;
        this.tipo = tipo;
        this.observaciones = observaciones;
        this.idContratacion = idContratacion;
    }
    
    // Getters y Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public BigDecimal getImporte() {
        return importe;
    }
    
    public void setImporte(BigDecimal importe) {
        this.importe = importe;
    }
    
    public String getTipo() {
        return tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public String getObservaciones() {
        return observaciones;
    }
    
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
    public Long getIdContratacion() {
        return idContratacion;
    }
    
    public void setIdContratacion(Long idContratacion) {
        this.idContratacion = idContratacion;
    }
    
    @Override
    public String toString() {
        return "OtraPercepcion{" +
                "id=" + id +
                ", importe=" + importe +
                ", tipo='" + tipo + '\'' +
                ", observaciones='" + observaciones + '\'' +
                ", idContratacion=" + idContratacion +
                '}';
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        
        OtraPercepcion that = (OtraPercepcion) o;
        
        return id != null ? id.equals(that.id) : that.id == null;
    }
    
    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}