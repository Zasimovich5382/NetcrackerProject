package com.myApplication.soundApplication.controller;

import org.springframework.ui.Model;
import com.myApplication.soundApplication.domain.Role;
import com.myApplication.soundApplication.domain.User;
import com.myApplication.soundApplication.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.Collections;
import com.myApplication.soundApplication.AppConstants;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo UserRepo;
    @GetMapping("/registration")
    public String registration(){
        return AppConstants.REGISTRATION;
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model){
        User UserFromDb = UserRepo.findByUsername(user.getUsername());
        if (UserFromDb!=null){
            model.addAttribute("message","User exist!");
            return "/registration";
        }
        user.setNickname("User");
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        UserRepo.save(user);
        return "redirect:/login";
    }

}
