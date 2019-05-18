package com.netcracker.musitians_along.service;

import com.netcracker.musitians_along.domain.Role;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.UserRepo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService{

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private SessionUserService sessionService;

    /*@Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        User userDB = userRepo.findByUsername(name);
        if (userDB == null) {
            throw new UsernameNotFoundException("User not found");
        }
        sessionService.setArtist(userDB.isArtist());
        sessionService.setUsername(userDB.getUsername());
        sessionService.setPassword(userDB.getPassword());
        sessionService.setNickname(userDB.getNickname());
        sessionService.setAvatar(userDB.getAvatar());
        sessionService.setBackground(userDB.getBackground());
        sessionService.setId(userDB.getId());
        sessionService.setActive(userDB.isActive());
        sessionService.setCity(userDB.getCity());

        UserDetails user = sessionService;

        return user;


    }*/

    public boolean addUser(User user){
        User UserFromDb = userRepo.findByUsername(user.getUsername());
        if(UserFromDb != null){
            return false;
        }

        user.setActive(true);
        user.setArtist(false);
        user.setCity("Russia");
        user.setAvatar("default/def_avatar.png");
        user.setBackground("default/def_background.jpg");
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepo.save(user);

        if(!StringUtils.isEmpty(user.getUsername())){
            String message = String.format("Hello, %s!\n"+
                    "Welcome to MusiciansAlong. Please, visit next link: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailSender.send(user.getUsername(), "Activation code", message);

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


    public User authUser(){
        String name = SecurityContextHolder.getContext().getAuthentication().getName();
        User userFromDb = userRepo.findByUsername(name);

        return userFromDb;
    }



}
