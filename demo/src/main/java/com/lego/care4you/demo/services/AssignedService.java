package com.lego.care4you.demo.services;

import com.lego.care4you.demo.repository.AssignedRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssignedService implements GenericService {

    private AssignedRepository assignedRepository;

    @Override
    public List getAll() {
        return null;
    }

    @Override
    public Object getById(String id) {
        return null;
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void insert(Object params) {

    }

    @Override
    public void update(Object params) {

    }
}
