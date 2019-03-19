package com.lego.care4you.demo.domain;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class OrganizationChart {

    private String title;

    private String Description;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }
}
