package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Incident;
import com.lego.care4you.demo.repository.custom.IncidentRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface IncidentRepository extends CrudRepository<Incident, Long>, IncidentRepositoryCustom {
}
