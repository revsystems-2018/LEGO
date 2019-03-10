package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "test.dbo.Company")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "GetAllEmployees",// Referencia a la cual se usa desde el repositorio
                procedureName = "test.dbo.GetAllEmployees", // Consumo de la bd
                resultClasses = Company.class)
})
public class Company implements Serializable {

    @javax.persistence.Id
    @Column(name = "Id")
    private Long id;

    @Column(name = "create_on")
    private Date createOn;

    @Column(name = "update_on")
    private Date updateOn;

    @Column(name = "version")
    private Integer version;

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

    public Date getCreateOn() {
        return createOn;
    }

    public void setCreateOn(Date createOn) {
        this.createOn = createOn;
    }

    public Date getUpdateOn() {
        return updateOn;
    }

    public void setUpdateOn(Date updateOn) {
        this.updateOn = updateOn;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
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
