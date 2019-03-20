package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Rules;
import com.lego.care4you.demo.repository.custom.RulesRepositoryCustom;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface RulesRepository extends MongoRepository<Rules, String>, RulesRepositoryCustom {

    Rules findTopById(String id);

}
