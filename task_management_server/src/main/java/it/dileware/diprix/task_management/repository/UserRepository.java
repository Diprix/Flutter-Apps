package it.dileware.diprix.task_management.repository;

import it.dileware.diprix.task_management.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
