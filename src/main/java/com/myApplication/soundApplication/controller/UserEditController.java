package com.myApplication.soundApplication.controller;

import com.myApplication.soundApplication.AppConstants;
import com.myApplication.soundApplication.domain.Role;
import com.myApplication.soundApplication.domain.User;
import com.myApplication.soundApplication.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
@Controller
@RequestMapping("/userPageEdit")
public class UserEditController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String userPageEdit() {
        return AppConstants.USEREDIT;
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return AppConstants.USEREDIT;
    }

    @PostMapping
    public String userEditSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);

        return AppConstants.LIBRARY;
    }
}
