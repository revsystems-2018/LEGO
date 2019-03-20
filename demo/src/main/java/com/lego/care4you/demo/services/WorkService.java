package com.lego.care4you.demo.services;

import com.lego.care4you.demo.domain.Work;
import com.lego.care4you.demo.repository.WorkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkService implements GenericService<Work> {

    @Autowired
    private WorkRepository workRepository;

    @Override
    public List<Work> getAll() {
        return null;
    }

    @Override
    public Work getById(String id) {
        return null;
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void insert(Work params) {

    }

    @Override
    public void update(Work params) {

    }
}
