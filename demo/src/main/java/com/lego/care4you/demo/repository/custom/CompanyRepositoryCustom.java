package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Company;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import java.util.List;

public interface CompanyRepositoryCustom extends QuerydslPredicateExecutor<Company> {

    @Query("{ 'name' : ?0 }")
    List<Company> findCompaniesByName(String name);
}
