package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "test.dbo.Assignment")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "GetAllEmployees",// Referencia a la cual se usa desde el repositorio
                procedureName = "test.dbo.GetAllEmployees", // Consumo de la bd
                resultClasses = Assignment.class)
})
public class Assignment implements Serializable {

    @javax.persistence.Id
    @Column(name = "Id")
    private Long id;

    @OneToOne(targetEntity = SafetyEquipment.class)
    private SafetyEquipment safetyEquipment;

    @OneToOne(targetEntity = Employees.class)
    private Employees employees;
}
