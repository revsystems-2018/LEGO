package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Work;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface WorkRepositoryCustom extends QuerydslPredicateExecutor<Work> {

    @Query("{ 'workCode' : ?0 }")
    List<Work> findWorksByWorkCode(String workCode);
}
