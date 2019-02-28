package edu.lego.care4you.data.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Ricardo Veizaga
 */
@Entity
@Table(name = "EquiposSeguridad")
public class EquipoSeguridad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdEquipoSeguridad")
    private Long id;

    @Column(name = "codigo")
    private Integer codigo;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "tipo")
    private String tipo;

    @Column(name = "descripcion")
    private String descripcion;

    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "Responsable", joinColumns = {@JoinColumn(name = "IdEquipoSeguridad")}, inverseJoinColumns = {@JoinColumn(name = "IdEmpleado")})
    private List<Empleado> empleados = new ArrayList<Empleado>();

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public List<Empleado> getEmpleados() {
        return empleados;
    }

    public void setEmpleados(List<Empleado> empleados) {
        this.empleados = empleados;
    }
}
