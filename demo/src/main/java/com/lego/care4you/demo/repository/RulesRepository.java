package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Rules;
import com.lego.care4you.demo.repository.custom.RulesRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface RulesRepository extends CrudRepository<Rules, Long>, RulesRepositoryCustom {
}
