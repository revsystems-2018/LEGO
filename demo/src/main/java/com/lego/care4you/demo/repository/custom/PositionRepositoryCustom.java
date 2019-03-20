package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Position;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.Date;
import java.util.List;

public interface PositionRepositoryCustom extends QuerydslPredicateExecutor<Position> {

    @Query("{ 'name' : ?0 }")
    List<Position> findPositionsByName(String name);
}
