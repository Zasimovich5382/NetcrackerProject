package com.myApplication.soundApplication.repos;
import com.myApplication.soundApplication.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String user);
}
