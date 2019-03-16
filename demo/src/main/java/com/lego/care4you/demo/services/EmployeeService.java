package com.lego.care4you.demo.services;

import com.lego.care4you.demo.domain.Employees;
import com.lego.care4you.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService implements GenericService<Employees>{

    @Autowired
    EmployeeRepository employeeRepository;

    @Override
    public List<Employees> getAll() {
        return employeeRepository.getAll();
    }

    @Override
    public Employees getById(long id) {
        return employeeRepository.getById(id);
    }

    @Override
    public void delete(long id) {
        employeeRepository.delete(id);
    }

    @Override
    public void insert(Employees params) {
        try {
            employeeRepository.insert(params);
        } catch (Exception e) {

        }
    }

    @Override
    public void update(Employees params) {
        try {
            employeeRepository.update(params);
        } catch (Exception e) {

        }
    }
}
