package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.domain.Employees;
import com.lego.care4you.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class EmployeeController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity<List<Employees>> getAllEmployees() {

        Iterable<Employees> employees = employeeRepository.getAllEmployees();

        List<Employees> target = new ArrayList<>();
        employees.forEach(target::add);
        return new ResponseEntity<>(target, HttpStatus.OK);
    }
}
