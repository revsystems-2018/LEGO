package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "Care4You.dbo.Rules")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "SP_GetAllRules",// Referencia a la cual se usa desde el repositorio
                procedureName = "Care4You.dbo.SP_GetAllRules", // Consumo de la bd
                resultClasses = Rules.class)
})
public class Rules extends DomainBase implements Serializable {

    @javax.persistence.Id
    @Column(name = "Id")
    private Long id;

    @Column(name = "employee_id")
    private Long employeeId;

    @Column(name = "state")
    private String state;

    @OneToOne(targetEntity = Company.class)
    private Company company;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }
}
