package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.CompanyRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class CompanyRepositoryImpl implements CompanyRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
