package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Department;
import com.lego.care4you.demo.repository.custom.DepartmentRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface DepartmentRepository extends MongoRepository<Department, String>, DepartmentRepositoryCustom {

    Department findTopById(String id);
}
