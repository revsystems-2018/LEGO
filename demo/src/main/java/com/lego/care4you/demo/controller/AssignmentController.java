package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.repository.AssignmentRepository;
import com.lego.care4you.demo.services.AssignmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AssignmentController {

    @Autowired
    AssignmentService assignmentService;
}
