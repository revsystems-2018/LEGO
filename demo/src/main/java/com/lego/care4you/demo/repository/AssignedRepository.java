package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Assigned;
import com.lego.care4you.demo.repository.custom.AssignedRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface AssignedRepository extends MongoRepository<Assigned, String>, AssignedRepositoryCustom {

    Assigned findTopById(String id);
}
