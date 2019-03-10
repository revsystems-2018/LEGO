package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Assigned;
import com.lego.care4you.demo.repository.custom.AssignedRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface AssignedRepository extends CrudRepository<Assigned, Long>, AssignedRepositoryCustom {
}
