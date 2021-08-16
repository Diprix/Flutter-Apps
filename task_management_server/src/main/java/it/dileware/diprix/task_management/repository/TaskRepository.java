package it.dileware.diprix.task_management.repository;

import it.dileware.diprix.task_management.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task, Long> {}
