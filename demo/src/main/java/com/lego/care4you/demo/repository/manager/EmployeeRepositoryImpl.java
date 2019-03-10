package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.domain.Employees;
import com.lego.care4you.demo.repository.custom.EmployeeRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepositoryCustom {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Employees> getAllEmployees() {
        StoredProcedureQuery findByYearProcedure = em.createNamedStoredProcedureQuery("GetAllEmployees");
        return findByYearProcedure.getResultList();
    }
}
