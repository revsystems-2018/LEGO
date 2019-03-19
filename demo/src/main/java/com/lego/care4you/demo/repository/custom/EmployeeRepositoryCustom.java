package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Employee;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface EmployeeRepositoryCustom extends QuerydslPredicateExecutor<Employee> {

    @Query("{ 'firstName' : ?0 }")
    List<Employee> findEmployeesByFirstName(String firstName);
}
