package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Position;
import com.lego.care4you.demo.repository.custom.PositionRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface PositionRepository extends MongoRepository<Position, String>, PositionRepositoryCustom {

    Position findTopById(String id);
}
