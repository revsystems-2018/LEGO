package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Incident;
import com.lego.care4you.demo.repository.custom.IncidentRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface IncidentRepository extends MongoRepository<Incident, String>, IncidentRepositoryCustom {

    Incident findTopById(String id);
}
