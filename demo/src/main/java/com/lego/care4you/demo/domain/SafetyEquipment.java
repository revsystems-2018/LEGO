package com.lego.care4you.demo.domain;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class SafetyEquipment extends DomainBase {

    private String name;

    private String description;

    private Integer stock;

    private Byte[] image;

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

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Byte[] getImage() {
        return image;
    }

    public void setImage(Byte[] image) {
        this.image = image;
    }
}
