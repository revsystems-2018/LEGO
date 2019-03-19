package com.lego.care4you.demo.domain;

import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Department extends DomainBase {

    private String code;

    private String name;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
