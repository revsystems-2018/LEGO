package com.lego.care4you.demo.services;

import com.lego.care4you.demo.domain.Department;
import com.lego.care4you.demo.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService implements GenericService<Department> {

    @Autowired
    private DepartmentRepository departmentRepository;

    @Override
    public List<Department> getAll() {
        return null;
    }

    @Override
    public Department getById(String id) {
        return null;
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void insert(Department params) {

    }

    @Override
    public void update(Department params) {

    }
}
