package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.AssignmentRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class AssignmentRepositoryImpl implements AssignmentRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
