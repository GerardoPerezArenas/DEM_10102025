package com.lanbide.lan6.errores.bean;

import java.io.Serializable;

/**
 * Stub implementation of ErrorBean for compilation compatibility.
 * This is a minimal implementation for Java 6 compatibility.
 */
public class ErrorBean implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String codigo;
    private String mensaje;
    private String tipo;
    private String origen;
    private String errorLog;
    private String idFlexia;
    private String traza;
    private String causa;
    private String idProcedimiento;
    private String idClave;
    private String sistemaOrigen;
    
    public ErrorBean() {
    }
    
    public ErrorBean(String codigo, String mensaje) {
        this.codigo = codigo;
        this.mensaje = mensaje;
    }
    
    public String getCodigo() {
        return codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    public String getMensaje() {
        return mensaje;
    }
    
    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
    public String getTipo() {
        return tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public String getOrigen() {
        return origen;
    }
    
    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    public String getErrorLog() {
        return errorLog;
    }
    
    public void setErrorLog(String errorLog) {
        this.errorLog = errorLog;
    }
    
    public String getIdFlexia() {
        return idFlexia;
    }
    
    public void setIdFlexia(String idFlexia) {
        this.idFlexia = idFlexia;
    }
    
    public String getTraza() {
        return traza;
    }
    
    public void setTraza(String traza) {
        this.traza = traza;
    }
    
    public String getCausa() {
        return causa;
    }
    
    public void setCausa(String causa) {
        this.causa = causa;
    }
    
    public String getIdProcedimiento() {
        return idProcedimiento;
    }
    
    public void setIdProcedimiento(String idProcedimiento) {
        this.idProcedimiento = idProcedimiento;
    }
    
    public String getIdClave() {
        return idClave;
    }
    
    public void setIdClave(String idClave) {
        this.idClave = idClave;
    }
    
    public String getSistemaOrigen() {
        return sistemaOrigen;
    }
    
    public void setSistemaOrigen(String sistemaOrigen) {
        this.sistemaOrigen = sistemaOrigen;
    }
    
    public String getMensajeExcepError() {
        return mensaje; // Alias for mensaje
    }
    
    public void setMensajeExcepError(String mensajeExcepError) {
        this.mensaje = mensajeExcepError;
    }
    
    @Override
    public String toString() {
        return "ErrorBean{" +
                "codigo='" + codigo + '\'' +
                ", mensaje='" + mensaje + '\'' +
                ", tipo='" + tipo + '\'' +
                ", origen='" + origen + '\'' +
                ", errorLog='" + errorLog + '\'' +
                ", idFlexia='" + idFlexia + '\'' +
                ", traza='" + traza + '\'' +
                ", causa='" + causa + '\'' +
                ", idProcedimiento='" + idProcedimiento + '\'' +
                ", idClave='" + idClave + '\'' +
                ", sistemaOrigen='" + sistemaOrigen + '\'' +
                '}';
    }
}