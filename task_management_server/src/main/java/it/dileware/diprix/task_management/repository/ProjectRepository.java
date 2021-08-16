package it.dileware.diprix.task_management.repository;

import it.dileware.diprix.task_management.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectRepository extends JpaRepository<Project, Long> {}
