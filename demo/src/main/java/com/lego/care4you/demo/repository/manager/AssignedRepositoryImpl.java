package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.AssignedRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class AssignedRepositoryImpl implements AssignedRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
