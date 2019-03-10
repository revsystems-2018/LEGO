package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "Care4You.dbo.Company")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "SP_GetAllCompany",// Referencia a la cual se usa desde el repositorio
                procedureName = "Care4You.dbo.SP_GetAllCompany", // Consumo de la bd
                resultClasses = Company.class)
})
public class Company extends DomainBase implements Serializable {

    @javax.persistence.Id
    @Column(name = "Id")
    private Long id;

    @Column(name = "code")
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "instructor")
    private String instructor;

    @OneToOne(targetEntity = Department.class)
    private Department department;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
