package com.lego.care4you.demo.repository;

import com.lego.care4you.demo.domain.Work;
import com.lego.care4you.demo.repository.custom.WorkRepositoryCustom;
import org.springframework.data.repository.CrudRepository;

public interface WorkRepository extends CrudRepository<Work, Long>, WorkRepositoryCustom {
}
