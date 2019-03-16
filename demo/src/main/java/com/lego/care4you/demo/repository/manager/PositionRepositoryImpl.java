package com.lego.care4you.demo.repository.manager;

import com.lego.care4you.demo.domain.Position;
import com.lego.care4you.demo.repository.custom.PositionRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import java.util.Date;
import java.util.List;

public class PositionRepositoryImpl implements PositionRepositoryCustom {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Position> getAllPositions() {
        StoredProcedureQuery findByYearProcedure = em.createNamedStoredProcedureQuery("SP_GetPosition");
        return findByYearProcedure.getResultList();
    }

    @Override
    public Position getPositionById(Long id) {
        StoredProcedureQuery findByIdProcedure = em.createNamedStoredProcedureQuery("SP_GetPositionId").registerStoredProcedureParameter(0, Long.class, ParameterMode.IN);
        findByIdProcedure.setParameter("id", id);
        return (Position) findByIdProcedure.getSingleResult();
    }

    @Override
    public Boolean deletePosition(Long id) {
        try {
            StoredProcedureQuery findByIdProcedure = em.createNamedStoredProcedureQuery("SP_DeletePosition").registerStoredProcedureParameter(0, Long.class, ParameterMode.IN);
            findByIdProcedure.setParameter("id", id);

            findByIdProcedure.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public Boolean addPosition(String name, String description, Date dateStart, Date dateEnd) {
        try {
            StoredProcedureQuery storedProcedure = em.createStoredProcedureQuery("SP_InsertPosition");

            storedProcedure.setParameter("name", name)
                    .setParameter("description", description)
                    .setParameter("date_start", dateStart)
                    .setParameter("date_end", dateEnd);

            storedProcedure.execute();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

    @Override
    public Boolean updatePosition(Long id, String name, String description, Date dateStart, Date dateEnd) {
        try {
            StoredProcedureQuery storedProcedure = em.createStoredProcedureQuery("SP_UpdatePosition")
                    .registerStoredProcedureParameter("id", Long.class, ParameterMode.IN)
                    .registerStoredProcedureParameter("name", String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter("description", String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter("date_start", Date.class, ParameterMode.IN)
                    .registerStoredProcedureParameter("date_end", Date.class, ParameterMode.IN);

            storedProcedure.setParameter("id", id)
                           .setParameter("name", name)
                           .setParameter("description", description)
                           .setParameter("date_start", dateStart)
                           .setParameter("date_end", dateEnd);

            storedProcedure.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
        return true;
    }

}
