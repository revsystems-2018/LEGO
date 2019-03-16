package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.domain.Employees;
import com.lego.care4you.demo.repository.GenericRepository;
import com.lego.care4you.demo.repository.custom.EmployeeRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.util.List;

public class EmployeeRepositoryImpl implements GenericRepository<Employees> {

    @PersistenceContext
    private EntityManager em;

//    @Override
//    public List<Employees> getAllEmployees() {
//        StoredProcedureQuery findByYearProcedure = em.createNamedStoredProcedureQuery("GetAllEmployees");
//        return findByYearProcedure.getResultList();
//    }

    @Override
    public List<Employees> getAll() {
        StoredProcedureQuery procedure =
                em.createNamedStoredProcedureQuery("SP_GetEmployee");
        return procedure.getResultList();
    }

    @Override
    public Employees getById(long id) {
        StoredProcedureQuery procedure =
                em.createNamedStoredProcedureQuery("SP_GetEmployeeById");
        procedure.setParameter("Id", id);

        return (Employees) procedure.getSingleResult();
    }

    @Override
    public void delete(long id) {
        StoredProcedureQuery procedure =
                em.createNamedStoredProcedureQuery("SP_DeleteEmployee");
        procedure.setParameter("Id", id);

        procedure.execute();
    }

    @Override
    public void insert(Employees params) {
        StoredProcedureQuery procedure =
                em.createNamedStoredProcedureQuery("SP_InsertEmployee");
        setParameters(params, procedure);
    }

    @Override
    public void update(Employees params) {
        StoredProcedureQuery procedure =
                em.createNamedStoredProcedureQuery("SP_UpdateEmployee");
        procedure.setParameter("Id", params.getId());
        setParameters(params, procedure);
    }

    private static void setParameters(Employees params, StoredProcedureQuery procedure) {
        procedure.setParameter("Dni", params.getDni());
        procedure.setParameter("First_Name", params.getFirstName());
        procedure.setParameter("Last_Name", params.getLastName());
        procedure.setParameter("Address", params.getAddress());
        procedure.setParameter("Phone", params.getPhone());
        procedure.setParameter("Email", params.getEmail());
        procedure.setParameter("Job_Description", params.getJobDescription());

        procedure.execute();
    }
}
