package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "Care4You.dbo.Assigned")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(name = "SP_GetAssigned",// Referencia a la cual se usa desde el repositorio
                procedureName = "Care4You.dbo.SP_GetAssigned", // Consumo de la bd
                resultClasses = Assigned.class)
})
public class Assigned implements Serializable {

    @javax.persistence.Id
    @Column(name = "Id")
    private Long id;

    @Column(name = "estado")
    private String state;

    @Column(name = "createBy")
    private Long createBy;

    @Column(name = "createDate")
    private Date createDate;

    @Column(name = "updateBy")
    private Long updateBy;

    @Column(name = "updateDate")
    private Date updateDate;

    @OneToOne(targetEntity = Position.class)
    private Position position;

    @OneToOne(targetEntity = Department.class)
    private Department department;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Long getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Long updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
