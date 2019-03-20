package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Department;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface DepartmentRepositoryCustom extends QuerydslPredicateExecutor<Department> {

    @Query("{ 'name' : ?0 }")
    List<Department> findDepartmentsByName(String name);
}
