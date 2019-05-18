package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Playlist;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.PlaylistRepo;
import com.netcracker.musitians_along.repos.UserRepo;
import com.netcracker.musitians_along.service.SessionUserService;
import com.netcracker.musitians_along.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.netcracker.musitians_along.AppConstants;


@Controller
@RequestMapping({"/userLibrary","/"})
public class LibraryController {

    @Autowired
    private PlaylistRepo playlistRepo;

    @Autowired
    private SessionUserService sessionUserService;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private UserService userService;

    @GetMapping
    public String userLibrary(Model model){

        User userFromDb = userService.authUser();
        Iterable<Playlist> playlistes = playlistRepo.findAllByAuthor(userFromDb);
        model.addAttribute("playlistes", playlistes);
        model.addAttribute("user", userFromDb);
        return AppConstants.LIBRARY;
    }


}
