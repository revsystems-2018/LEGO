package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.PositionRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class PositionRepositoryImpl implements PositionRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
