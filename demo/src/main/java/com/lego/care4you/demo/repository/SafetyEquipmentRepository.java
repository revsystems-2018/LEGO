package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.SafetyEquipment;
import com.lego.care4you.demo.repository.custom.SafetyEquipmentRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Date;
import java.util.List;

public interface SafetyEquipmentRepository extends MongoRepository<SafetyEquipment, String>, SafetyEquipmentRepositoryCustom {

    SafetyEquipment findTopById(String id);

    List<SafetyEquipment> findSafetyEquipmentsByCreatedDateOrderByCreatedDateDesc(Date createdDate);
}
