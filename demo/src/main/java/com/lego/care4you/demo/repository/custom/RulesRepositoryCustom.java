package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Rules;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface RulesRepositoryCustom extends QuerydslPredicateExecutor<Rules> {

    @Query("{ 'state' : ?0 }")
    List<Rules> findRulesByState(String state);
}
