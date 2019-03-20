package com.lego.care4you.demo.services;

import com.lego.care4you.demo.domain.Employee;
import com.lego.care4you.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService implements GenericService<Employee>{

    @Autowired
    EmployeeRepository employeeRepository;

    @Override
    public List<Employee> getAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee getById(String id) {
        return employeeRepository.findTopById(id);
    }

    @Override
    public void delete(String id) {
        employeeRepository.deleteById(id);
    }

    @Override
    public void insert(Employee params) {
        try {
            employeeRepository.insert(params);
        } catch (Exception e) {

        }
    }

    @Override
    public void update(Employee params) {
        try {
            employeeRepository.insert(params);
        } catch (Exception e) {

        }
    }
}
