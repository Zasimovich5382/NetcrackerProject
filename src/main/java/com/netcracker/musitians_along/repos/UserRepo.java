package com.netcracker.musitians_along.repos;
import com.netcracker.musitians_along.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String user);

    User findByActivationCode(String code);
}
