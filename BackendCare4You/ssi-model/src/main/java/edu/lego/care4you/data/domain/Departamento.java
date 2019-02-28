package edu.lego.care4you.data.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Ricardo Veizaga
 */
@Entity
@Table(name = "Departamento")
public class Departamento extends DomainBase{

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "descripcion")
    private String descripcion;

    @OneToMany(mappedBy = "empresas", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private List<Empresas> empresas = new ArrayList<Empresas>();

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
