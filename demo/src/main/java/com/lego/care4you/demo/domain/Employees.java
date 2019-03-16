package com.lego.care4you.demo.domain;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Care4You.dbo.Employees")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "SP_GetEmployee",// Referencia a la cual se usa desde el repositorio
                procedureName = "Care4You.dbo.SP_GetEmployee", // Consumo de la bd
                resultClasses = Employees.class),
        @NamedStoredProcedureQuery(name = "SP_GetEmployeeById",
                procedureName = "Care4You.dbo.SP_GetEmployeeById",
                resultClasses = Employees.class,
                parameters = {
                        @StoredProcedureParameter(name = "Id", mode = ParameterMode.IN, type = Long.class)
                }),
        @NamedStoredProcedureQuery(name = "SP_DeleteEmployee",
                procedureName = "Care4You.dbo.SP_DeleteEmployee",
                resultClasses = Employees.class,
                parameters = {
                        @StoredProcedureParameter(name = "Id", mode = ParameterMode.IN, type = Long.class)
                }),
        @NamedStoredProcedureQuery(name = "SP_InsertEmployee",
                procedureName = "Care4You.dbo.SP_InsertEmployee",
                resultClasses = Employees.class,
                parameters = {
                        @StoredProcedureParameter(name = "Dni", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "First_Name", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "Last_Name", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "Address", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "Phone", mode = ParameterMode.IN, type = Long.class),
                        @StoredProcedureParameter(name = "Email", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "Job_Description", mode = ParameterMode.IN, type = String.class)
                }),
        @NamedStoredProcedureQuery(name = "SP_UpdateEmployee",
                procedureName = "Care4You.dbo.SP_UpdateEmployee",
                resultClasses = Employees.class,
                parameters = {
                        @StoredProcedureParameter(name = "Id", mode = ParameterMode.IN, type = Long.class),
                        @StoredProcedureParameter(name = "Dni", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "First_Name", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "Last_Name", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "Address", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "Phone", mode = ParameterMode.IN, type = Long.class),
                        @StoredProcedureParameter(name = "Email", mode = ParameterMode.IN, type = String.class),
                        @StoredProcedureParameter(name = "Job_Description", mode = ParameterMode.IN, type = String.class)
                })
})
public class Employees implements Serializable {

    @javax.persistence.Id
    @Column(name = "Id")
    private long Id;

    @Column(name = "Dni")
    private String dni;

    @Column(name = "First_Name")
    private String firstName;

    @Column(name = "Last_Name")
    private String lastName;

    @Column(name = "Address")
    private String address;

    @Column(name = "Phone")
    private long phone;

    @Column(name = "email")
    private String email;

    @Column(name = "Job_Description")
    private String jobDescription;

    public long getId() {
        return Id;
    }

    public void setId(long id) {
        Id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }
}
