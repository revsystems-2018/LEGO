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
        findByIdProcedure.setParameter(0, id);
        return (Position) findByIdProcedure.getSingleResult();
    }

    @Override
    public Boolean deletePosition(Long id) {
        try {
            StoredProcedureQuery findByIdProcedure = em.createNamedStoredProcedureQuery("SP_DeletePosition").registerStoredProcedureParameter(0, Long.class, ParameterMode.IN);
            findByIdProcedure.setParameter(0, id);

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
            StoredProcedureQuery storedProcedure = em.createStoredProcedureQuery("SP_InsertPosition")
                    .registerStoredProcedureParameter(0, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(2, Date.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(3, Date.class, ParameterMode.IN);

            storedProcedure.setParameter(0, name)
                    .setParameter(1, description)
                    .setParameter(2, dateStart)
                    .setParameter(3, dateEnd);

            storedProcedure.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public Boolean updatePosition(Long id, String name, String description, Date dateStart, Date dateEnd) {
        try {
            StoredProcedureQuery storedProcedure = em.createStoredProcedureQuery("SP_UpdatePosition")
                    .registerStoredProcedureParameter(0, Long.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(1, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(2, String.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(3, Date.class, ParameterMode.IN)
                    .registerStoredProcedureParameter(4, Date.class, ParameterMode.IN);

            storedProcedure.setParameter(0, id)
                           .setParameter(1, name)
                           .setParameter(2, description)
                           .setParameter(3, dateStart)
                           .setParameter(4, dateEnd);

            storedProcedure.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

}
