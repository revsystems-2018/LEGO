package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.SafetyEquipment;
import com.lego.care4you.demo.repository.custom.SafetyEquipmentRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface SafetyEquipmentRepository extends CrudRepository<SafetyEquipment, Long>, SafetyEquipmentRepositoryCustom {
}
