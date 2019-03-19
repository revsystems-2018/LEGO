package com.lego.care4you.demo.domain;

import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Assignment extends DomainBase {

    @DBRef
    private OrganizationChart organizationChart;

    @DBRef
    private Department department;

    @DBRef
    private SafetyEquipment safetyEquipment;

    @DBRef
    private Employee employee;

    public OrganizationChart getOrganizationChart() {
        return organizationChart;
    }

    public void setOrganizationChart(OrganizationChart organizationChart) {
        this.organizationChart = organizationChart;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public SafetyEquipment getSafetyEquipment() {
        return safetyEquipment;
    }

    public void setSafetyEquipment(SafetyEquipment safetyEquipment) {
        this.safetyEquipment = safetyEquipment;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
