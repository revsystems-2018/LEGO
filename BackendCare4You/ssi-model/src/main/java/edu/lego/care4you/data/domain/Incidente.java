package edu.lego.care4you.data.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: Ricardo Veizaga
 */
@Entity
@Table(name = "Normas")
public class Incidente extends DomainBase{

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "fecha")
    private Date fecha;

    @Column(name = "tipo")
    private String tipo;

    @Column(name = "severidad")
    private String severidad;

    @Column(name = "observacion")
    private String observacion;

    @Column(name = "bajaRequerida")
    private boolean bajaRequerida;

    @Column(name = "bajaTiempo")
    private boolean bajaTiempo;

    @OneToMany(mappedBy = "empleados", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private List<Empleado> empleados = new ArrayList<Empleado>();

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

    public List<Empleado> getEmpleados() {
        return empleados;
    }

    public void setEmpleados(List<Empleado> empleados) {
        this.empleados = empleados;
    }
}
