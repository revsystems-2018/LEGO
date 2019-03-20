package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.domain.Employee;
import com.lego.care4you.demo.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

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
    public ResponseEntity<List<Employee>> getAllEmployees() {

        Iterable<Employee> employees = employeeService.getAll();

        List<Employee> target = new ArrayList<>();
        employees.forEach(target::add);
        return new ResponseEntity<>(target, HttpStatus.OK);
    }
}
