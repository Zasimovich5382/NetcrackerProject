package com.netcracker.musitians_along.controller;

import com.netcracker.musitians_along.domain.Playlist;
import com.netcracker.musitians_along.domain.User;
import com.netcracker.musitians_along.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.netcracker.musitians_along.AppConstants;

import java.util.Map;


@Controller
public class PlaylistController {

    @Autowired
    private UserService userService;

    @GetMapping("/playlist/{playlist}")
    public String playlist(@PathVariable Playlist playlist, Map<String,Object> model){
        User user = userService.authUser();
        model.put("playlist", playlist);
        model.put("user", user);
        return AppConstants.PLAYLIST;
    }



}