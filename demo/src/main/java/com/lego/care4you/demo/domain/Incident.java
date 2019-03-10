package com.lego.care4you.demo.domain;

import com.lego.care4you.demo.enums.IncidentType;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Care4You.dbo.Incident")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "SP_GetIncident",// Referencia a la cual se usa desde el repositorio
                procedureName = "Care4You.dbo.SP_GetIncident", // Consumo de la bd
                resultClasses = Incident.class)
})
public class Incident extends DomainBase implements Serializable {

    @javax.persistence.Id
    @Column(name = "id")
    private Long id;

    @Column(name = "IncidentName")
    private String incidentName;

    @Column(name = "IncidentCode")
    private String incidentCode;

    @Column(name = "IncidentType")
    private IncidentType incidentType;

    @Column(name = "IncidentScope")
    private String incidentScope;

    @Column(name = "IncidentObjective")
    private String incidentObjective;

    @Column(name = "IncidentCriteria")
    private String incidentCriteria;

    @Column(name = "IncidentPeriodicity")
    private String incidentPeriodicity;

    @Column(name = "DepartmentId")
    private Long departmentId;

    @OneToOne(targetEntity = Employees.class)
    private Employees employees;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIncidentName() {
        return incidentName;
    }

    public void setIncidentName(String incidentName) {
        this.incidentName = incidentName;
    }

    public String getIncidentCode() {
        return incidentCode;
    }

    public void setIncidentCode(String incidentCode) {
        this.incidentCode = incidentCode;
    }

    public IncidentType getIncidentType() {
        return incidentType;
    }

    public void setIncidentType(IncidentType incidentType) {
        this.incidentType = incidentType;
    }

    public String getIncidentScope() {
        return incidentScope;
    }

    public void setIncidentScope(String incidentScope) {
        this.incidentScope = incidentScope;
    }

    public String getIncidentObjective() {
        return incidentObjective;
    }

    public void setIncidentObjective(String incidentObjective) {
        this.incidentObjective = incidentObjective;
    }

    public String getIncidentCriteria() {
        return incidentCriteria;
    }

    public void setIncidentCriteria(String incidentCriteria) {
        this.incidentCriteria = incidentCriteria;
    }

    public String getIncidentPeriodicity() {
        return incidentPeriodicity;
    }

    public void setIncidentPeriodicity(String incidentPeriodicity) {
        this.incidentPeriodicity = incidentPeriodicity;
    }

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

    public Employees getEmployees() {
        return employees;
    }

    public void setEmployees(Employees employees) {
        this.employees = employees;
    }
}
