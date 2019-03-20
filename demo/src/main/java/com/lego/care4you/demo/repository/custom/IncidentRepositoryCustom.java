package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Incident;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface IncidentRepositoryCustom extends QuerydslPredicateExecutor<Incident> {

    @Query("{ 'incidentName' : ?0 }")
    List<Incident> findIncidentsByIncidentName(String incidentName);
}
