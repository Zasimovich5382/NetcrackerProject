package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Playlist;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.PlaylistRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.netcracker.musitians_along.AppConstants;


@Controller
@RequestMapping({"/userLibrary","/"})
public class LibraryController {

    @Autowired
    private PlaylistRepo playlistRepo;

    @GetMapping
    public String userLibrary(@AuthenticationPrincipal User myUser,
                              Model model){
        Iterable<Playlist> playlistes = playlistRepo.findAllByAuthor(myUser);
        model.addAttribute("playlistes", playlistes);
        return AppConstants.LIBRARY;
    }


}
