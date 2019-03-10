package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "test.dbo.Work")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "GetAllEmployees",// Referencia a la cual se usa desde el repositorio
                procedureName = "test.dbo.GetAllEmployees", // Consumo de la bd
                resultClasses = Work.class)
})
public class Work extends DomainBase implements Serializable {

    @javax.persistence.Id
    @Column(name = "id")
    private Long id;

    @Column(name = "Work_amount")
    private String workAmount;

    @Column(name = "Work_code")
    private String workCode;

    @Column(name = "end_date")
    private Date endDate;

    @Column(name = "init_date")
    private Date initDate;

    @Column(name = "payment_type")
    private String paymentType;

    @OneToOne(targetEntity = Employees.class)
    private Employees employees;

    @OneToOne(targetEntity = Position.class)
    private Position position;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWorkAmount() {
        return workAmount;
    }

    public void setWorkAmount(String workAmount) {
        this.workAmount = workAmount;
    }

    public String getWorkCode() {
        return workCode;
    }

    public void setWorkCode(String workCode) {
        this.workCode = workCode;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getInitDate() {
        return initDate;
    }

    public void setInitDate(Date initDate) {
        this.initDate = initDate;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public Employees getEmployees() {
        return employees;
    }

    public void setEmployees(Employees employees) {
        this.employees = employees;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }
}
