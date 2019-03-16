package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Employees;
import com.lego.care4you.demo.repository.custom.EmployeeRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface EmployeeRepository extends CrudRepository<Employees, Long>, GenericRepository<Employees> {
}
