package com.lego.care4you.demo.controller;

import com.lego.care4you.demo.repository.IncidentRepository;
import com.lego.care4you.demo.services.IncidentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IncidentController {

    @Autowired
    private IncidentService incidentService;
}
