package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Company;
import com.lego.care4you.demo.repository.custom.CompanyRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface CompanyRepository extends CrudRepository<Company, Long>, CompanyRepositoryCustom {
}
