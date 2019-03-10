package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.RulesRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class RulesRepositoryImpl implements RulesRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
