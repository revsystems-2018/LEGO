package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.repository.WorkRepository;
import com.lego.care4you.demo.services.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WorkController {

    @Autowired
    private WorkService workService;
}
