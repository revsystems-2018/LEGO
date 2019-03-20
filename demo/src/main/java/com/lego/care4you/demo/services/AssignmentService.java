package com.lego.care4you.demo.services;

import com.lego.care4you.demo.repository.AssignmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssignmentService implements GenericService {

    @Autowired
    private AssignmentRepository assignmentRepository;

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
