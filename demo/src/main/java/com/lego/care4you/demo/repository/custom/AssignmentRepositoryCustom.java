package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Assignment;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface AssignmentRepositoryCustom extends QuerydslPredicateExecutor<Assignment> {

    @Query("{ 'email' : ?0 }")
    List<Assignment> findAssignmentByEmployee_Email(String email);
}
