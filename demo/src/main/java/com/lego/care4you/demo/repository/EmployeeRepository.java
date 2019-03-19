package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Employee;
import com.lego.care4you.demo.repository.custom.EmployeeRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface EmployeeRepository extends MongoRepository<Employee, String>, EmployeeRepositoryCustom {

    Employee findTopById(String id);
}
