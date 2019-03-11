package com.lego.care4you.demo.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "Care4You.dbo.Position")

@NamedStoredProcedureQueries({
        @NamedStoredProcedureQuery(
                name = "SP_GetPosition",// Referencia a la cual se usa desde el repositorio
                procedureName = "Care4You.dbo.SP_GetPosition", // Consumo de la bd
                resultClasses = Position.class),
        @NamedStoredProcedureQuery(
                name = "SP_GetPositionId",
                procedureName = "Care4You.dbo.SP_GetPositionId",
                resultClasses = Position.class,
                parameters = {
                        @StoredProcedureParameter(name="id", type=Long.class, mode=ParameterMode.IN)
                }),
        @NamedStoredProcedureQuery(
                name = "SP_DeletePosition",
                procedureName = "Care4You.dbo.SP_DeletePosition",
                resultClasses = Position.class,
                parameters = {
                        @StoredProcedureParameter(name="id", type=Long.class, mode=ParameterMode.IN)
                }),
        @NamedStoredProcedureQuery(
                name="SP_InsertPosition",
                procedureName="Care4You.dbo.SP_InsertPosition",
                resultClasses = Position.class,
                parameters={
                        @StoredProcedureParameter(name="name", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="description", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="date_start", type=Date.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="date_end", type=Date.class, mode=ParameterMode.IN)
                }),
        @NamedStoredProcedureQuery(
                name="SP_UpdatePosition",
                procedureName="Care4You.dbo.SP_UpdatePosition",
                resultClasses = Position.class,
                parameters={
                        @StoredProcedureParameter(name="id", type=Long.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="name", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="description", type=String.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="date_start", type=Date.class, mode=ParameterMode.IN),
                        @StoredProcedureParameter(name="date_end", type=Date.class, mode=ParameterMode.IN)
                })
})
public class Position implements Serializable {

    @javax.persistence.Id
    @Column(name = "id")
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "date_start")
    private Date dateStart;

    @Column(name = "date_end")
    private Date dateEnd;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }
}
