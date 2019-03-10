package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "Care4You.dbo.Company")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "SP_GetAllCompany",// Referencia a la cual se usa desde el repositorio
                procedureName = "Care4You.dbo.SP_GetAllCompany", // Consumo de la bd
                resultClasses = Company.class),
        @NamedStoredProcedureQuery(
                name = "SP_GetCompanyId",
                procedureName = "Care4You.dbo.SP_GetCompanyId",
                resultClasses = Position.class,
                parameters = {
                        @StoredProcedureParameter(name="id", type=Long.class, mode=ParameterMode.IN)
                }),
        @NamedStoredProcedureQuery(
                name = "SP_DeleteCompany",
                procedureName = "Care4You.dbo.SP_DeleteCompany",
                resultClasses = Position.class,
                parameters = {
                        @StoredProcedureParameter(name="id", type=Long.class, mode=ParameterMode.IN)
                }),
        @NamedStoredProcedureQuery(
                name="SP_InsertCompany",
                procedureName="Care4You.dbo.SP_InsertCompany",
                resultClasses = Position.class,
                parameters={
                        @StoredProcedureParameter(name="code", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="name", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="instructor", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="departmentId", type=Long.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="ModifiedBy", type=Long.class, mode=ParameterMode.IN)
                }),
        @NamedStoredProcedureQuery(
                name="SP_UpdateCompany",
                procedureName="Care4You.dbo.SP_UpdateCompany",
                resultClasses = Position.class,
                parameters={
                        @StoredProcedureParameter(name="IdCompany", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="Code", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="Name", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="Instructor", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="DepartmentId", type=Long.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="ModifiedBy", type=Long.class, mode=ParameterMode.IN)
                }),
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
