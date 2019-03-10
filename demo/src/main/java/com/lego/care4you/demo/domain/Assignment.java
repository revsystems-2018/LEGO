package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Care4You.dbo.Assignment")
public class Assignment implements Serializable {

    @javax.persistence.Id
    @Column(name = "Id")
    private Long id;

    @OneToOne(targetEntity = SafetyEquipment.class)
    private SafetyEquipment safetyEquipment;

    @OneToOne(targetEntity = Employees.class)
    private Employees employees;
}
