package com.lego.care4you.demo.services;

import com.lego.care4you.demo.domain.Incident;
import com.lego.care4you.demo.repository.IncidentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IncidentService implements GenericService<Incident> {

    @Autowired
    private IncidentRepository incidentRepository;

    @Override
    public List<Incident> getAll() {
        return null;
    }

    @Override
    public Incident getById(String id) {
        return null;
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void insert(Incident params) {

    }

    @Override
    public void update(Incident params) {

    }
}
