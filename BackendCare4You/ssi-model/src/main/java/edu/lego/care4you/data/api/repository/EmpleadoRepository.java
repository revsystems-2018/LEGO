package edu.lego.care4you.data.api.repository;

import edu.lego.care4you.data.domain.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmpleadoRepository extends JpaRepository<Empleado, Long> {
}
