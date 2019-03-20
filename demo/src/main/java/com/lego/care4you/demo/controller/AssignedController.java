package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.repository.AssignmentRepository;
import com.lego.care4you.demo.services.AssignedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AssignedController {

    @Autowired
    AssignedService assignedService;
}
