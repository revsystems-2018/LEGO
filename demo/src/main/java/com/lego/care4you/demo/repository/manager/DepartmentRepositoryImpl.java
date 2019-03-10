package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.DepartmentRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class DepartmentRepositoryImpl implements DepartmentRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
