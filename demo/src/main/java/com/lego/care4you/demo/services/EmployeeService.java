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
        return employeeRepository.getAll();
    }

    @Override
    public Employee getById(long id) {
        return employeeRepository.getById(id);
    }

    @Override
    public void delete(long id) {
        employeeRepository.delete(id);
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
            employeeRepository.update(params);
        } catch (Exception e) {

        }
    }
}
