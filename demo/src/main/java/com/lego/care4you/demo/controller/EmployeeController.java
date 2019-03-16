package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.domain.Employees;
import com.lego.care4you.demo.repository.EmployeeRepository;
import com.lego.care4you.demo.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/employees")
@Produces(MediaType.APPLICATION_JSON)
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GET
    public ResponseEntity<List<Employees>> getAllEmployees() {

        Iterable<Employees> employees = employeeService.getAll();

        List<Employees> target = new ArrayList<>();
        employees.forEach(target::add);
        return new ResponseEntity<>(target, HttpStatus.OK);
    }

//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public ResponseEntity<List<Employees>> getAllEmployees() {
//
//        Iterable<Employees> employees = employeeRepository.getAllEmployees();
//
//        List<Employees> target = new ArrayList<>();
//        employees.forEach(target::add);
//        return new ResponseEntity<>(target, HttpStatus.OK);
//    }
}
