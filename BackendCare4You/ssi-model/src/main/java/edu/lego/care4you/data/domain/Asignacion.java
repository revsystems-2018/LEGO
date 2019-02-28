package edu.lego.care4you.data.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Ricardo Veizaga
 */
@Entity
@Table(name = "Asignacion")
public class Asignacion extends DomainBase{

    @OneToOne(targetEntity = Departamento.class)
    private Departamento departamento;

    @OneToOne(targetEntity = Cargo.class)
    private Cargo cargo;

    @OneToMany(mappedBy = "organigrama", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private List<Organigrama> organigramas = new ArrayList<Organigrama>();

}
