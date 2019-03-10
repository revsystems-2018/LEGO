package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.WorkRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class WorkRepositoryImpl implements WorkRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
