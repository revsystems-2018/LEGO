package com.lego.care4you.demo.services;

import java.util.List;

public interface GenericService<T> {

    List<T> getAll();

    T getById(long id);

    void delete(long id);

    void insert(T params);

    void update(T params);
}
