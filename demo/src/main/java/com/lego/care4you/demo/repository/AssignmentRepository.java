package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Assignment;
import com.lego.care4you.demo.repository.custom.AssignmentRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface AssignmentRepository extends MongoRepository<Assignment, String>, AssignmentRepositoryCustom {

    Assignment findTopById(String id);
}
