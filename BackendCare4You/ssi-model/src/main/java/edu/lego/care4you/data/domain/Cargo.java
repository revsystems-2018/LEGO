package edu.lego.care4you.data.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Ricardo Veizaga
 */
@Entity
@Table(name = "Cargo")
public class Cargo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdCargo")
    private Long id;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "descripcion")
    private String descripcion;

    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name = "Trabaja", joinColumns = {@JoinColumn(name = "IdCargo")}, inverseJoinColumns = {@JoinColumn(name = "IdEmpleado")})
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
}
