package com.lego.care4you.demo.domain;

import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Assigned extends DomainBase {

    private String stateAssigned;

    @DBRef
    private Position position;

    @DBRef
    private Department department;

    public String getState() {
        return stateAssigned;
    }

    public void setState(String state) {
        this.stateAssigned = state;
    }

    public String getStateAssigned() {
        return stateAssigned;
    }

    public void setStateAssigned(String stateAssigned) {
        this.stateAssigned = stateAssigned;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
