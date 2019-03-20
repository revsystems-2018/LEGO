package com.lego.care4you.demo.services;

import com.lego.care4you.demo.domain.Rules;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RulesService implements GenericService<Rules> {

    @Autowired
    private RulesService rulesService;

    @Override
    public List<Rules> getAll() {
        return null;
    }

    @Override
    public Rules getById(String id) {
        return null;
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void insert(Rules params) {

    }

    @Override
    public void update(Rules params) {

    }
}
