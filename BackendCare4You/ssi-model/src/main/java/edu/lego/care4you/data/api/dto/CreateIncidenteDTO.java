package edu.lego.care4you.data.api.dto;

import java.util.Date;

public class CreateIncidenteDTO {

    private String nombre;

    private String descripcion;

    private Date fecha;

    private String tipo;

    private String severidad;

    private String observacion;

    private boolean bajaRequerida;

    private boolean bajaTiempo;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSeveridad() {
        return severidad;
    }

    public void setSeveridad(String severidad) {
        this.severidad = severidad;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public boolean isBajaRequerida() {
        return bajaRequerida;
    }

    public void setBajaRequerida(boolean bajaRequerida) {
        this.bajaRequerida = bajaRequerida;
    }

    public boolean isBajaTiempo() {
        return bajaTiempo;
    }

    public void setBajaTiempo(boolean bajaTiempo) {
        this.bajaTiempo = bajaTiempo;
    }
}
