package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.domain.Company;
import com.lego.care4you.demo.repository.custom.CompanyRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.util.Date;
import java.util.List;

public class CompanyRepositoryImpl implements CompanyRepositoryCustom {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Company> getAllCompanies() {
        StoredProcedureQuery findByYearProcedure = em.createNamedStoredProcedureQuery("SP_GetAllCompany");
        return findByYearProcedure.getResultList();
    }

    @Override
    public Company getCompanyById(Long id) {
        StoredProcedureQuery findByIdProcedure = em.createNamedStoredProcedureQuery("SP_GetCompanyId").registerStoredProcedureParameter(0, Long.class, ParameterMode.IN);
        findByIdProcedure.setParameter(0, id);
        return (Company) findByIdProcedure.getSingleResult();
    }

    @Override
    public Boolean deleteCompany(Long id) {
        try {
            StoredProcedureQuery deleteByIdProcedure = em.createNamedStoredProcedureQuery("SP_DeleteCompany").registerStoredProcedureParameter(0, Long.class, ParameterMode.IN);
            deleteByIdProcedure.setParameter(0, id);

            deleteByIdProcedure.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public Boolean addCompany(String code, String name, String instructor, Long departmentId, Long ModifiedBy) {
        try {
            StoredProcedureQuery storedProcedure = em.createStoredProcedureQuery("SP_InsertCompany")
                    .registerStoredProcedureParameter(0, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(3, Long.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(4, Long.class, ParameterMode.IN);

            storedProcedure.setParameter(0, code)
                    .setParameter(1, name)
                    .setParameter(2, instructor)
                    .setParameter(3, departmentId)
                    .setParameter(3, ModifiedBy);

            storedProcedure.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public Boolean updateCompany(Long id, String code, String name, String instructor, Long departmentId, Long ModifiedBy) {
        try {
            StoredProcedureQuery storedProcedure = em.createStoredProcedureQuery("SP_UpdateCompany")
                    .registerStoredProcedureParameter(0, Long.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(3, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(4, Long.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(5, Long.class, ParameterMode.IN);

            storedProcedure.setParameter(0, id)
                    .setParameter(1, code)
                    .setParameter(2, name)
                    .setParameter(3, instructor)
                    .setParameter(4, departmentId)
                    .setParameter(5, ModifiedBy);

            storedProcedure.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
