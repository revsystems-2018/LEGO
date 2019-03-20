package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Work;
import com.lego.care4you.demo.repository.custom.WorkRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface WorkRepository extends MongoRepository<Work, String>, WorkRepositoryCustom {

    Work findTopById(String id);
}
