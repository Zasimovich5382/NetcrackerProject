package com.netcracker.musitians_along.repos;
import com.netcracker.musitians_along.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String user);

    /*User findByEmail(String email);*/

    User findFirstById(Long id);

    Page<User> findByNicknameContaining(String name, Pageable pageable);

    User findByActivationCode(String code);
}
