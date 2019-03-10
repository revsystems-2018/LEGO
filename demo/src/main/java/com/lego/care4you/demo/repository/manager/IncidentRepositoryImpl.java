package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.IncidentRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class IncidentRepositoryImpl implements IncidentRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
