package com.myApplication.soundApplication.controller;

import com.myApplication.soundApplication.domain.Playlist;
import com.myApplication.soundApplication.domain.User;
import com.myApplication.soundApplication.repos.PlaylistRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.myApplication.soundApplication.AppConstants;


@Controller
@RequestMapping({"/userLibrary","/"})
public class LibraryController {
    @Autowired
    private PlaylistRepo playlistRepo;
    @GetMapping
    public String userLibrary(@AuthenticationPrincipal User user,
                              Model model){
        Iterable<Playlist> playlistes = playlistRepo.findAllByAuthor(user);
        model.addAttribute("playlistes", playlistes);
        return AppConstants.LIBRARY;
    }


}
