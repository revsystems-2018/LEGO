package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.SafetyEquipment;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface SafetyEquipmentRepositoryCustom extends QuerydslPredicateExecutor<SafetyEquipment> {

    @Query("{ 'name' : ?0 }")
    List<SafetyEquipment> findWorksByName(String name);

    @Query("{ 'name' : ?0,  'description': ?1}")
    List<SafetyEquipment> findSafetyEquipmentByNameOrDescription(String name, String description);
}
