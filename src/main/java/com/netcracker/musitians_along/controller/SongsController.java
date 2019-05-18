package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Playlist;
import com.netcracker.musitians_along.domain.Song;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.repos.PlaylistRepo;
import com.netcracker.musitians_along.repos.SongRepo;
import com.netcracker.musitians_along.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class SongsController {

    @Autowired
    private SongRepo songRepo;

    @Autowired
    private PlaylistRepo playlistRepo;

    @Autowired
    private UserService userService;

    @GetMapping("/songs")
    public String userLibrary( Model model){
        User user = userService.authUser();
        Iterable<Song> songs = songRepo.findAll();
        Iterable<Playlist> playlists = playlistRepo.findAllByAuthor(user);
        model.addAttribute("songs", songs);
        model.addAttribute("playlists", playlists);
        model.addAttribute("user", user);
        return "songs";
    }



}