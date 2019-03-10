package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Assignment;
import com.lego.care4you.demo.repository.custom.AssignmentRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface AssignmentRepository extends CrudRepository<Assignment, Long>, AssignmentRepositoryCustom {
}
