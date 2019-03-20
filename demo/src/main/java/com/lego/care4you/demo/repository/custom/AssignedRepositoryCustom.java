package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Assigned;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface AssignedRepositoryCustom extends QuerydslPredicateExecutor<Assigned> {

    @Query("{ 'stateAssigned' : ?0 }")
    List<Assigned> findAssignedByStateAssigned(String stateAssigned);
}
