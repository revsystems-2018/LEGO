package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Company;
import com.lego.care4you.demo.repository.custom.CompanyRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CompanyRepository extends MongoRepository<Company, String>, CompanyRepositoryCustom {

    Company findTopById(String id);
}
