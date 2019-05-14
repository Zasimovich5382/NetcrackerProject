package com.netcracker.musitians_along.service;

import com.netcracker.musitians_along.domain.Role;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.UserRepo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return user;


    }

    public boolean addUser(User user){
        User UserFromDb = userRepo.findByUsername(user.getUsername());
        if(UserFromDb != null){
            return false;
        }
        user.setNickname("User");
        user.setActive(true);
        user.setArtist(false);
        user.setAvatar("images/def_avatar.png");
        user.setBackground("images/def_background.jpg");
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepo.save(user);

        if(!StringUtils.isEmpty(user.getEmail())){
            String message = String.format("Hello, %s!\n"+
                    "Welcome to MusiciansAlong. Please, visit next link: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailSender.send(user.getEmail(), "Activation code", message);

        }

        return true;
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if(user == null) {
            return false;
        }

        user.setActivationCode(null);

        userRepo.save(user);

        return true;
    }
}
