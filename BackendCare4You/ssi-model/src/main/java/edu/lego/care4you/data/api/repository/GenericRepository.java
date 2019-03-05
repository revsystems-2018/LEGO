package edu.lego.care4you.data.api.repository;

import edu.lego.care4you.data.domain.DomainBase;
import org.springframework.data.jpa.repository.JpaRepository;

@SuppressWarnings("rawtypes")
public interface GenericRepository<T extends DomainBase> extends JpaRepository<T, Long> {
}