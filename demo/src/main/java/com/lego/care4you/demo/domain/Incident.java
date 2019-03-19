package com.lego.care4you.demo.domain;

import com.lego.care4you.demo.enums.IncidentType;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Incident extends DomainBase {

    private String incidentName;

    private String incidentCode;

    private IncidentType incidentType;

    private String incidentScope;

    private String incidentObjective;

    private String incidentCriteria;

    private String incidentPeriodicity;

    @DBRef
    private Employee employee;

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

    public Employee getEmployees() {
        return employee;
    }

    public void setEmployees(Employee employee) {
        this.employee = employee;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
