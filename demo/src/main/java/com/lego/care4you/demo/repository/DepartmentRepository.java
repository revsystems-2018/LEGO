package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Department;
import com.lego.care4you.demo.repository.custom.DepartmentRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface DepartmentRepository extends CrudRepository<Department, Long>, DepartmentRepositoryCustom {
}
