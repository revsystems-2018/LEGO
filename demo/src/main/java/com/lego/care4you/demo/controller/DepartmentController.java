package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.repository.DepartmentRepository;
import com.lego.care4you.demo.services.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;
}
