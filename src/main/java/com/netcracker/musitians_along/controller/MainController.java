package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.AppConstants;
import com.netcracker.musitians_along.domain.Playlist;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.PlaylistRepo;
import com.netcracker.musitians_along.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private PlaylistRepo playlistRepo;

    @GetMapping("/"+ AppConstants.SEARCH)
    public String getSearch(Model model){
        User user = userService.authUser();
        model.addAttribute("user", user);
        return AppConstants.SEARCH;
    }

    @GetMapping("/"+ AppConstants.ARTIST +"/{user}")
    public String getArtist(@PathVariable User user, Model model){
        User myUser = userService.authUser();
        Iterable<Playlist> list = playlistRepo.findAllByAuthor(myUser);
        model.addAttribute("idArtist", user.getId());
        model.addAttribute("user", user);
        model.addAttribute("myUser", myUser);
        model.addAttribute("playlistes", list);
        return AppConstants.ARTIST;
    }
}


