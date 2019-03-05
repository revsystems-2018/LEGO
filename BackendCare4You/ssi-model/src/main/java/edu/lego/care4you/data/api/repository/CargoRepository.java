package edu.lego.care4you.data.api.repository;

import edu.lego.care4you.data.domain.Cargo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CargoRepository extends JpaRepository<Cargo, Long> {
}
