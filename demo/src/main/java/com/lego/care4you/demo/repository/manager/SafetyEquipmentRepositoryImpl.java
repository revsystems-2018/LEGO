package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.repository.custom.SafetyEquipmentRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class SafetyEquipmentRepositoryImpl implements SafetyEquipmentRepositoryCustom {

    @PersistenceContext
    private EntityManager em;
}
