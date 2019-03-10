package com.lego.care4you.demo.repository.custom;

import com.lego.care4you.demo.domain.Company;

import java.util.Date;
import java.util.List;

public interface CompanyRepositoryCustom {

    public List<Company> getAllCompanies();

    public Company getCompanyById(Long id);

    public Boolean deleteCompany(Long id);

    public Boolean addCompany(String code, String name, String instructor, Long departmentId, Long ModifiedBy);

    public Boolean updateCompany(Long id, String code, String name, String instructor, Long departmentId, Long ModifiedBy);
}
