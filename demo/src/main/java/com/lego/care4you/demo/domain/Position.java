package com.lego.care4you.demo.domain;

import org.springframework.data.mongodb.core.mapping.Document;
import java.util.Date;

@Document
public class Position extends DomainBase {

    private String name;

    private String description;

    private Date dateStart;

    private Date dateEnd;

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
