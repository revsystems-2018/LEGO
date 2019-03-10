package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Position;
import com.lego.care4you.demo.repository.custom.PositionRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface PositionRepository extends CrudRepository<Position, Long>, PositionRepositoryCustom {
}
